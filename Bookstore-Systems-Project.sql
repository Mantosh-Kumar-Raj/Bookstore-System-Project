-- Create Database 
CREATE DATABASE Sql_project2_db;

-- Create Books Table
CREATE TABLE Books_details(
         Book_ID INT PRIMARY KEY,
		 Title VARCHAR(255),
		 Author	VARCHAR(255),
		 Genre VARCHAR(255),
		 Published_Year	INT,
		 Price FLOAT,
		 Stock INT
		 );

-- Create Customers Table
CREATE TABLE Customers_details(
         Customer_ID INT PRIMARY KEY,
		 Name VARCHAR(255),
		 Email VARCHAR(255),
		 Phone VARCHAR(255),
		 City VARCHAR(255),
		 Country VARCHAR(255)
		 );

-- Create Orders Table
CREATE TABLE Orders_details (
         Order_ID INT PRIMARY KEY,
         Customer_ID INT REFERENCES Customers_details(Customer_ID),
         Book_ID INT REFERENCES Books_details(Book_ID),
         Order_Date DATE,
         Quantity INT,
         Total_Amount FLOAT
         );

-- Now We check the created table one by one. 
SELECT * FROM Books_details;
SELECT * FROM Customers_details;
SELECT * FROM Orders_details;

-- Import the data.
COPY Books_details(Book_id,Title,Author,Genre,Published_year,Price,Stock)
FROM 'C:\Users\manto\Downloads\Books.csv'
CSV HEADER;

-- Data Cleaning  
-- Check Null values IF Exists
SELECT * FROM Books_details
WHERE 
    Book_ID IS NULL
	OR
    Title IS NULL
	OR
    Author IS NULL
	OR
	Genre IS NULL
	OR
	Published_Year IS NULL
	OR
	Price IS NULL
	OR
	Stock IS NULL;
     
-- Check Datacount of each tables.
SELECT COUNT(*) FROM Books_details;
SELECT COUNT(*) FROM Customers_details;
SELECT COUNT(*) FROM Orders_details;

-- Data Exploration andf solve problems

-- Q1.Retrieve all books in the "Fiction" genre.
SELECT * FROM Books_details
WHERE genre = 'Fiction';


-- Q2.Find books published after the year 1950.
SELECT * FROM Books_details
WHERE published_year > 1950
ORDER BY published_year;


-- Q3.List all customers from the Canada.
SELECT * FROM Customers_details
WHERE Country = 'Canada';


-- Q4.Show orders placed in November 2023.
SELECT * FROM Orders_details
WHERE TO_CHAR(order_date, 'YYYY-MM') = '2023-11';


-- Q5.Retrieve the total stock of books available.
SELECT SUM(stock) AS Total_Stocks
FROM Books_details;


-- Q6.Find the details of the most expensive book.
SELECT * FROM Books_details 
WHERE price = (SELECT MAX(price) FROM Books_details);


-- Q7.Show all customers who ordered more than 1 quantity of a book.
SELECT name,email,phone,country,quantity FROM Customers_details AS C
INNER JOIN Orders_details as O 
ON C.customer_id = O.customer_id
WHERE quantity > 1
ORDER BY quantity;


-- Q8.Retrieve all orders where the total amount exceeds $20.
SELECT * FROM Orders_details
WHERE total_amount > 20;


-- Q9.List all genres available in the Books table.
SELECT genre FROM Books_details
GROUP BY genre;


-- Q10.Find the book with the lowest stock.
SELECT * FROM Books_details
WHERE stock = (SELECT MIN(stock) FROM Books_details)
LIMIT 1;


-- Q11.Calculate the total revenue generated from all orders.
SELECT SUM(total_amount) AS Total_revenue
FROM Orders_details;


-- Advance Questions 

-- Q12.Retrieve the total number of books sold for each genre.
SELECT genre,SUM(quantity) FROM Books_details AS B
INNER JOIN Orders_details as O
ON B.book_id = O.book_id
GROUP BY genre;


-- Q13.Find the average price of books in the "Fantasy" genre.
SELECT AVG(price) AS Average_Price
FROM Books_details
WHERE Genre = 'Fantasy';


-- Q14.List customers who have placed at least 2 orders.
SELECT O.customer_id, C.name, COUNT(O.Order_id) AS Order_Counts
FROM Orders_details AS O
JOIN Customers_details AS C ON O.customer_id = C.customer_id
GROUP BY O.customer_id, C.name
HAVING COUNT(Order_id) >=2;


-- Q15.Find the most frequently ordered book.
SELECT B.book_id, B.title, COUNT(O.Order_ID) AS Most_Orders
FROM Books_details AS B
JOIN Orders_details AS O
ON B.book_id = O.book_id
GROUP BY B.book_id, B.title
ORDER BY Most_Orders DESC
LIMIT 1;


-- Q16.Show the top 3 most expensive books of 'Fantasy' Genre.
SELECT book_id, title, price FROM Books_details
WHERE genre = 'Fantasy'
ORDER BY price DESC
LIMIT 3;


-- Q17.Retrieve the total quantity of books sold by each author.
SELECT author, SUM(quantity) AS total_quantity
FROM Books_details as B
JOIN Orders_details as O
ON B.book_id = O.book_id
GROUP BY author;


-- Q18.List the cities where customers who spent over $30 are located.
SELECT DISTINCT city, total_amount FROM Customers_details AS C
JOIN Orders_details AS O
ON C.customer_id = O.customer_id
WHERE total_amount > 30;


-- Q19.Find the customer who spent the most on orders.
SELECT C.name, SUM(O.total_amount) AS Total_Spent
FROM Customers_details AS C
JOIN Orders_details AS O
ON C.customer_id = O.customer_id
GROUP BY C.name
ORDER BY Total_Spent DESC
LIMIT 1;


-- Q20.Calculate the stock remaining after fulfilling all orders.
SELECT B.book_id, B.title, B.stock, COALESCE(SUM(O.quantity),0) AS Order_quantity,  
	   B.stock- COALESCE(SUM(O.quantity),0) AS Remaining_Quantity
FROM Books_details AS B
LEFT JOIN Orders_details AS O 
ON B.book_id = O.book_id
GROUP BY B.book_id 
ORDER BY B.book_id;











