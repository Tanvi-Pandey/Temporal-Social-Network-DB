#  Temporal Social Network Database System
A relational database system that demonstrates **temporal data management** by preserving the complete history of records instead of overwriting them. The project models a social networking platform where user profiles, posts, friendships, and interactions maintain historical versions, enabling the database to reconstruct the state of the system at any point in time.

>**Note:** This repository contains the implementation of a **group academic project** developed as part of a Database Management Systems (DBMS) course. The repository documents the complete database design, implementation, and SQL scripts used in the project.

## 📖 Overview
Traditional relational databases typically overwrite records whenever updates occur, resulting in the loss of historical information. While this approach is sufficient for many applications, it is unsuitable for systems that require auditability, compliance, or historical analysis.

This project implements a **Temporal Database** that stores multiple versions of records using validity timestamps. Instead of replacing data, every significant modification creates a new historical version, allowing users to query the database as it existed at any specific moment.

The system is demonstrated using a social networking platform where users can:

* Create and edit posts
* Update profile information
* Form and remove friendships
* React to posts
* Retrieve historical versions of data through temporal queries

## ✨ Features
* ⏳ Temporal versioning of database records
* 📝 Complete post edit history
* 👤 User profile history tracking
* 🤝 Friendship lifecycle management
* 📅 Point-in-time (temporal) SQL queries
* ⚙️ Automatic version creation using database triggers
* 🔒 Data integrity through constraints and transactions
* 🚀 Indexed temporal queries for improved performance

## 🗄️ Database Design

### Core Entities
* Users
* UserHistory
* Posts
* PostVersions
* Friendships
* Reactions

The database is designed using normalization principles and maintains both current and historical records through temporal attributes.

## 🛠️ Technologies Used
* SQL
* MySQL 8.0
* Relational Database Design
* ER Modeling
* Database Triggers
* Stored Procedures
* Views
* Indexing

## 📂 Project Structure
temporal-social-network-db/
│
├── README.md
├── schema.sql
├── constraints.sql
├── sample_data.sql
├── triggers.sql
├── procedures.sql
├── views.sql
├── indexes.sql
├── queries.sql
└── report/
    ├── ER_Diagram.png
    ├── Relational_Schema.png
    └── Project_Report.pdf

## 📌 Concepts Demonstrated
* Entity-Relationship Modeling
* Relational Schema Design
* Functional Dependencies
* BCNF Normalization
* Primary & Foreign Keys
* CHECK & UNIQUE Constraints
* Triggers
* Stored Procedures
* Transactions
* Views
* Indexing
* Temporal SQL Queries

## 📈 Example Use Cases
This design can be applied to systems that require complete historical data, including:

* Banking and financial systems
* Healthcare record management
* Audit and compliance systems
* Legal document versioning
* Enterprise information systems

## 🚀 Future Enhancements
* Graph-based social network analysis
* Advanced temporal analytics
* Timeline visualization of historical data
* Integration with NoSQL databases for hybrid storage
* REST API for application integration

## 👥 Team Project
This project was developed collaboratively as part of a **Database Management Systems (DBMS)** group project. Each team member contributed to different stages of the project, including database design, schema development, SQL implementation, documentation, testing, and validation.

## 📄 License
This project is intended for educational purposes.
