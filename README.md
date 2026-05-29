# SciLake GraphQL API

The Lake API is SciLake's GraphQL web service for unified, SKG-IF-aligned access to all five pilot Scientific Knowledge Graphs and the OpenAIRE-derived core. A shared schema covers the SKG-IF entity model; each pilot adds domain-specific extensions on top.

The stack is FastAPI, Strawberry GraphQL, and Uvicorn, packaged for deployment with Docker. GraphQL queries are compiled to Cypher against either Neo4j or AvantGraph. Clients can filter and paginate results, request only the fields they need, and select a target graph with a parameter request header.

**Public endpoint & GraphiQL:** [https://scilake-api.athenarc.gr/](https://scilake-api.athenarc.gr/)

## Steps to run locally 
```bash
# Create a virtual environment
python -m venv venv

# Activate the virtual environment
# On macOS/Linux
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Configure environment variables in .env file

# Run the application
uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
```

Or use docker compose: 

```bash
docker-compose up --build
```

Once the server is running, open your browser and navigate to: http://127.0.0.1:8000/graphql

## Acknowledgments

This work was supported by the European Union's Horizon Europe research and innovation programme under grant agreement No. 101058573 [SciLake](https://scilake.eu/).
