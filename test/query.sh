curl \
-X POST 'http://localhost:7700/indexes/products/search' \
-H 'Content-Type: application/json' \
--data-binary "{ \"q\":\"$1\" }" | prettier --parser json | bat -l json
