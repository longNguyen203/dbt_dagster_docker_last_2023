{{ config(materialized='table') }}
{{ config(schema='staging') }}

with source_data as (

    {#-
        Use source for model
    #}
    select * from {{ source('src_postgres', 'src_Production_ProductCategory') }}

),
    
renamed as (

    select 
        "ProductCategoryID",
        "Name" as NameProductCategory,
        "rowguid",
        "ModifiedDate" as EditDate

    from source_data

)

select * from renamed