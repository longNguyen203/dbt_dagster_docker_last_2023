with source as (

    select * from {{ source('src_postgres', 'src_Sales_SalesOrderHeader') }}

),

renamed as (

    select
        "SalesOrderID",
        "RevisionNumber",
        "OrderDate",
        "DueDate",
        "ShipDate",
        "Status",
        "OnlineOrderFlag",
        "SalesOrderNumber",
        "PurchaseOrderNumber",
        "AccountNumber",
        "CustomerID",
        "SalesPersonID",
        "TerritoryID",
        "BillToAddressID",
        "ShipToAddressID",
        "ShipMethodID",
        "CreditCardID",
        "CreditCardApprovalCode",
        "CurrencyRateID",
        "SubTotal",
        "TaxAmt",
        "Freight",
        "TotalDue",
        "Comment",
        "rowguid",
        "ModifiedDate"

    from source

)

select * from renamed