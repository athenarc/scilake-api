import strawberry
from typing import Optional, List

@strawberry.type
class ResearchProduct:
    id: str
    title: str
    product_type: str
    publicationdate: Optional[str] = None
    publisher: Optional[str] = None

    # related entities 
    pids: List["Pid"] = None
    agents: List["Agent"] = None
    venue: Optional["Venue"] = None
    topics: List["Topic"] = None

@strawberry.type
class Pid:
    value: str
    scheme: str

@strawberry.type
class Agent:
    id: str
    fullname: str

    #related entities
    research_products: List[ResearchProduct] = None
    
@strawberry.type
class Venue:
    name: str

    #related entities
    research_products: List[ResearchProduct] = None

@strawberry.type
class Topic:
    name: str
    scheme: str

    #related entities
    research_products: List[ResearchProduct] = None
    
#filters 
@strawberry.input
class StringFilter:
    equals: Optional[str] = None
    contains: Optional[str] = None
    in_list: Optional[List[str]] = None

@strawberry.input
class ResearchProductFilter:
    id: Optional[StringFilter] = None
    title: Optional[StringFilter] = None
    pids: Optional["PidFilter"] = None
    product_type: Optional[StringFilter] = None

@strawberry.input
class AgentFilter:
    id: Optional[StringFilter] = None
    fullname: Optional[StringFilter] = None

@strawberry.input
class VenueFilter:
    name: Optional[StringFilter] = None

@strawberry.input
class TopicFilter:
    name: Optional[StringFilter] = None
    scheme: Optional[StringFilter] = None

@strawberry.input
class PidFilter:
    scheme: Optional[StringFilter] = None
    value: Optional[StringFilter] = None

@strawberry.input
class ResearchProductWhereFilter:
    AND: Optional[List["ResearchProductWhereFilter"]] = None
    OR: Optional[List["ResearchProductWhereFilter"]] = None
    research_product: Optional[ResearchProductFilter] = None
    agent: Optional[AgentFilter] = None
    venue: Optional[VenueFilter] = None
    topic: Optional[TopicFilter] = None

@strawberry.input
class AgentWhereFilter:
    AND: Optional[List["AgentWhereFilter"]] = None
    OR: Optional[List["AgentWhereFilter"]] = None
    agent: Optional[AgentFilter] = None
    research_product: Optional[ResearchProductFilter] = None

@strawberry.input
class TopicWhereFilter:
    AND: Optional[List["TopicWhereFilter"]] = None
    OR: Optional[List["TopicWhereFilter"]] = None
    topic: Optional[TopicFilter] = None
    research_product: Optional[ResearchProductFilter] = None

@strawberry.input
class VenueWhereFilter:
    AND: Optional[List["VenueWhereFilter"]] = None
    OR: Optional[List["VenueWhereFilter"]] = None
    venue: Optional[VenueFilter] = None
    research_product: Optional[ResearchProductFilter] = None
