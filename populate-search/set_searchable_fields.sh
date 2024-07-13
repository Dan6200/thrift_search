#!/bin/bash
curl \
-X POST "http://localhost:7700/indexes/products/settings/searchable-attributes" \
-H 'Content-Type: application/json' \
--data-binary '["title","description"]'
