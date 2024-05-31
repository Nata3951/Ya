USE hahn;
PRAGMA yt.Pool='praktikum-etl-heavy';
PRAGMA AnsiInForEmptyOrNullableItemsCollections;

-- OUTPUT XNM
$path_detailed_xnm = "home/praktikum/users/nmoroz001/240530_b2c_plan"; 

INSERT INTO $path_detailed_xnm
WITH TRUNCATE
SELECT
    *
FROM
    $total_log
;

-- https://yql.yandex-team.ru/docs/yt/syntax/_includes/insert_into

INSERT INTO my_table (Key1, Key2, Value1, Value2)
VALUES (345987,'ydb', 'Яблочный край', 1414);
COMMIT;

INSERT INTO my_table (key, value)
VALUES ("foo", 1), ("bar", 2);
