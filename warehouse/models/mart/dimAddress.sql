select
    {{ dbt_utils.generate_surrogate_key(['stg_address."AddressID"']) }} as address_key,
    -- Tạo ID cho dimensional address

    stg_address."AddressID",
    stg_address."City" as city_name,
    stg_address."PostalCode", 
    stg_address."AddressLine1" || ' '|| coalesce(stg_address."AddressLine2", '') as Addressline,
    "stg_StateProvince"."Name" as state_name,
    "stg_CountryRegion"."Name" as country_name

from {{ ref("stg_address") }}
    left join {{ ref("stg_StateProvince") }} on stg_address."StateProvinceID" = "stg_StateProvince"."StateProvinceID"
    left join {{ ref("stg_CountryRegion") }} on "stg_StateProvince"."CountryRegionCode" = "stg_CountryRegion"."CountryRegionCode"