FROM getmeili/meilisearch:latest
COPY ./fetch_from_db.sh /opt/src/fetch_from_db.sh
RUN /opt/src/fetch_from_db.sh
COPY ./populate_search.sh /opt/src/populate_search.sh
RUN /opt/src/populate_search.sh
COPY ./set_searchable_fields.sh /opt/src/set_searchable_fields.sh
RUN /opt/src/set_searchable_fields.sh
