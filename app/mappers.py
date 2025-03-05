from app.types import *
from neo4j import Result

def to_publications(results):
    publications = []
    for record in results:
        publication_data = {key: record["p"].get(key) for key in record["p"].keys()}
        publication_data["subjects"] = [Subject(**subject) for subject in record.get("subjects", [])]
        publication_data["venue"] = Venue(name=record.get("venue")) if record.get("venue") else None
        publication_data["authors"] = [Author(**author) for author in record.get("authors", [])]
        publications.append(Publication(**publication_data))
    return publications
