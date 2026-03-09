import strawberry
from typing import Optional, List

@strawberry.type
class Product:
    id: str
    title: str
    product_type: str
    # Core metadata aligned with Product node properties
    abstract: Optional[str] = None
    publicationdate: Optional[str] = None  # maps Product.publication_date
    publisher: Optional[str] = None
    citation_count: Optional[float] = None
    citation_count_class: Optional[str] = None
    influence: Optional[float] = None
    influence_class: Optional[str] = None
    popularity: Optional[float] = None
    popularity_class: Optional[str] = None
    impulse: Optional[float] = None
    impulse_class: Optional[str] = None
    repro_rci: Optional[float] = None
    repro_focused_rci: Optional[float] = None
    repro_positive_mentions_count: Optional[int] = None
    entity_type: Optional[str] = None

    # related entities 
    pids: List["Pid"] = None
    agents: List["Agent"] = None
    topics: List["Topic"] = None
    grants: List["Grant"] = None
    manifestations: List["Manifestation"] = None
    research_artifacts: List["ResearchArtifact"] = None
    technologies: List["Technology"] = None

    # graph-specific enrichments grouped by type (vary by graphdb)
    graph_enrichments: Optional["GraphEnrichments"] = None

@strawberry.type
class Pid:
    local_identifier: Optional[str] = None
    value: Optional[str] = None
    scheme: Optional[str] = None

@strawberry.type
class Agent:
    id: Optional[str] = None
    fullname: Optional[str] = None
    local_identifier: Optional[str] = None
    website: Optional[str] = None
    name: Optional[str] = None
    family_name: Optional[str] = None
    types: Optional[List[str]] = None
    entity_type: Optional[str] = None
    short_name: Optional[str] = None
    given_name: Optional[str] = None
    other_names: Optional[List[str]] = None
    country: Optional[str] = None

    #related entities
    research_products: List[Product] = None
    
@strawberry.type
class Topic:
    name: Optional[str] = None
    local_identifier: Optional[str] = None
    entity_type: Optional[str] = None

    #related entities
    research_products: List[Product] = None
    
@strawberry.type
class Grant:
    id: Optional[str] = None
    abstract: Optional[str] = None
    local_identifier: Optional[str] = None
    keywords: Optional[List[str]] = None
    acronym: Optional[str] = None
    website: Optional[str] = None
    duration_start: Optional[str] = None
    funded_amount: Optional[float] = None
    currency: Optional[str] = None
    title: Optional[str] = None
    grant_number: Optional[str] = None
    funding_stream: Optional[str] = None
    duration_end: Optional[str] = None
    entity_type: Optional[str] = None


@strawberry.type
class Manifestation:
    local_identifier: Optional[str] = None
    publicationdate: Optional[str] = None
    type_defined_in: Optional[str] = None
    licence: Optional[str] = None
    type_class: Optional[str] = None
    biblio: Optional[str] = None
    access_rights_status: Optional[str] = None
    access_rights_description: Optional[str] = None
    peer_review_status: Optional[str] = None
    type_label: Optional[str] = None


@strawberry.type
class ResearchArtifact:
    local_identifier: Optional[str] = None
    label: Optional[str] = None
    type: Optional[str] = None


@strawberry.type
class Technology:
    local_identifier: Optional[str] = None
    name: Optional[str] = None


# graph-specific entities (per graph)

# Energy
@strawberry.type(description="Energy graph-specific entity: energy type (only for 'energy' graphdb).")
class EnergyType:
    local_identifier: Optional[str] = None
    name: Optional[str] = None
    source: Optional[str] = None


@strawberry.type(description="Energy graph-specific entity: energy storage (only for 'energy' graphdb).")
class EnergyStorage:
    local_identifier: Optional[str] = None
    name: Optional[str] = None
    source: Optional[str] = None


@strawberry.type(description="Energy graph-specific entity: geographic entity (only for 'energy' graphdb).")
class GeographicEntity:
    local_identifier: Optional[str] = None
    name: Optional[str] = None
    display_name: Optional[str] = None
    lat: Optional[float] = None
    lon: Optional[float] = None
    wikidata: Optional[str] = None


# Neuroscience
@strawberry.type(description="Neuroscience graph-specific entity: technique (only for 'neuroscience' graphdb).")
class Technique:
    local_identifier: Optional[str] = None
    name: Optional[str] = None
    source: Optional[str] = None


@strawberry.type(description="Neuroscience graph-specific entity: species (only for 'neuroscience' graphdb).")
class Species:
    local_identifier: Optional[str] = None
    name: Optional[str] = None
    source: Optional[str] = None


@strawberry.type(description="Neuroscience graph-specific entity: UBERON parcellation (only for 'neuroscience' graphdb).")
class UBERONParcellation:
    local_identifier: Optional[str] = None
    name: Optional[str] = None
    source: Optional[str] = None


@strawberry.type(description="Neuroscience graph-specific entity: biological sex (only for 'neuroscience' graphdb).")
class BiologicalSex:
    local_identifier: Optional[str] = None
    name: Optional[str] = None
    source: Optional[str] = None


@strawberry.type(description="Neuroscience graph-specific entity: preparation type (only for 'neuroscience' graphdb).")
class PreparationType:
    local_identifier: Optional[str] = None
    name: Optional[str] = None
    source: Optional[str] = None


# Transport-CCAM
@strawberry.type(description="Transport-CCAM graph-specific entity: communication type (only for 'transport-ccam' graphdb).")
class CommunicationType:
    local_identifier: Optional[str] = None
    name: Optional[str] = None
    source: Optional[str] = None


@strawberry.type(description="Transport-CCAM graph-specific entity: entity connection type (only for 'transport-ccam' graphdb).")
class EntityConnectionType:
    local_identifier: Optional[str] = None
    name: Optional[str] = None
    source: Optional[str] = None


@strawberry.type(description="Transport-CCAM graph-specific entity: level of automation (only for 'transport-ccam' graphdb).")
class LevelOfAutomation:
    local_identifier: Optional[str] = None
    name: Optional[str] = None
    source: Optional[str] = None


@strawberry.type(description="Transport-CCAM graph-specific entity: scenario type (only for 'transport-ccam' graphdb).")
class ScenarioType:
    local_identifier: Optional[str] = None
    name: Optional[str] = None
    source: Optional[str] = None


@strawberry.type(description="Transport-CCAM graph-specific entity: sensor type (only for 'transport-ccam' graphdb).")
class SensorType:
    local_identifier: Optional[str] = None
    name: Optional[str] = None
    source: Optional[str] = None


@strawberry.type(description="Transport-CCAM graph-specific entity: vehicle type (only for 'transport-ccam' graphdb).")
class VehicleType:
    local_identifier: Optional[str] = None
    name: Optional[str] = None
    source: Optional[str] = None


@strawberry.type(description="Transport-CCAM graph-specific entity: vulnerable road user type (only for 'transport-ccam' graphdb).")
class VRUType:
    local_identifier: Optional[str] = None
    name: Optional[str] = None
    source: Optional[str] = None


# Transport-Maritime
@strawberry.type(description="Transport-maritime graph-specific entity: vessel type (only for 'transport-maritime' graphdb).")
class VesselType:
    local_identifier: Optional[str] = None
    name: Optional[str] = None
    type: Optional[str] = None


# Cancer
@strawberry.type(description="Cancer graph-specific entity: disease (only for 'cancer' graphdb).")
class Disease:
    id: Optional[str] = None
    name: Optional[str] = None
    description: Optional[str] = None
    type: Optional[str] = None


@strawberry.type(description="Cancer graph-specific entity: drug (only for 'cancer' graphdb).")
class Drug:
    id: Optional[str] = None
    name: Optional[str] = None
    description: Optional[str] = None


@strawberry.type(description="Cancer graph-specific entity: tissue (only for 'cancer' graphdb).")
class Tissue:
    id: Optional[str] = None
    name: Optional[str] = None
    description: Optional[str] = None
    type: Optional[str] = None


@strawberry.type(description="Cancer graph-specific entity: protein (only for 'cancer' graphdb).")
class Protein:
    id: Optional[str] = None
    name: Optional[str] = None
    accession: Optional[str] = None


@strawberry.type(description="Cancer graph-specific entity: gene (only for 'cancer' graphdb).")
class Gene:
    id: Optional[str] = None
    name: Optional[str] = None
    family: Optional[str] = None


@strawberry.type(
    description=(
        "Graph-specific domain enrichments related to a Product, grouped by type. "
        "Fields are populated only for the active graphdb "
        "('energy', 'neuroscience', 'transport-ccam', 'transport-maritime', or 'cancer')."
    )
)
class GraphEnrichments:
    # Energy graph
    energy_types: List[EnergyType] = strawberry.field(default_factory=list)
    energy_storages: List[EnergyStorage] = strawberry.field(default_factory=list)
    geographic_entities: List[GeographicEntity] = strawberry.field(default_factory=list)

    # Neuroscience graph
    techniques: List[Technique] = strawberry.field(default_factory=list)
    species: List[Species] = strawberry.field(default_factory=list)
    uberon_parcellations: List[UBERONParcellation] = strawberry.field(default_factory=list)
    biological_sexes: List[BiologicalSex] = strawberry.field(default_factory=list)
    preparation_types: List[PreparationType] = strawberry.field(default_factory=list)

    # Transport-CCAM graph
    communication_types: List[CommunicationType] = strawberry.field(default_factory=list)
    entity_connection_types: List[EntityConnectionType] = strawberry.field(default_factory=list)
    levels_of_automation: List[LevelOfAutomation] = strawberry.field(default_factory=list)
    scenario_types: List[ScenarioType] = strawberry.field(default_factory=list)
    sensor_types: List[SensorType] = strawberry.field(default_factory=list)
    vehicle_types: List[VehicleType] = strawberry.field(default_factory=list)
    vru_types: List[VRUType] = strawberry.field(default_factory=list)

    # Transport-maritime graph
    vessel_types: List[VesselType] = strawberry.field(default_factory=list)

    # Cancer graph
    diseases: List[Disease] = strawberry.field(default_factory=list)
    drugs: List[Drug] = strawberry.field(default_factory=list)
    tissues: List[Tissue] = strawberry.field(default_factory=list)
    proteins: List[Protein] = strawberry.field(default_factory=list)
    genes: List[Gene] = strawberry.field(default_factory=list)

#filters 
@strawberry.input
class StringFilter:
    equals: Optional[str] = None
    contains: Optional[str] = None
    in_list: Optional[List[str]] = None


@strawberry.input
class FloatFilter:
    equals: Optional[float] = None
    gt: Optional[float] = None
    gte: Optional[float] = None
    lt: Optional[float] = None
    lte: Optional[float] = None
    in_list: Optional[List[float]] = None


@strawberry.input
class IntFilter:
    equals: Optional[int] = None
    gt: Optional[int] = None
    gte: Optional[int] = None
    lt: Optional[int] = None
    lte: Optional[int] = None
    in_list: Optional[List[int]] = None

@strawberry.input
class ProductFilter:
    id: Optional[StringFilter] = None
    title: Optional[StringFilter] = None
    pids: Optional["PidFilter"] = None
    product_type: Optional[StringFilter] = None

    # impact indicators (numeric values)
    citation_count: Optional[FloatFilter] = None
    influence: Optional[FloatFilter] = None
    popularity: Optional[FloatFilter] = None
    impulse: Optional[FloatFilter] = None
    repro_rci: Optional[FloatFilter] = None
    repro_focused_rci: Optional[FloatFilter] = None
    repro_positive_mentions_count: Optional[IntFilter] = None

    # impact indicator classes (strings)
    citation_count_class: Optional[StringFilter] = None
    influence_class: Optional[StringFilter] = None
    popularity_class: Optional[StringFilter] = None
    impulse_class: Optional[StringFilter] = None

@strawberry.input
class AgentFilter:
    local_identifier: Optional[StringFilter] = None
    name: Optional[StringFilter] = None

@strawberry.input
class TopicFilter:
    name: Optional[StringFilter] = None

@strawberry.input
class GrantFilter:
    local_identifier: Optional[StringFilter] = None
    title: Optional[StringFilter] = None

@strawberry.input
class ManifestationFilter:
    local_identifier: Optional[StringFilter] = None
    publicationdate: Optional[StringFilter] = None
    type_label: Optional[StringFilter] = None

@strawberry.input
class ResearchArtifactFilter:
    local_identifier: Optional[StringFilter] = None
    label: Optional[StringFilter] = None
    type: Optional[StringFilter] = None

@strawberry.input
class TechnologyFilter:
    local_identifier: Optional[StringFilter] = None
    name: Optional[StringFilter] = None


@strawberry.input(description="Filter for EnergyType entities (only for 'energy' graphdb).")
class EnergyTypeFilter:
    local_identifier: Optional[StringFilter] = None
    name: Optional[StringFilter] = None
    source: Optional[StringFilter] = None


@strawberry.input(description="Filter for EnergyStorage entities (only for 'energy' graphdb).")
class EnergyStorageFilter:
    local_identifier: Optional[StringFilter] = None
    name: Optional[StringFilter] = None
    source: Optional[StringFilter] = None


@strawberry.input(description="Filter for GeographicEntity entities (only for 'energy' graphdb).")
class GeographicEntityFilter:
    local_identifier: Optional[StringFilter] = None
    name: Optional[StringFilter] = None
    display_name: Optional[StringFilter] = None
    wikidata: Optional[StringFilter] = None


@strawberry.input(description="Filter for Technique entities (only for 'neuroscience' graphdb).")
class TechniqueFilter:
    local_identifier: Optional[StringFilter] = None
    name: Optional[StringFilter] = None
    source: Optional[StringFilter] = None


@strawberry.input(description="Filter for Species entities (only for 'neuroscience' graphdb).")
class SpeciesFilter:
    local_identifier: Optional[StringFilter] = None
    name: Optional[StringFilter] = None
    source: Optional[StringFilter] = None


@strawberry.input(description="Filter for UBERONParcellation entities (only for 'neuroscience' graphdb).")
class UBERONParcellationFilter:
    local_identifier: Optional[StringFilter] = None
    name: Optional[StringFilter] = None
    source: Optional[StringFilter] = None


@strawberry.input(description="Filter for BiologicalSex entities (only for 'neuroscience' graphdb).")
class BiologicalSexFilter:
    local_identifier: Optional[StringFilter] = None
    name: Optional[StringFilter] = None
    source: Optional[StringFilter] = None


@strawberry.input(description="Filter for PreparationType entities (only for 'neuroscience' graphdb).")
class PreparationTypeFilter:
    local_identifier: Optional[StringFilter] = None
    name: Optional[StringFilter] = None
    source: Optional[StringFilter] = None


@strawberry.input(description="Filter for CommunicationType entities (only for 'transport-ccam' graphdb).")
class CommunicationTypeFilter:
    local_identifier: Optional[StringFilter] = None
    name: Optional[StringFilter] = None
    source: Optional[StringFilter] = None


@strawberry.input(description="Filter for EntityConnectionType entities (only for 'transport-ccam' graphdb).")
class EntityConnectionTypeFilter:
    local_identifier: Optional[StringFilter] = None
    name: Optional[StringFilter] = None
    source: Optional[StringFilter] = None


@strawberry.input(description="Filter for LevelOfAutomation entities (only for 'transport-ccam' graphdb).")
class LevelOfAutomationFilter:
    local_identifier: Optional[StringFilter] = None
    name: Optional[StringFilter] = None
    source: Optional[StringFilter] = None


@strawberry.input(description="Filter for ScenarioType entities (only for 'transport-ccam' graphdb).")
class ScenarioTypeFilter:
    local_identifier: Optional[StringFilter] = None
    name: Optional[StringFilter] = None
    source: Optional[StringFilter] = None


@strawberry.input(description="Filter for SensorType entities (only for 'transport-ccam' graphdb).")
class SensorTypeFilter:
    local_identifier: Optional[StringFilter] = None
    name: Optional[StringFilter] = None
    source: Optional[StringFilter] = None


@strawberry.input(description="Filter for VehicleType entities (only for 'transport-ccam' graphdb).")
class VehicleTypeFilter:
    local_identifier: Optional[StringFilter] = None
    name: Optional[StringFilter] = None
    source: Optional[StringFilter] = None


@strawberry.input(description="Filter for VRUType entities (only for 'transport-ccam' graphdb).")
class VRUTypeFilter:
    local_identifier: Optional[StringFilter] = None
    name: Optional[StringFilter] = None
    source: Optional[StringFilter] = None


@strawberry.input(description="Filter for VesselType entities (only for 'transport-maritime' graphdb).")
class VesselTypeFilter:
    local_identifier: Optional[StringFilter] = None
    name: Optional[StringFilter] = None
    type: Optional[StringFilter] = None


@strawberry.input(description="Filter for Disease entities (only for 'cancer' graphdb).")
class DiseaseFilter:
    id: Optional[StringFilter] = None
    name: Optional[StringFilter] = None
    type: Optional[StringFilter] = None


@strawberry.input(description="Filter for Drug entities (only for 'cancer' graphdb).")
class DrugFilter:
    id: Optional[StringFilter] = None
    name: Optional[StringFilter] = None


@strawberry.input(description="Filter for Tissue entities (only for 'cancer' graphdb).")
class TissueFilter:
    id: Optional[StringFilter] = None
    name: Optional[StringFilter] = None
    type: Optional[StringFilter] = None


@strawberry.input(description="Filter for Protein entities (only for 'cancer' graphdb).")
class ProteinFilter:
    id: Optional[StringFilter] = None
    name: Optional[StringFilter] = None
    accession: Optional[StringFilter] = None


@strawberry.input(description="Filter for Gene entities (only for 'cancer' graphdb).")
class GeneFilter:
    id: Optional[StringFilter] = None
    name: Optional[StringFilter] = None
    family: Optional[StringFilter] = None


@strawberry.input
class PidFilter:
    scheme: Optional[StringFilter] = None
    value: Optional[StringFilter] = None

@strawberry.input
class ProductWhereFilter:
    AND: Optional[List["ProductWhereFilter"]] = None
    OR: Optional[List["ProductWhereFilter"]] = None
    product: Optional[ProductFilter] = None
    agent: Optional[AgentFilter] = None
    topic: Optional[TopicFilter] = None
    grant: Optional[GrantFilter] = None
    manifestation: Optional[ManifestationFilter] = None
    research_artifact: Optional[ResearchArtifactFilter] = None
    technology: Optional[TechnologyFilter] = None
    # graph-specific filters per graph
    energy_type: Optional[EnergyTypeFilter] = None
    energy_storage: Optional[EnergyStorageFilter] = None
    geographic_entity: Optional[GeographicEntityFilter] = None
    technique: Optional[TechniqueFilter] = None
    species: Optional[SpeciesFilter] = None
    uberon_parcellation: Optional[UBERONParcellationFilter] = None
    biological_sex: Optional[BiologicalSexFilter] = None
    preparation_type: Optional[PreparationTypeFilter] = None
    communication_type: Optional[CommunicationTypeFilter] = None
    entity_connection_type: Optional[EntityConnectionTypeFilter] = None
    level_of_automation: Optional[LevelOfAutomationFilter] = None
    scenario_type: Optional[ScenarioTypeFilter] = None
    sensor_type: Optional[SensorTypeFilter] = None
    vehicle_type: Optional[VehicleTypeFilter] = None
    vru_type: Optional[VRUTypeFilter] = None
    vessel_type: Optional[VesselTypeFilter] = None
    disease: Optional[DiseaseFilter] = None
    drug: Optional[DrugFilter] = None
    tissue: Optional[TissueFilter] = None
    protein: Optional[ProteinFilter] = None
    gene: Optional[GeneFilter] = None

