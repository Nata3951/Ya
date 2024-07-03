PRAGMA library("utils.sql", "https://yt.yandex-team.ru/hahn/navigation?path=//home/praktikum/$ENVIRONMENT/libs/utils.sql");
IMPORT utils SYMBOLS $str_msk_dttm_to_msk_dt, $to_start_of_period;

    FROM
        RANGE($dm_student_status, $min_date_string)
    WHERE 1 = 1
        AND
        (
        cash_in_cy > 0
        OR cash_out_cy > 0
        OR revenue_cy > 0
        OR discount_cy > 0
        OR unrealized_installment_cy > 0
        cash_in_rub > 0
        OR cash_out_rub > 0
        OR revenue_rub > 0
        OR discount_rub > 0
        OR unrealized_installment_rub > 0
        OR ($str_msk_dttm_to_msk_dt(msk_program_start_dttm) = msk_report_dt
            AND program_paid_flg)
        OR booking_cy > 0
        OR booking_rub > 0
        )

/* ===== определяем последнюю таблицу в директории и считаем последнюю актуальную дату ====== */
$latest = (
    SELECT
        ListTake(ListSortDesc(AGG_LIST(Path)), 1)
    FROM
        FOLDER($dm_student_status)
);

$max_dwh_date = (
    SELECT
        MAX(msk_report_dt)
    FROM
        EACH($latest)
);

-- определяем дату первого букингса для расчета новых оплат
$first_booking_date = (
    SELECT
        user_id,
        MIN($str_msk_dttm_to_msk_dt(msk_payment_dttm)) AS min_bookings_date,
        MIN_BY(program_id, msk_payment_dttm) AS first_program_id
    FROM
        $all_bookings
    GROUP BY
        user_id
);

-- создаем массив со всеми датами
$all_date_list = (
    SELECT
        ListFromRange(CAST($min_date AS DATE),CAST($max_date AS DATE), DateTime::IntervalFromDays(1)) AS date_list
);

-- разворачиваем список
$all_dates = (
    SELECT
        date_list AS snap_date,
        $to_start_of_period(date_list, 'month') AS snap_month
    FROM
        $all_date_list
        FLATTEN LIST BY date_list
);


    CROSS JOIN
        $currency_dict AS b
    WHERE 1 = 1
        AND a.snap_date >= b.from_d
        AND a.snap_date < b.to_d
