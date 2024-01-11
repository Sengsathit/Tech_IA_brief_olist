SELECT c.customer_state as state, COUNT(temp.order_id) as nb_orders, SUM(temp.nb_products) as sold_products, SUM(temp.total_price) as total_sales
FROM (
	-- Récupérer pour chaque commande : la quantité de produits, le prix total de cette commande
	SELECT order_id, COUNT(DISTINCT product_id) as nb_products, SUM(price) as total_price
	FROM order_items 
	GROUP BY order_id
) AS temp
INNER JOIN orders o
	ON o.order_id = temp.order_id
INNER JOIN customers c 
	ON c.customer_id = o.customer_id 
GROUP BY c.customer_state