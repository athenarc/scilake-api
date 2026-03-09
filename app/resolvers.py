from app.logger import logger
from app.types import *
from app.utils import get_driver
from typing import Optional, List
import app.mappers as mappers


def get_products(
    database: str,
    where: Optional[ProductWhereFilter] = None,
    page: int = 1,
    page_size: int = 10,
    sort_by: Optional[str] = None,
    sort_order: Optional[str] = None,
    selected_fields: List[str] = None
) -> List[Product]:

    selected_fields = selected_fields or []

    include_topics = "topics" in selected_fields
    include_agents = "agents" in selected_fields
    include_pids = "pids" in selected_fields
    include_grants = "grants" in selected_fields
    include_manifestations = "manifestations" in selected_fields
    # Strawberry exposes snake_case fields as camelCase in GraphQL (e.g. researchArtifacts, graphEnrichments),
    # so we check for both representations in the selected field names.
    include_research_artifacts = (
        "research_artifacts" in selected_fields or "researchArtifacts" in selected_fields
    )
    include_technologies = "technologies" in selected_fields
    include_graph_enrichments = (
        "graph_enrichments" in selected_fields or "graphEnrichments" in selected_fields
    )

    params = {
        "skip": (page - 1) * page_size,
        "limit": page_size
    }

    match_clauses = ["MATCH (p:Product)"]  # Start with base MATCH for Product nodes
    optional_match_clauses = []  # Store OPTIONAL MATCH clauses
    graph_entity_with_parts: List[str] = []  # extra WITH projections for graph-specific entities
    graph_entity_return_parts: List[str] = []  # extra RETURN parts for graph-specific entities
    where_clauses = []

    # Convert `where` object to Cypher conditions
    def build_where_clause(filter_obj: ProductWhereFilter) -> str:
        clauses = []

        def add_clause(field: str, filter_data):
            param_name = field.replace(".", "_")

            # equality
            if getattr(filter_data, "equals", None) is not None:
                clauses.append(f"{field} = ${param_name}")
                params[param_name] = filter_data.equals

            # string contains
            if getattr(filter_data, "contains", None) is not None:
                clauses.append(f"{field} CONTAINS ${param_name}_contains")
                params[f"{param_name}_contains"] = filter_data.contains

            # IN list
            if getattr(filter_data, "in_list", None) is not None:
                clauses.append(f"{field} IN ${param_name}_in")
                params[f"{param_name}_in"] = filter_data.in_list

            # numeric comparisons (for FloatFilter / IntFilter)
            if getattr(filter_data, "gt", None) is not None:
                clauses.append(f"{field} > ${param_name}_gt")
                params[f"{param_name}_gt"] = filter_data.gt
            if getattr(filter_data, "gte", None) is not None:
                clauses.append(f"{field} >= ${param_name}_gte")
                params[f"{param_name}_gte"] = filter_data.gte
            if getattr(filter_data, "lt", None) is not None:
                clauses.append(f"{field} < ${param_name}_lt")
                params[f"{param_name}_lt"] = filter_data.lt
            if getattr(filter_data, "lte", None) is not None:
                clauses.append(f"{field} <= ${param_name}_lte")
                params[f"{param_name}_lte"] = filter_data.lte

        if filter_obj.AND:
            and_clauses = [build_where_clause(f) for f in filter_obj.AND]
            clauses.append(f"({' AND '.join(and_clauses)})")
        if filter_obj.OR:
            or_clauses = [build_where_clause(f) for f in filter_obj.OR]
            clauses.append(f"({' OR '.join(or_clauses)})")

        if filter_obj.product:
            # Map GraphQL ProductFilter.id to Product.local_identifier in the graph
            if filter_obj.product.id:
                add_clause("p.local_identifier", filter_obj.product.id)
            if filter_obj.product.title:
                add_clause("p.title", filter_obj.product.title)
            if filter_obj.product.product_type:
                add_clause("p.product_type", filter_obj.product.product_type)
            if filter_obj.product.pids:
                match_clauses.append("MATCH (p)-[:HAS_PID]->(pid:Pid)")
                if filter_obj.product.pids.scheme:
                    add_clause("pid.scheme", filter_obj.product.pids.scheme)
                if filter_obj.product.pids.value:
                    add_clause("pid.value", filter_obj.product.pids.value)

            if filter_obj.product.citation_count:
                add_clause("p.citation_count", filter_obj.product.citation_count)
            if filter_obj.product.citation_count_class:
                add_clause("p.citation_count_class", filter_obj.product.citation_count_class)
            if filter_obj.product.influence:
                add_clause("p.influence", filter_obj.product.influence)
            if filter_obj.product.influence_class:
                add_clause("p.influence_class", filter_obj.product.influence_class)
            if filter_obj.product.popularity:
                add_clause("p.popularity", filter_obj.product.popularity)
            if filter_obj.product.popularity_class:
                add_clause("p.popularity_class", filter_obj.product.popularity_class)
            if filter_obj.product.impulse:
                add_clause("p.impulse", filter_obj.product.impulse)
            if filter_obj.product.impulse_class:
                add_clause("p.impulse_class", filter_obj.product.impulse_class)
            if filter_obj.product.repro_rci:
                add_clause("p.repro_rci", filter_obj.product.repro_rci)
            if filter_obj.product.repro_focused_rci:
                add_clause("p.repro_focused_rci", filter_obj.product.repro_focused_rci)
            if filter_obj.product.repro_positive_mentions_count:
                add_clause("p.repro_positive_mentions_count", filter_obj.product.repro_positive_mentions_count)

        if filter_obj.agent:
            match_clauses.append("MATCH (p)<-[:HAS_CONTRIBUTED_TO]-(a:Agent)")
            if filter_obj.agent.local_identifier:
                add_clause("a.local_identifier", filter_obj.agent.local_identifier)
            if filter_obj.agent.name:
                add_clause("a.name", filter_obj.agent.name)

        if filter_obj.topic:
            match_clauses.append("MATCH (p)-[:HAS_TOPIC]->(t:Topic)")
            if filter_obj.topic.name:
                add_clause("t.name", filter_obj.topic.name)

        if filter_obj.grant:
            match_clauses.append("MATCH (p)-[:FUNDED_BY]->(g:Grant)")
            if filter_obj.grant.local_identifier:
                add_clause("g.local_identifier", filter_obj.grant.local_identifier)
            if filter_obj.grant.title:
                add_clause("g.title", filter_obj.grant.title)
            if filter_obj.grant.abstract:
                add_clause("g.abstract", filter_obj.grant.abstract)

        if filter_obj.manifestation:
            match_clauses.append("MATCH (p)-[:HAS_MANIFESTATION]->(m:Manifestation)")
            if filter_obj.manifestation.local_identifier:
                add_clause("m.local_identifier", filter_obj.manifestation.local_identifier)
            if filter_obj.manifestation.publicationdate:
                add_clause("m.publication_date", filter_obj.manifestation.publicationdate)
            if filter_obj.manifestation.type_label:
                add_clause("m.type_label", filter_obj.manifestation.type_label)

        if filter_obj.research_artifact:
            match_clauses.append("MATCH (p)-[:HAS_RESEARCH_ARTIFACT]->(ra:ResearchArtifact)")
            if filter_obj.research_artifact.local_identifier:
                add_clause("ra.local_identifier", filter_obj.research_artifact.local_identifier)
            if filter_obj.research_artifact.label:
                add_clause("ra.label", filter_obj.research_artifact.label)
            if filter_obj.research_artifact.type:
                add_clause("ra.type", filter_obj.research_artifact.type)

        if filter_obj.technology:
            match_clauses.append("MATCH (p)-[:HAS_TECHNOLOGY]->(tech:Technology)")
            if filter_obj.technology.local_identifier:
                add_clause("tech.local_identifier", filter_obj.technology.local_identifier)
            if filter_obj.technology.name:
                add_clause("tech.name", filter_obj.technology.name)

        # graph-specific filters per graph (all resolved through the current graphdb)
        if getattr(filter_obj, "energy_type", None):
            match_clauses.append("MATCH (p)-[:MENTIONS]->(et:EnergyType)")
            if filter_obj.energy_type.local_identifier:
                add_clause("et.local_identifier", filter_obj.energy_type.local_identifier)
            if filter_obj.energy_type.name:
                add_clause("et.name", filter_obj.energy_type.name)
            if filter_obj.energy_type.source:
                add_clause("et.source", filter_obj.energy_type.source)

        if getattr(filter_obj, "energy_storage", None):
            match_clauses.append("MATCH (p)-[:MENTIONS]->(es:EnergyStorage)")
            if filter_obj.energy_storage.local_identifier:
                add_clause("es.local_identifier", filter_obj.energy_storage.local_identifier)
            if filter_obj.energy_storage.name:
                add_clause("es.name", filter_obj.energy_storage.name)
            if filter_obj.energy_storage.source:
                add_clause("es.source", filter_obj.energy_storage.source)

        if getattr(filter_obj, "geographic_entity", None):
            match_clauses.append("MATCH (p)-[:MENTIONS]->(ge:GeographicEntity)")
            if filter_obj.geographic_entity.local_identifier:
                add_clause("ge.local_identifier", filter_obj.geographic_entity.local_identifier)
            if filter_obj.geographic_entity.name:
                add_clause("ge.name", filter_obj.geographic_entity.name)
            if filter_obj.geographic_entity.display_name:
                add_clause("ge.display_name", filter_obj.geographic_entity.display_name)
            if filter_obj.geographic_entity.wikidata:
                add_clause("ge.wikidata", filter_obj.geographic_entity.wikidata)

        if getattr(filter_obj, "technique", None):
            match_clauses.append("MATCH (p)-[:MENTIONS]->(technique:Technique)")
            if filter_obj.technique.local_identifier:
                add_clause("technique.local_identifier", filter_obj.technique.local_identifier)
            if filter_obj.technique.name:
                add_clause("technique.name", filter_obj.technique.name)
            if filter_obj.technique.source:
                add_clause("technique.source", filter_obj.technique.source)

        if getattr(filter_obj, "species", None):
            match_clauses.append("MATCH (p)-[:MENTIONS]->(species:Species)")
            if filter_obj.species.local_identifier:
                add_clause("species.local_identifier", filter_obj.species.local_identifier)
            if filter_obj.species.name:
                add_clause("species.name", filter_obj.species.name)
            if filter_obj.species.source:
                add_clause("species.source", filter_obj.species.source)

        if getattr(filter_obj, "uberon_parcellation", None):
            match_clauses.append("MATCH (p)-[:MENTIONS]->(uberon:UBERONParcellation)")
            if filter_obj.uberon_parcellation.local_identifier:
                add_clause(
                    "uberon.local_identifier",
                    filter_obj.uberon_parcellation.local_identifier,
                )
            if filter_obj.uberon_parcellation.name:
                add_clause("uberon.name", filter_obj.uberon_parcellation.name)
            if filter_obj.uberon_parcellation.source:
                add_clause("uberon.source", filter_obj.uberon_parcellation.source)

        if getattr(filter_obj, "biological_sex", None):
            match_clauses.append("MATCH (p)-[:MENTIONS]->(biosex:BiologicalSex)")
            if filter_obj.biological_sex.local_identifier:
                add_clause(
                    "biosex.local_identifier",
                    filter_obj.biological_sex.local_identifier,
                )
            if filter_obj.biological_sex.name:
                add_clause("biosex.name", filter_obj.biological_sex.name)
            if filter_obj.biological_sex.source:
                add_clause("biosex.source", filter_obj.biological_sex.source)

        if getattr(filter_obj, "preparation_type", None):
            match_clauses.append("MATCH (p)-[:MENTIONS]->(prep:PreparationType)")
            if filter_obj.preparation_type.local_identifier:
                add_clause(
                    "prep.local_identifier",
                    filter_obj.preparation_type.local_identifier,
                )
            if filter_obj.preparation_type.name:
                add_clause("prep.name", filter_obj.preparation_type.name)
            if filter_obj.preparation_type.source:
                add_clause("prep.source", filter_obj.preparation_type.source)

        if getattr(filter_obj, "communication_type", None):
            match_clauses.append("MATCH (p)-[:MENTIONS]->(comm_type:CommunicationType)")
            if filter_obj.communication_type.local_identifier:
                add_clause(
                    "comm_type.local_identifier",
                    filter_obj.communication_type.local_identifier,
                )
            if filter_obj.communication_type.name:
                add_clause("comm_type.name", filter_obj.communication_type.name)
            if filter_obj.communication_type.source:
                add_clause("comm_type.source", filter_obj.communication_type.source)

        if getattr(filter_obj, "entity_connection_type", None):
            match_clauses.append(
                "MATCH (p)-[:MENTIONS]->(entity_conn_type:EntityConnectionType)"
            )
            if filter_obj.entity_connection_type.local_identifier:
                add_clause(
                    "entity_conn_type.local_identifier",
                    filter_obj.entity_connection_type.local_identifier,
                )
            if filter_obj.entity_connection_type.name:
                add_clause(
                    "entity_conn_type.name", filter_obj.entity_connection_type.name
                )
            if filter_obj.entity_connection_type.source:
                add_clause(
                    "entity_conn_type.source", filter_obj.entity_connection_type.source
                )

        if getattr(filter_obj, "level_of_automation", None):
            match_clauses.append("MATCH (p)-[:MENTIONS]->(loa:LevelOfAutomation)")
            if filter_obj.level_of_automation.local_identifier:
                add_clause(
                    "loa.local_identifier",
                    filter_obj.level_of_automation.local_identifier,
                )
            if filter_obj.level_of_automation.name:
                add_clause("loa.name", filter_obj.level_of_automation.name)
            if filter_obj.level_of_automation.source:
                add_clause("loa.source", filter_obj.level_of_automation.source)

        if getattr(filter_obj, "scenario_type", None):
            match_clauses.append(
                "MATCH (p)-[:MENTIONS]->(scenario_type:ScenarioType)"
            )
            if filter_obj.scenario_type.local_identifier:
                add_clause(
                    "scenario_type.local_identifier",
                    filter_obj.scenario_type.local_identifier,
                )
            if filter_obj.scenario_type.name:
                add_clause("scenario_type.name", filter_obj.scenario_type.name)
            if filter_obj.scenario_type.source:
                add_clause("scenario_type.source", filter_obj.scenario_type.source)

        if getattr(filter_obj, "sensor_type", None):
            match_clauses.append("MATCH (p)-[:MENTIONS]->(sensor_type:SensorType)")
            if filter_obj.sensor_type.local_identifier:
                add_clause(
                    "sensor_type.local_identifier",
                    filter_obj.sensor_type.local_identifier,
                )
            if filter_obj.sensor_type.name:
                add_clause("sensor_type.name", filter_obj.sensor_type.name)
            if filter_obj.sensor_type.source:
                add_clause("sensor_type.source", filter_obj.sensor_type.source)

        if getattr(filter_obj, "vehicle_type", None):
            match_clauses.append("MATCH (p)-[:MENTIONS]->(vehicle_type:VehicleType)")
            if filter_obj.vehicle_type.local_identifier:
                add_clause(
                    "vehicle_type.local_identifier",
                    filter_obj.vehicle_type.local_identifier,
                )
            if filter_obj.vehicle_type.name:
                add_clause("vehicle_type.name", filter_obj.vehicle_type.name)
            if filter_obj.vehicle_type.source:
                add_clause("vehicle_type.source", filter_obj.vehicle_type.source)

        if getattr(filter_obj, "vru_type", None):
            match_clauses.append("MATCH (p)-[:MENTIONS]->(vru_type:VRUType)")
            if filter_obj.vru_type.local_identifier:
                add_clause(
                    "vru_type.local_identifier",
                    filter_obj.vru_type.local_identifier,
                )
            if filter_obj.vru_type.name:
                add_clause("vru_type.name", filter_obj.vru_type.name)
            if filter_obj.vru_type.source:
                add_clause("vru_type.source", filter_obj.vru_type.source)

        if getattr(filter_obj, "vessel_type", None):
            match_clauses.append("MATCH (p)-[:MENTIONS]->(vessel_type:VesselType)")
            if filter_obj.vessel_type.local_identifier:
                add_clause(
                    "vessel_type.local_identifier",
                    filter_obj.vessel_type.local_identifier,
                )
            if filter_obj.vessel_type.name:
                add_clause("vessel_type.name", filter_obj.vessel_type.name)
            if filter_obj.vessel_type.type:
                add_clause("vessel_type.type", filter_obj.vessel_type.type)

        if getattr(filter_obj, "disease", None):
            match_clauses.append("MATCH (p)-[:MENTIONS]->(disease:Disease)")
            if filter_obj.disease.id:
                add_clause("disease.id", filter_obj.disease.id)
            if filter_obj.disease.name:
                add_clause("disease.name", filter_obj.disease.name)
            if filter_obj.disease.type:
                add_clause("disease.type", filter_obj.disease.type)

        if getattr(filter_obj, "drug", None):
            match_clauses.append("MATCH (p)-[:MENTIONS]->(drug:Drug)")
            if filter_obj.drug.id:
                add_clause("drug.id", filter_obj.drug.id)
            if filter_obj.drug.name:
                add_clause("drug.name", filter_obj.drug.name)

        if getattr(filter_obj, "tissue", None):
            match_clauses.append("MATCH (p)-[:MENTIONS]->(tissue:Tissue)")
            if filter_obj.tissue.id:
                add_clause("tissue.id", filter_obj.tissue.id)
            if filter_obj.tissue.name:
                add_clause("tissue.name", filter_obj.tissue.name)
            if filter_obj.tissue.type:
                add_clause("tissue.type", filter_obj.tissue.type)

        if getattr(filter_obj, "protein", None):
            match_clauses.append("MATCH (p)-[:MENTIONS]->(protein:Protein)")
            if filter_obj.protein.id:
                add_clause("protein.id", filter_obj.protein.id)
            if filter_obj.protein.name:
                add_clause("protein.name", filter_obj.protein.name)
            if filter_obj.protein.accession:
                add_clause("protein.accession", filter_obj.protein.accession)

        if getattr(filter_obj, "gene", None):
            # Genes are typically reached through proteins; we still model a direct mention pattern here.
            match_clauses.append("MATCH (p)-[:MENTIONS]->(gene:Gene)")
            if filter_obj.gene.id:
                add_clause("gene.id", filter_obj.gene.id)
            if filter_obj.gene.name:
                add_clause("gene.name", filter_obj.gene.name)
            if filter_obj.gene.family:
                add_clause("gene.family", filter_obj.gene.family)

        return " AND ".join(clauses)
    
    # Apply filtering if `where` is provided
    if where:
        where_clause = build_where_clause(where)
        if where_clause:
            where_clauses.append(where_clause)

    # Ensure OPTIONAL MATCH for requested fields (avoid filtering out results)
    if include_agents and not any("MATCH (p)<-[:HAS_CONTRIBUTED_TO]-(a:Agent)" in clause for clause in match_clauses):
        optional_match_clauses.append("OPTIONAL MATCH (p)<-[:HAS_CONTRIBUTED_TO]-(a:Agent)")
    if include_topics and not any("MATCH (p)-[:HAS_TOPIC]->(t:Topic)" in clause for clause in match_clauses):
        optional_match_clauses.append("OPTIONAL MATCH (p)-[:HAS_TOPIC]->(t:Topic)")
    if include_pids and not any("MATCH (p)-[:HAS_PID]->(pid:Pid)" in clause for clause in match_clauses):
        optional_match_clauses.append("OPTIONAL MATCH (p)-[:HAS_PID]->(pid:Pid)")

    # Bring in other shared neighbours of Product (no citation links) only if requested
    if include_grants:
        optional_match_clauses.append("OPTIONAL MATCH (p)-[:FUNDED_BY]->(g:Grant)")
    if include_manifestations:
        optional_match_clauses.append("OPTIONAL MATCH (p)-[:HAS_MANIFESTATION]->(m:Manifestation)")
    if include_research_artifacts:
        optional_match_clauses.append("OPTIONAL MATCH (p)-[:HAS_RESEARCH_ARTIFACT]->(ra:ResearchArtifact)")
    if include_technologies:
        optional_match_clauses.append("OPTIONAL MATCH (p)-[:HAS_TECHNOLOGY]->(tech:Technology)")

    # graph-specific OPTIONAL MATCHes and WITH/RETURN projections
    if include_graph_enrichments:
        # helper: check if any selected field path starts with a given prefix
        def field_selected(prefix: str) -> bool:
            return any(f.startswith(prefix) for f in selected_fields)

        if database == "energy":
            if field_selected("graphEnrichments.energyTypes"):
                optional_match_clauses.append(
                    "OPTIONAL MATCH (p)-[:MENTIONS]->(et:EnergyType)"
                )
                graph_entity_with_parts.append(
                    "collect(DISTINCT et) AS energy_types"
                )
                graph_entity_return_parts.append("energy_types")

            if field_selected("graphEnrichments.energyStorages"):
                optional_match_clauses.append(
                    "OPTIONAL MATCH (p)-[:MENTIONS]->(es:EnergyStorage)"
                )
                graph_entity_with_parts.append(
                    "collect(DISTINCT es) AS energy_storages"
                )
                graph_entity_return_parts.append("energy_storages")

            if field_selected("graphEnrichments.geographicEntities"):
                optional_match_clauses.append(
                    "OPTIONAL MATCH (p)-[:MENTIONS]->(ge:GeographicEntity)"
                )
                graph_entity_with_parts.append(
                    "collect(DISTINCT ge) AS geographic_entities"
                )
                graph_entity_return_parts.append("geographic_entities")

        elif database == "neuroscience":
            if field_selected("graphEnrichments.techniques"):
                optional_match_clauses.append(
                    "OPTIONAL MATCH (p)-[:MENTIONS]->(technique:Technique)"
                )
                graph_entity_with_parts.append(
                    "collect(DISTINCT technique) AS techniques"
                )
                graph_entity_return_parts.append("techniques")

            if field_selected("graphEnrichments.species"):
                optional_match_clauses.append(
                    "OPTIONAL MATCH (p)-[:MENTIONS]->(species:Species)"
                )
                graph_entity_with_parts.append(
                    "collect(DISTINCT species) AS species_list"
                )
                graph_entity_return_parts.append("species_list")

            if field_selected("graphEnrichments.uberonParcellations"):
                optional_match_clauses.append(
                    "OPTIONAL MATCH (p)-[:MENTIONS]->(uberon:UBERONParcellation)"
                )
                graph_entity_with_parts.append(
                    "collect(DISTINCT uberon) AS uberon_parcellations"
                )
                graph_entity_return_parts.append("uberon_parcellations")

            if field_selected("graphEnrichments.biologicalSexes"):
                optional_match_clauses.append(
                    "OPTIONAL MATCH (p)-[:MENTIONS]->(biosex:BiologicalSex)"
                )
                graph_entity_with_parts.append(
                    "collect(DISTINCT biosex) AS biological_sexes"
                )
                graph_entity_return_parts.append("biological_sexes")

            if field_selected("graphEnrichments.preparationTypes"):
                optional_match_clauses.append(
                    "OPTIONAL MATCH (p)-[:MENTIONS]->(prep:PreparationType)"
                )
                graph_entity_with_parts.append(
                    "collect(DISTINCT prep) AS preparation_types"
                )
                graph_entity_return_parts.append("preparation_types")

        elif database == "transport-ccam":
            if field_selected("graphEnrichments.communicationTypes"):
                optional_match_clauses.append(
                    "OPTIONAL MATCH (p)-[:MENTIONS]->(comm_type:CommunicationType)"
                )
                graph_entity_with_parts.append(
                    "collect(DISTINCT comm_type) AS communication_types"
                )
                graph_entity_return_parts.append("communication_types")

            if field_selected("graphEnrichments.entityConnectionTypes"):
                optional_match_clauses.append(
                    "OPTIONAL MATCH (p)-[:MENTIONS]->(entity_conn_type:EntityConnectionType)"
                )
                graph_entity_with_parts.append(
                    "collect(DISTINCT entity_conn_type) AS entity_connection_types"
                )
                graph_entity_return_parts.append("entity_connection_types")

            if field_selected("graphEnrichments.levelsOfAutomation"):
                optional_match_clauses.append(
                    "OPTIONAL MATCH (p)-[:MENTIONS]->(loa:LevelOfAutomation)"
                )
                graph_entity_with_parts.append(
                    "collect(DISTINCT loa) AS levels_of_automation"
                )
                graph_entity_return_parts.append("levels_of_automation")

            if field_selected("graphEnrichments.scenarioTypes"):
                optional_match_clauses.append(
                    "OPTIONAL MATCH (p)-[:MENTIONS]->(scenario_type:ScenarioType)"
                )
                graph_entity_with_parts.append(
                    "collect(DISTINCT scenario_type) AS scenario_types"
                )
                graph_entity_return_parts.append("scenario_types")

            if field_selected("graphEnrichments.sensorTypes"):
                optional_match_clauses.append(
                    "OPTIONAL MATCH (p)-[:MENTIONS]->(sensor_type:SensorType)"
                )
                graph_entity_with_parts.append(
                    "collect(DISTINCT sensor_type) AS sensor_types"
                )
                graph_entity_return_parts.append("sensor_types")

            if field_selected("graphEnrichments.vehicleTypes"):
                optional_match_clauses.append(
                    "OPTIONAL MATCH (p)-[:MENTIONS]->(vehicle_type:VehicleType)"
                )
                graph_entity_with_parts.append(
                    "collect(DISTINCT vehicle_type) AS vehicle_types"
                )
                graph_entity_return_parts.append("vehicle_types")

            if field_selected("graphEnrichments.vruTypes"):
                optional_match_clauses.append(
                    "OPTIONAL MATCH (p)-[:MENTIONS]->(vru_type:VRUType)"
                )
                graph_entity_with_parts.append(
                    "collect(DISTINCT vru_type) AS vru_types"
                )
                graph_entity_return_parts.append("vru_types")

        elif database == "transport-maritime":
            if field_selected("graphEnrichments.vesselTypes"):
                optional_match_clauses.append(
                    "OPTIONAL MATCH (p)-[:MENTIONS]->(vessel_type:VesselType)"
                )
                graph_entity_with_parts.append(
                    "collect(DISTINCT vessel_type) AS vessel_types"
                )
                graph_entity_return_parts.append("vessel_types")

        elif database == "cancer":
            # Cancer graph: domain entities such as Disease, Drug, Tissue, Protein, Gene.
            # These may be connected through domain-specific subgraphs; we model them via generic mention edges when present.
            if field_selected("graphEnrichments.diseases"):
                optional_match_clauses.append(
                    "OPTIONAL MATCH (p)-[:MENTIONS]->(disease:Disease)"
                )
                graph_entity_with_parts.append(
                    "collect(DISTINCT disease) AS diseases"
                )
                graph_entity_return_parts.append("diseases")

            if field_selected("graphEnrichments.drugs"):
                optional_match_clauses.append(
                    "OPTIONAL MATCH (p)-[:MENTIONS]->(drug:Drug)"
                )
                graph_entity_with_parts.append(
                    "collect(DISTINCT drug) AS drugs"
                )
                graph_entity_return_parts.append("drugs")

            if field_selected("graphEnrichments.tissues"):
                optional_match_clauses.append(
                    "OPTIONAL MATCH (p)-[:MENTIONS]->(tissue:Tissue)"
                )
                graph_entity_with_parts.append(
                    "collect(DISTINCT tissue) AS tissues"
                )
                graph_entity_return_parts.append("tissues")

            if field_selected("graphEnrichments.proteins"):
                optional_match_clauses.append(
                    "OPTIONAL MATCH (p)-[:MENTIONS]->(protein:Protein)"
                )
                graph_entity_with_parts.append(
                    "collect(DISTINCT protein) AS proteins"
                )
                graph_entity_return_parts.append("proteins")

            if field_selected("graphEnrichments.genes"):
                optional_match_clauses.append(
                    "OPTIONAL MATCH (p)-[:MENTIONS]->(gene:Gene)"
                )
                graph_entity_with_parts.append(
                    "collect(DISTINCT gene) AS genes"
                )
                graph_entity_return_parts.append("genes")

    # Construct the final query
    graph_entity_with_clause = (
        (", " + ", ".join(graph_entity_with_parts)) if graph_entity_with_parts else ""
    )
    graph_entity_return_clause = (
        (", " + ", ".join(graph_entity_return_parts))
        if graph_entity_return_parts
        else ""
    )
    order_clause = f"ORDER BY p.{sort_by} {sort_order}" if sort_by and sort_order else ""

    query = f"""
    {" ".join(match_clauses)}
    {"WHERE " + " AND ".join(where_clauses) if where_clauses else ""}
    {" ".join(optional_match_clauses)}
    WITH p 
    {", collect(DISTINCT t) AS topics" if include_topics else ""} 
    {", collect(DISTINCT a) AS agents" if include_agents else ""}
    {", collect(DISTINCT pid) AS pids" if include_pids else ""}
    {", collect(DISTINCT g) AS grants" if include_grants else ""}
    {", collect(DISTINCT m) AS manifestations" if include_manifestations else ""}
    {", collect(DISTINCT ra) AS research_artifacts" if include_research_artifacts else ""}
    {", collect(DISTINCT tech) AS technologies" if include_technologies else ""}
    {graph_entity_with_clause}
    RETURN p 
    {", topics" if include_topics else ""} 
    {", agents" if include_agents else ""}
    {", pids" if include_pids else ""}
    {", grants" if include_grants else ""}
    {", manifestations" if include_manifestations else ""}
    {", research_artifacts" if include_research_artifacts else ""}
    {", technologies" if include_technologies else ""}
    {graph_entity_return_clause}
    {order_clause}
    SKIP $skip
    LIMIT $limit
    """

    logger.info(f"Generated Cypher Query:\n{query}\nParameters: {params}")

    driver = get_driver(database)
    return driver.execute_query(query, params, result_transformer_=mappers.to_products)

