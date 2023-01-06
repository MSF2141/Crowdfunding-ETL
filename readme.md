# ETL Process for a Crowdfunding Platform

## Overview of the Project

Independent Funding is a crowdfunding platform for funding independent projects or ventures. The platform has been growing to a point where a database is needed to 
store all their accessible data. This way, the analytics team will be able to perform analysis and create reports for company stakeholders and donors.

In this project, the **extract, transform, and load (ETL)** process is applied to collect and clean data from two worksheets of one large Excel file and store them in a database prior to performing analysis. Python and Pandas in Jupyter notebook is used to do the extract and transform phases. pgAdmin 4 is then used to create a PostgreSQL database in the load phase. The design of database and its table schema is based on an entity relationship diagram (ERD) created with QuickDBD. Data analysis are performed using SQL queries.

## Objectives
Deliverable 1: Extract Data <br />
Deliverable 2: Transform and Clean Data <br />
Deliverable 3: Create an ERD and Table Schema, and Load Data <br />
Deliverable 4: SQL Analysis <br />

## Softwares
- Python, Pandas, Jupyter Notebook 6.4.12
- Quick DBD
- pgAdmin 4 and PostgreSQL 

## Analysis
Following four (4) source csv files [campaign](https://github.com/MSF2141/Crowdfunding-ETL/blob/d4faa810a0f53cd258f4f96daeee256de986c9b2/campaign.csv), [category](https://github.com/MSF2141/Crowdfunding-ETL/blob/c1e0a19e9e59b52f4f0eb64d0a63d0c87187a224/category.csv), [subcategory](https://github.com/MSF2141/Crowdfunding-ETL/blob/6f78874d3079963627df4daac5e9e04a07d8200b/subcategory.csv), [contacts](https://github.com/MSF2141/Crowdfunding-ETL/blob/c723c283a8d544a3d89d40d9cdf36ff552e2dca9/contacts.csv) were extracted and transformed using the [ETL%20code](https://github.com/MSF2141/Crowdfunding-ETL/blob/42b078a6c708dc813812fb5e2fdd855a141dab41/ETL%20code.ipynb). The fifth source table, [backers](https://github.com/MSF2141/Crowdfunding-ETL/blob/7ff026afa8168ca202a823e14a1dee2d2cfc90f2/backers.csv), was extracted and transformed using the [Extract-Transform_final_code](https://github.com/MSF2141/Crowdfunding-ETL/blob/9dd4fdb27ddd4697dcabb9383d59502ab6c1ae92/Extract-Transform_final_code.ipynb).

Crowdfunding database was created using the following code [crowdfunding_db_schema](https://github.com/MSF2141/Crowdfunding-ETL/blob/45084da51926b7ad06b4ad1a559b55eda621e04d/crowdfunding_db_schema.sql) and based on the ERD logical diagram of five (5) source tables: <br /> 
![crowdfunding_db_relationships](https://github.com/MSF2141/Crowdfunding-ETL/blob/0b0b1743d394b8b3618af14ac533100c28172b78/crowdfunding_db_relationships.png) 

The SQL queries were done using the following code [crowdfunding_SQL_Analysis](https://github.com/MSF2141/Crowdfunding-ETL/blob/85ec0a7c9cd5344aa2aae7fe5b1639ca6f8a4cea/crowdfunding_SQL_Analysis.sql) to find out an email to each contact of every live campaign to inform them of how much of the goal remains ([email_contacts_remaining_goal_amount](https://github.com/MSF2141/Crowdfunding-ETL/blob/9d8e1673828b738e9f84f4adaeb6accf4b5faa84/email_contacts_remaining_goal_amount.csv)). <br /> 
![email_contacts_remaining_goal_amount](https://github.com/MSF2141/Crowdfunding-ETL/blob/c5f9c71aa80f2e3ecf6a0ffdf287532d74f862c4/email_contacts_remaining_goal_amount.png)

In addition, the SQL query was done to find out an email to each backer to let them know how much of the goal remains for each live campaign that they have pledged
([email_backers_remaining_goal_amount](https://github.com/MSF2141/Crowdfunding-ETL/blob/c213964bd778c9695662dc8d6343899b39abac8b/email_backers_remaining_goal_amount.csv)). <br /> 
![email_backers_remaining_goal_amount](https://github.com/MSF2141/Crowdfunding-ETL/blob/e30d14dcd066ec55c812e580fd93aaf3cb7e4d58/email_backers_remaining_goal_amount.png)
<br /> 
