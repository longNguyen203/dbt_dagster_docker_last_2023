with source as (

    select * from {{ source('src_postgres', 'src_Production_ProductSubcategory') }}

),

renamed as (

    select
        "ProductSubcategoryID",
        "ProductCategoryID",
        "Name",
        "rowguid",
        "ModifiedDate"

    from source

)

select * from renamed