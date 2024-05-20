select region, Geo::RegionById(cast(region as Int32)).name as region_name,


-- получить в колонке первое непустое значение
SELECT
   FIRST_VALUE(my_column) IGNORE NULLS OVER w
FROM my_table
WINDOW w AS (ORDER BY key);
Дока: https://yql.yandex-team.ru/docs/yt/builtins/window?searchQuery=IGNORE%20NULLS#first_value-/-last_value 


$some_date = DATE('2022-01-01')

-- 
FROM AS_TABLE(
    AsList(
        AsStruct(1 AS Key, AsList(1, 2, 3, 4) AS Value),
        AsStruct(4 AS Key, AsList(4, 5, 6, 7) AS Value),
        AsStruct(2 AS Key, AsList(7, 8, 9, 0) AS Value)
    )
)

--
DECLARE $x AS String;
DECLARE $y AS String?;
DECLARE $z AS List<String>;
SELECT $x, $y, $z;
