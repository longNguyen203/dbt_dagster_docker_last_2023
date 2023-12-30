with source as (

    select * from {{ source('src_postgres', 'src_Production_ProductCategory') }}

),

renamed as (

    select
        "ProductCategoryID",
        "Name",
        "rowguid",
        "ModifiedDate"

    from source

)

select * from renamed