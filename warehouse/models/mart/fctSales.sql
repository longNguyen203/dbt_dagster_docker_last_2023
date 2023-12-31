select
    {{ dbt_utils.generate_surrogate_key(['"stg_SalesOrderDetail"."SalesOrderID"', '"SalesOrderDetailID"']) }} as sales_key,
    {{ dbt_utils.generate_surrogate_key(['"ProductID"']) }} as product_key,
    {{ dbt_utils.generate_surrogate_key(['"CustomerID"']) }} as customer_key,
    {{ dbt_utils.generate_surrogate_key(['"CreditCardID"']) }} as creditcard_key,
    {{ dbt_utils.generate_surrogate_key(['"ShipToAddressID"']) }} as ship_address_key,
    {{ dbt_utils.generate_surrogate_key(['"Status"']) }} as order_status_key,
    {{ dbt_utils.generate_surrogate_key(['"OrderDate"']) }} as order_date_key,
    {{ dbt_utils.generate_surrogate_key(['"ShipDate"']) }} as ship_date_key,
    {{ dbt_utils.generate_surrogate_key(['"DueDate"']) }} as due_date_key,
    {{ dbt_utils.generate_surrogate_key(['"TerritoryID"']) }} as territory_key,
    {{ dbt_utils.ge}}
    "OrderDate",
    "OnlineOrderFlag",
    "stg_SalesOrderDetail"."UnitPriceDiscount" as "UnitPriceDiscount",
    "stg_SalesOrderHeader"."SalesOrderNumber",
	"stg_SalesOrderDetail"."SalesOrderID",
    "stg_SalesOrderDetail"."SalesOrderDetailID",
    "stg_SalesOrderDetail"."UnitPrice",
    "stg_SalesOrderDetail"."OrderQty",
    "stg_SalesOrderDetail"."LineTotal" as revenue,
    "stg_SalesOrderDetail"."LineTotal" as salesamount,

    case 
        when "stg_SalesOrderDetail"."UnitPriceDiscount" > 0
            then "stg_SalesOrderDetail"."LineTotal" * "stg_SalesOrderDetail"."UnitPriceDiscount" 
        else "stg_SalesOrderDetail"."LineTotal"
    end as totaldiscount,

    "stg_SalesOrderHeader"."TaxAmt" 
from {{ ref("stg_SalesOrderDetail") }}
inner join  {{ ref("stg_SalesOrderHeader") }} on "stg_SalesOrderDetail"."SalesOrderID" = "stg_SalesOrderHeader"."SalesOrderID"