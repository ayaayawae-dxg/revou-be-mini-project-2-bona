CREATE TABLE users (
	username VARCHAR(16) PRIMARY KEY,
	fullname VARCHAR(255) NOT NULL,
	balance FLOAT DEFAULT 0,
	created_at TIMESTAMP DEFAULT NOW(),
	updated_at TIMESTAMP ON UPDATE NOW()
);

CREATE TABLE products (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255),
	price FLOAT NOT NULL,
	stock INT DEFAULT 0,
	created_at TIMESTAMP DEFAULT NOW(),
	updated_at TIMESTAMP ON UPDATE NOW()
);

CREATE TABLE orders (
	id INT PRIMARY KEY AUTO_INCREMENT,
	user_id VARCHAR(16) NOT NULL,
	created_at TIMESTAMP DEFAULT NOW(),
	FOREIGN KEY (user_id) REFERENCES users(username)
);

CREATE TABLE orders_detail (
	id INT PRIMARY KEY AUTO_INCREMENT,
	order_id INT NOT NULL,
	product_id INT NOT NULL,
	price FLOAT NOT NULL,
	FOREIGN KEY (order_id) REFERENCES orders(id),
	FOREIGN KEY (product_id) REFERENCES products(id)
);