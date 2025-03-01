# Data Warehouse ETL Project

# Project Overview

This project is designed to build a Data Warehouse (DWH) for a banking client of ID/X Partners. The client needs to consolidate data from multiple sources into a structured DWH to facilitate efficient reporting and analysis. The data sources include:

* transaction_excel (Excel file)

* transaction_csv (CSV file)

* transaction_db (SQL Server Database)

* account (SQL Server Database)

* customer (SQL Server Database)

* branch (SQL Server Database)

* city (SQL Server Database)

* state (SQL Server Database)

The main challenge is extracting data from multiple formats and integrating them into a unified system while ensuring data consistency and accuracy.

# Project Tasks

As a Data Engineer, the tasks for this project include:

1. Database Creation

Create a new database named DWH.

Define three dimension tables: DimAccount, DimCustomer, DimBranch.

Define one fact table: FactTransaction.

Assign appropriate primary keys and foreign keys.

![image](https://github.com/user-attachments/assets/92c33c04-4f00-4c8c-8411-19a11daf1a07)

2. ETL Job for Dimension Tables

Develop an ETL job in Talend to extract data from the source systems and load it into the dimension tables.

Ensure that DimCustomer contains the following columns:

CustomerID, CustomerName, Address, CityName, StateName, Age, Gender, Email

Convert all column values to uppercase except CustomerID, Age, and Email.

Follow PascalCase naming conventions for column names.

3. ETL Job for Fact Table

Develop an ETL job to merge transaction data from transaction_excel, transaction_csv, and transaction_db into FactTransaction.

Ensure no duplicate rows exist in FactTransaction despite differences in data sources.

4. Stored Procedures

Implement two stored procedures (SP) to enable fast data retrieval:

a. DailyTransaction

Calculates the total number of transactions and their sum for each day.

Expected output columns: Date, TotalTransactions, TotalAmount.

Parameters: @start_date, @end_date.

b. BalancePerCustomer

Retrieves the remaining balance per customer.

Expected output columns: CustomerName, AccountType, Balance, CurrentBalance.

CurrentBalance is computed as:

Balance from account table minus the total transaction amount.

If transaction_type = Deposit, balance increases; otherwise, it decreases.

Filters only active accounts.

Parameter: @name (Customer Name).

# Technologies Used

Database: SQL Server

ETL Tool: Talend

Scripting: SQL (Stored Procedures)

# How to Use

Set up a SQL Server database and create the required tables.

Use Talend to execute ETL jobs and populate the Data Warehouse.

Run stored procedures to generate required reports.
