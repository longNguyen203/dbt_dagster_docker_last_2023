select 
     {{ dbt_utils.generate_surrogate_key(['"stg_SalesTerritory"."TerritoryID"']) }} as territory_key,
    "TerritoryID", 
    "Name", 
    "Group" as territory_group, 
    "CountryRegionCode", 
    "CostYTD",  
    "SalesYTD", 
    "CostLastYear",
    "SalesLastYear",
    "ModifiedDate"
from {{ ref("stg_SalesTerritory") }}