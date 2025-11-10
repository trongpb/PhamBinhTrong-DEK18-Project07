SELECT  order_id,
        user_id_db,
        local_time,
        time_stamp,
        device_id,
        store_id,
        REGEXP_EXTRACT(current_url, r'https?://([^/]+)') AS domain_id,
        ip ,
        cast(c.product_id as INTEGER) AS product_id ,
        c.amount,
        c.price,
        c.currency
FROM unigap-project05.summary_mongo.tbl_summary_export_checkout_success as s,
     UNNEST(s.cart_products) AS c
WHERE s.order_id is not null and order_id <> ""    
ORDER BY order_id,local_time