with source as (

    select * from {{ source('src_postgres', 'src_Sales_Store') }}

),

renamed as (

    select
        "BusinessEntityID",
        "Name",
        "SalesPersonID",
        "Demographics",
        "rowguid",
        "ModifiedDate"

    from source

)

select * from renamed