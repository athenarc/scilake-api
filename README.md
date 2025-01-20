# Scilake GraphQL API

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
