from app.types import *
from neo4j import Result


def to_products(results):
    """
    Map Neo4j Product nodes to GraphQL ResearchProduct objects, aligned with
    the common Product properties defined in the graph_db_schemas snapshots.
    """
    products = []
    for record in results:
        product_node = record["p"]

        # Map primitive Product properties
        rp = {
            # Core identifiers
            "id": product_node.get("local_identifier"),
            "title": product_node.get("title"),
            "product_type": product_node.get("product_type"),
            # Scalar properties from Product node
            "abstract": product_node.get("abstract"),
            "publicationdate": product_node.get("publication_date"),
            "publisher": None,
            "citation_count": product_node.get("citation_count"),
            "citation_count_class": product_node.get("citation_count_class"),
            "influence": product_node.get("influence"),
            "influence_class": product_node.get("influence_class"),
            "popularity": product_node.get("popularity"),
            "popularity_class": product_node.get("popularity_class"),
            "impulse": product_node.get("impulse"),
            "impulse_class": product_node.get("impulse_class"),
            "repro_rci": product_node.get("repro_rci"),
            "repro_focused_rci": product_node.get("repro_focused_rci"),
            "repro_positive_mentions_count": product_node.get("repro_positive_mentions_count"),
            "entity_type": product_node.get("entity_type"),
        }

        # Related entities from joined records
        pids = [
            Pid(
                local_identifier=pid_node.get("local_identifier"),
                value=pid_node.get("value"),
                scheme=pid_node.get("scheme"),
            )
            for pid_node in (record.get("pids") or [])
            if pid_node is not None
        ]

        agents = [
            Agent(
                id=agent_node.get("local_identifier"),
                fullname=agent_node.get("name"),
                local_identifier=agent_node.get("local_identifier"),
                website=agent_node.get("website"),
                name=agent_node.get("name"),
                family_name=agent_node.get("family_name"),
                types=agent_node.get("types"),
                entity_type=agent_node.get("entity_type"),
                short_name=agent_node.get("short_name"),
                given_name=agent_node.get("given_name"),
                other_names=agent_node.get("other_names"),
                country=agent_node.get("country"),
            )
            for agent_node in (record.get("agents") or [])
            if agent_node is not None
        ]

        topics = [
            Topic(
                name=topic_node.get("label") or topic_node.get("name"),
                local_identifier=topic_node.get("local_identifier"),
                entity_type=topic_node.get("entity_type"),
            )
            for topic_node in (record.get("topics") or [])
            if topic_node is not None
        ]

        grants = [
            Grant(
                id=grant_node.get("local_identifier"),
                abstract=grant_node.get("abstract"),
                local_identifier=grant_node.get("local_identifier"),
                keywords=grant_node.get("keywords"),
                acronym=grant_node.get("acronym"),
                website=grant_node.get("website"),
                duration_start=grant_node.get("duration_start"),
                funded_amount=grant_node.get("funded_amount"),
                currency=grant_node.get("currency"),
                title=grant_node.get("title"),
                grant_number=grant_node.get("grant_number"),
                funding_stream=grant_node.get("funding_stream"),
                duration_end=grant_node.get("duration_end"),
                entity_type=grant_node.get("entity_type"),
            )
            for grant_node in (record.get("grants") or [])
            if grant_node is not None
        ]

        manifestations = [
            Manifestation(
                local_identifier=man_node.get("local_identifier"),
                publicationdate=man_node.get("publication_date"),
                type_defined_in=man_node.get("type_defined_in"),
                licence=man_node.get("licence"),
                type_class=man_node.get("type_class"),
                biblio=man_node.get("biblio"),
                access_rights_status=man_node.get("access_rights_status"),
                access_rights_description=man_node.get("access_rights_description"),
                peer_review_status=man_node.get("peer_review_status"),
                type_label=man_node.get("type_label"),
            )
            for man_node in (record.get("manifestations") or [])
            if man_node is not None
        ]

        research_artifacts = [
            ResearchArtifact(
                local_identifier=ra_node.get("local_identifier"),
                label=ra_node.get("label"),
                type=ra_node.get("type"),
            )
            for ra_node in (record.get("research_artifacts") or [])
            if ra_node is not None
        ]

        technologies = [
            Technology(
                local_identifier=tech_node.get("local_identifier"),
                name=tech_node.get("name"),
            )
            for tech_node in (record.get("technologies") or [])
            if tech_node is not None
        ]

        rp.update(
            {
                "pids": pids,
                "agents": agents,
                "topics": topics,
                "grants": grants,
                "manifestations": manifestations,
                "research_artifacts": research_artifacts,
                "technologies": technologies,
            }
        )

        products.append(Product(**rp))

    return products

def to_agents(results):
    agents = []
    for record in results:
        agent_data = {key: record["a"].get(key) for key in record["a"].keys()}
        agent_data["research_products"] = [Product(**rp) for rp in record.get("research_products", [])]
        agents.append(Agent(**agent_data))
    return agents

def to_topics(results):
    topics = []
    for record in results:
        topic_data = {key: record["s"].get(key) for key in record["s"].keys()}
        topic_data["research_products"] = [Product(**rp) for rp in record.get("research_products", [])]
        topics.append(Topic(**topic_data))
    return topics

def to_venues(results):
    venues = []
    for record in results:
        venue_data = {"name": record["v"].get("name")}
        venue_data["research_products"] = [Product(**rp) for rp in record.get("research_products", [])]
        venues.append(Venue(**venue_data))
    return venues
