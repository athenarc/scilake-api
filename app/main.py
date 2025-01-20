import strawberry
from fastapi import FastAPI
from strawberry.fastapi import GraphQLRouter
from app.queries import Queries

schema = strawberry.Schema(query=Queries)

# Create the FastAPI app and GraphQL router
graphql_app = GraphQLRouter(schema)
app = FastAPI()

# Add the GraphQL endpoint
app.include_router(graphql_app, prefix="/graphql")
