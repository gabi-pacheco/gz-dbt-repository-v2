WITH finance_month AS (
    SELECT
        EXTRACT(month FROM date_date) AS date_month,
        margin,
        average_basket,
        operational_margin,
        ads_cost,
        ads_margin
    FROM {{ref('finance_campaigns_day')}}
)
SELECT 
    date_month,
    SUM(ads_margin) AS ads_margin,
    ROUND(SUM(average_basket),2) AS average_basket,
    SUM(operational_margin) as operational_margin,
    SUM(margin) as margin,
    SUM(ads_cost) as ads_cost,
FROM finance_month
GROUP BY date_month
ORDER BY date_month DESC
