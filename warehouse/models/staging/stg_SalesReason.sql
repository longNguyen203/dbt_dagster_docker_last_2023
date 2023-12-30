with source as (

    select * from {{ source('src_postgres', 'src_Sales_SalesReason') }}

),

renamed as (

    select
        "SalesReasonID",
        "Name",
        "ReasonType",
        "ModifiedDate"

    from source

)

select * from renamed