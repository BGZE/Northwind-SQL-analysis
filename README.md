# Northwind-SQL-analysis
This project uses the classic **Northwind** dataset to explore business insights through SQL.  
Queries were written in PostgreSQL and executed inside a **Dockerized environment** for reproducibility.  

##  Project Structure
``` Northwind_Traders/
│-- docker-compose.yml # Docker setup for Postgres + PgAdmin
│-- northwind.sql # Northwind dataset schema & data
│-- queries/ # SQL queries for analysis
│ ├── customers_churn_rate.sql
│ ├── profits_by_region.sql
│ ├── customers_segmentation.sql
│ ├── time_series.sql
│ └── employee_performance.sql
```

## Setup Instructions
```
1. Clone this repo:
   git clone https://github.com/BGZE/Northwind-SQL-analysis.git
   cd Northwind-SQL-analysis
2. Start Docker containers:
  docker-compose up -d
3. Connect PgAdmin:
Host: db
Username: postgres
Password: postgres
Database: northwind
```

## Analysis
```
The following queries are included:
1. Customer Churn Analysis
    -Calculates churn rate (customers inactive >30 days).
    -Breaks down churn by region.
2. Profits by Region
    -Aggregates revenue by customer region.
    -Highlights top-performing areas.
3. Customer Segmentation
    -Segments customers into Low, Medium, and High revenue groups.
4. Time Series Sales Trends
    -Monthly and yearly revenue analysis.
    -Useful for seasonality insights.
5. Employee Performance
    -Ranks employees by number of orders handled.
```

📷 Example Outputs

Example:


## Technologies:
```
  -PostgreSQL
  -Docker + Docker Compose
  -PgAdmin 4
  -SQL (window functions, aggregates, CTEs)
```
