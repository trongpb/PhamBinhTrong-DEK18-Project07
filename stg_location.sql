WITH 
source_data AS (
SELECT ip,Country,Region,City
FROM {{ source('ip_location', 'tbl_ip_location') }}
where ip is not null
)

SELECT * FROM source_data