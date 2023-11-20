SELECT 
	ord.order_id ,
	CONCAT(cust.first_name,' ',cust.last_name) AS 'customer_name' ,
	cust.city ,
	cust.state ,
	ord.order_date ,
	CAST(SUM(ordit.list_price) AS INT) AS 'total_units' ,
	CAST(SUM(ordit.quantity * ordit.list_price) AS INT) AS 'revenue' ,
	prod.product_name ,
	brd.brand_name ,
	cat.category_name ,
	sto.store_name ,
	CONCAT(stf.first_name,' ',stf.last_name) AS 'sales_rep' 
FROM sales.customers cust
JOIN sales.orders ord 
ON cust.customer_id = ord.customer_id
JOIN sales.order_items ordit 
ON ordit.order_id = ord.order_id
JOIN production.products prod 
ON prod.product_id = ordit.product_id
JOIN production.brands brd
ON brd.brand_id = prod.brand_id
JOIN production.categories cat
ON cat.category_id = prod.category_id
JOIN sales.stores sto
ON sto.store_id = ord.store_id
JOIN sales.staffs stf
ON stf.staff_id = ord.staff_id
GROUP BY 
	ord.order_id ,
	CONCAT(cust.first_name,' ',cust.last_name)  ,
	cust.city ,
	cust.state ,
	ord.order_date ,
	product_name ,
	brd.brand_name ,
	category_name ,
	store_name ,
	CONCAT(stf.first_name,' ',stf.last_name) ;
	


