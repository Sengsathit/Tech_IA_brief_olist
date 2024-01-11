SELECT customer_unique_id, COUNT(customer_unique_id)
FROM customers
GROUP BY customer_unique_id
	HAVING COUNT(customer_unique_id) > 1

-- Beaucoup de customer_unique_id ont plus de deux occurrences