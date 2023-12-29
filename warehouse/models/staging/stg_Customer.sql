with source as (

    select * from {{ source('src_postgres', 'src_Sales_Customer') }}

),

renamed as (

    select
        "CustomerID",
        "PersonID",
        "StoreID",
        "TerritoryID",
        "AccountNumber",
        "rowguid",
        "ModifiedDate"

    from source

)

select * from renamed