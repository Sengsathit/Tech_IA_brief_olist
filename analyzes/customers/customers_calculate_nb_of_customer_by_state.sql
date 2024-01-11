SELECT customer_state, count(customer_id) as Customers
FROM customers
GROUP BY customer_state