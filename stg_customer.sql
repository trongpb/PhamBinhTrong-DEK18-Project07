WITH 
source_data AS (
SELECT DISTINCT user_id_db,email_address,ip
FROM {{ source('summary_mongo_na', 'tbl_summary_export_checkout_success') }}
WHERE user_id_db is not null and user_id_db <>""
)
SELECT * FROM source_data