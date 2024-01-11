SELECT COUNT(*)
	FROM customers
	WHERE customer_id ISNULL  
		OR customer_unique_id ISNULL 
		OR customer_zip_code_prefix ISNULL 
		OR customer_city ISNULL 
		OR customer_state ISNULL