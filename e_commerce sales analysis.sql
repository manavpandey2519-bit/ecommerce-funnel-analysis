select * 
from user_events
limit 1000

--Making a sales funnel 

WITH funnel_stages AS (
    SELECT
        COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN user_id END) AS till_views,
        COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) AS till_add_to_cart,
        COUNT(DISTINCT CASE WHEN event_type = 'checkout_start' THEN user_id END) AS till_checkout,
        COUNT(DISTINCT CASE WHEN event_type = 'payment_info' THEN user_id END) AS till_payment_info,
        COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS till_purchase
    FROM user_events
    WHERE event_date >= (SELECT MAX(event_date) FROM user_events) - INTERVAL '30 days'
)
SELECT * FROM funnel_stages;

--Checking Conversion rates
WITH funnel_stages AS (
    SELECT
        COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN user_id END) AS till_views,
        COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) AS till_add_to_cart,
        COUNT(DISTINCT CASE WHEN event_type = 'checkout_start' THEN user_id END) AS till_checkout,
        COUNT(DISTINCT CASE WHEN event_type = 'payment_info' THEN user_id END) AS till_payment_info,
        COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS till_purchase
    FROM user_events
    WHERE event_date >= (SELECT MAX(event_date) FROM user_events) - INTERVAL '30 days'
)
SELECT 
    ROUND(till_add_to_cart * 100.0 / till_views, 2) AS view_to_cart,
    ROUND(till_checkout * 100.0 / till_add_to_cart, 2) AS cart_to_checkout,
    ROUND(till_payment_info * 100.0 / till_checkout, 2) AS checkout_to_payment_info,
    ROUND(till_purchase * 100.0 / till_payment_info, 2) AS payment_to_purchase
FROM funnel_stages;

--Traffic Source Funnel
with source_funnel as(
select 
		traffic_source,
 	    COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN user_id END) AS view,
        COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) AS add_to_cart,
        COUNT(DISTINCT CASE WHEN event_type = 'checkout_start' THEN user_id END) AS purchase
from user_events 
group by traffic_source
)
select 
traffic_source,
view,
add_to_cart,
purchase,
ROUND(add_to_cart * 100.0 / view , 2) AS view_to_cart,
ROUND(purchase * 100.0 / add_to_cart , 2) AS cart_to_purchase,
ROUND(purchase * 100.0 / view , 2) AS view_to_purchase
from source_funnel
order by purchase

--Revenue by traffic source
select 
traffic_source,
count(case when event_type = 'purchase' then event_id end) as total_buyers,
sum(case when event_type = 'purchase' then amount end) as total_revenue,
round(avg(case when event_type = 'purchase' then amount end),2) as avg_order_value
from user_events
group by traffic_source
order by total_buyers desc











--Product Performance
WITH product_funnel AS (
SELECT
product_id,
COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN user_id END) AS views,
COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) AS add_to_cart,
COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS purchases
FROM user_events
GROUP BY product_id
)
SELECT 
product_id,
views,
add_to_cart,
purchases,
ROUND(add_to_cart * 100.0 / views, 2) AS view_to_cart_rate,
ROUND(purchases * 100.0 / views, 2) AS view_to_purchase_rate
FROM product_funnel
ORDER BY view_to_purchase_rate ASC;













