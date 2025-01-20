import strawberry

@strawberry.type
class Publication:
    doi: str
    pmc_id: str
    year: int
