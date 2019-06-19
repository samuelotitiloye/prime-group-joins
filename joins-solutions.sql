--1. Get all customers and their addresses.
SELECT * FROM "customers"
JOIN "addresses" ON "addresses"."customer_id"="customers"."id";

--2. Get all orders and their line items (orders, quantity and product).
SELECT *
FROM "orders"
JOIN "line_items"
ON"line_items"."order_id"="orders"."id";


--3. Which warehouses have cheetos?
SELECT "warehouse" FROM "products"
JOIN "warehouse_product" ON "products"."id"="warehouse_product"."warehouse_id"
JOIN "warehouse" ON "warehouse"."id"="warehouse_product"."warehouse_id"
WHERE "products"."description"='cheetos';


--4. Which warehouses have diet pepsi?
SELECT * FROM "products"
JOIN "warehouse_product" 
ON "warehouse_product"."product_id"="products"."id"
JOIN "warehouse" 
ON "warehouse"."id"="warehouse_product"."warehouse_id"
WHERE "products"."description"='diet pepsi'; 

SELECT * FROM "products"
JOIN "warehouse_product" ON "products"."id"="warehouse_product"."product_id"
JOIN "warehouse" ON "warehouse"."id"="warehouse_product"."warehouse_id"
WHERE "products"."description"='diet pepsi';

--5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
-- SELECT "quantity", "first_name", "last_name" FROM "line_items"
-- JOIN "orders" 
-- ON "orders"."id"="line_items"."order_id"
-- JOIN "addresses" 
-- ON "addresses"."id"="orders"."address_id"
-- JOIN "customers"
-- ON "customers"."id"="addresses"."id";

SELECT COUNT (*), "first_name", "last_name" FROM "orders" 
JOIN "addresses" 
ON "addresses"."id"="orders"."address_id"
JOIN "customers"
ON "customers"."id"="addresses"."customer_id"
GROUP BY "customers"."id";


--6. How many customers do we have?
SELECT COUNT(*) FROM "customers";

--7. How many products do we carry?
SELECT COUNT (*) FROM "products";

--8. What is the total (SUM) available (column)on-hand quantity of (product_name)diet pepsi?
SELECT SUM("on_hand") FROM "products"
JOIN "warehouse_product" 
ON "warehouse_product"."product_id"="products"."id"
WHERE "description"='diet pepsi';
--GROUP BY "products"."description", "on_hand";

