import strawberry
from strawberry.types import Info
from typing import List, Optional
from app.types import *
import app.mappers as mappers
import app.resolvers as resolvers
import app.utils as utils

@strawberry.type
class Queries:

    @strawberry.field(description="Retrieve a paginated list of publications with filtering and sorting.")
    def get_publications(
        self,
        where: Optional[PublicationWhereFilter] = None,  # Now using structured filtering
        page: Optional[int] = 1,  # Default page number
        page_size: Optional[int] = 10,  # Default number of results per page
        sort_by: Optional[str] = "id",  # Default sorting field
        sort_order: Optional[str] = "DESC",  # Default sorting order
        info: Info = None
    ) -> List[Publication]:
    
        graph_db = utils.get_graph_db(info.context["request"].headers)

        selected_fields = utils.get_selected_fields(info.selected_fields[0].selections)

        publications = resolvers.get_publications(
            database=graph_db, 
            where=where,
            page=page,
            page_size=page_size,
            sort_by=sort_by,
            sort_order=sort_order,
            selected_fields=selected_fields 
        )

        return publications

    @strawberry.field(description="Retrieve a paginated list of authors with filtering and sorting.")
    def get_authors(
        self,
        where: Optional[AuthorWhereFilter] = None,  # Now using structured filtering
        page: Optional[int] = 1,  # Default page number
        page_size: Optional[int] = 10,  # Default number of results per page
        sort_by: Optional[str] = "id",  # Default sorting field
        sort_order: Optional[str] = "DESC",  # Default sorting order
        info: Info = None
    ) -> List[Author]:
    
        graph_db = utils.get_graph_db(info.context["request"].headers)

        selected_fields = utils.get_selected_fields(info.selected_fields[0].selections)

        authors = resolvers.get_authors(
            database=graph_db, 
            where=where,
            page=page,
            page_size=page_size,
            sort_by=sort_by,
            sort_order=sort_order,
            selected_fields=selected_fields
        )

        return authors
    


    @strawberry.field(description="Retrieve a paginated list of subjects with filtering and sorting.")
    def get_subjects(
        self,
        where: Optional[SubjectWhereFilter] = None,  # Now using structured filtering
        page: Optional[int] = 1,  # Default page number
        page_size: Optional[int] = 10,  # Default number of results per page
        sort_by: Optional[str] = "id",  # Default sorting field
        sort_order: Optional[str] = "DESC",  # Default sorting order
        info: Info = None
    ) -> List[Subject]:
    
        graph_db = utils.get_graph_db(info.context["request"].headers)

        selected_fields = utils.get_selected_fields(info.selected_fields[0].selections)

        subjects = resolvers.get_subjects(
            database=graph_db, 
            where=where,
            page=page,
            page_size=page_size,
            sort_by=sort_by,
            sort_order=sort_order,
            selected_fields=selected_fields
        )

        return subjects