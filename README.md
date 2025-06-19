
# ☕ Coffee Shop Management System - SQLite Database

🔧 Developed by: **Gustavo Lopes**

---

## 📑 Table of Contents

1. [☕ Project Description](#1-project-description)  
2. [🏗️ Database Structure](#2-database-structure)  
3. [🔗 Relationships Between Tables](#3-relationships-between-tables)  
4. [🔥 Features Developed](#4-features-developed)  
5. [📊 Key SQL Queries](#5-key-sql-queries)  
6. [🚀 Future Improvements](#6-future-improvements)  
7. [🧠 How to Run This Project](#7-how-to-run-this-project)  
8. [✅ Final Considerations](#8-final-considerations)  

---

## 1. ☕ Project Description

This project is a **relational database system** built in **SQLite** to manage all operations of a fictional coffee shop.

The system handles:

- Product inventory  
- Customer registrations  
- Staff members  
- Suppliers  
- Orders and order items  
- Daily revenue tracking  

It includes **advanced SQL features** like **joins**, **views**, **triggers**, and **analytical queries**, providing full control over daily operations, customer behavior, and sales monitoring.

---

## 2. 🏗️ Database Structure

### 📂 Tables Created:

| Table | Purpose |
|---|---|
| `produtos` | Products available for sale |
| `clientes` | Customer data |
| `pedidos` | Order records |
| `itenspedidos` | Items within each order |
| `colaboradores` | Employees handling orders |
| `fornecedores` | Suppliers of products |
| `faturamentodiario` | Tracks total daily revenue |

---

## 3. 🔗 Relationships Between Tables

- **One client** can place **many orders** (1:N)
- **One order** can contain **many order items** (1:N)
- **Each item** relates to **one product**
- **Each product** can be supplied by **one supplier**
- **Each order** can be handled by **one employee**

---

## 4. 🔥 Features Developed

✅ **Database Schema with Referential Integrity**  
✅ **Full Data Insertion Scripts**  
✅ **Advanced SQL Queries**:  
- Joins  
- Group By  
- Having  
- Subqueries  
- Unions  

✅ **Views Implemented**:
- `viewclientes`
- `ViewValorTotalPedido`
- `ViewItensPedidoDetalhado`
- `ViewProdutosFornecedores`
- `ViewEstoqueBaixo`
- `ViewPedidosColaboradores`

✅ **Triggers**:
- Automatic update of **daily revenue** whenever a new order is inserted.

✅ **Python Application (`Python.py`)**:  
- Interactive terminal **menu**
- Dynamic queries: **Top selling products**, **Customers without orders**, **Monthly revenue**, **Filter orders by date**, **Products by category**, **View Data Preview**, etc.

---

## 5. 📊 Key SQL Queries

- 📌 Customers who placed orders in a given month  
- 📌 Customers without any orders  
- 📦 Unsold products  
- 💸 Products priced above the average  
- 💰 Total daily revenue  
- 📋 Detailed order items  
- 🔗 Product and supplier relationship  
- 👥 Orders linked to staff members  

---

## 6. 🚀 Future Improvements

- 🛒 Dynamic stock control  
- ❌ Order cancellation feature  
- 🎉 Promotional system  
- 📈 Category-based sales reports  
- 🗄️ Automatic database backup  
- 🖥️ Web dashboard for reporting  

---

## 7. 🧠 How to Run This Project

### ✅ Requirements:

- SQLite installed  
*(Or use a GUI like **DB Browser for SQLite** or **SQLiteStudio**)*  
- Python 3.x

---

### ✅ Execution Order:

1. Run: `criando_tabelas.sql` → (Creates tables)  
2. Run: `inserindo_dados.sql`, `inserindo_dados2.sql`, `inserindo_dados3.sql` → (Insert sample data)  
3. Run: `criando_views.sql` → (Create views)  
4. Run: `criando_trigger.sql` → (Create triggers)  
5. Explore the database with **Python.py**  

---

## 8. ✅ Final Considerations

This project was built to **consolidate SQL and database modeling skills**, applying:

- Relational design
- Data normalization
- Referential integrity
- Advanced SQL queries
- Automation with **views** and **triggers**
- Python + SQLite integration for dynamic data manipulation

It simulates a **real coffee shop operation**, from **order processing** to **financial control**.

---
