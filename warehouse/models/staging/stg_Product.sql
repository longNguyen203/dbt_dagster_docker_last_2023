with source as (

    select * from {{ source('src_postgres', 'src_Production_Product') }}

),

renamed as (

    select
        "ProductID",
        "Name",
        "ProductNumber",
        "MakeFlag",
        "FinishedGoodsFlag",
        "Color",
        "SafetyStockLevel",
        "ReorderPoint",
        "StandardCost",
        "ListPrice",
        "Size",
        "SizeUnitMeasureCode",
        "WeightUnitMeasureCode",
        "Weight",
        "DaysToManufacture",
        "ProductLine",
        "Class",
        "Style",
        "ProductSubcategoryID",
        "ProductModelID",
        "SellStartDate",
        "SellEndDate",
        "DiscontinuedDate",
        "rowguid",
        "ModifiedDate"

    from source

)

select * from renamed