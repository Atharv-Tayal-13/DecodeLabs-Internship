# Project 3 - SQL Data Analysis

Same order dataset used in Project 2, this time loaded into a SQLite database
and queried directly with SQL instead of pandas. Goal was to practice writing
SELECT queries, filtering with WHERE, sorting with ORDER BY, grouping with
GROUP BY, and using COUNT/SUM/AVG aggregations.

## Folder structure

```
project 3/
├── README.md
├── requirements.txt
├── data/
│   └── orders.csv
├── database/
│   └── orders.db
├── queries/
│   └── queries.sql
├── notebooks/
│   └── SQL_Project3.ipynb
└── reports/
    └── SQL_Summary_Report.md
```

## What's covered

- Building a SQLite database from the raw csv
- Basic SELECT with specific columns
- WHERE with equality, comparison, multiple conditions, and LIKE
- ORDER BY ascending and descending
- GROUP BY with COUNT, SUM, AVG
- HAVING to filter grouped results
- Grouping by month for a revenue trend
- A subquery to calculate percentage contribution per product
- Repeat customer check and a cancelled/returned order breakdown

## How to run it

```
pip install -r requirements.txt
jupyter notebook notebooks/SQL_Project3.ipynb
```

The notebook builds the database from data/orders.csv, then runs each query
and shows the output as a table. queries/queries.sql has all the same queries
as plain SQL if you want to run them in a different SQL client (DB Browser
for SQLite, etc).

## Main findings

- Printer and Tablet have the most orders, but that doesn't automatically
  mean highest revenue since prices vary a lot across products
- Cancelled + Returned orders make up about 41% of all orders
- Average order value doesn't change much across payment methods
- Revenue is fairly evenly split across the 7 product categories, nothing
  is dominating
- 655 unique shipping addresses across 1200 orders, so there are repeat
  addresses

More detail is in reports/SQL_Summary_Report.md.
