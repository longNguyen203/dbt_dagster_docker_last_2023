with source as (

    select * from {{ source('src_postgres', 'src_Sales_SalesOrderHeaderSalesReason') }}

),

renamed as (

    select
        "SalesOrderID",
        "SalesReasonID",
        "ModifiedDate"

    from source

)

select * from renamed