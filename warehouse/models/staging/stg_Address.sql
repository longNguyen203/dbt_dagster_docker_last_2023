with source as (

    select * from {{ source('src_postgres', 'src_Person_Address') }}

),

renamed as (

    select
        "AddressID",
        "AddressLine1",
        "AddressLine2",
        "City",
        "StateProvinceID",
        "PostalCode",
        "rowguid",
        "ModifiedDate"

    from source

)

select * from renamed