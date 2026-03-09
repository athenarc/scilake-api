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

        # graph-specific entities grouped by type (per graph)

        # Energy
        energy_types = [
            EnergyType(
                local_identifier=et_node.get("local_identifier"),
                name=et_node.get("name"),
                source=et_node.get("source"),
            )
            for et_node in (record.get("energy_types") or [])
            if et_node is not None
        ]

        energy_storages = [
            EnergyStorage(
                local_identifier=es_node.get("local_identifier"),
                name=es_node.get("name"),
                source=es_node.get("source"),
            )
            for es_node in (record.get("energy_storages") or [])
            if es_node is not None
        ]

        geographic_entities = [
            GeographicEntity(
                local_identifier=ge_node.get("local_identifier"),
                name=ge_node.get("name"),
                display_name=ge_node.get("display_name"),
                lat=ge_node.get("lat"),
                lon=ge_node.get("lon"),
                wikidata=ge_node.get("wikidata"),
            )
            for ge_node in (record.get("geographic_entities") or [])
            if ge_node is not None
        ]

        # Neuroscience
        techniques = [
            Technique(
                local_identifier=tech_node.get("local_identifier"),
                name=tech_node.get("name"),
                source=tech_node.get("source"),
            )
            for tech_node in (record.get("techniques") or [])
            if tech_node is not None
        ]

        species_list = [
            Species(
                local_identifier=species_node.get("local_identifier"),
                name=species_node.get("name"),
                source=species_node.get("source"),
            )
            for species_node in (record.get("species_list") or [])
            if species_node is not None
        ]

        uberon_parcellations = [
            UBERONParcellation(
                local_identifier=uberon_node.get("local_identifier"),
                name=uberon_node.get("name"),
                source=uberon_node.get("source"),
            )
            for uberon_node in (record.get("uberon_parcellations") or [])
            if uberon_node is not None
        ]

        biological_sexes = [
            BiologicalSex(
                local_identifier=biosex_node.get("local_identifier"),
                name=biosex_node.get("name"),
                source=biosex_node.get("source"),
            )
            for biosex_node in (record.get("biological_sexes") or [])
            if biosex_node is not None
        ]

        preparation_types = [
            PreparationType(
                local_identifier=prep_node.get("local_identifier"),
                name=prep_node.get("name"),
                source=prep_node.get("source"),
            )
            for prep_node in (record.get("preparation_types") or [])
            if prep_node is not None
        ]

        # Transport-CCAM
        communication_types = [
            CommunicationType(
                local_identifier=comm_node.get("local_identifier"),
                name=comm_node.get("name"),
                source=comm_node.get("source"),
            )
            for comm_node in (record.get("communication_types") or [])
            if comm_node is not None
        ]

        entity_connection_types = [
            EntityConnectionType(
                local_identifier=ect_node.get("local_identifier"),
                name=ect_node.get("name"),
                source=ect_node.get("source"),
            )
            for ect_node in (record.get("entity_connection_types") or [])
            if ect_node is not None
        ]

        levels_of_automation = [
            LevelOfAutomation(
                local_identifier=loa_node.get("local_identifier"),
                name=loa_node.get("name"),
                source=loa_node.get("source"),
            )
            for loa_node in (record.get("levels_of_automation") or [])
            if loa_node is not None
        ]

        scenario_types = [
            ScenarioType(
                local_identifier=scenario_node.get("local_identifier"),
                name=scenario_node.get("name"),
                source=scenario_node.get("source"),
            )
            for scenario_node in (record.get("scenario_types") or [])
            if scenario_node is not None
        ]

        sensor_types = [
            SensorType(
                local_identifier=sensor_node.get("local_identifier"),
                name=sensor_node.get("name"),
                source=sensor_node.get("source"),
            )
            for sensor_node in (record.get("sensor_types") or [])
            if sensor_node is not None
        ]

        vehicle_types = [
            VehicleType(
                local_identifier=vehicle_node.get("local_identifier"),
                name=vehicle_node.get("name"),
                source=vehicle_node.get("source"),
            )
            for vehicle_node in (record.get("vehicle_types") or [])
            if vehicle_node is not None
        ]

        vru_types = [
            VRUType(
                local_identifier=vru_node.get("local_identifier"),
                name=vru_node.get("name"),
                source=vru_node.get("source"),
            )
            for vru_node in (record.get("vru_types") or [])
            if vru_node is not None
        ]

        # Transport-maritime
        vessel_types = [
            VesselType(
                local_identifier=vessel_node.get("local_identifier"),
                name=vessel_node.get("name"),
                type=vessel_node.get("type"),
            )
            for vessel_node in (record.get("vessel_types") or [])
            if vessel_node is not None
        ]

        # Cancer
        diseases = [
            Disease(
                id=disease_node.get("id"),
                name=disease_node.get("name"),
                description=disease_node.get("description"),
                type=disease_node.get("type"),
            )
            for disease_node in (record.get("diseases") or [])
            if disease_node is not None
        ]

        drugs = [
            Drug(
                id=drug_node.get("id"),
                name=drug_node.get("name"),
                description=drug_node.get("description"),
            )
            for drug_node in (record.get("drugs") or [])
            if drug_node is not None
        ]

        tissues = [
            Tissue(
                id=tissue_node.get("id"),
                name=tissue_node.get("name"),
                description=tissue_node.get("description"),
                type=tissue_node.get("type"),
            )
            for tissue_node in (record.get("tissues") or [])
            if tissue_node is not None
        ]

        proteins = [
            Protein(
                id=protein_node.get("id"),
                name=protein_node.get("name"),
                accession=protein_node.get("accession"),
            )
            for protein_node in (record.get("proteins") or [])
            if protein_node is not None
        ]

        genes = [
            Gene(
                id=gene_node.get("id"),
                name=gene_node.get("name"),
                family=gene_node.get("family"),
            )
            for gene_node in (record.get("genes") or [])
            if gene_node is not None
        ]

        graph_enrichments = GraphEnrichments(
            energy_types=energy_types,
            energy_storages=energy_storages,
            geographic_entities=geographic_entities,
            techniques=techniques,
            species=species_list,
            uberon_parcellations=uberon_parcellations,
            biological_sexes=biological_sexes,
            preparation_types=preparation_types,
            communication_types=communication_types,
            entity_connection_types=entity_connection_types,
            levels_of_automation=levels_of_automation,
            scenario_types=scenario_types,
            sensor_types=sensor_types,
            vehicle_types=vehicle_types,
            vru_types=vru_types,
            vessel_types=vessel_types,
            diseases=diseases,
            drugs=drugs,
            tissues=tissues,
            proteins=proteins,
            genes=genes,
        )

        rp.update(
            {
                "pids": pids,
                "agents": agents,
                "topics": topics,
                "grants": grants,
                "manifestations": manifestations,
                "research_artifacts": research_artifacts,
                "technologies": technologies,
                "graph_enrichments": graph_enrichments,
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
