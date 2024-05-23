-- days to payment

$leads = "home/praktikum/prod/analytics/dashboards/amocrm_leads";

IF(
  [is_paid] 
  AND NOT [is_robot] 
  AND [payment_ts] > [created_ts], 
  ([payment_ts] - [created_ts]), 
  NULL)
