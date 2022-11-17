with world_gdp as (

    select * from {{ ref('stg_world_gdp')}}

)

select * from world_gdp