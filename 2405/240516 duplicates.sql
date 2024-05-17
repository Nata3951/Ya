use hahn;

$t = 'home/praktikum/prod/analytics/dashboards/lessons_time_dashboard';

select distinct `subscription_id`, `profession_name`, `user_id`
from $t
where user_id IN (4785451, 3037)
;


-- checking that users do not duplicate in user list

PRAGMA AnsiInForEmptyOrNullableItemsCollections;

use hahn;

$t = 'home/praktikum/prod/datalake/db_transfer_personal/accounts_user';

select id, `yauid`,`username`
from $t
where id IN (4785451, 3037)
;
