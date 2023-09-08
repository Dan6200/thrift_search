FROM ubuntu:latest as builder
RUN apt-get update && apt-get install -y postgresql-client curl
RUN ./fetch_from_db.sh

FROM getmeili/meilisearch:latest
COPY --from=builder ./products.json ./products.json
RUN ./populate_search.sh
RUN ./set_searchable_fields.sh
