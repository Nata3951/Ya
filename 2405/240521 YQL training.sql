-- https://wiki.yandex-team.ru/crowd/crowdinfra/cookbook/yqlonboardingqueries/#peremennye-i-podzaprosy
  

-- дата и время
-- https://quantum.yandex-team.ru/courses/crowd_onboarding_tech_yql/overview#13610

$value_to_search = 4;
-- определяем переменную
$subquery = (
        -- определяем подзапрос
        SELECT
            Key,
            Value
        FROM AS_TABLE(
            AsList(
                AsStruct(1 AS Key, AsList(1, 2, 3, 4) AS Value),
                AsStruct(4 AS Key, AsList(4, 5, 6, 7) AS Value),
                AsStruct(2 AS Key, AsList(7, 8, 9, 0) AS Value)
            )
        )
);

SELECT
    Key,
    Value,
    $value_to_search AS SearchedValue
-- используем переменную
FROM $subquery
-- используем подзапрос
WHERE $value_to_search IN Value;
-- используем переменную

-- https://wiki.yandex-team.ru/crowd/crowdinfra/cookbook/yqlonboardingqueries/#oboznachenie-dlitelnosti-zadachi-iz-trekera
SELECT
    Interval("PT5H"),
    Interval("PT2400H"),
    Interval("P400WT5H");
