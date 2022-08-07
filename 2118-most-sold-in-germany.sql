-- MySQL
SELECT
    market_name
FROM
    (
        SELECT
            product_id,
            market_name,
            COUNT(DISTINCT shopify_orders.order_id),
            RANK() OVER (ORDER BY COUNT(DISTINCT shopify_orders.order_id) DESC) AS r
        FROM shopify_orders
                 JOIN shopify_users ON shopify_orders.user_id = shopify_users.id
                 JOIN map_product_order ON shopify_orders.order_id = map_product_order.order_id
                 JOIN dim_product ON map_product_order.product_id = dim_product.prod_sku_id
        WHERE shopify_users.country = 'Germany'
        GROUP BY product_id, market_name
    ) lookup
WHERE r = 1;