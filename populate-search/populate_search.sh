#!/bin/bash

curl \
  -X POST 'https://thrift-search.onrender.com/indexes/products/documents?primaryKey=product_id' \
  -H 'Content-Type: application/json' \
  --data-binary @/opt/src/products.json
