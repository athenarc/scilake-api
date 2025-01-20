from typing import List, Optional
import strawberry
from app.resolvers import get_publications
from app.types import Publication

@strawberry.type
class Queries:
    @strawberry.field
    def get_publications(
        self,
        database: str,
        dois: Optional[List[str]] = None,
        pmc_ids: Optional[List[str]] = None,
        start_year: Optional[int] = None,
        end_year: Optional[int] = None,
    ) -> List[Publication]:
        """
        Resolver function to fetch publications with filters and handle dynamic database selection.
        """
        publications = get_publications(
            database=database, dois=dois, pmc_ids=pmc_ids, start_year=start_year, end_year=end_year
        )

        return publications
