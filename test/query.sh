curl \
-X POST 'https://thrift-search.onrender.com/indexes/products/search' \
-H 'Content-Type: application/json' \
--data-binary "{ \"q\":\"$1\" }" | prettier --parser json | bat -l json
