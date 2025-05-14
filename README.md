#Database Migration 

COMPANY : CODTECH IT SOLUTIONS

NAME : Nikeeta Nitin Sawant

INTERN ID : CT04DK245

Domain : sql

Duration : 4 WEEKS

MENTOR : Neela Santosh Kumar

#Description
As part of my internship at CodTech, I was given the task of migrating data from a MySQL database to PostgreSQL.
The main goal was to learn how to move structured data between two different relational database systems while
maintaining data integrity. This task was new for me, and at first, I wasn’t sure how to approach it. But after
doing a bit of research and breaking it down into clear steps, I was able to understand the process and complete 
the migration successfully. I started by creating a MySQL database called "SalesAnalysis" using MySQL Workbench.
In this database, I created three main tables: Categories, Products, and Sales. Each table was related to the other
using foreign keys to ensure relational accuracy. I filled the tables with sample data representing different product 
categories, products under those categories, and sales transactions for those products. After populating the MySQL
database, the next step was exporting the data. For this, I used the SELECT INTO OUTFILE command to export each table
into CSV files. I made sure each file had the right structure with headers, correct delimiters, and no formatting errors. 
I also checked the CSVs manually in Notepad++ to make sure there were no hidden characters or issues. Once the data was
exported, I moved on to PostgreSQL. I opened pgAdmin and created a new database, also named "SalesAnalysis", to maintain 
naming consistency. I then recreated the table structures in PostgreSQL using adjusted syntax since PostgreSQL doesn’t
support all MySQL data types directly. For example, AUTO_INCREMENT in MySQL had to be changed to SERIAL in PostgreSQL,
and decimal values were handled using NUMERIC. After setting up the tables, I began importing the CSV data using PostgreSQL’s 
COPY command. I had to ensure the paths were correct and accessible, and that the column order in the CSV matched the table 
schema exactly. Any mismatch would have thrown an error, so I proceeded carefully and tested each table one by one. After
importing the data, I validated it by running SELECT COUNT(*) on both databases to ensure the row counts matched. 
I also ran some JOIN queries between tables to check if the foreign key relations were preserved properly. Everything worked
as expected, and there was no data loss or mismatch. One of the most important things I learned from this task was how even
small syntax differences can cause big problems during migration. I also realized the importance of testing each step, 
especially when dealing with important data. I used MySQL Workbench for the source database, exported using SQL commands,
and then used pgAdmin and psql CLI for creating and importing into PostgreSQL. The whole experience helped me understand 
cross-platform data operations and gave me real-world insights into database management. Overall, this task helped improve
my technical confidence and made me more comfortable with both MySQL and PostgreSQL. It was a rewarding experience, and
I now have a better understanding of how data is handled across systems in actual business environments.









