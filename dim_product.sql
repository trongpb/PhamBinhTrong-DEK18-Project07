WITH 
source_data AS (
    SELECT DISTINCT
        product_id,
        product_name,
        product_type,
        category_name,
        current_url
    FROM unigap-project05.product_name_list.tbl_product
    WHERE product_id is not null and ( product_type is not null and product_type <>"-1" and product_type <>"--_select_--")
)
SELECT count(*)
FROM source_data