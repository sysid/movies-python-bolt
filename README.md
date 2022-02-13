# Cypher

## Recommendation Engine
- Usecase, Product
- every Usecase must have complete product association
- Usecase acts as filter (MATCH all relationships: Usecase -- product)

- requires latest driver for async
- :play movies

NEO4J_URI=neo4j://localhost:7687 NEO4J_DATABASE=neo4j NEO4J_USER="neo4j" NEO4J_PASSWORD="tw" python movies_async.py