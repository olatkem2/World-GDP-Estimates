-- GDP Estimates can not have a negative value, so the value should always be >= 0.
-- Therefore return records where this isn't true to make the test fail.

select 
    country,
       sum(cast(gdp as numeric)) as total_gdp
from {{  ref('stg_world_gdp')  }}
where gdp NOT IN  ('\342\200\224', '—')
group by country
having not (total_gdp >=0)
