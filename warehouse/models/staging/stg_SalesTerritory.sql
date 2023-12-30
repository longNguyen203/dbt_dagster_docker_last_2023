with source as (

    select * from {{ source('src_postgres', 'src_Sales_SalesTerritory') }}

),

renamed as (

    select
        "TerritoryID",
        "Name",
        "CountryRegionCode",
        "Group",
        "SalesYTD",
        "SalesLastYear",
        "CostYTD",
        "CostLastYear",
        "rowguid",
        "ModifiedDate"

    from source

)

select * from renamed