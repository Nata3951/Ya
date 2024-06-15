$capture = Re2::Capture(@@([\d]+)@@);
$fc = Re2::FindAndConsume(@@([\d]+,?[\d]*)@@);

SELECT
    String::SplitToList(
        String::SplitToList("ОКВЭД 22.11.23", " ")[1],
        "."
    )[0]
;


SELECT
    CAST(Re2::Capture("([0-9]+)")("ОКВЭД 01")._0 AS Int64),
    CAST(Re2::Capture("([0-9]+)")("ОКВЭД 01.02")._0 AS Int64),
    CAST(Re2::Capture("([0-9]+)")("ОКВЭД 01.02.03")._0 AS Int64),
;

$unite_spaces = Re2::Replace("(\\s|\u00A0)+");

SELECT
    $unite_spaces("asdad       (nbsps)asdasd        (spaces)asdasd  dasd adasd ", " ") as united_str;

//
$match = Re2::FindAndConsume('(\\d+)');

select
    substring(`datetime`, 0, 10) as registration_date,
    inn,
    phone as phone_raw,
    Unicode::RemoveAll(Cast(phone as utf8), '+-()/?÷	,.*:_=') as phone,
    ListConcat($match(phone), '') as re_phone
    --phone
from
    range($reg_path)
where inn = '165100284807'
--order by len(phone) desc

-- https://ydb.tech/docs/ru/yql/reference/udf/list/re2

  
$value = "xaaxaaxaa";
$options = Re2::Options(false AS CaseSensitive);
$match = Re2::Match("[ax]+\\d");
$grep = Re2::Grep("a.*");
$capture = Re2::Capture(".*(?P<foo>xa?)(a{2,}).*");
$replace = Re2::Replace("x(a+)x");
$count = Re2::Count("a", $options);

SELECT
  $match($value) AS match,                -- false
  $grep($value) AS grep,                  -- true
  $capture($value) AS capture,            -- (_0: 'xaaxaaxaa', _1: 'aa', foo: 'x')
  $capture($value)._1 AS capture_member,  -- "aa"
  $replace($value, "b\\1z") AS replace,   -- "baazaaxaa"
  $count($value) AS count;                -- 6
