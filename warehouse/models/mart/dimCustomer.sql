select
    {{ dbt_utils.generate_surrogate_key(['"stg_Customer"."CustomerID"']) }} as customer_key,
    "stg_Customer"."CustomerID",
    "stg_Person"."BusinessEntityID" as personbusinessentityid,
    "stg_Person"."Title",
    "stg_Person"."FirstName" || ' ' || "stg_Person"."LastName" as fullname,
    "stg_Person"."MiddleName", 
    -- "stg_Person"."occupation", 
    -- "stg_Person"."maritalstatus", 
    -- "stg_Person"."commutedistance", 
    "stg_Person"."Demographics", 
    --"stg_Person".gender,
    "stg_Person"."AdditionalContactInfo", 
    "stg_Person"."NameStyle", 
    "stg_Person"."Suffix", 
    "stg_Person"."EmailPromotion",
    "stg_CountryRegion"."Name" as country,
    stg_address."City",
    "stg_StateProvince"."Name" as state,
    stg_address."PostalCode",
    stg_address."AddressLine1",
    stg_address."AddressLine2"

from {{ ref("stg_Customer") }}
    left join {{ ref("stg_Person") }} on "stg_Customer"."PersonID" = "stg_Person"."BusinessEntityID"
    left join {{ ref("stg_BusinessEntityAddress") }} on "stg_BusinessEntityAddress"."BusinessEntityID" = "stg_Person"."BusinessEntityID"
    left join {{ ref('stg_address') }} on stg_address."AddressID" = "stg_BusinessEntityAddress"."AddressID"
    left join {{ ref("stg_StateProvince") }} on "stg_StateProvince"."StateProvinceID" = stg_address."StateProvinceID"
    left join {{ ref("stg_CountryRegion") }} on "stg_CountryRegion"."CountryRegionCode" = "stg_StateProvince"."CountryRegionCode"

where "PersonType" = 'IN' and "AddressTypeID" = 2