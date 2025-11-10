WITH source_data AS (
    SELECT DISTINCT
        REGEXP_EXTRACT(current_url, r'https?://([^/]+)') AS domain_id,
        current_url,
        referrer_url
    FROM {{ source('summary_mongo_na', 'tbl_summary_export_checkout_success') }}
)

SELECT * FROM source_data
