# Zwigato — Food Delivery Backend (SQL Project)

## Overview

**Zwigato** is a SQL-based backend simulation of a real-world **food delivery platform**.
The project focuses on **database design, business logic implementation, and analytical querying** using SQL.

It models the complete order lifecycle — from customer ordering to payment, delivery, and ratings — while keeping performance and scalability in mind.

---

## Tech Stack

* **SQL** (MySQL / PostgreSQL compatible design)
* Concepts used:

  * Relational database modeling
  * Primary & Foreign keys
  * Joins, subqueries, aggregations
  * Views for analytics
  * Stored procedures for business logic
  * Indexes & triggers for performance

---

## Core Database Entities

* **Customers & Addresses**
* **Restaurants**
* **Menu Items**
* **Orders & Order Items**
* **Payments**
* **Delivery Partners & Deliveries**
* **Ratings & Reviews**

The schema is normalized and designed to resemble a **production-grade food delivery system**.

---

## Project Structure

```
Zwigato/
│
├── cust_table.sql               -- Customers and addresses
├── restaurant_and_menu.sql      -- Restaurants and menu items
├── orders_table.sql             -- Orders and order items
├── supporting_tables.sql        -- Payments, delivery, ratings
│
├── insert_data.sql              -- Sample data for testing
├── adding_new_orders.sql        -- End-to-end order flow
│
├── performance.sql              -- Indexes and triggers
├── view.sql                     -- Analytical views (KPIs)
├── procedure.sql                -- Stored procedures
```

---

## Order Lifecycle (High Level)

1. Customer places an order
2. Items are added to the order
3. Business logic is executed via stored procedure
4. Payment is processed
5. Order is delivered
6. Customer submits rating

All calculations (subtotal, discount, delivery fee, total) are handled inside **stored procedures**, not application code.

---

## Analytical Capabilities

Using views and queries, the project can answer:

* Restaurant-wise revenue and order counts
* Customer ordering behavior
* Average ratings per restaurant
* Active vs delivered orders
* Performance comparison across restaurants

---

## How to Run

1. Create a database in MySQL or PostgreSQL
2. Execute table creation files in order:

   * `cust_table.sql`
   * `restaurant_and_menu.sql`
   * `orders_table.sql`
   * `supporting_tables.sql`
3. Insert sample data using `insert_data.sql`
4. Apply performance optimizations using `performance.sql`
5. Create procedures and views:

   * `procedure.sql`
   * `view.sql`
6. Test order flow using `adding_new_orders.sql`

---

## Why This Project?

* Demonstrates **strong SQL fundamentals**
* Shows real-world **business logic inside the database**
* Uses **procedures, views, and indexing** (rare in student projects)

---
