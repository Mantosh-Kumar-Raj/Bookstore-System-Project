# Bookstore System Project

### Project Title: Bookstore System

A beginner-friendly SQL project designed to manage books, customers, and orders in a bookstore. This project demonstrates how to use SQL for database creation, table design, and querying data. It is ideal for beginners looking to practice SQL and understand how to handle relational data in a simple system.

## Key Objectives
- **Database Initialization**: Set up and populate a bookstore database with structured data.
- **Data Management**: Manage book details, customer information, and order records.
- **Order Tracking**: Track customer orders, including books purchased, quantities, and total amounts.
- **Sales Insights**: Extract data using SQL queries to understand book sales and customer behavior.

## Key Findings
- **Book Availability**: Stock levels and prices can be monitored to identify high-demand books.
- **Customer Insights**: Analyze customer data to identify purchasing patterns and demographics.
- **Order Trends**: Explore sales data to identify peak ordering periods or customer preferences.

## Reports & Impact
- **Book Inventory Summary**: Overview of available books and their stock levels.
- **Sales Insights**: Overview of the total sales made by customers.
- **Customer Analysis**: Identify top customers and popular books based on order data.

## SQL Script to Create Database and Tables

To create the database and tables, use the following SQL script:

```sql
-- Create Database 
CREATE DATABASE Sql_project2_db;

-- Use the database
USE Sql_project2_db;

-- Create Books Table
CREATE TABLE Books_details(
         Book_ID INT PRIMARY KEY,
         Title VARCHAR(255),
         Author VARCHAR(255),
         Genre VARCHAR(255),
         Published_Year INT,
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
