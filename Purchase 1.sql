# John Doe membeli Esia sebanyak 2 dan Samsul 30 sebanyak 1
# Samsul 30 | 80000 @ 1	: 80000
# Esia		| 10000 @ 2	: 20000
# 						 ======
# Total					 100000

START TRANSACTION

SELECT name, price, stock FROM products WHERE id = 3 OR id = 4 FOR UPDATE;

# ... Cek ketersediaan stock, jika 0 ROLLBACK

SELECT username, fullname, balance FROM users WHERE username = 'john_doe' FOR UPDATE;

# ... Cek balance apakah cukup, jika tidak cukup ROLLBACK

UPDATE products SET stock = stock - 1 WHERE id = 3;
UPDATE products SET stock = stock - 2 WHERE id = 4; 

INSERT INTO orders (user_id) VALUES ("john_doe");
select * from orders o;
INSERT INTO orders_detail (order_id, product_id, price) VALUES (1, 3, 80000);
INSERT INTO orders_detail (order_id, product_id, price) VALUES (1, 4, 10000);
INSERT INTO orders_detail (order_id, product_id, price) VALUES (1, 4, 10000);

COMMIT
-- ROLLBACK