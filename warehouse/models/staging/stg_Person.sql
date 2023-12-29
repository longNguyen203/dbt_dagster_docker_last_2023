with source as (

    select * from {{ source('src_postgres', 'src_Person_Person') }}

),

renamed as (

    select
        "BusinessEntityID",
        "PersonType",
        "NameStyle",
        "Title",
        "FirstName",
        "MiddleName",
        "LastName",
        "Suffix",
        "EmailPromotion",
        "AdditionalContactInfo",
        "Demographics",
        "rowguid",
        "ModifiedDate"

    from source

)

select * from renamed