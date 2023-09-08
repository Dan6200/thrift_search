FROM getmeili/meilisearch:latest
COPY ./populate_search.sh /opt/src/populate_search.sh
RUN /opt/src/populate_search.sh
