select 
    products_id, 
    date_date, 
    orders_id,
    revenue, 
    quantity,
    CAST(purchase_price AS FLOAT64) as purchase_price,
    ROUND(sales.quantity * CAST(product.purchase_price AS FLOAT64), 2) AS purchase_cost,
    ROUND(sales.revenue - round(sales.quantity * CAST(product.purchase_price AS FLOAT64), 2), 2) AS margin
from {{ ref('stg_raw__sales')}} sales
left join {{ ref('stg_raw__product')}} product 
    using (products_id)