# universitary-library-database
Learning how to create a database making a database for a universitary library system

Prepare a document answering the following questions in your own words.
Basic
1. What is SQL?

Explain what SQL (Structured Query Language) is, when it was created, why it was created, and what problem it solves.

2. What is SQL used for?

Mention and explain at least 4 real-world situations where SQL is used. For example: an e-commerce system, a food delivery app, etc.

3. Types of SQL Commands

Explain the difference between the command groups below and give one example of each.

Group	Purpose
Data Definition	Create and modify database structures
Data Manipulation	Insert, update, and delete data
Data Query	Retrieve information from the database
Access Control	Manage user permissions
Database Creation
1. You will design and create a database for a university library system.

The database must contain the following tables:

P.S.: It is important to understand what a foreign key is, what it is used for, and how to use it in order to understand the database structure below.

author: id, name, nationality, birth_date
book: id, title, publication_year, author_id (foreign key referencing author; this indicates which author wrote the book)
student: id, name, email, student_id, major
loan: id, student_id, book_id, loan_date, expected_return_date, actual_return_date, status (stores which student borrowed which book, along with the loan information)
2. Populate the Database (INSERT)

Insert enough data to test the queries in Part 4. At a minimum:

5 authors
10 books (linked to the authors)
8 students
15 loans (including different situations: returned, open, and overdue)
SQL Queries (SELECT)

(You will demonstrate these queries working on your computer.)

Write the SQL queries to answer the following questions. Each query must include a comment explaining what it does.

Q1 — Basic SELECT

List the name and email of all registered students.

Q2 — WHERE

List all books published after the year 2000.

Q3 — ORDER BY

List all students in alphabetical order by name.

Q4 — JOIN

List the title of each book along with the name of its author.

Q5 — JOIN with 3 Tables

List the student's name, the book title, and the loan date for every loan recorded in the system.

Q6 — WHERE with a Condition

List all loans whose status is 'open' and whose expected return date has already passed (overdue books).

Q7 — COUNT and GROUP BY

Show how many books each author has registered in the system. Display the author's name and the number of books.

Q8 — HAVING

Show only the authors who have more than 2 books registered in the system.
