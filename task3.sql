# Step 1: MySQL - Create the Database and Tables

# Create the database in MySQL
CREATE DATABASE SalesAnalysis;
USE SalesAnalysis;

# Create Categories Table in MySQL
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,   # Unique identifier for category
    CategoryName VARCHAR(100)      # Name of the category
);

# Create Products Table in MySQL
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,     # Unique identifier for product
    ProductName VARCHAR(100),      # Name of the product
    CategoryID INT,                # Foreign key to reference Categories table
    SalesAmount DECIMAL(10,2),     # Sales price for the product
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)  # Establish foreign key relationship
);

# Create Sales Table in MySQL
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,        # Unique identifier for the sale
    ProductID INT,                 # Foreign key to reference Products table
    SalesDate DATE,                # Date of the sale
    SalesAmount DECIMAL(10,2),     # Sales amount for the transaction
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)  # Establish foreign key relationship
);

# Step 2: Insert Sample Data into MySQL Tables

# Insert data into Categories table
INSERT INTO Categories (CategoryID, CategoryName) 
VALUES 
(1, 'Electronics'), 
(2, 'Furniture'), 
(3, 'Clothing');

# Insert data into Products table
INSERT INTO Products (ProductID, ProductName, CategoryID, SalesAmount) 
VALUES 
(1, 'Laptop', 1, 1500),
(2, 'Phone', 1, 800),
(3, 'Chair', 2, 100),
(4, 'Sofa', 2, 300),
(5, 'T-Shirt', 3, 20),
(6, 'Jeans', 3, 40);

# Insert data into Sales table
INSERT INTO Sales (SaleID, ProductID, SalesDate, SalesAmount) 
VALUES 
(1, 1, '2025-01-01', 1500),
(2, 2, '2025-01-02', 800),
(3, 3, '2025-01-03', 100),
(4, 4, '2025-01-04', 300),
(5, 5, '2025-01-05', 20),
(6, 6, '2025-01-06', 40);

# Step 3: Export Data from MySQL to CSV files

# Export Categories data to CSV
SELECT * INTO OUTFILE '/path/to/categories.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM Categories;

# Export Products data to CSV
SELECT * INTO OUTFILE '/path/to/products.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM Products;

# Export Sales data to CSV
SELECT * INTO OUTFILE '/path/to/sales.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM Sales;

# Step 4: PostgreSQL - Create the Database and Tables

# In PostgreSQL, connect manually via psql
# Example: psql -U username -d postgres

# Switch to the salesanalysis database (for PostgreSQL)
# In psql, use: \c salesanalysis;

# Create Categories Table in PostgreSQL
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,  # Unique identifier for category
    CategoryName VARCHAR(100)     # Name of the category
);

# Create Products Table in PostgreSQL
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,    # Unique identifier for product
    ProductName VARCHAR(100),     # Name of the product
    CategoryID INT,               # Foreign key to reference Categories table
    SalesAmount DECIMAL(10,2),    # Sales price for the product
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID) -- Establish foreign key relationship
);

# Create Sales Table in PostgreSQL
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,       # Unique identifier for the sale
    ProductID INT,                # Foreign key to reference Products table
    SalesDate DATE,               # Date of the sale
    SalesAmount DECIMAL(10,2),    # Sales amount for the transaction
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) -- Establish foreign key relationship
);

# Step 5: Import Data into PostgreSQL from CSV Files

# Import Categories data from CSV into PostgreSQL
COPY Categories(CategoryID, CategoryName)
FROM '/path/to/categories.csv'
DELIMITER ',' 
CSV HEADER;

# Import Products data from CSV into PostgreSQL
COPY Products(ProductID, ProductName, CategoryID, SalesAmount)
FROM '/path/to/products.csv'
DELIMITER ',' 
CSV HEADER;

# Import Sales data from CSV into PostgreSQL
COPY Sales(SaleID, ProductID, SalesDate, SalesAmount)
FROM '/path/to/sales.csv'
DELIMITER ',' CSV HEADER;

# Step 6: Data Integrity Checks in PostgreSQL

# Foreign Key Integrity Check in Products table (check if CategoryID is valid)
SELECT * FROM Products WHERE CategoryID NOT IN (SELECT CategoryID FROM Categories);

# Foreign Key Integrity Check in Sales table (check if ProductID is valid)
SELECT * FROM Sales WHERE ProductID NOT IN (SELECT ProductID FROM Products);

# Row Count Validation for Categories Table (ensure the count matches)
SELECT COUNT(*) FROM Categories;

# Row Count Validation for Products Table (ensure the count matches)
SELECT COUNT(*) FROM Products;

# Row Count Validation for Sales Table (ensure the count matches)
SELECT COUNT(*) FROM Sales;

