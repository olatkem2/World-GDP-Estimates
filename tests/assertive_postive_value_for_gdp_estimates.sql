-- GDP Estimates can not have a negative value, so the value should always be >= 0.
-- Therefore return records where this isn't true to make the test fail.

select 
    country,
       sum(gdp) as total_gdp
from {{  ref('stg_world_gdp')  }}
group by country
having not (total_gdp >=0)
