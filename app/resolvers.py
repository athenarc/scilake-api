import logging
from app.types import *
from app.utils import get_driver
from typing import Optional, List
import app.mappers as mappers

# Initialize logger
logger = logging.getLogger(__name__)
logging.basicConfig(level=logging.INFO)


def get_publications(
    database: str,
    where: Optional[PublicationWhereFilter] = None,
    page: int = 1,
    page_size: int = 10,
    sort_by: str = "id",
    sort_order: str = "DESC",
    selected_fields: List[str] = None
) -> List[Publication]:

    selected_fields = selected_fields or []

    include_subjects = "subjects" in selected_fields
    include_venues = "venue" in selected_fields
    include_authors = "authors" in selected_fields

    params = {
        "skip": (page - 1) * page_size,
        "limit": page_size
    }

    match_clauses = ["MATCH (p:Publication)"]  # Start with base MATCH
    optional_match_clauses = []  # Store OPTIONAL MATCH clauses
    where_clauses = []

    # Convert `where` object to Cypher conditions
    def build_where_clause(filter_obj: PublicationWhereFilter) -> str:
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

        if filter_obj.publication:
            if filter_obj.publication.id:
                add_clause("p.id", filter_obj.publication.id)
            if filter_obj.publication.title:
                add_clause("p.title", filter_obj.publication.title)
            if filter_obj.publication.pids:
                clauses.append("p.pids IN $p_pids")
                params["p_pids"] = filter_obj.publication.pids

        if filter_obj.author:
            match_clauses.append("MATCH (p)<-[:AUTHORED]-(a:Author)")  # Strict MATCH
            if filter_obj.author.id:
                add_clause("a.id", filter_obj.author.id)
            if filter_obj.author.name:
                add_clause("a.name", filter_obj.author.name)

        if filter_obj.venue:
            match_clauses.append("MATCH (p)-[:PUBLISHED_IN]->(v:Venue)")  # Strict MATCH
            if filter_obj.venue.name:
                add_clause("v.name", filter_obj.venue.name)

        if filter_obj.subject:
            match_clauses.append("MATCH (p)-[:HAS_SUBJECT]->(s:Subject)")  # Strict MATCH
            if filter_obj.subject.name:
                add_clause("s.name", filter_obj.subject.name)
            if filter_obj.subject.scheme:
                add_clause("s.scheme", filter_obj.subject.scheme)

        return " AND ".join(clauses)
    
    # Apply filtering if `where` is provided
    if where:
        where_clause = build_where_clause(where)
        if where_clause:
            where_clauses.append(where_clause)

    # Ensure OPTIONAL MATCH for requested fields (avoid filtering out results)
    if include_authors and not any("MATCH (p)<-[:AUTHORED]-(a:Author)" in clause for clause in match_clauses):
        optional_match_clauses.append("OPTIONAL MATCH (p)<-[:AUTHORED]-(a:Author)")
    if include_venues and not any("MATCH (p)-[:PUBLISHED_IN]->(v:Venue)" in clause for clause in match_clauses):
        optional_match_clauses.append("OPTIONAL MATCH (p)-[:PUBLISHED_IN]->(v:Venue)")
    if include_subjects and not any("MATCH (p)-[:HAS_SUBJECT]->(s:Subject)" in clause for clause in match_clauses):
        optional_match_clauses.append("OPTIONAL MATCH (p)-[:HAS_SUBJECT]->(s:Subject)")

    # Construct the final query
    query = f"""
    {" ".join(match_clauses)}
    {"WHERE " + " AND ".join(where_clauses) if where_clauses else ""}
    {" ".join(optional_match_clauses)}
    WITH p 
    {", collect(s) AS subjects" if include_subjects else ""} 
    {", head(collect(v.name)) AS venue" if include_venues else ""} 
    {", collect(a) AS authors" if include_authors else ""}
    RETURN p 
    {", subjects" if include_subjects else ""} 
    {", venue" if include_venues else ""} 
    {", authors" if include_authors else ""}
    ORDER BY p.{sort_by} {sort_order}
    SKIP $skip
    LIMIT $limit
    """

    logger.info(f"Generated Cypher Query:\n{query}\nParameters: {params}")

    driver = get_driver(database)
    return driver.execute_query(query, params, result_transformer_=mappers.to_publications)


def get_authors(
    database: str,
    where: Optional[AuthorWhereFilter] = None,
    page: int = 1,
    page_size: int = 10,
    sort_by: str = "id",
    sort_order: str = "DESC",
    selected_fields: List[str] = None
) -> List[Author]:

    selected_fields = selected_fields or []
    
    include_publications = "publications" in selected_fields

    params = {
        "skip": (page - 1) * page_size,
        "limit": page_size
    }

    match_clauses = ["MATCH (a:Author)"]  # Base MATCH for authors
    optional_match_clauses = []
    where_clauses = []

    # Build WHERE conditions based on filter
    def build_where_clause(filter_obj: AuthorWhereFilter) -> str:
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

        if filter_obj.author:
            if filter_obj.author.id:
                add_clause("a.id", filter_obj.author.id)
            if filter_obj.author.fullname:
                add_clause("a.fullname", filter_obj.author.fullname)

        if filter_obj.publication:
            match_clauses.append("MATCH (a)-[:AUTHORED]->(p:Publication)")  # Strict MATCH
            if filter_obj.publication.id:
                add_clause("p.id", filter_obj.publication.id)
            if filter_obj.publication.title:
                add_clause("p.title", filter_obj.publication.title)
            if filter_obj.publication.pids:
                clauses.append("p.pids IN $p_pids")
                params["p_pids"] = filter_obj.publication.pids

        return " AND ".join(clauses)

    # Ensure OPTIONAL MATCH for requested fields (avoid filtering out results)
    if include_publications and not any("MATCH (a)-[:AUTHORED]->(p:Publication)" in clause for clause in match_clauses):
        optional_match_clauses.append("OPTIONAL MATCH (a)-[:AUTHORED]->(p:Publication)")

    # Apply filtering if `where` is provided
    if where:
        where_clause = build_where_clause(where)
        if where_clause:
            where_clauses.append(where_clause)

    # Construct final Cypher query
    query = f"""
    {" ".join(match_clauses)}
    {"WHERE " + " AND ".join(where_clauses) if where_clauses else ""}
    {" ".join(optional_match_clauses)}
    WITH a 
    {", collect(p) AS publications" if include_publications else ""}
    RETURN a 
    {", publications" if include_publications else ""}
    ORDER BY a.{sort_by} {sort_order}
    SKIP $skip
    LIMIT $limit
    """

    logger.info(f"Generated Cypher Query:\n{query}\nParameters: {params}")

    driver = get_driver(database)
    return driver.execute_query(query, params, result_transformer_=mappers.to_authors)