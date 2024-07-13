#!/bin/bash

# Start Meilisearch in the background
meilisearch --env production &

# Wait for meilisearch to be ready

while ! curl -s http://localhost:7700/health | grep '"status":"available"'; do
	echo "Waiting for Meilisearch to be available..."
	sleep 2
done

# Run scripts
/opt/src/populate_search.sh
/opt/src/set_searchable_fields.sh
/opt/src/run_test.sh
