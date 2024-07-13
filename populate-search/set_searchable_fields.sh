#!/bin/sh
curl \
-X PUT "http://localhost:7700/indexes/products/settings/searchable-attributes" \
-H 'Content-Type: application/json' \
-H "Authorization: Bearer $API_KEY" \
--data-binary '["title","description"]'
