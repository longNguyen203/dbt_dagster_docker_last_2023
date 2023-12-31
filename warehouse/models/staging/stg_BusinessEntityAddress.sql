with source as (

    select * from {{ source('src_postgres', 'src_Person_BusinessEntityAddress') }}

),

renamed as (

    select
        "BusinessEntityID", 
        "AddressID", 
        "AddressTypeID", 
        "rowguid", 
        "ModifiedDate"

    from source

)

select * from renamed