SELECT toDate(t1.snap_date) AS res_0, sum(t1.bookings) AS res_1, sum(t1.bookings_plan) AS res_2
FROM ""//home/praktikum/prod/analytics/dashboards/overview_monitor_practicum/overview_monitor_practicum"" AS t1
WHERE
  toDate(t1.snap_date) BETWEEN toDate32('2023-11-12') AND toDate32('2024-05-13') AND t1.period_type IN ('week') AND t1.channel IN ('b2c') AND t1.full_period_flg IN ('Да')
GROUP BY res_0
  ORDER BY res_0 ASC NULLS FIRST
LIMIT 1000001



use hahn;

$t = 'home/praktikum/prod/analytics/dashboards/overview_monitor_practicum/overview_monitor_practicum';

-- $out = 'home/praktikum/users/nmoroz001/240515_test1';
-- insert into $out

select * 
from $t
limit 10
;

-----
USE HAHN;

select DISTINCT `type`
from `logs/praktikum/production/pierce-analytics/1d/2024-05-14`
;

-- from tutorial

select AsList(true, false);
