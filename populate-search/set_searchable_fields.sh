#!/bin/bash
curl \
-X POST 'https://thrift-search.onrender.com/indexes/products/settings/searchable-attributes' \
-H 'Content-Type: application/json' \
--data-binary '["title","description"]'
