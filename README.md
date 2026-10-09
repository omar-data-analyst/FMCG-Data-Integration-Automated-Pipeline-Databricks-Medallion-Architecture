# 🛒 FMCG Enterprise Data Warehouse & Automated ETL Pipeline

<img width="1584" height="672" alt="planer" src="https://github.com/user-attachments/assets/de95c7c2-0043-498c-be25-eacc834a0816" />

> **An End-to-End Medallion Architecture Data Pipeline, Dynamic Analytics Engine, and Conversational AI Agent built on Databricks, PySpark, and Delta Lake.**

---

## 📌 Badges

![PySpark](https://img.shields.io/badge/PySpark-3.x-orange?style=for-the-badge&logo=apachespark)
![Databricks](https://img.shields.io/badge/Databricks-Unified_Analytics-red?style=for-the-badge&logo=databricks)
![SQL](https://img.shields.io/badge/SQL-ANSI-blue?style=for-the-badge&logo=postgresql)
![Delta Tables](https://img.shields.io/badge/Delta_Lake-Medallion-blueviolet?style=for-the-badge&logo=delta)
![Medallion Architecture](https://img.shields.io/badge/Architecture-Medallion-emerald?style=for-the-badge)

---
## My Account on Linked In:
![LinkedIn](https://img.shields.io/badge/LinkedIn-Profile-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)

https://www.linkedin.com/in/omar-hussein-analyst-663019400
---

## 📜 Project Overview

This project implements a scalable, enterprise-grade Data Warehouse and automated ETL ingestion pipeline for Fast-Moving Consumer Goods (FMCG) sales, product cataloging, and customer intelligence. 

Built on **Databricks** using **PySpark** and **Delta Lake**, the platform seamlessly consolidates legacy enterprise data from the parent company (**Atlikon**) with newly acquired data from its subsidiary (**Sports Bar**).

### 🚀 Core Engineering Capabilities
1. **Data Cleansing & Standardization:** Robust cleaning pipelines that handle messy date formats (`dd/MM/yyyy`, `yyyy-MM-d`, textual names), string normalization, category typo corrections, surrogate/hash primary key generation (SHA-256), and null-value imputations.
2. **Automated Pipeline Orchestration:** Multi-layered batch pipelines with full schema evolution, Change Data Feed (CDF) tracking, dynamic notebook widgets, deduplication logic, and automated staging cleanup (`TRUNCATE`).
3. **Enterprise Data Warehouse (EDW) Construction:** Production-ready dimensional model adhering to the **Medallion Architecture** (Bronze $\rightarrow$ Silver $\rightarrow$ Gold), feeding consolidated analytical views for enterprise reporting and AI-driven conversational querying via **Databricks Genie Agent**.

---

## 🏛️ System Architecture & Pipeline Diagrams

### 1. General Pipeline Diagram (Full Load)
The foundational ETL pipeline ingests raw multi-source CSV files, cleanses them through the Silver layer, and executes atomic Delta `MERGE` (Upsert) operations into the Gold Star Schema.

<img width="1022" height="512" alt="General Pipline Daigram (Full Load)" src="https://github.com/user-attachments/assets/b28e4237-65eb-4836-bb65-d8132689e3dc" />

---

### 2. Incremental Load Pipeline Diagram (Orders Data)
The incremental pipeline ingests daily order batches into a dedicated Staging Bronze layer, validates data quality metrics, updates Silver staging, automatically flushes staging buffers, and performs additive aggregation into the production Gold Fact tables.

<img width="1358" height="514" alt="Increamental Load Order Data" src="https://github.com/user-attachments/assets/df51d07d-3107-4f8c-86ce-582df76024ea" />

---

### 3. Notebook Execution & Sequential Task Workflow
Visual workflow illustrating sequential multi-notebook orchestration, parameter passing, and dependency scheduling over defined execution windows.

<img width="1205" height="522" alt="Automated Pipline" src="https://github.com/user-attachments/assets/013174f6-8013-4750-9bd7-90b34132984c" />

---

## 📐 Dimensional Data Model (Gold Layer ERD)

The Gold layer is structured into an enterprise Star Schema linking central Fact tables to parent company (**Atlikon**) dimensions alongside integrated child entity attributes (**Sports Bar**).

![Gold Layer Schema Diagram](docs/images/gold_layer_schema.png)

### Model Structure Highlights:
* **Fact Tables:** `gold.fact_orders` (Monthly aggregated sales grain) and `gold.sb_fact_orders` (Granular transactional grain).
* **Parent Dimensions (Atlikon):** `gold.dim_products`, `gold.dim_customers`, `gold.dim_gross_price`, and `gold.dim_date`.
* **Analytical View:** `fmcg.gold.vw_fact_orders_enriched` denormalizes all surrounding dimensions for instant BI consumption.

---

## 🤖 AI-Powered Data Interaction (Databricks Genie Agent)

To enable self-service analytics, the consolidated Gold analytical dataset was unified into a single Gold view (`vw_fact_orders_enriched`) and connected directly to **Databricks Genie Agent**. 

Users can ask complex business questions in natural language and receive real-time answers backed by exact numbers or dynamically rendered interactive visualizations.

### 📊 Genie Agent Highlights
1. **Natural Language Analytics:** Converts conversational text queries into accurate PySpark/SQL transformations.
2. **Instant Visualization:** Automatically generates bar charts, trend lines, and KPI cards directly within the chat interface.
3. **Unified Gold Context:** Queries across combined product, customer, pricing, and temporal metrics simultaneously.

#### Genie Agent Interface & Sample Outputs

<img width="1366" height="513" alt="Genie Agent 2" src="https://github.com/user-attachments/assets/223270d4-b087-4f03-adf7-ee1d0893b406" />

<img width="1366" height="608" alt="Genie Agent 3" src="https://github.com/user-attachments/assets/681ea656-fdd1-405e-8619-ff9c33012579" />

<img width="1357" height="610" alt="Genie Agent 4" src="https://github.com/user-attachments/assets/3750b91a-1eab-4c43-af6c-56961d828000" />

> 💡 **Live Genie Agent Access Notice:**  
> The live link to the Databricks Genie Agent room is tied to temporary workspace cloud instance sessions. Because free trial community instances automatically shut down after inactivity, the agent instance cannot remain permanently online via a static URL. However, the complete model definition and underlying SQL/PySpark infrastructure remain fully reproducible using the codebase provided in this repository.

---

## 💻 Code Structure & Implementation Examples

The codebase is organized into modular PySpark notebooks designed for parameterization and automated execution.

<img width="1023" height="402" alt="Code 1" src="https://github.com/user-attachments/assets/bc4809ab-f275-4489-8e21-13cd32481a6c" />

<img width="1064" height="459" alt="Code 2" src="https://github.com/user-attachments/assets/73a3d340-95bd-425d-a8cb-39783fdb52cb" />

<img width="1059" height="403" alt="Code 3" src="https://github.com/user-attachments/assets/26c894b5-210b-4574-a019-ca6412170cd0" />

---

## 🛠️ Getting Started & Usage Guide

### Prerequisites
* **Databricks Runtime:** Version 11.3 LTS or higher (Spark 3.x, Delta Lake 2.x).
* **Archive Utility:** WinRAR / 7-Zip / `unrar` (to extract raw dataset files).

### Installation & Execution Steps

1- **Upload Data to Databricks Storage:**
Upload the extracted .csv files (customers.csv, products.csv, gross_price.csv, and orders/ directory) into your Databricks Unity Catalog Volume or DBFS path (e.g., /Volumes/fmcg/default/landing/).

2- **Execute Pipelines:**
Run the notebooks in sequential order as defined in the task workflow:

```
1) 0_Setup\
      ├── dim_date_table_creation.ipynb
      └── Setup_Catalogs.ipynb
    
2) 1_chilled_customers_processing.py

3) 2_products_data_processing.py

4) 3_gross_price_data_processing.py

5) full_load_fact_sales_processing.py / Incremental_load_fact_sales_data_processing.py

6) 6_create_vw_fact_orders_enriched.sql

```

3- **For Trying Genie Agent:**

- In the Databricks sidebar, go to the "SQL" section and select "Genie Agent".

- Click `+ New` and in the selection window, navigate to `fmcg` -> `gold` -> `vw_fact_orders_enriched`.
