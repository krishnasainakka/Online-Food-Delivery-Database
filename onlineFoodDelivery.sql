CREATE DATABASE online_food_delivery;
USE online_food_delivery;

CREATE TABLE Customers (
  c_id INT PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  address VARCHAR(50) NOT NULL
);
CREATE TABLE CustomersLogin(
  c_id INT NOT NULL,
  email VARCHAR(20) NOT NULL UNIQUE,
  password VARCHAR(20) NOT NULL,
  FOREIGN KEY (c_id) REFERENCES Customers(c_id)
);

CREATE TABLE Customer_Phone (
  c_id INT,
  mobile NUMERIC(10) NOT NULL,
  FOREIGN KEY (c_id) REFERENCES Customers(c_id),
  CHECK (LENGTH(mobile) = 10)
);

CREATE TABLE Restaurant (
  r_id INT PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  email VARCHAR(20) UNIQUE NOT NULL,
  password VARCHAR(20) NOT NULL,
  address VARCHAR(50) NOT NULL
);



CREATE TABLE Restaurant_Phone (
  r_id INT,
  mobile NUMERIC(10) NOT NULL,
  CHECK (LENGTH(mobile) = 10),
  FOREIGN KEY (r_id) REFERENCES Restaurant(r_id)
);

CREATE TABLE Orders (
  o_id INT PRIMARY KEY,
  r_id INT NOT NULL,
  c_id INT NOT NULL,
  
  ord_date DATE NOT NULL,
  ord_time TIMESTAMP NOT NULL,
  Total DECIMAL(10,2) NOT NULL,
  ord_status VARCHAR(20) NOT NULL,
  FOREIGN KEY (r_id) REFERENCES Restaurant(r_id),
  FOREIGN KEY (c_id) REFERENCES Customers(c_id)
);

CREATE TABLE Delivery (
  del_id INT,
  o_id INT,
  primary key(del_id,o_id),
  del_status VARCHAR(20) NOT NULL,
  del_time TIMESTAMP NOT NULL,
  FOREIGN KEY (o_id) REFERENCES Orders(o_id)
  );

CREATE TABLE Delivery_Driver (
  del_dri_id INT PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  vehno VARCHAR(20) NOT NULL,
  email VARCHAR(20) UNIQUE NOT NULL,
  password VARCHAR(20) NOT NULL
);

CREATE TABLE Delivery_Driver_ord (
  del_dri_id INT,
  del_id INT,
  primary key(del_dri_id,del_id),
  FOREIGN KEY (del_id) REFERENCES Delivery(del_id),
  FOREIGN KEY (del_dri_id) REFERENCES Delivery_Driver(del_dri_id)
);

CREATE TABLE Delivery_Driver_Phone (
  del_dri_id INT,
  mobile NUMERIC(10) NOT NULL,
  CHECK (LENGTH(mobile) = 10),
  FOREIGN KEY (del_dri_id) REFERENCES Delivery_Driver(del_dri_id)
);

CREATE TABLE MenuItems (
  m_id INT,
  r_id INT NOT NULL,
  primary key(m_id,r_id),
  price DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (r_id) REFERENCES Restaurant(r_id)
);

CREATE TABLE MenuItemsInfo (
  m_id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  description VARCHAR(200) NOT NULL,
  FOREIGN KEY (m_id) REFERENCES MenuItems(m_id)
);

CREATE TABLE OrderItems (
  o_id INT,
  m_id INT,
  Qty INT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (o_id) REFERENCES Orders(o_id),
  FOREIGN KEY (m_id) REFERENCES MenuItems(m_id)
);

CREATE TABLE Payment (
  pay_id INT PRIMARY KEY,
  pay_method VARCHAR(20) NOT NULL,
  pay_status VARCHAR(20) NOT NULL,
  o_id INT NOT NULL,
  FOREIGN KEY (o_id) REFERENCES Orders(o_id)
);

INSERT INTO Customers VALUES(100,"Krishna","d/no:32-21-45, ganesh nagar, tadepalligudem");
INSERT INTO Customers VALUES(101,"Sasi","d/no:32-15-45, chanda nagar, tadepalligudem");
INSERT INTO Customers VALUES(102,"Sathvik","G-04 nagavalli, NITAP, tadepalligudem");
INSERT INTO Customers VALUES(103,"Jayanth","d/no:32-42-12, raliway colony,tadepalligudem");
INSERT INTO Customers VALUES(104,"Krishna","d/no:32-12-6, seshmahal road, tadepalligudem");

INSERT INTO CustomersLogin VALUES(100,"Krishnasai@gmail.com","abcd123");
INSERT INTO CustomersLogin VALUES(101,"sasisai@gmail.com","abcd123");
INSERT INTO CustomersLogin VALUES(102,"sathvik@gmail.com","dot#$123");
INSERT INTO CustomersLogin VALUES(102,"satvy@gmail.com","nayak#$123");
INSERT INTO CustomersLogin VALUES(103,"Jaya@gmail.com","asdf123");
INSERT INTO CustomersLogin VALUES(104,"Krishna@gmail.com","123456");

INSERT INTO Customer_Phone VALUES(100,9484567890);
INSERT INTO Customer_Phone VALUES(101,6301868874);
INSERT INTO Customer_Phone VALUES(101,8688888446);
INSERT INTO Customer_Phone VALUES(102,8938421300);
INSERT INTO Customer_Phone VALUES(103,6387106843);
INSERT INTO Customer_Phone VALUES(104,8325641234);

INSERT INTO Restaurant VALUES(1,"Hungry Birds","HBirds@gmail.com","hb696969","1500 opp rangamahal theatre");
INSERT INTO Restaurant VALUES(2,"VFC","vfc@gmail.com","vfc2021","1010 opp Busstand,Lalashaebgudem");
INSERT INTO Restaurant VALUES(3,"Swaghat","Swaghat@gmail.com","sght456","1007 Ganesh nagar");
INSERT INTO Restaurant VALUES(4,"Bawarchi","Bawarchi@gmail.com","bawarchi++","1005 Sheshmahal road");
INSERT INTO Restaurant VALUES(5,"Tasty House","Tasty@gmail.com","tstyhouse8@","1111 railway station");

INSERT INTO Restaurant_Phone VALUES(1,8456321015);
INSERT INTO Restaurant_Phone VALUES(2,9452301242);
INSERT INTO Restaurant_Phone VALUES(3,8965871235);
INSERT INTO Restaurant_Phone VALUES(4,9955362142);
INSERT INTO Restaurant_Phone VALUES(5,9456321545);

INSERT INTO Delivery_Driver VALUES(1000,"Mohan","APTG1020","mohan@gmail.com","mhn2003");
INSERT INTO Delivery_Driver VALUES(1001,"Arun","APTG2040","arun12@gmail.com","mhn2003");
INSERT INTO Delivery_Driver VALUES(1002,"Mohamed","APTG1111","mohamed20@gmail.com","moh@25");
INSERT INTO Delivery_Driver VALUES(1003,"Sailesh","APTG2013","sasi12@gmail.com","sasi2021");
INSERT INTO Delivery_Driver VALUES(1004,"Srujan","APTG1505","srujan27@gmail.com","srujan#$123");

INSERT INTO Delivery_Driver_ord VALUES(1000,501);
INSERT INTO Delivery_Driver_ord VALUES(1000,506);
INSERT INTO Delivery_Driver_ord VALUES(1001,502);
INSERT INTO Delivery_Driver_ord VALUES(1002,503);
INSERT INTO Delivery_Driver_ord VALUES(1003,504);
INSERT INTO Delivery_Driver_ord VALUES(1004,505);

INSERT INTO Delivery_Driver_Phone VALUES(1000,8654231562);
INSERT INTO Delivery_Driver_Phone VALUES(1001,9492928585);
INSERT INTO Delivery_Driver_Phone VALUES(1002,8585112255);
INSERT INTO Delivery_Driver_Phone VALUES(1003,8325641256);
INSERT INTO Delivery_Driver_Phone VALUES(1004,9490026542);

INSERT INTO MenuItems Values(1, 1, 120.99);
INSERT INTO MenuItems Values(2, 1,  299.99);
INSERT INTO MenuItems Values(2, 2,  299.99);
INSERT INTO MenuItems Values(3, 1,  149.99);
INSERT INTO MenuItems Values(3, 4,  149.99);
INSERT INTO MenuItems Values(4, 2,  58.99);
INSERT INTO MenuItems Values(5, 2,  299.99);
INSERT INTO MenuItems Values(6, 2,  299.99);
INSERT INTO MenuItems Values(7, 3,  99.99);
INSERT INTO MenuItems Values(8, 3,  89.99);
INSERT INTO MenuItems Values(9, 3,  79.99);
INSERT INTO MenuItems Values(10, 3,  249.99);
INSERT INTO MenuItems Values(11, 4,  139.99);
INSERT INTO MenuItems Values(12, 4,  299.99);
INSERT INTO MenuItems Values(13, 4,  399.99);
INSERT INTO MenuItems Values(14, 5,  499.99);
INSERT INTO MenuItems Values(15, 5,  249.99);
INSERT INTO MenuItems Values(16, 5, 199.99);
INSERT INTO MenuItems Values(17, 3, 109.99);
INSERT INTO MenuItems Values(18, 4,  79.99);
INSERT INTO MenuItems Values(19, 5,  599.99);
INSERT INTO MenuItems Values(20, 1,  249.99);


INSERT INTO MenuItemsInfo Values(1, 'Chicken Tikka Masala', 'Grilled chicken in a creamy tomato sauce');
INSERT INTO MenuItemsInfo Values(2, 'Saag Paneer', 'Spinach and cheese in a spiced curry sauce');
INSERT INTO MenuItemsInfo Values(3, 'Lamb Vindaloo', 'Spicy lamb in a tangy sauce');
INSERT INTO MenuItemsInfo Values(4, 'Cheeseburger', 'Beef patty with cheese, lettuce, and tomato');
INSERT INTO MenuItemsInfo Values(5, 'Chicken Caesar Salad', 'Grilled chicken with romaine lettice and Caesar dressing');
INSERT INTO MenuItemsInfo Values(6, 'Margherita Pizza', 'Tomato sauce, mozzarella, and basil');
INSERT INTO MenuItemsInfo Values(7, 'California Roll', 'Crab, avocado, and cucumber in a sushi roll');
INSERT INTO MenuItemsInfo Values(8, 'Spicy Tuna Roll', 'Tuna, sriracha, and cucumber in a sushi roll');
INSERT INTO MenuItemsInfo Values(9, 'Shrimp Tempura Roll', 'Shrimp, avocado, and tempura flakes in a sushi roll');
INSERT INTO MenuItemsInfo Values(10, 'Chicken Teriyaki', 'Grilled chicken in a sweet and savory teriyaki sauce');
INSERT INTO MenuItemsInfo Values(11, 'Philly Cheesesteak', 'Sliced beef with melted cheese on a hoagie roll');
INSERT INTO MenuItemsInfo Values(12, 'Chicken Alfredo','Grilled chicken in a creamy garlic sauce with pasta');
INSERT INTO MenuItemsInfo Values(13, 'Meatball Sub','Meatballs in marinara sauce on a hoagie roll');
INSERT INTO MenuItemsInfo Values(14, 'Fish and Chips', 'Beer-battered fish with fries and tartar sauce');
INSERT INTO MenuItemsInfo Values(15, 'Chicken Fajitas', 'Grilled chicken with peppers and onions, served with tortillas');
INSERT INTO MenuItemsInfo Values(16, 'Vegetable Stir-Fry', 'Mixed vegetables in a soy sauce, served with rice');
INSERT INTO MenuItemsInfo Values(17, 'Spaghetti and Meatballs', 'Meatballs in marinara sauce with pasta');
INSERT INTO MenuItemsInfo Values(18, 'Caesar Salad', 'Romaine lettuce with croutons and Caesar dressing');
INSERT INTO MenuItemsInfo Values(19, 'Margherita Flatbread', 'Tomato sauce, mozzarella, and basil on a flatbread');
INSERT INTO MenuItemsInfo Values(20, 'Chicken Parmesan', 'Breaded chicken with sauce and cheese, served with pasta');


INSERT INTO Orders VALUES(10001, 1, 100, '2023-04-05', '2023-04-05 15:00:00', 1399.95 , 'in progress');
INSERT INTO Orders VALUES(10002, 2, 101, '2023-04-05', '2023-04-05 13:00:00', 79.99   , 'Prepared');
INSERT INTO Orders VALUES(10003, 5, 100, '2023-04-05', '2023-04-05 14:30:00', 1399.96 , 'in progress');
INSERT INTO Orders VALUES(10004, 4, 102, '2023-04-05', '2023-04-05 14:00:00', 1079.96 , 'in progress');
INSERT INTO Orders VALUES(10005, 5, 103, '2023-04-05', '2023-04-05 13:15:00', 1499.96 , 'Prepared');
INSERT INTO Orders VALUES(10006, 3, 104, '2023-04-05', '2023-04-05 13:30:00', 479.95  , 'Prepared');


INSERT INTO Delivery VALUES(501, 10001, 'pending', '2023-04-05 15:00:00');
INSERT INTO Delivery VALUES(502, 10002, 'pending', '2023-04-05 13:10:00');
INSERT INTO Delivery VALUES(503, 10003, 'pending', '2023-04-05 15:00:00');
INSERT INTO Delivery VALUES(504, 10004, 'pending', '2023-04-05 14:30:00');
INSERT INTO Delivery VALUES(505, 10005, 'delivered', '2023-04-05 14:00:00');
INSERT INTO Delivery VALUES(506, 10006, 'delivered', '2023-04-05 14:15:00');

INSERT INTO OrderItems VALUES(10001, 1, 2, 249.98);
INSERT INTO OrderItems VALUES(10001, 5, 1, 299.99);
INSERT INTO OrderItems VALUES(10001, 6, 2, 599.99);
INSERT INTO OrderItems VALUES(10002, 9, 1, 79.99);
INSERT INTO OrderItems VALUES(10003, 12, 3, 999.97);
INSERT INTO OrderItems VALUES(10003, 2, 1, 299.99);
INSERT INTO OrderItems VALUES(10004, 8, 2, 179.98);
INSERT INTO OrderItems VALUES(10004, 6, 1, 299.99);
INSERT INTO OrderItems VALUES(10005, 15, 2, 499.98);
INSERT INTO OrderItems VALUES(10005, 14, 2, 999.98);
INSERT INTO OrderItems VALUES(10004, 19, 1, 599.99);
INSERT INTO OrderItems VALUES(10001, 20, 1, 249.99);
INSERT INTO OrderItems VALUES(10006, 11, 2, 279.98);
INSERT INTO OrderItems VALUES(10006, 7, 3, 299.97);


INSERT INTO Payment VALUES(91, 'Credit Card', 'Paid', 10001);
INSERT INTO Payment VALUES(92, 'PayPal', 'Paid', 10002);
INSERT INTO Payment VALUES(93, 'Debit Card', 'Pending', 10003);
INSERT INTO Payment VALUES(94, 'Cash on Delivery', 'Pending', 10004);
INSERT INTO Payment VALUES(95, 'Credit Card', 'Paid', 10005);
INSERT INTO Payment VALUES(96, 'Credit Card', 'Paid', 10006);





select * from Customers;

select * from customer_phone;

select * from customersLogin;

select * from Delivery;

select * from delivery_driver;

select * from delivery_driver_ord;

select * from delivery_driver_phone;

select * from restaurant;

select * from restaurant_phone;

select * from menuitems;

select * from menuitemsinfo;

select * from Orders;

select * from Orders_add;

select * from orderitems;

select * from payment;

select customers.c_id,name,address from Customers 
right join orders
on orders.c_id = customers.c_id;

select  customers.name, ord_status , del_status from orders
right join customers 
on orders.c_id = customers.c_id
right join delivery
on orders.o_id = delivery.o_id;

select restaurant.r_id,restaurant.name,menuitemsinfo.name,menuitemsinfo.description, menuitems.price from restaurant
left join menuitems
on menuitems.r_id = restaurant.r_id
left join menuitemsinfo
on menuitemsinfo.m_id = menuitems.m_id
where restaurant.name = "Hungry birds";

select customers.c_id,customers.name,orders.o_id,Qty,price,ord_status,delivery.del_id,delivery_driver.name from customers
left join orders
on orders.c_id = customers.c_id
left join orderitems
on orders.o_id = orderitems.o_id
left join delivery
on orders.o_id = delivery.o_id
left join delivery_driver_ord
on delivery.del_id = delivery_driver_ord.del_id
left join delivery_driver
on delivery_driver.del_dri_id = delivery_driver_ord.del_dri_id
where customers.c_id = 100;
















