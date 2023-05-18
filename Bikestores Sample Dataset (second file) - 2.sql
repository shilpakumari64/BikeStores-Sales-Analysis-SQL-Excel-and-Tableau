SELECT
      ord.order_id,
concat(cus.First_name, "  ",cus.last_name) AS "customers",
cus.city,
cus.state,
ord.order_date,
SUM(ite.quantity) AS "total_units",
SUM(ite.quantity * ite.list_price) AS "revenue",
pro.product_name,
cat.category_name,
sto.store_name,
CONCAT(sta.first_name, " ",sta.last_name) AS "Sales_rep"




FROM sales.orders ord
JOIN 	sales.customers cus
ON ord.customer_id = customer_id

JOIN sales.order_items ite
ON ord.order_id = ite.order_id 

JOIN product.products production
ON ite.product_id = pro.product_id 

JOIN  prodcution.categories cat
ON pro.category_id = cat.category_id

JOIN sales.stores sto
ON ord.store_id = sto.store_id

JOIN sales.staffs sta
ON ord.staff_id = sta.staff_id
 
GROUP BY 
ord.order_id,
concat(cus.First_name, "  ",cus.last_name),
cus.city,
cus.state,
ord.order_date,
pro.prodct_name,
cat.category_name,
sto.store_name,
CONCAT(sta.first_name, " ",sta.last_name) 

