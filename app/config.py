import os
from dotenv import load_dotenv
from neo4j import GraphDatabase

load_dotenv()

def load_db_config():
    """
    Load database configurations from the environment.
    """
    config = {}
    index = 1
    while True:
        name = os.getenv(f"DB{index}_NAME")
        uri = os.getenv(f"DB{index}_URI")
        user = os.getenv(f"DB{index}_USER")
        password = os.getenv(f"DB{index}_PASSWORD")
        if not name:
            break
        config[name] = {"uri": uri, "user": user, "password": password}
        index += 1
    return config

# Load database configurations
DB_CONFIGS = load_db_config()

# Initialize Neo4j drivers for each database
drivers = {
    db_name: GraphDatabase.driver(
        config["uri"], auth=(config["user"], config["password"])
    )
    for db_name, config in DB_CONFIGS.items()
}
