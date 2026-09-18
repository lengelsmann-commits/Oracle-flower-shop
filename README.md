# Le Jardin de Charlotte - Oracle Database

Oracle relational database designed and implemented for a florist shop to manage customers, orders, deliveries, bouquet compositions, and wholesaler stock purchases.

## Overview

This project involves designing the conceptual (MCD) and logical (MLD) data models for "Le Jardin de Charlotte" flower shop in Lyon, implementing the schema under Oracle SQL with integrity constraints, instantiating test scenarios, populating data from CSV files, and writing business analysis SQL queries.

## What I worked on

* Designing the MCD (Conceptual Data Model) and converting it to MLD and MPD
* Creating Oracle SQL tables with primary keys, foreign keys, and integrity constraints
* Writing a test scenario script (`insertion_donne_test.sql`) to validate relational integrity
* Populating the database from CSV files (`insertion_donne_csv.sql`)
* Writing analytical SQL queries (`requete.sql`) to evaluate sales, top delivery locations, flower usage, customer revenue, and invoices

## Technologies

* Oracle SQL
* SQL
* Relational Data Modeling (MCD / MLD / MPD)
* CSV

## Project structure

```text
sql/
    Contains SQL scripts for table creation (crea_table.sql), test scenarios, CSV imports, business queries (requete.sql), and the master script (full.sql).

data/
    CSV files containing data used to populate the database tables.

docs/
    Technical report detailing the MCD diagram, data dictionary, MLD, and query results.
```

## Context

This project was developed as part of the BUT Informatique coursework at Université Claude Bernard Lyon 1.
