import strawberry
from strawberry.types import Info
from typing import List, Optional
from app.types import *
import app.mappers as mappers
import app.resolvers as resolvers
import app.utils as utils

@strawberry.type
class Queries:

    @strawberry.field(description="Retrieve a paginated list of products with filtering and sorting.")
    def get_products(
        self,
        where: Optional[ProductWhereFilter] = None,  # Now using structured filtering
        page: Optional[int] = 1,  # Default page number
        page_size: Optional[int] = 10,  # Default number of results per page
        sort_by: Optional[str] = None,  # No default sorting field
        sort_order: Optional[str] = None,  # No default sorting order
        info: Info = None
    ) -> List[Product]:
    
        graph_db = utils.get_graph_db(info.context["request"].headers)

        selected_fields = utils.get_selected_fields(info.selected_fields[0].selections)

        rps = resolvers.get_products(
            database=graph_db, 
            where=where,
            page=page,
            page_size=page_size,
            sort_by=sort_by,
            sort_order=sort_order,
            selected_fields=selected_fields 
        )

        return rps

    # Enrichment-specific queries (per graph)

    # Energy
    @strawberry.field(description="List energy types with a paginated list of related products (energy graph only).")
    def get_energy_types(
        self,
        where: Optional[EnergyTypeFilter] = None,
        page: int = 1,
        page_size: int = 10,
        info: Info = None,
    ) -> List[EnergyType]:
        graph_db = utils.get_graph_db(info.context["request"].headers)
        return resolvers.get_energy_types(
            database=graph_db,
            where=where,
            page=page,
            page_size=page_size,
        )

    @strawberry.field(description="List energy storages with a paginated list of related products (energy graph only).")
    def get_energy_storages(
        self,
        where: Optional[EnergyStorageFilter] = None,
        page: int = 1,
        page_size: int = 10,
        info: Info = None,
    ) -> List[EnergyStorage]:
        graph_db = utils.get_graph_db(info.context["request"].headers)
        return resolvers.get_energy_storages(
            database=graph_db,
            where=where,
            page=page,
            page_size=page_size,
        )

    @strawberry.field(description="List geographic entities with a paginated list of related products (energy graph only).")
    def get_geographic_entities(
        self,
        where: Optional[GeographicEntityFilter] = None,
        page: int = 1,
        page_size: int = 10,
        info: Info = None,
    ) -> List[GeographicEntity]:
        graph_db = utils.get_graph_db(info.context["request"].headers)
        return resolvers.get_geographic_entities(
            database=graph_db,
            where=where,
            page=page,
            page_size=page_size,
        )

    # Neuroscience
    @strawberry.field(description="List techniques with a paginated list of related products (neuroscience graph only).")
    def get_techniques(
        self,
        where: Optional[TechniqueFilter] = None,
        page: int = 1,
        page_size: int = 10,
        info: Info = None,
    ) -> List[Technique]:
        graph_db = utils.get_graph_db(info.context["request"].headers)
        return resolvers.get_techniques(
            database=graph_db,
            where=where,
            page=page,
            page_size=page_size,
        )

    @strawberry.field(description="List species with a paginated list of related products (neuroscience graph only).")
    def get_species(
        self,
        where: Optional[SpeciesFilter] = None,
        page: int = 1,
        page_size: int = 10,
        info: Info = None,
    ) -> List[Species]:
        graph_db = utils.get_graph_db(info.context["request"].headers)
        return resolvers.get_species(
            database=graph_db,
            where=where,
            page=page,
            page_size=page_size,
        )

    @strawberry.field(description="List UBERON parcellations with a paginated list of related products (neuroscience graph only).")
    def get_uberon_parcellations(
        self,
        where: Optional[UBERONParcellationFilter] = None,
        page: int = 1,
        page_size: int = 10,
        info: Info = None,
    ) -> List[UBERONParcellation]:
        graph_db = utils.get_graph_db(info.context["request"].headers)
        return resolvers.get_uberon_parcellations(
            database=graph_db,
            where=where,
            page=page,
            page_size=page_size,
        )

    @strawberry.field(description="List biological sexes with a paginated list of related products (neuroscience graph only).")
    def get_biological_sexes(
        self,
        where: Optional[BiologicalSexFilter] = None,
        page: int = 1,
        page_size: int = 10,
        info: Info = None,
    ) -> List[BiologicalSex]:
        graph_db = utils.get_graph_db(info.context["request"].headers)
        return resolvers.get_biological_sexes(
            database=graph_db,
            where=where,
            page=page,
            page_size=page_size,
        )

    @strawberry.field(description="List preparation types with a paginated list of related products (neuroscience graph only).")
    def get_preparation_types(
        self,
        where: Optional[PreparationTypeFilter] = None,
        page: int = 1,
        page_size: int = 10,
        info: Info = None,
    ) -> List[PreparationType]:
        graph_db = utils.get_graph_db(info.context["request"].headers)
        return resolvers.get_preparation_types(
            database=graph_db,
            where=where,
            page=page,
            page_size=page_size,
        )

    # Transport-CCAM
    @strawberry.field(description="List communication types with a paginated list of related products (transport-ccam graph only).")
    def get_communication_types(
        self,
        where: Optional[CommunicationTypeFilter] = None,
        page: int = 1,
        page_size: int = 10,
        info: Info = None,
    ) -> List[CommunicationType]:
        graph_db = utils.get_graph_db(info.context["request"].headers)
        return resolvers.get_communication_types(
            database=graph_db,
            where=where,
            page=page,
            page_size=page_size,
        )

    @strawberry.field(description="List entity connection types with a paginated list of related products (transport-ccam graph only).")
    def get_entity_connection_types(
        self,
        where: Optional[EntityConnectionTypeFilter] = None,
        page: int = 1,
        page_size: int = 10,
        info: Info = None,
    ) -> List[EntityConnectionType]:
        graph_db = utils.get_graph_db(info.context["request"].headers)
        return resolvers.get_entity_connection_types(
            database=graph_db,
            where=where,
            page=page,
            page_size=page_size,
        )

    @strawberry.field(description="List levels of automation with a paginated list of related products (transport-ccam graph only).")
    def get_levels_of_automation(
        self,
        where: Optional[LevelOfAutomationFilter] = None,
        page: int = 1,
        page_size: int = 10,
        info: Info = None,
    ) -> List[LevelOfAutomation]:
        graph_db = utils.get_graph_db(info.context["request"].headers)
        return resolvers.get_levels_of_automation(
            database=graph_db,
            where=where,
            page=page,
            page_size=page_size,
        )

    @strawberry.field(description="List scenario types with a paginated list of related products (transport-ccam graph only).")
    def get_scenario_types(
        self,
        where: Optional[ScenarioTypeFilter] = None,
        page: int = 1,
        page_size: int = 10,
        info: Info = None,
    ) -> List[ScenarioType]:
        graph_db = utils.get_graph_db(info.context["request"].headers)
        return resolvers.get_scenario_types(
            database=graph_db,
            where=where,
            page=page,
            page_size=page_size,
        )

    @strawberry.field(description="List sensor types with a paginated list of related products (transport-ccam graph only).")
    def get_sensor_types(
        self,
        where: Optional[SensorTypeFilter] = None,
        page: int = 1,
        page_size: int = 10,
        info: Info = None,
    ) -> List[SensorType]:
        graph_db = utils.get_graph_db(info.context["request"].headers)
        return resolvers.get_sensor_types(
            database=graph_db,
            where=where,
            page=page,
            page_size=page_size,
        )

    @strawberry.field(description="List vehicle types with a paginated list of related products (transport-ccam graph only).")
    def get_vehicle_types(
        self,
        where: Optional[VehicleTypeFilter] = None,
        page: int = 1,
        page_size: int = 10,
        info: Info = None,
    ) -> List[VehicleType]:
        graph_db = utils.get_graph_db(info.context["request"].headers)
        return resolvers.get_vehicle_types(
            database=graph_db,
            where=where,
            page=page,
            page_size=page_size,
        )

    @strawberry.field(description="List vulnerable road user types with a paginated list of related products (transport-ccam graph only).")
    def get_vru_types(
        self,
        where: Optional[VRUTypeFilter] = None,
        page: int = 1,
        page_size: int = 10,
        info: Info = None,
    ) -> List[VRUType]:
        graph_db = utils.get_graph_db(info.context["request"].headers)
        return resolvers.get_vru_types(
            database=graph_db,
            where=where,
            page=page,
            page_size=page_size,
        )

    # Transport-maritime
    @strawberry.field(description="List vessel types with a paginated list of related products (transport-maritime graph only).")
    def get_vessel_types(
        self,
        where: Optional[VesselTypeFilter] = None,
        page: int = 1,
        page_size: int = 10,
        info: Info = None,
    ) -> List[VesselType]:
        graph_db = utils.get_graph_db(info.context["request"].headers)
        return resolvers.get_vessel_types(
            database=graph_db,
            where=where,
            page=page,
            page_size=page_size,
        )

    # Cancer
    @strawberry.field(description="List diseases with a paginated list of related products (cancer graph only).")
    def get_diseases(
        self,
        where: Optional[DiseaseFilter] = None,
        page: int = 1,
        page_size: int = 10,
        info: Info = None,
    ) -> List[Disease]:
        graph_db = utils.get_graph_db(info.context["request"].headers)
        return resolvers.get_diseases(
            database=graph_db,
            where=where,
            page=page,
            page_size=page_size,
        )

    @strawberry.field(description="List drugs with a paginated list of related products (cancer graph only).")
    def get_drugs(
        self,
        where: Optional[DrugFilter] = None,
        page: int = 1,
        page_size: int = 10,
        info: Info = None,
    ) -> List[Drug]:
        graph_db = utils.get_graph_db(info.context["request"].headers)
        return resolvers.get_drugs(
            database=graph_db,
            where=where,
            page=page,
            page_size=page_size,
        )

    @strawberry.field(description="List tissues with a paginated list of related products (cancer graph only).")
    def get_tissues(
        self,
        where: Optional[TissueFilter] = None,
        page: int = 1,
        page_size: int = 10,
        info: Info = None,
    ) -> List[Tissue]:
        graph_db = utils.get_graph_db(info.context["request"].headers)
        return resolvers.get_tissues(
            database=graph_db,
            where=where,
            page=page,
            page_size=page_size,
        )

    @strawberry.field(description="List proteins with a paginated list of related products (cancer graph only).")
    def get_proteins(
        self,
        where: Optional[ProteinFilter] = None,
        page: int = 1,
        page_size: int = 10,
        info: Info = None,
    ) -> List[Protein]:
        graph_db = utils.get_graph_db(info.context["request"].headers)
        return resolvers.get_proteins(
            database=graph_db,
            where=where,
            page=page,
            page_size=page_size,
        )

    @strawberry.field(description="List genes with a paginated list of related products (cancer graph only).")
    def get_genes(
        self,
        where: Optional[GeneFilter] = None,
        page: int = 1,
        page_size: int = 10,
        info: Info = None,
    ) -> List[Gene]:
        graph_db = utils.get_graph_db(info.context["request"].headers)
        return resolvers.get_genes(
            database=graph_db,
            where=where,
            page=page,
            page_size=page_size,
        )