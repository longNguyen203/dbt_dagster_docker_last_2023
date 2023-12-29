with source as (

    select * from {{ source('src_postgres', 'src_Sales_SalesOrderDetail') }}

),

renamed as (

    select
        "SalesOrderID",
        "SalesOrderDetailID",
        "CarrierTrackingNumber",
        "OrderQty",
        "ProductID",
        "SpecialOfferID",
        "UnitPrice",
        "UnitPriceDiscount",
        "LineTotal",
        "rowguid",
        "ModifiedDate"

    from source

)

select * from renamed