#!/bin/bash

curl -o '/opt/src/products.json' -s $APP_API_URL/v1/products?sort=created_at&public=true 2> error.log
