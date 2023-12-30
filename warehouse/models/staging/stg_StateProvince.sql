with source as (

    select * from {{ source('src_postgres', 'src_Person_StateProvince') }}

),

renamed as (

    select
        "StateProvinceID",
        "StateProvinceCode",
        "CountryRegionCode",
        "IsOnlyStateProvinceFlag",
        "Name",
        "TerritoryID",
        "rowguid",
        "ModifiedDate"

    from source

)

select * from renamed