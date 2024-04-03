# Jef Bos membeli Samsul 30 sebanyak 1
# Samsul 30 | 80000 @ 1	: 80000
# 						  =====
# Total					  80000

START TRANSACTION

SELECT name, price, stock FROM products WHERE id = 3 FOR UPDATE;

# ... Cek ketersediaan stock, jika 0 ROLLBACK

SELECT username, fullname, balance FROM users WHERE username = 'jef_bos' FOR UPDATE;

# ... Cek balance apakah cukup, jika tidak cukup ROLLBACK

UPDATE products SET stock = stock - 1 WHERE id = 3;

INSERT INTO orders (user_id) VALUES ("jef_bos");
SELECT * FROM orders o;
INSERT INTO orders_detail (order_id, product_id, price) VALUES (2, 3, 80000);

-- COMMIT
ROLLBACK