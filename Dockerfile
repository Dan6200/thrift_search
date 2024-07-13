# Stage 1: Fetch and prepare data
FROM ubuntu:latest AS data-fetcher
RUN apt-get update && apt-get install -y postgresql-client curl

# Copy the scripts
COPY ./populate-search/fetch_products.sh /opt/src/fetch_products.sh
COPY ./populate-search/populate_search.sh /opt/src/populate_search.sh
COPY ./populate-search/set_searchable_fields.sh /opt/src/set_searchable_fields.sh
COPY ./test/query.sh	/opt/src/run_test.sh

# Ensure the scripts are executable
RUN chmod +x /opt/src/*.sh

# Stage 2: MeiliSearch service
FROM getmeili/meilisearch:latest
EXPOSE 7700

# Copy the necessary files from the first stage
COPY --from=data-fetcher /opt/src /opt/src

# Ensure the scripts are executable
RUN chmod +x /opt/src/*.sh

# Copy the entrypoint script to /usr/local/bin
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

RUN ls -la /usr/local/bin |grep entrypoint

# Use the entrypoint script to start MeiliSearch and then run scripts
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Default command for MeiliSearch
CMD ["--env", "production"]
