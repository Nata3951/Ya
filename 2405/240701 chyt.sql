
use chyt.hahn;

test

SELECT
  toStartOfInterval(toDate(toDate(t1.created_dt)), interval 1 month) AS res_0,
  ifNull(countIf(t1.row_type = 'fact' AND NOT t1.is_robot), 0) AS res_1
FROM "//home/praktikum/prod/analytics/dashboards/amocrm_leads" AS t1
WHERE
  toStartOfInterval(toDate(toDate(t1.created_dt)), interval 1 month) BETWEEN toDate32('2024-05-01') AND toDate32('2024-05-01')
  AND t1.source_group IN ('Входящие')
  AND t1.closure_category IN ('Целевая')
GROUP BY res_0
  ORDER BY res_0 ASC NULLS FIRST
LIMIT 1000001



substring(`msk_expired_dttm`, 1, 7) as year_month,
