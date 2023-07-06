USE Homework_2 ;

-- Task_1. Используя операторы языка SQL, создайте таблицу “sales”. Заполните ее данными.

CREATE TABLE sales (
	id INT NOT NULL DEFAULT '1',
	order_date DATE,
	bucket INT DEFAULT '0'
);
-- заполняем данные
INSERT INTO `sales` (order_date, bucket)
VALUES 
('2022-01-01', 140),
('2022-01-02', 150),
('2022-01-03', 30),
('2022-01-04', 144),
('2022-01-05', 355);

/* Task_2 Разделите значения поля “bucket” на 3 сегмента: меньше 100(“Маленький заказ”),
 100-300(“Средний заказ”) и больше 300 (“Большой заказ”)
 */
 SELECT
	*,
	CASE
		WHEN bucket < 100
			THEN "Маленький заказ"
		WHEN bucket BETWEEN 100 AND 300
			THEN "Средний заказ"
		WHEN bucket > 300
			THEN "Большой заказ"
	END AS order_size
FROM Homework_2.sales
ORDER BY bucket ASC;

/* Task_3  Создайте таблицу “orders”, заполните ее значениями. Покажите 
“полный” статус заказа, используя оператор CASE.
*/
CREATE TABLE Homework_2.orders
(
	orderid INT PRIMARY KEY AUTO_INCREMENT,
	employeeid VARCHAR(4) NOT NULL, 
	amount DECIMAL(7, 2), 
	orderstatus VARCHAR(10) # 
);

INSERT INTO Homework_2.orders (employeeid, amount, orderstatus)
VALUES
("e03", 15.00, "OPEN"),
("e01", 25.50, "OPEN"),
("e05", 100.70, "CLOSED"),
("e02", 22.18, "OPEN"),
("e04", 9.50, "CANCELLED"),
("e04", 99.99, "OPEN");

SELECT * FROM Homework_2.orders;

SELECT
	orderid, orderstatus,
	CASE
		WHEN orderstatus = "OPEN"
			THEN "Order is in open state."
		WHEN orderstatus = "CLOSED" OR orderstatus = "CANCELLED"
			THEN CONCAT("Order is ", LOWER(orderstatus), ".")
	END AS order_summary
FROM Homework_2.orders;

