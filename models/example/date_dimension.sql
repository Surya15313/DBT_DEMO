WITH CTE AS (

    SELECT 
    TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
    DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
    HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,

    CASE WHEN DAYNAME(TO_TIMESTAMP(STARTED_AT)) IN ('sat','sun') then 'WEEKEND' ELSE 'BUISNESSDAY' END AS DAY_TYPE,

    {{function1('STARTED_AT')}}

    FROM {{ source('demo', 'bike') }}
    where STARTED_AT != 'started_at'
)

select * from CTE