import strawberry
from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles
from fastapi.responses import HTMLResponse
from strawberry.fastapi import GraphQLRouter
from app.queries import Queries
from app.graphiql_template import get_graphiql_html
from pathlib import Path

schema = strawberry.Schema(query=Queries)

# Create the FastAPI app and GraphQL router
graphql_app = GraphQLRouter(schema, graphiql=False)
app = FastAPI()

# Mount static files
app.mount("/static", StaticFiles(directory="static"), name="static")


@app.get("/", include_in_schema=False)
async def docs():
    """
    Minimal HTML documentation landing page.
    """
    docs_path = Path(__file__).resolve().parent / "docs.html"
    html = docs_path.read_text(encoding="utf-8")
    return HTMLResponse(html)

# Custom GraphiQL endpoint
@app.get("/graphql", include_in_schema=False)
async def graphiql():
    html = get_graphiql_html()
    return HTMLResponse(html)

# Add the GraphQL endpoint
app.include_router(graphql_app, prefix="/graphql")
