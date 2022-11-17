select 
    country,
    region,
    Estimate_Type as estimate_type,
    cast(gdp as numeric) as gdp
from {{  source('world_gdp_estimates_raw', 'countries_gdp_cleansed') }}
where gdp NOT IN  ('\342\200\224', '—')