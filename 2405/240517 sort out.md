##expiration for temporary table

INSERT INTO `//home/praktikum/users/svnazarov54/rai_cosmolet/prosto_primer` 
WITH (TRUNCATE, EXPIRATION="2m")

## string manipulation

### to number
practicum/analytics/operational/regular/yql/adhoc/operations_old_sources_hist.sql
CAST(String::ReplaceAll(value, ",", ".") AS Double) AS value,

$replace_comma = Re2::Replace(",");
$fc = Re2::FindAndConsume(@@([\d]+,?[\d]*)@@);


select 
    year,
    CAST (year as Uint32) as year1,
    CASE month
        WHEN 'Август' THEN 8
        ELSE 0
    END as month, 
    cast($replace_comma(ListConcat($fc(plan)), '.') as DOUBLE) as plan,
    from $source limit 30;

### nymber from google sheet with spaces


select region, Geo::RegionById(cast(region as Int32)).name as region_name,


### последняя не пустая дата
date(INT([created_dt]) + [Bookings руб.]/10000000)


## виджеты инфо
###кружки в тексте
Исходящие лиды, план <span style="color:coral; font-size: 1.2em">&#9679; </span>  и факт <span style="color:navy; font-size: 1.2em">&#9679; </span>

### bold
 на Робота. **Целевыми** называются сделки в активных статусах, оплаченные и закрытые с целевой причиной отказа

###п еренос строки
Bookings_plan = 
\n  count(IN) * avg_booking(IN) 
\n \+ count(OTHER) * avg_booking(OTHER) 
\n(1) посчитана средняя доля каждого дня в месяце за прошедший год (например, 1 число - 1% bookings, 30 число - 5% bookings);



## доля целого

```sql
-- добавим процент от общей суммы
$booking_by_month_day_hist = (
    SELECT
        day_of_month,
        month_day_booking_avg,
        month_day_booking_avg / sum(month_day_booking_avg) OVER () AS day_pct_hist
    FROM $booking_by_month_day
);
```

## получить в колонке первое непустое значение

```sql
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
```



## распарсить прикрепленный файл

```sql
$support_list = 
    SELECT
        *
    FROM 
        (
            SELECT
                ParseFile("String","sup.txt") AS promo
        )
    FLATTEN LIST BY promo
;
```
