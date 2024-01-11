SELECT COUNT(DISTINCT(customer_city))
FROM customers
WHERE customer_state LIKE "SP"