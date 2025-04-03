from app.types import *
from neo4j import Result

def to_research_products(results):
    rps = []
    for record in results:
        rp = {key: record["p"].get(key) for key in record["p"].keys()}
        rp["topics"] = [Topic(**topic) for topic in record.get("topics", [])]
        rp["venue"] = Venue(name=record.get("venue")) if record.get("venue") else None
        rp["agents"] = [Agent(**agent) for agent in record.get("agents", [])]
        rp["pids"] = [Pid(**pid) for pid in record.get("pids", [])]
        rps.append(ResearchProduct(**rp))
    return rps

def to_agents(results):
    agents = []
    for record in results:
        agent_data = {key: record["a"].get(key) for key in record["a"].keys()}
        agent_data["research_products"] = [ResearchProduct(**rp) for rp in record.get("research_products", [])]
        agents.append(Agent(**agent_data))
    return agents

def to_topics(results):
    topics = []
    for record in results:
        topic_data = {key: record["s"].get(key) for key in record["s"].keys()}
        topic_data["research_products"] = [ResearchProduct(**rp) for rp in record.get("research_products", [])]
        topics.append(Topic(**topic_data))
    return topics

def to_venues(results):
    venues = []
    for record in results:
        venue_data = {"name": record["v"].get("name")}
        venue_data["research_products"] = [ResearchProduct(**rp) for rp in record.get("research_products", [])]
        venues.append(Venue(**venue_data))
    return venues
