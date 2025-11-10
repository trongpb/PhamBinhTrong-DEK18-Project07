WITH 
source_data AS (
    SELECT DISTINCT
        product_id ,
        product_name,
        product_type,
        category_name,
        price,
        current_url 
    FROM unigap-project05.product_name_list.tbl_product_v1
    WHERE product_id is not null and ( product_type is not null and product_type <>"-1" and product_type <>"--_select_--")
    ORDER BY product_id
)
SELECT *
FROM source_data