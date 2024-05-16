use hahn;

$t = 'home/praktikum/prod/analytics/dashboards/lessons_time_dashboard';

select distinct `subscription_id`, `profession_name`, `user_id`
from $t
where user_id IN (4785451, 3037)
;
