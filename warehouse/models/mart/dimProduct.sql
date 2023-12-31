select
    {{ dbt_utils.generate_surrogate_key(['"stg_Product"."ProductID"']) }} as product_key,
    "stg_Product"."ProductID",
    "stg_Product"."Name" as product_name,
    "stg_Product"."ProductNumber",
    "stg_Product"."Color",
    "stg_Product"."DaysToManufacture",
	"stg_Product"."SafetyStockLevel",
    "stg_Product"."StandardCost",
    "stg_ProductSubcategory"."Name" as product_subcategory_name,
    "stg_ProductCategory"."Name" as product_category_name,
    "stg_Product"."SellStartDate",
    "stg_Product"."SellEndDate"
from  {{ ref("stg_Product") }}
left join  {{ ref("stg_ProductSubcategory") }} on "stg_Product"."ProductSubcategoryID" = "stg_ProductSubcategory"."ProductSubcategoryID"
left join  {{ ref("stg_ProductCategory") }} on "stg_ProductSubcategory"."ProductCategoryID" = "stg_ProductCategory"."ProductCategoryID"