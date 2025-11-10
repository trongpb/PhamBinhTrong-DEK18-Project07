{{ config(
    materialized='table'
) }}

-- 📅 Tạo danh sách ngày từ 2010-01-01 đến 2030-12-31
with date_range as (
  select
    day as date_day
  from
    unnest(generate_date_array('2024-01-01', '2026-12-31', interval 1 day)) as day
),

final as (
  select
    format_date('%Y%m%d', date_day) as date_key,
    date_day,
    extract(year from date_day) as year,
    extract(quarter from date_day) as quarter,
    extract(month from date_day) as month,
    extract(day from date_day) as day,
    extract(dayofweek from date_day) as day_of_week,
    format_date('%A', date_day) as day_name,
    format_date('%B', date_day) as month_name,
    extract(isoweek from date_day) as week_of_year,
    case when extract(dayofweek from date_day) in (1, 7) then true else false end as is_weekend
  
  from date_range
)

select * from final
