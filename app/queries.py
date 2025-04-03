import strawberry
from strawberry.types import Info
from typing import List, Optional
from app.types import *
import app.mappers as mappers
import app.resolvers as resolvers
import app.utils as utils

@strawberry.type
class Queries:

    @strawberry.field(description="Retrieve a paginated list of research products with filtering and sorting.")
    def get_research_products(
        self,
        where: Optional[ResearchProductWhereFilter] = None,  # Now using structured filtering
        page: Optional[int] = 1,  # Default page number
        page_size: Optional[int] = 10,  # Default number of results per page
        sort_by: Optional[str] = "id",  # Default sorting field
        sort_order: Optional[str] = "DESC",  # Default sorting order
        info: Info = None
    ) -> List[ResearchProduct]:
    
        graph_db = utils.get_graph_db(info.context["request"].headers)

        selected_fields = utils.get_selected_fields(info.selected_fields[0].selections)

        rps = resolvers.get_research_products(
            database=graph_db, 
            where=where,
            page=page,
            page_size=page_size,
            sort_by=sort_by,
            sort_order=sort_order,
            selected_fields=selected_fields 
        )

        return rps

    @strawberry.field(description="Retrieve a paginated list of agents with filtering and sorting.")
    def get_agents(
        self,
        where: Optional[AgentWhereFilter] = None,  # Now using structured filtering
        page: Optional[int] = 1,  # Default page number
        page_size: Optional[int] = 10,  # Default number of results per page
        sort_by: Optional[str] = "id",  # Default sorting field
        sort_order: Optional[str] = "DESC",  # Default sorting order
        info: Info = None
    ) -> List[Agent]:
    
        graph_db = utils.get_graph_db(info.context["request"].headers)

        selected_fields = utils.get_selected_fields(info.selected_fields[0].selections)

        agents = resolvers.get_agents(
            database=graph_db, 
            where=where,
            page=page,
            page_size=page_size,
            sort_by=sort_by,
            sort_order=sort_order,
            selected_fields=selected_fields
        )

        return agents
    


    @strawberry.field(description="Retrieve a paginated list of topics with filtering and sorting.")
    def get_topics(
        self,
        where: Optional[TopicWhereFilter] = None,  # Now using structured filtering
        page: Optional[int] = 1,  # Default page number
        page_size: Optional[int] = 10,  # Default number of results per page
        sort_by: Optional[str] = "id",  # Default sorting field
        sort_order: Optional[str] = "DESC",  # Default sorting order
        info: Info = None
    ) -> List[Topic]:
    
        graph_db = utils.get_graph_db(info.context["request"].headers)

        selected_fields = utils.get_selected_fields(info.selected_fields[0].selections)

        topics = resolvers.get_topics(
            database=graph_db, 
            where=where,
            page=page,
            page_size=page_size,
            sort_by=sort_by,
            sort_order=sort_order,
            selected_fields=selected_fields
        )

        return topics
    
    @strawberry.field(description="Retrieve a paginated list of venues with filtering and sorting.")
    def get_venues(
        self,
        where: Optional[VenueWhereFilter] = None,  # Now using structured filtering
        page: Optional[int] = 1,  # Default page number
        page_size: Optional[int] = 10,  # Default number of results per page
        sort_by: Optional[str] = "id",  # Default sorting field
        sort_order: Optional[str] = "DESC",  # Default sorting order
        info: Info = None
    ) -> List[Venue]:
    
        graph_db = utils.get_graph_db(info.context["request"].headers)

        selected_fields = utils.get_selected_fields(info.selected_fields[0].selections)

        venues = resolvers.get_venues(
            database=graph_db, 
            where=where,
            page=page,
            page_size=page_size,
            sort_by=sort_by,
            sort_order=sort_order,
            selected_fields=selected_fields
        )

        return venues