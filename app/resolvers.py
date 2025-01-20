from app.types import *
from app.utils import get_driver
from typing import Optional, List
from app.utils import get_driver
from app.types import Publication

def get_publications(database: str, dois: Optional[List[str]] = None,
                     pmc_ids: Optional[List[str]] = None, start_year: Optional[int] = None,
                     end_year: Optional[int] = None):
    
    # Get the appropriate driver based on the database parameter
    driver = get_driver(database)
    
    with driver.session() as session:
        query = "MATCH (p:Publication)"
        params = {}
        
        if dois or pmc_ids or start_year or end_year: 
            query += " WHERE "

        if dois:
            query += " p.DOI IN $dois"
            params['dois'] = dois
        
        if pmc_ids:
            if dois: query += " AND"
            query += " p.pmc_id IN $pmc_ids"
            params['pmc_ids'] = pmc_ids
        
        if start_year is not None and end_year is not None:
            if dois or pmc_ids: query += " AND"
            query += " p.year >= $start_year AND p.year <= $end_year"
            params['start_year'] = start_year
            params['end_year'] = end_year
        
        query += " RETURN p.DOI as doi, p.PMC_id as pmc_id, p.year as year LIMIT 5"
        print(query)
        print(params)

        # Execute the query and return the results
        result = session.run(query, params)
        
        # Mapping Cypher query results to Publication type
        publications = [
            Publication(doi=record['doi'], pmc_id=record['pmc_id'], year=record['year'])
            for record in result
        ]

        return publications
