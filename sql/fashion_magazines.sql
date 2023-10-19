SELECT customer_name AS Customer,
    PRINTF('$%.2f', SUM(price_per_month * subscription_length), 2) AS 'Amount Due'
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
JOIN subscriptions ON orders.subscription_id = subscriptions.subscription_id
WHERE orders.order_status = 'unpaid'
AND subscriptions.description = 'Fashion Magazine'
GROUP BY customers.customer_name;
