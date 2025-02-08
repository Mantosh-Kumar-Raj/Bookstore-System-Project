# Bookstore System Project

## Project Overview

The **Bookstore System** is a beginner-friendly SQL-based project designed to help you manage books, customers, and orders in a bookstore. It allows you to:
- Add books with details such as title, author, price, and stock.
- Manage customer information such as name, email, and phone number.
- Track orders placed by customers, including which books they ordered, the quantity, and the total amount spent.

This project is perfect for beginners who are learning how to use SQL for creating databases and managing data.

## Database Schema

The database has three main tables: **Books**, **Customers**, and **Orders**. Here's how each table is structured:

### 1. Books Table (`Books_details`)

This table holds information about the books available in the bookstore.

```sql
CREATE TABLE Books_details(
         Book_ID INT PRIMARY KEY,
         Title VARCHAR(255),
         Author VARCHAR(255),
         Genre VARCHAR(255),
         Published_Year INT,
         Price FLOAT,
         Stock INT
);
