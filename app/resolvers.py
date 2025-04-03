from app.logger import logger
from app.types import *
from app.utils import get_driver
from typing import Optional, List
import app.mappers as mappers


def get_research_products(
    database: str,
    where: Optional[ResearchProductWhereFilter] = None,
    page: int = 1,
    page_size: int = 10,
    sort_by: str = "id",
    sort_order: str = "DESC",
    selected_fields: List[str] = None
) -> List[ResearchProduct]:

    selected_fields = selected_fields or []

    include_topics = "topics" in selected_fields
    include_venues = "venue" in selected_fields
    include_agents = "agents" in selected_fields
    include_pids = "pids" in selected_fields

    params = {
        "skip": (page - 1) * page_size,
        "limit": page_size
    }

    match_clauses = ["MATCH (p:ResearchProduct)"]  # Start with base MATCH
    optional_match_clauses = []  # Store OPTIONAL MATCH clauses
    where_clauses = []

    # Convert `where` object to Cypher conditions
    def build_where_clause(filter_obj: ResearchProductWhereFilter) -> str:
        clauses = []

        def add_clause(field: str, filter_data: StringFilter):
            param_name = field.replace(".", "_")

            if filter_data.equals:
                clauses.append(f"{field} = ${param_name}")
                params[param_name] = filter_data.equals
            if filter_data.contains:
                clauses.append(f"{field} CONTAINS ${param_name}_contains")
                params[f"{param_name}_contains"] = filter_data.contains
            if filter_data.in_list:
                clauses.append(f"{field} IN ${param_name}_in")
                params[f"{param_name}_in"] = filter_data.in_list

        if filter_obj.AND:
            and_clauses = [build_where_clause(f) for f in filter_obj.AND]
            clauses.append(f"({' AND '.join(and_clauses)})")
        if filter_obj.OR:
            or_clauses = [build_where_clause(f) for f in filter_obj.OR]
            clauses.append(f"({' OR '.join(or_clauses)})")

        if filter_obj.research_product:
            if filter_obj.research_product.id:
                add_clause("p.id", filter_obj.research_product.id)
            if filter_obj.research_product.title:
                add_clause("p.title", filter_obj.research_product.title)
            if filter_obj.research_product.product_type:
                add_clause("p.product_type", filter_obj.research_product.product_type)
            if filter_obj.research_product.pids:
                match_clauses.append("MATCH (p)-[:HAS_PID]->(pid:Pid)")
                if filter_obj.research_product.pids.scheme:
                    add_clause("pid.scheme", filter_obj.research_product.pids.scheme)
                if filter_obj.research_product.pids.value:
                    add_clause("pid.value", filter_obj.research_product.pids.value)

        if filter_obj.agent:
            match_clauses.append("MATCH (p)<-[:AUTHORED]-(a:Agent)")
            if filter_obj.agent.id:
                add_clause("a.id", filter_obj.agent.id)
            if filter_obj.author.name:
                add_clause("a.name", filter_obj.agent.name)

        if filter_obj.venue:
            match_clauses.append("MATCH (p)-[:PUBLISHED_IN]->(v:Venue)")
            if filter_obj.venue.name:
                add_clause("v.name", filter_obj.venue.name)

        if filter_obj.topic:
            match_clauses.append("MATCH (p)-[:HAS_SUBJECT]->(t:Topic)")
            if filter_obj.topic.name:
                add_clause("t.name", filter_obj.topic.name)
            if filter_obj.topic.scheme:
                add_clause("t.scheme", filter_obj.topic.scheme)

        return " AND ".join(clauses)
    
    # Apply filtering if `where` is provided
    if where:
        where_clause = build_where_clause(where)
        if where_clause:
            where_clauses.append(where_clause)

    # Ensure OPTIONAL MATCH for requested fields (avoid filtering out results)
    if include_agents and not any("MATCH (p)<-[:AUTHORED]-(a:Agent)" in clause for clause in match_clauses):
        optional_match_clauses.append("OPTIONAL MATCH (p)<-[:AUTHORED]-(a:Agent)")
    if include_venues and not any("MATCH (p)-[:PUBLISHED_IN]->(v:Venue)" in clause for clause in match_clauses):
        optional_match_clauses.append("OPTIONAL MATCH (p)-[:PUBLISHED_IN]->(v:Venue)")
    if include_topics and not any("MATCH (p)-[:HAS_SUBJECT]->(t:Topic)" in clause for clause in match_clauses):
        optional_match_clauses.append("OPTIONAL MATCH (p)-[:HAS_SUBJECT]->(t:Topic)")
    if include_pids and not any("MATCH (p)-[:HAS_PID]->(pid:Pid)" in clause for clause in match_clauses):
        optional_match_clauses.append("OPTIONAL MATCH (p)-[:HAS_PID]->(pid:Pid)")

    # Construct the final query
    query = f"""
    {" ".join(match_clauses)}
    {"WHERE " + " AND ".join(where_clauses) if where_clauses else ""}
    {" ".join(optional_match_clauses)}
    WITH p 
    {", collect(t) AS topics" if include_topics else ""} 
    {", head(collect(v.name)) AS venue" if include_venues else ""} 
    {", collect(a) AS agents" if include_agents else ""}
    {", collect(pid) AS pids" if include_pids else ""}
    RETURN p 
    {", topics" if include_topics else ""} 
    {", venue" if include_venues else ""} 
    {", agents" if include_agents else ""}
    {", pids" if include_pids else ""}
    ORDER BY p.{sort_by} {sort_order}
    SKIP $skip
    LIMIT $limit
    """

    logger.info(f"Generated Cypher Query:\n{query}\nParameters: {params}")

    driver = get_driver(database)
    return driver.execute_query(query, params, result_transformer_=mappers.to_research_products)


def get_agents(
    database: str,
    where: Optional[AgentWhereFilter] = None,
    page: int = 1,
    page_size: int = 10,
    sort_by: str = "id",
    sort_order: str = "DESC",
    selected_fields: List[str] = None
) -> List[Agent]:

    selected_fields = selected_fields or []
    
    include_research_products = "researchProducts" in selected_fields

    params = {
        "skip": (page - 1) * page_size,
        "limit": page_size
    }

    match_clauses = ["MATCH (a:Agent)"]  # Base MATCH for agents
    optional_match_clauses = []
    where_clauses = []

    # Build WHERE conditions based on filter
    def build_where_clause(filter_obj: AgentWhereFilter) -> str:
        clauses = []

        def add_clause(field: str, filter_data: StringFilter):
            param_name = field.replace(".", "_")

            if filter_data.equals:
                clauses.append(f"{field} = ${param_name}")
                params[param_name] = filter_data.equals
            if filter_data.contains:
                clauses.append(f"{field} CONTAINS ${param_name}_contains")
                params[f"{param_name}_contains"] = filter_data.contains
            if filter_data.in_list:
                clauses.append(f"{field} IN ${param_name}_in")
                params[f"{param_name}_in"] = filter_data.in_list

        if filter_obj.AND:
            and_clauses = [build_where_clause(f) for f in filter_obj.AND]
            clauses.append(f"({' AND '.join(and_clauses)})")
        if filter_obj.OR:
            or_clauses = [build_where_clause(f) for f in filter_obj.OR]
            clauses.append(f"({' OR '.join(or_clauses)})")

        if filter_obj.agent:
            if filter_obj.agent.id:
                add_clause("a.id", filter_obj.agent.id)
            if filter_obj.agent.fullname:
                add_clause("a.fullname", filter_obj.agent.fullname)

        if filter_obj.research_product:
            match_clauses.append("MATCH (a)-[:AUTHORED]->(p:ResearchProduct)")  # Strict MATCH
            if filter_obj.research_product.id:
                add_clause("p.id", filter_obj.research_product.id)
            if filter_obj.research_product.title:
                add_clause("p.title", filter_obj.research_product.title)
            if filter_obj.research_product.product_type:
                add_clause("p.product_type", filter_obj.research_product.product_type)

        return " AND ".join(clauses)

    # Apply filtering if `where` is provided
    if where:
        where_clause = build_where_clause(where)
        if where_clause:
            where_clauses.append(where_clause)

    # Ensure OPTIONAL MATCH for requested fields (avoid filtering out results)
    if include_research_products and not any("MATCH (a)-[:AUTHORED]->(p:ResearchProduct)" in clause for clause in match_clauses):
        optional_match_clauses.append("OPTIONAL MATCH (a)-[:AUTHORED]->(p:ResearchProduct)")

    # Construct final Cypher query
    query = f"""
    {" ".join(match_clauses)}
    {"WHERE " + " AND ".join(where_clauses) if where_clauses else ""}
    {" ".join(optional_match_clauses)}
    WITH a 
    {", collect(p) AS research_products" if include_research_products else ""}
    RETURN a 
    {", research_products" if include_research_products else ""}
    ORDER BY a.{sort_by} {sort_order}
    SKIP $skip
    LIMIT $limit
    """
    print(query)

    logger.info(f"Generated Cypher Query:\n{query}\nParameters: {params}")

    driver = get_driver(database)
    return driver.execute_query(query, params, result_transformer_=mappers.to_agents)


def get_topics(
    database: str,
    where: Optional[TopicWhereFilter] = None,
    page: int = 1,
    page_size: int = 10,
    sort_by: str = "name",
    sort_order: str = "ASC",
    selected_fields: List[str] = None
) -> List[Topic]:

    selected_fields = selected_fields or []
    
    include_research_products = "researchProducts" in selected_fields

    params = {
        "skip": (page - 1) * page_size,
        "limit": page_size
    }

    match_clauses = ["MATCH (s:Topic)"]  # Base MATCH for topics
    optional_match_clauses = []
    where_clauses = []

    # Build WHERE conditions based on filter
    def build_where_clause(filter_obj: TopicWhereFilter) -> str:
        clauses = []

        def add_clause(field: str, filter_data: StringFilter):
            param_name = field.replace(".", "_")

            if filter_data.equals:
                clauses.append(f"{field} = ${param_name}")
                params[param_name] = filter_data.equals
            if filter_data.contains:
                clauses.append(f"{field} CONTAINS ${param_name}_contains")
                params[f"{param_name}_contains"] = filter_data.contains
            if filter_data.in_list:
                clauses.append(f"{field} IN ${param_name}_in")
                params[f"{param_name}_in"] = filter_data.in_list

        if filter_obj.AND:
            and_clauses = [build_where_clause(f) for f in filter_obj.AND]
            clauses.append(f"({' AND '.join(and_clauses)})")
        if filter_obj.OR:
            or_clauses = [build_where_clause(f) for f in filter_obj.OR]
            clauses.append(f"({' OR '.join(or_clauses)})")

        if filter_obj.topic:
            if filter_obj.topic.name:
                add_clause("s.name", filter_obj.topic.name)
            if filter_obj.topic.scheme:
                add_clause("s.scheme", filter_obj.topic.scheme)

        if filter_obj.research_product:
            match_clauses.append("MATCH (s)<-[:HAS_SUBJECT]-(p:ResearchProduct)")  # Strict MATCH
            if filter_obj.research_product.id:
                add_clause("p.id", filter_obj.research_product.id)
            if filter_obj.research_product.title:
                add_clause("p.title", filter_obj.research_product.title)
            if filter_obj.research_product.product_type:
                add_clause("p.product_type", filter_obj.research_product.product_type)

        return " AND ".join(clauses)

    # Apply filtering if `where` is provided
    if where:
        where_clause = build_where_clause(where)
        if where_clause:
            where_clauses.append(where_clause)

    # Ensure OPTIONAL MATCH for requested fields (avoid filtering out results)
    if include_research_products and not any("MATCH (s)<-[:HAS_SUBJECT]-(p:ResearchProduct)" in clause for clause in match_clauses):
        optional_match_clauses.append("OPTIONAL MATCH (s)<-[:HAS_SUBJECT]-(p:ResearchProduct)")

    # Construct final Cypher query
    query = f"""
    {" ".join(match_clauses)}
    {"WHERE " + " AND ".join(where_clauses) if where_clauses else ""}
    {" ".join(optional_match_clauses)}
    WITH s 
    {", collect(p) AS research_products" if include_research_products else ""}
    RETURN s 
    {", research_products" if include_research_products else ""}
    ORDER BY s.{sort_by} {sort_order}
    SKIP $skip
    LIMIT $limit
    """

    logger.info(f"Generated Cypher Query:\n{query}\nParameters: {params}")

    driver = get_driver(database)
    return driver.execute_query(query, params, result_transformer_=mappers.to_topics)


def get_venues(
    database: str,
    where: Optional[VenueWhereFilter] = None,
    page: int = 1,
    page_size: int = 10,
    sort_by: str = "name",
    sort_order: str = "ASC",
    selected_fields: List[str] = None
) -> List[Venue]:

    selected_fields = selected_fields or []
    
    include_research_products = "researchProducts" in selected_fields

    params = {
        "skip": (page - 1) * page_size,
        "limit": page_size
    }

    match_clauses = ["MATCH (v:Venue)"]  # Base MATCH for venues
    optional_match_clauses = []
    where_clauses = []

    # Build WHERE conditions based on filter
    def build_where_clause(filter_obj: VenueWhereFilter) -> str:
        clauses = []

        def add_clause(field: str, filter_data: StringFilter):
            param_name = field.replace(".", "_")

            if filter_data.equals:
                clauses.append(f"{field} = ${param_name}")
                params[param_name] = filter_data.equals
            if filter_data.contains:
                clauses.append(f"{field} CONTAINS ${param_name}_contains")
                params[f"{param_name}_contains"] = filter_data.contains
            if filter_data.in_list:
                clauses.append(f"{field} IN ${param_name}_in")
                params[f"{param_name}_in"] = filter_data.in_list

        if filter_obj.AND:
            and_clauses = [build_where_clause(f) for f in filter_obj.AND]
            clauses.append(f"({' AND '.join(and_clauses)})")
        if filter_obj.OR:
            or_clauses = [build_where_clause(f) for f in filter_obj.OR]
            clauses.append(f"({' OR '.join(or_clauses)})")

        if filter_obj.venue:
            if filter_obj.venue.name:
                add_clause("v.name", filter_obj.venue.name)

        if filter_obj.research_product:
            match_clauses.append("MATCH (v)<-[:PUBLISHED_IN]-(p:ResearchProduct)")  # Strict MATCH
            if filter_obj.research_product.id:
                add_clause("p.id", filter_obj.research_product.id)
            if filter_obj.research_product.title:
                add_clause("p.title", filter_obj.research_product.title)
            if filter_obj.research_product.product_type:
                add_clause("p.product_type", filter_obj.research_product.product_type)

        return " AND ".join(clauses)

    # Apply filtering if `where` is provided
    if where:
        where_clause = build_where_clause(where)
        if where_clause:
            where_clauses.append(where_clause)

    # Ensure OPTIONAL MATCH for requested fields (avoid filtering out results)
    if include_research_products and not any("MATCH (v)<-[:PUBLISHED_IN]-(p:ResearchProduct)" in clause for clause in match_clauses):
        optional_match_clauses.append("OPTIONAL MATCH (v)<-[:PUBLISHED_IN]-(p:ResearchProduct)")

    # Construct final Cypher query
    query = f"""
    {" ".join(match_clauses)}
    {"WHERE " + " AND ".join(where_clauses) if where_clauses else ""}
    {" ".join(optional_match_clauses)}
    WITH v 
    {", collect(p) AS research_products" if include_research_products else ""}
    RETURN v 
    {", research_products" if include_research_products else ""}
    ORDER BY v.{sort_by} {sort_order}
    SKIP $skip
    LIMIT $limit
    """

    logger.info(f"Generated Cypher Query:\n{query}\nParameters: {params}")

    driver = get_driver(database)
    return driver.execute_query(query, params, result_transformer_=mappers.to_venues)