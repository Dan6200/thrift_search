curl \
-X POST 'http://localhost:7700/indexes/products/search' \
-H 'Content-Type: application/json' \
-H "Authorization: Bearer $API_KEY" \
--data-binary "{ \"q\":\"$1\" }"
