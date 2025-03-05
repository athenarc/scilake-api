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
    graph_db = headers.get("graphdb")
    if not graph_db:
        raise GraphQLError("Missing 'graphdb' parameter; please provide a 'graphdb' \
                           request header with one of the following values: 'neuro', 'transport', 'transport-ccam', 'energy'")
    return graph_db

def get_selected_fields(selections):
        
    # Extract the names of the selected fields into a set
    return {selection.name for selection in selections}
