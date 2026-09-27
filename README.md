# Netflix Data Analysis

An end-to-end data analysis project using **Python, MySQL, and Power BI** to clean, analyze, and visualize Netflix movies and TV shows.

## Project Overview

This project analyzes a dataset of **8,807 Netflix titles** to understand content distribution, genres, ratings, countries, release trends, movie durations, and other characteristics of the Netflix catalog.

The project follows a multi-stage data analysis workflow:

**Raw Dataset → Data Cleaning & Transformation → Exploratory Data Analysis → SQL Analysis → Power BI Dashboard**

## Tech Stack

* **Python** — Data cleaning, transformation, and exploratory analysis
* **Pandas** — Data manipulation and preprocessing
* **NumPy** — Numerical operations
* **Matplotlib & Seaborn** — Data visualization
* **MySQL** — Structured data analysis using SQL
* **Power BI** — Interactive dashboard and visualization
* **Jupyter Notebook** — Python-based analysis environment

## Dataset

The project uses the Netflix Titles dataset containing information about movies and TV shows.

### Original Dataset

* **Rows:** 8,807
* **Columns:** 12

Key fields include:

* Show ID
* Type
* Title
* Director
* Cast
* Country
* Date Added
* Release Year
* Rating
* Duration
* Listed In
* Description

## Data Cleaning & Transformation

The dataset was cleaned and transformed using Python and Pandas.

Major preprocessing steps include:

* Handling missing values in categorical columns
* Identifying and correcting incorrectly placed duration values in the rating column
* Converting `date_added` into a proper date format
* Extracting year and month information from `date_added`
* Separating movie/TV duration into numeric value and unit
* Standardizing duration units
* Creating a normalized genre dataset by splitting multi-valued genre entries
* Preparing cleaned CSV files for further analysis

The main cleaned dataset contains **8,807 rows and 17 columns**.

A separate genre dataset was also created to represent the relationship between titles and their individual genres.

## Exploratory Data Analysis

Python-based EDA was performed to examine:

* Movies vs. TV Shows distribution
* Titles added to Netflix over time
* Most common genres
* Content distribution by country
* Rating distribution
* Movie duration statistics
* Content distribution by release year

Visualizations were created using **Matplotlib and Seaborn**.

## SQL Analysis

MySQL was used to perform structured analysis on the cleaned Netflix dataset.

The project contains **10 SQL analysis queries** covering areas such as:

* Movies vs. TV Shows
* Titles added by year
* Country distribution
* Rating distribution
* Ratings by content type
* Genre/category analysis
* Longest movies
* Cast size
* Directors with the most titles
* Difference between release year and Netflix addition year

The SQL queries demonstrate the use of aggregation, filtering, grouping, sorting, string functions, and calculated fields.

## Power BI Dashboard

The final analysis was visualized using Power BI.

The dashboard includes:

* KPI cards
* Movies vs. TV Shows distribution
* Ratings analysis
* Genre analysis
* Release-year trends
* Country distribution
* Additional summary metrics

The dashboard provides an interactive overview of the Netflix catalog and its major content trends.

## Project Structure

```text
Netflix-Data-Analysis/
│
├── Dashboard/
│   └── Netflix_Analysis_Dashboard.pbix
│
├── Netflix_SQL/
│   └── netflix_analysis_10_queries.sql
│
├── EDA.ipynb
├── netflix_analysis.ipynb
│
├── netflix_titles.csv
├── netflix_cleaned.csv
├── netflix_genres.csv
│
└── .gitignore
```

## Workflow

```text
Netflix Titles Dataset
        │
        ▼
Python / Pandas
        │
        ├── Data Cleaning
        ├── Transformation
        └── Feature Engineering
        │
        ▼
Cleaned CSV Data
        │
        ├──────────────► Exploratory Data Analysis
        │                 Python + Matplotlib + Seaborn
        │
        ▼
MySQL
        │
        └── 10 SQL Analysis Queries
        │
        ▼
Power BI
        │
        └── Interactive Dashboard
```

## Key Outcomes

The project demonstrates an end-to-end approach to working with a real-world dataset, from raw data preparation through analytical querying and dashboard development.

It provides practical experience with:

* Data cleaning
* Data transformation
* Feature engineering
* Exploratory data analysis
* Relational data analysis
* SQL querying
* Data visualization
* Dashboard development
* Combining multiple data-analysis tools into one workflow

## How to Use

### Python

Open the notebooks using Jupyter Notebook or JupyterLab:

```bash
jupyter notebook
```

Run:

* `netflix_analysis.ipynb` for data cleaning and transformation
* `EDA.ipynb` for exploratory analysis

### SQL

Open:

```text
Netflix_SQL/netflix_analysis_10_queries.sql
```

in MySQL Workbench or another MySQL-compatible environment.

### Power BI

Open:

```text
Dashboard/Netflix_Analysis_Dashboard.pbix
```

using Power BI Desktop to explore the dashboard.

## Files Generated

| File                              | Description                       |
| --------------------------------- | --------------------------------- |
| `netflix_titles.csv`              | Original Netflix dataset          |
| `netflix_cleaned.csv`             | Cleaned and transformed dataset   |
| `netflix_genres.csv`              | Normalized title-to-genre dataset |
| `netflix_analysis.ipynb`          | Data cleaning and transformation  |
| `EDA.ipynb`                       | Exploratory data analysis         |
| `netflix_analysis_10_queries.sql` | SQL analysis queries              |
| `Netflix_Analysis_Dashboard.pbix` | Power BI dashboard                |
