CREATE DATABASE inventory;

USE inventory;

CREATE TABLE Orders (
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    customer_name VARCHAR(255)
);

CREATE TABLE Category (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255)  NOT NULL
);

CREATE TABLE Product (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(id)
);

CREATE TABLE Food (
	id INT PRIMARY KEY,
	expiration_date DATE NOT NULL,
    calories FLOAT NOT NULL,
    FOREIGN KEY (id) REFERENCES Product(id)
);

CREATE TABLE Furniture (
	id INT PRIMARY KEY,
    manufacture_date DATE NOT NULL,
    FOREIGN KEY (id) REFERENCES Product(id)
);

CREATE TABLE Order_line (
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(id),
    FOREIGN KEY (product_id) REFERENCES Product(id)
);


INSERT INTO Category (name) VALUES
('Comida'),
('Muebles');

-- Productos
INSERT INTO Product (name, price, category_id) VALUES
('Manzanas', 2.50, 1),
('Mesa de madera', 150.00, 2),
('Leche', 3.00, 1),
('Silla ejecutiva', 200.00, 2);

-- Productos específicos Food
INSERT INTO Food (id, expiration_date, calories) VALUES
(1, '2024-12-31', 52.0),
(3, '2024-07-15', 150.0);

-- Productos específicos Furniture
INSERT INTO Furniture (id, manufacture_date) VALUES
(2, '2024-01-15'),
(4, '2024-02-20');

-- Órdenes
INSERT INTO Orders (customer_name) VALUES
('Juan Pérez'),
('María García');

-- Líneas de orden
INSERT INTO Order_line (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 5, 2.50),
(1, 2, 1, 150.00),
(2, 3, 2, 3.00),
(2, 4, 1, 200.00);

-- SELECT * FROM Order_line;
-- SELECT * FROM Product;
-- SELECT * FROM Food;
-- SELECT * FROM Orders;
-- SELECT * FROM Furniture;
-- SELECT * FROM Category;

SELECT p.name as producto, p.price as precio, c.name as categoria
FROM Product p
LEFT JOIN Category c ON p.category_id = c.id;

SELECT p.name as producto, f.expiration_date as vencimiento, f.calories as calorias
FROM Product p
INNER JOIN Food f ON p.id = f.id;

SELECT o.id as orden, o.customer_name as cliente, p.name as producto, ol.quantity as cantidad
FROM Orders o
INNER JOIN Order_line ol ON o.id = ol.order_id
INNER JOIN Product p ON ol.product_id = p.id;