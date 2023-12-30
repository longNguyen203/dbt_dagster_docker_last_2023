with source as (

    select * from {{ source('src_postgres', 'src_Person_CountryRegion') }}

),

renamed as (

    select
        "CountryRegionCode",
        "Name",
        "ModifiedDate"

    from source

)

select * from renamed