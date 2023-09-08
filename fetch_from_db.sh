#!/bin/bash

PGPASSWORD=PiFgClvqzJwMRJjHCW8BHyxn6I7kwSEt psql -h dpg-cjbeb7c5kgrc739bmhu0-a.frankfurt-postgres.render.com -U dan thrift_db -t -A -o 'products.json' -c \
"select json_agg (product_data) from (
        select p.*,
        (select json_agg(media_data) from
        (select pm.* from product_media pm
                where pm.product_id=p.product_id) as media_data)
                as media, c.category_name, s.subcategory_name
                from products p join categories c using (category_id)
                join subcategories s using (category_id)
) as product_data"
