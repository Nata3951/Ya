select region, Geo::RegionById(cast(region as Int32)).name as region_name,


-- получить в колонке первое непустое значение
SELECT
   FIRST_VALUE(my_column) IGNORE NULLS OVER w
FROM my_table
WINDOW w AS (ORDER BY key);
Дока: https://yql.yandex-team.ru/docs/yt/builtins/window?searchQuery=IGNORE%20NULLS#first_value-/-last_value 
