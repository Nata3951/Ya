targeted fraction = SUM([targeted_count] BEFORE FILTER BY [is_targeted]) / SUM(COUNT_IF(NOT [is_robot]) BEFORE FILTER BY [is_targeted])

color = [cohort_analysis_metric] / MAX([cohort_analysis_metric] among [Неделя создания])

avg = AVG(sum([bookings_count_by_payment_dt] INCLUDE [created_dt]))


    
IF [selected_metric_type] in ('plan_percent', 'cohort_conversion', 'cr_created_qualified', 'cr_qualified_paid') -- 'conversion'
THEN CONCAT(STR(ROUND(100.0 * [selected_metric], 1)), '%')
ELSE
    IF ABS([selected_metric]) < 1000
        THEN STR(ROUND([selected_metric], 2))
    ELSEIF LOG10(ABS([selected_metric])) < 6
        THEN CONCAT(STR(ROUND([selected_metric]/POWER(10, 3), 2)), 'K')
    ELSEIF LOG10(ABS([selected_metric])) < 9
        THEN CONCAT(STR(ROUND([selected_metric]/POWER(10, 6), 2)), 'M')
    ELSE
        CONCAT(STR(ROUND([selected_metric]/POWER(10, 9), 2)), 'G')
    END
END
