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
    id: Optional[StringFilter] = None
    fullname: Optional[StringFilter] = None

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

