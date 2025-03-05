import strawberry
from typing import Optional, List

@strawberry.type
class Publication:
    id: str
    pids: List[str]
    title: str
    publicationdate: Optional[str] = None
    publisher: Optional[str] = None

    # related entities 
    authors: List["Author"] = None
    venue: Optional["Venue"] = None
    subjects: List["Subject"] = None

@strawberry.type
class Author:
    id: str
    fullname: str

    #related entities
    publications: List[Publication] = None
    
@strawberry.type
class Venue:
    name: str

@strawberry.type
class Subject:
    name: str
    scheme: str

    #related entities
    publications: List[Publication] = None
    
#filters 
@strawberry.input
class StringFilter:
    equals: Optional[str] = None
    contains: Optional[str] = None
    in_list: Optional[List[str]] = None

@strawberry.input
class PublicationFilter:
    id: Optional[StringFilter] = None
    title: Optional[StringFilter] = None
    pids: Optional[List[str]] = None  # Exact match only

@strawberry.input
class AuthorFilter:
    id: Optional[StringFilter] = None
    fullname: Optional[StringFilter] = None

@strawberry.input
class VenueFilter:
    name: Optional[StringFilter] = None

@strawberry.input
class SubjectFilter:
    name: Optional[StringFilter] = None
    scheme: Optional[StringFilter] = None

@strawberry.input
class PublicationWhereFilter:
    AND: Optional[List["PublicationWhereFilter"]] = None
    OR: Optional[List["PublicationWhereFilter"]] = None
    publication: Optional[PublicationFilter] = None
    author: Optional[AuthorFilter] = None
    venue: Optional[VenueFilter] = None
    subject: Optional[SubjectFilter] = None

@strawberry.input
class AuthorWhereFilter:
    AND: Optional[List["AuthorWhereFilter"]] = None
    OR: Optional[List["AuthorWhereFilter"]] = None
    author: Optional[AuthorFilter] = None
    publication: Optional[PublicationFilter] = None

@strawberry.input
class SubjectWhereFilter:
    AND: Optional[List["SubjectWhereFilter"]] = None
    OR: Optional[List["SubjectWhereFilter"]] = None
    subject: Optional[SubjectFilter] = None
    publication: Optional[PublicationFilter] = None

