from app.logger import logger
from app.types import *
from app.utils import get_driver
from typing import Optional, List
import app.mappers as mappers


def get_products(
    database: str,
    where: Optional[ProductWhereFilter] = None,
    page: int = 1,
    page_size: int = 10,
    sort_by: Optional[str] = None,
    sort_order: Optional[str] = None,
    selected_fields: List[str] = None
) -> List[Product]:

    selected_fields = selected_fields or []

    include_topics = "topics" in selected_fields
    include_agents = "agents" in selected_fields
    include_pids = "pids" in selected_fields
    include_grants = "grants" in selected_fields
    include_manifestations = "manifestations" in selected_fields
    include_research_artifacts = "research_artifacts" in selected_fields
    include_technologies = "technologies" in selected_fields

    params = {
        "skip": (page - 1) * page_size,
        "limit": page_size
    }

    match_clauses = ["MATCH (p:Product)"]  # Start with base MATCH for Product nodes
    optional_match_clauses = []  # Store OPTIONAL MATCH clauses
    where_clauses = []

    # Convert `where` object to Cypher conditions
    def build_where_clause(filter_obj: ProductWhereFilter) -> str:
        clauses = []

        def add_clause(field: str, filter_data):
            param_name = field.replace(".", "_")

            # equality
            if getattr(filter_data, "equals", None) is not None:
                clauses.append(f"{field} = ${param_name}")
                params[param_name] = filter_data.equals

            # string contains
            if getattr(filter_data, "contains", None) is not None:
                clauses.append(f"{field} CONTAINS ${param_name}_contains")
                params[f"{param_name}_contains"] = filter_data.contains

            # IN list
            if getattr(filter_data, "in_list", None) is not None:
                clauses.append(f"{field} IN ${param_name}_in")
                params[f"{param_name}_in"] = filter_data.in_list

            # numeric comparisons (for FloatFilter / IntFilter)
            if getattr(filter_data, "gt", None) is not None:
                clauses.append(f"{field} > ${param_name}_gt")
                params[f"{param_name}_gt"] = filter_data.gt
            if getattr(filter_data, "gte", None) is not None:
                clauses.append(f"{field} >= ${param_name}_gte")
                params[f"{param_name}_gte"] = filter_data.gte
            if getattr(filter_data, "lt", None) is not None:
                clauses.append(f"{field} < ${param_name}_lt")
                params[f"{param_name}_lt"] = filter_data.lt
            if getattr(filter_data, "lte", None) is not None:
                clauses.append(f"{field} <= ${param_name}_lte")
                params[f"{param_name}_lte"] = filter_data.lte

        if filter_obj.AND:
            and_clauses = [build_where_clause(f) for f in filter_obj.AND]
            clauses.append(f"({' AND '.join(and_clauses)})")
        if filter_obj.OR:
            or_clauses = [build_where_clause(f) for f in filter_obj.OR]
            clauses.append(f"({' OR '.join(or_clauses)})")

        if filter_obj.product:
            # Map GraphQL ProductFilter.id to Product.local_identifier in the graph
            if filter_obj.product.id:
                add_clause("p.local_identifier", filter_obj.product.id)
            if filter_obj.product.title:
                add_clause("p.title", filter_obj.product.title)
            if filter_obj.product.product_type:
                add_clause("p.product_type", filter_obj.product.product_type)
            if filter_obj.product.pids:
                match_clauses.append("MATCH (p)-[:HAS_PID]->(pid:Pid)")
                if filter_obj.product.pids.scheme:
                    add_clause("pid.scheme", filter_obj.product.pids.scheme)
                if filter_obj.product.pids.value:
                    add_clause("pid.value", filter_obj.product.pids.value)

            if filter_obj.product.citation_count:
                add_clause("p.citation_count", filter_obj.product.citation_count)
            if filter_obj.product.citation_count_class:
                add_clause("p.citation_count_class", filter_obj.product.citation_count_class)
            if filter_obj.product.influence:
                add_clause("p.influence", filter_obj.product.influence)
            if filter_obj.product.influence_class:
                add_clause("p.influence_class", filter_obj.product.influence_class)
            if filter_obj.product.popularity:
                add_clause("p.popularity", filter_obj.product.popularity)
            if filter_obj.product.popularity_class:
                add_clause("p.popularity_class", filter_obj.product.popularity_class)
            if filter_obj.product.impulse:
                add_clause("p.impulse", filter_obj.product.impulse)
            if filter_obj.product.impulse_class:
                add_clause("p.impulse_class", filter_obj.product.impulse_class)
            if filter_obj.product.repro_rci:
                add_clause("p.repro_rci", filter_obj.product.repro_rci)
            if filter_obj.product.repro_focused_rci:
                add_clause("p.repro_focused_rci", filter_obj.product.repro_focused_rci)
            if filter_obj.product.repro_positive_mentions_count:
                add_clause("p.repro_positive_mentions_count", filter_obj.product.repro_positive_mentions_count)

        if filter_obj.agent:
            match_clauses.append("MATCH (p)<-[:HAS_CONTRIBUTED_TO]-(a:Agent)")
            if filter_obj.agent.id:
                add_clause("a.local_identifier", filter_obj.agent.id)
            if filter_obj.agent.fullname:
                add_clause("a.name", filter_obj.agent.fullname)

        if filter_obj.topic:
            match_clauses.append("MATCH (p)-[:HAS_TOPIC]->(t:Topic)")
            if filter_obj.topic.name:
                add_clause("t.name", filter_obj.topic.name)

        if filter_obj.grant:
            match_clauses.append("MATCH (p)-[:FUNDED_BY]->(g:Grant)")
            if filter_obj.grant.local_identifier:
                add_clause("g.local_identifier", filter_obj.grant.local_identifier)
            if filter_obj.grant.title:
                add_clause("g.title", filter_obj.grant.title)
            if filter_obj.grant.abstract:
                add_clause("g.abstract", filter_obj.grant.abstract)

        if filter_obj.manifestation:
            match_clauses.append("MATCH (p)-[:HAS_MANIFESTATION]->(m:Manifestation)")
            if filter_obj.manifestation.local_identifier:
                add_clause("m.local_identifier", filter_obj.manifestation.local_identifier)
            if filter_obj.manifestation.publicationdate:
                add_clause("m.publication_date", filter_obj.manifestation.publicationdate)
            if filter_obj.manifestation.type_label:
                add_clause("m.type_label", filter_obj.manifestation.type_label)

        if filter_obj.research_artifact:
            match_clauses.append("MATCH (p)-[:HAS_RESEARCH_ARTIFACT]->(ra:ResearchArtifact)")
            if filter_obj.research_artifact.local_identifier:
                add_clause("ra.local_identifier", filter_obj.research_artifact.local_identifier)
            if filter_obj.research_artifact.label:
                add_clause("ra.label", filter_obj.research_artifact.label)
            if filter_obj.research_artifact.type:
                add_clause("ra.type", filter_obj.research_artifact.type)

        if filter_obj.technology:
            match_clauses.append("MATCH (p)-[:HAS_TECHNOLOGY]->(tech:Technology)")
            if filter_obj.technology.local_identifier:
                add_clause("tech.local_identifier", filter_obj.technology.local_identifier)
            if filter_obj.technology.name:
                add_clause("tech.name", filter_obj.technology.name)

        return " AND ".join(clauses)
    
    # Apply filtering if `where` is provided
    if where:
        where_clause = build_where_clause(where)
        if where_clause:
            where_clauses.append(where_clause)

    # Ensure OPTIONAL MATCH for requested fields (avoid filtering out results)
    if include_agents and not any("MATCH (p)<-[:HAS_CONTRIBUTED_TO]-(a:Agent)" in clause for clause in match_clauses):
        optional_match_clauses.append("OPTIONAL MATCH (p)<-[:HAS_CONTRIBUTED_TO]-(a:Agent)")
    if include_topics and not any("MATCH (p)-[:HAS_TOPIC]->(t:Topic)" in clause for clause in match_clauses):
        optional_match_clauses.append("OPTIONAL MATCH (p)-[:HAS_TOPIC]->(t:Topic)")
    if include_pids and not any("MATCH (p)-[:HAS_PID]->(pid:Pid)" in clause for clause in match_clauses):
        optional_match_clauses.append("OPTIONAL MATCH (p)-[:HAS_PID]->(pid:Pid)")

    # Bring in other shared neighbours of Product (no citation links) only if requested
    if include_grants:
        optional_match_clauses.append("OPTIONAL MATCH (p)-[:FUNDED_BY]->(g:Grant)")
    if include_manifestations:
        optional_match_clauses.append("OPTIONAL MATCH (p)-[:HAS_MANIFESTATION]->(m:Manifestation)")
    if include_research_artifacts:
        optional_match_clauses.append("OPTIONAL MATCH (p)-[:HAS_RESEARCH_ARTIFACT]->(ra:ResearchArtifact)")
    if include_technologies:
        optional_match_clauses.append("OPTIONAL MATCH (p)-[:HAS_TECHNOLOGY]->(tech:Technology)")

    # Construct the final query
    order_clause = f"ORDER BY p.{sort_by} {sort_order}" if sort_by and sort_order else ""

    query = f"""
    {" ".join(match_clauses)}
    {"WHERE " + " AND ".join(where_clauses) if where_clauses else ""}
    {" ".join(optional_match_clauses)}
    WITH p 
    {", collect(DISTINCT t) AS topics" if include_topics else ""} 
    {", collect(DISTINCT a) AS agents" if include_agents else ""}
    {", collect(DISTINCT pid) AS pids" if include_pids else ""}
    {", collect(DISTINCT g) AS grants" if include_grants else ""}
    {", collect(DISTINCT m) AS manifestations" if include_manifestations else ""}
    {", collect(DISTINCT ra) AS research_artifacts" if include_research_artifacts else ""}
    {", collect(DISTINCT tech) AS technologies" if include_technologies else ""}
    RETURN p 
    {", topics" if include_topics else ""} 
    {", agents" if include_agents else ""}
    {", pids" if include_pids else ""}
    {", grants" if include_grants else ""}
    {", manifestations" if include_manifestations else ""}
    {", research_artifacts" if include_research_artifacts else ""}
    {", technologies" if include_technologies else ""}
    {order_clause}
    SKIP $skip
    LIMIT $limit
    """

    logger.info(f"Generated Cypher Query:\n{query}\nParameters: {params}")

    driver = get_driver(database)
    return driver.execute_query(query, params, result_transformer_=mappers.to_products)

