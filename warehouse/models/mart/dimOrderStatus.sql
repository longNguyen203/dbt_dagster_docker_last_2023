select
    {{ dbt_utils.generate_surrogate_key(['"stg_SalesOrderHeader"."Status"']) }} as order_status_key,
    "Status" as order_status,
    case
        when "Status" = 1 then 'in_process'
        when "Status" = 2 then 'approved'
        when "Status" = 3 then 'backordered'
        when "Status" = 4 then 'rejected'
        when "Status" = 5 then 'shipped'
        when "Status" = 6 then 'cancelled'
        else 'no_status'
    end as order_status_name
from  {{ ref('stg_SalesOrderHeader') }}