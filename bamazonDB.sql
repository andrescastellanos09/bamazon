DROP DATABASE IF EXISTS bamazon_db;
-- Creates the "bamazon" database --
CREATE DATABASE bamazon_db;
-- Makes it so all of the following code will affect bamazon --
USE bamazon_db;
CREATE TABLE Products
(
    -- Creates a numeric column called "id" which will automatically increment its default value as we create new rows --
    item_id INTEGER(11)
    AUTO_INCREMENT NOT NULL,
    -- Makes a string column called "product name" which cannot contain null --
  product_name VARCHAR
    (30) NOT NULL,
    -- Makes a string column called "department name" which cannot contain null --
  department_name VARCHAR
    (30) NOT NULL,
    -- Makes a string column called "price" which cannot contain null --
  price INTEGER
    (11) NOT NULL,
    -- Makes a string column called "stock quantity" which cannot contain null --
    stock_quantity INTEGER
    (11) NOT NULL,
    PRIMARY KEY (item_id)
);

-- Creates new rows containing data in all named columns --
INSERT INTO Products (product_name, department_name, price, stock_quantity)
VALUES ("iphone8", "electronics", 700, 100);

INSERT INTO Products (product_name, department_name, price, stock_quantity)
VALUES ("backpack", "travel items", 35, 500);

INSERT INTO Products (product_name, department_name, price, stock_quantity)
VALUES ("nike air shoes", "mens shoes", 80, 300);

INSERT INTO Products (product_name, department_name, price, stock_quantity)
VALUES ("Gucci belts", "womens accesories", 600, 150);

INSERT INTO Products (product_name, department_name, price, stock_quantity)
VALUES ("PS4", "gaming", 300, 400);

INSERT INTO Products (product_name, department_name, price, stock_quantity)
VALUES ("HP 23mx laptop", "electronics", 545.99, 700);

INSERT INTO Products (product_name, department_name, price, stock_quantity)
VALUES ("Dyson 34x vacuum", "electronics", 635, 100);

INSERT INTO Products (product_name, department_name, price, stock_quantity)
VALUES ("ipod 10", "electronics", 245.99, 400);

INSERT INTO Products (product_name, department_name, price, stock_quantity)
VALUES ("keurig 23", "appliances", 145.99, 1000);

INSERT INTO Products (product_name, department_name, price, stock_quantity)
VALUES ("xbox 360", "gaming", 345.99, 300);





