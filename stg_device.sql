WITH 
source_data AS (
SELECT DISTINCT device_id,user_agent,resolution
FROM {{ source('summary_mongo_na', 'tbl_summary_export_checkout_success') }}
)
SELECT * FROM source_data
