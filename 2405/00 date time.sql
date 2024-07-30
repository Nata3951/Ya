$str_to_date = ($str_timestamp) -> {
    RETURN (
        DateTime::MakeDate(
            DateTime::ParseIso8601($str_timestamp)
        )
    )
};

$str_to_date = ($str_timestamp) -> {
    RETURN (
    cast (
        substring(
            cast (
                $str_timestamp as string), 0, 10) 
                as date)
    )   
};

$fdt = DateTime::Format("%Y-%m-%d");
$report_day = DateTime::MakeDate(CurrentTzDatetime('Europe/Moscow')) + DateTime::IntervalFromDays(-1);
$start_of_current_month = DateTime::MakeDate(DateTime::StartOfMonth($report_day));
$start_of_next_month = DateTime::MakeDate(DateTime::ShiftMonths(DateTime::StartOfMonth($report_day), 1));
$start_of_year = DateTime::MakeDate(DateTime::StartOfYear($report_day));
$five_months_ago = DateTime::MakeDate(DateTime::ShiftMonths(DateTime::StartOfMonth($report_day), -5));
$minus_one_day = DateTime::IntervalFromDays(-1);
$end_report_month = DateTime::MakeDate(DateTime::ShiftMonths($start_of_current_month, 1)) + $minus_one_day;


## Количество дней в месяце даты $dt
$days_in_month = ($pay_month) -> {
    RETURN (
        DateTime::GetDayOfMonth(DateTime::MakeDate((DateTime::ShiftMonths(DateTime::StartOfMonth($pay_month), 1)))
        + DateTime::IntervalFromDays(-1))
    )
};



-- будние дни, на которые приходятся праздники
$holidays = AsList(
    $str_to_date('2023-05-01'),
    $str_to_date('2023-05-08'),
    $str_to_date('2023-05-09'),
    $str_to_date('2023-06-12'),
    $str_to_date('2023-11-06'),
    $str_to_date('2024-01-01'),
    $str_to_date('2024-01-02'),
    $str_to_date('2024-01-03'),
    $str_to_date('2024-01-04'),
    $str_to_date('2024-01-05'),
    $str_to_date('2024-01-08'),
    $str_to_date('2024-02-23'),
    $str_to_date('2024-03-08'),
    $str_to_date('2024-04-29'),
    $str_to_date('2024-04-30'),
    $str_to_date('2024-05-01'),
    $str_to_date('2024-05-09'),
    $str_to_date('2024-05-10'),
    $str_to_date('2024-06-12'),
    $str_to_date('2024-11-04'),
    $str_to_date('2024-12-30'),
    $str_to_date('2024-12-31')
);
