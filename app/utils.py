from app.config import drivers

def get_driver(database: str):
    """
    Retrieve the driver for a specific database.
    """
    print(drivers)
    if database not in drivers:
        raise ValueError(f"Database '{database}' is not configured.")
    return drivers[database]

