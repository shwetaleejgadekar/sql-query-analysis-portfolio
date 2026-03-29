# SQL Query & Analysis Portfolio

A progressive collection of SQL work spanning database design, multi-table querying,
subquery-driven analysis, and advanced window functions — applied across four distinct
real-world datasets in MySQL.

## What's Inside

| Topic | Dataset | Key Concepts |
|---|---|---|
| [Database Design & DDL](./database-design-and-ddl/) | Business (Customers, Items, Orders) | Schema design, primary/foreign keys, cascading constraints, data insertion |
| [Movie Ratings Analysis](./movie-ratings-sql-queries/) | Movies, Ratings, Reviewers | JOINs, filtering, aggregation, NULL handling, CONCAT_WS |
| [Airline Operations Analysis](./airline-operations-sql-analysis/) | Employees, Aircraft, Flights, Certifications | Subqueries, correlated queries, GROUP BY, salary analysis |
| [COVID Statistics Analysis](./covid-statistics-window-functions/) | State-level COVID data | Window functions, LAG, RANK, ROW_NUMBER, rolling averages, mortality rate |

## Technical Highlights

- **Schema Design** — Designed normalized relational schema with referential integrity,
  foreign key constraints, and cascading rules from scratch
- **Multi-table JOINs** — Wrote INNER, LEFT, and self-join queries across 3-4 tables
  to extract meaningful cross-entity insights
- **Subqueries** — Used correlated and non-correlated subqueries for salary comparisons,
  route filtering, and price benchmarking
- **Window Functions** — Applied `LAG()`, `RANK()`, `ROW_NUMBER()`, and
  `AVG() OVER()` for time-series analysis, spike detection, and rolling averages
- **Analytical Queries** — Computed mortality rates per 100K population, smoothed
  COVID case averages, pilot salary differentials, and revenue-based route analysis

## Progression
```
DDL & Schema Design
      ↓
Basic Querying & JOINs
      ↓
Subqueries & Aggregations
      ↓
Window Functions & Time-Series Analysis
```

## Tech Stack
`MySQL` · `DDL` · `DML` · `Window Functions` · `Subqueries` · `JOINs` · `Aggregations`