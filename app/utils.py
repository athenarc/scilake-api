from app.config import drivers
from graphql import GraphQLError


def get_driver(database: str):
    """
    Retrieve the driver for a specific database.
    """
    if database not in drivers:
        raise ValueError(f"Database '{database}' is not configured.")
    return drivers[database]


def get_graph_db(headers):
    """
    Resolve and validate the target graph database from request headers.
    """
    graph_db = headers.get("graphdb")

    allowed_graphs = list(drivers.keys())
    allowed_str = "', '".join(allowed_graphs)

    if not graph_db or graph_db not in drivers:
        raise GraphQLError(
            f"Missing or invalid 'graphdb' parameter; please provide a 'graphdb' "
            f"request header with one of the following values: '{allowed_str}'"
        )

    return graph_db

# def get_selected_fields(selections):
        
#     # Extract the names of the selected fields into a set
#     return {selection.name for selection in selections}

def get_selected_fields(selections, prefix=""):
    """
    Recursively extract selected fields from GraphQL query selections.
    
    Args:
        selections: The selections from GraphQL resolver.
        prefix: The current nested path (used for nested fields).
        
    Returns:
        A set of fully qualified field paths (e.g., "research_products.topics").
    """
    selected_fields = set()

    for selection in selections:
        field_name = selection.name
        full_field_name = f"{prefix}.{field_name}" if prefix else field_name
        
        selected_fields.add(full_field_name)

        # Recursively process nested fields
        if hasattr(selection, "selections") and selection.selections:
            selected_fields.update(get_selected_fields(selection.selections, full_field_name))

    return selected_fields
