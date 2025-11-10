
/* dbt run --select stg_summary  phải chạy file này trước thì các file khác mới ref được file này và câu lệnh trong 
file này sẽ được chạy trên bigquery khi chạy lệnh dbt run , dbt run cũng kiểm tra các file khác có đúng pháp không.
Nếu có sửa file thì nhấn save trước khi run
*/
with stg_summary_cte AS(
    SELECT  *
    FROM {{ref('stg_summary')}}
),
stg_product_cte AS(
    SELECT  *
    FROM {{ref('stg_product')}}
),
stg_location_cte AS(
    SELECT  *
    FROM {{ref('stg_location')}}
),
source_data AS(
    SELECT 
        s.order_id,
        s.user_id_db,
        s.local_time,
        s.time_stamp,
        s.device_id,
        s.store_id,
        l.country,
        l.region,
        l.city,
        p.current_url,
        p.price as price_web,
        s.product_id,
        p.product_name,
        s.amount,
        s.price as price_cart,
        s.currency
    FROM   stg_summary_cte AS s 
    LEFT JOIN  stg_product_cte AS p
         ON s.product_id = p.product_id
    LEFT JOIN  stg_location_cte AS l
         ON l.ip = s.ip

    ORDER BY  s.order_id
)

SELECT * FROM source_data


