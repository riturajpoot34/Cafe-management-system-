-- Create Database
CREATE DATABASE IF NOT EXISTS cafe_management_system;
USE cafe_management_system;

-- Table structure for table `manager`
CREATE TABLE IF NOT EXISTS manager (
  Manager_ID VARCHAR(100) NOT NULL PRIMARY KEY,
  Password VARCHAR(255) NOT NULL
);

-- Table structure for table `customer`
CREATE TABLE IF NOT EXISTS customer (
  Customer_ID VARCHAR(100) NOT NULL PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Password VARCHAR(255) NOT NULL,
  Feedback TEXT DEFAULT NULL,
  rate VARCHAR(50) DEFAULT NULL
);

-- Table structure for table `menu`
CREATE TABLE IF NOT EXISTS menu (
  Item_ID INT NOT NULL PRIMARY KEY,
  Item_Name VARCHAR(255) NOT NULL,
  Item_Price INT NOT NULL,
  Quantity INT NOT NULL,
  Category VARCHAR(100) NOT NULL
);

-- Table structure for table `orders`
CREATE TABLE IF NOT EXISTS orders (
  Order_ID INT NOT NULL PRIMARY KEY,
  Customer_ID VARCHAR(100) NOT NULL,
  Bill INT NOT NULL,
  Order_Status VARCHAR(50) NOT NULL,
  Ordering_Time TIME NOT NULL,
  Recieving_Time VARCHAR(50) NOT NULL
);

-- Table structure for table `order_detail`
CREATE TABLE IF NOT EXISTS order_detail (
  id INT NOT NULL PRIMARY KEY,
  Order_ID INT NOT NULL,
  ItemName VARCHAR(255) NOT NULL,
  quantity INT NOT NULL,
  Status VARCHAR(50) NOT NULL
);

-- Table structure for table `employee`
CREATE TABLE IF NOT EXISTS employee (
  Emp_ID INT NOT NULL PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Contact VARCHAR(50) NOT NULL,
  Age INT NOT NULL,
  Duty VARCHAR(100) NOT NULL,
  Salary INT NOT NULL
);

-- Table structure for table `sale`
CREATE TABLE IF NOT EXISTS sale (
  Sale_ID INT NOT NULL PRIMARY KEY,
  Order_ID INT NOT NULL,
  Sale INT NOT NULL
);

-- Seed data for `manager`
INSERT INTO manager (Manager_ID, Password) VALUES ('m_001', 'admin') ON DUPLICATE KEY UPDATE Password=Password;
INSERT INTO manager (Manager_ID, Password) VALUES ('admin', 'admin') ON DUPLICATE KEY UPDATE Password=Password;

-- Seed data for `menu`
INSERT INTO menu (Item_ID, Item_Name, Item_Price, Quantity, Category) VALUES
(1, 'Lays Masala', 30, 36, 'Snacks'),
(2, 'Chicken Burger', 120, 12, 'Junk Food'),
(3, 'Chicken korma', 80, 9, 'Meal'),
(4, 'Chocolate Icecream', 25, 6, 'Dessert'),
(5, 'Apple Juice (Fresh)', 60, 12, 'Juice'),
(6, 'Nestle Mango Juice', 25, 9, 'Juice'),
(7, 'Banana Shake', 50, 25, 'Shake'),
(8, 'Aquafina (water)', 35, 12, 'Other'),
(9, 'Dairy Milk', 60, 20, 'Snacks')
ON DUPLICATE KEY UPDATE Item_Price=VALUES(Item_Price), Quantity=VALUES(Quantity);
