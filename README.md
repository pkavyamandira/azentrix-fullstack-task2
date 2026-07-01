# TaskFlow Pro - Multi User Task Management System

## GitHub Repository

https://github.com/pkavyamandira/azentrix-fullstack-task2

---

## Overview

TaskFlow Pro is a full-stack task management web application inspired by Trello. It enables teams to create project boards, assign tasks, track project progress using a Kanban workflow, and collaborate efficiently through role-based access control.

The application provides separate functionalities for **Admin** and **Member** users while securely storing project data in a MySQL database.

---

## Features

* User Registration and Login
* Session-Based Authentication
* Board Creation and Management
* Task Creation and Assignment
* Due Date and Priority Management
* Kanban Board (To Do, In Progress, Done)
* Drag and Drop Task Movement
* Near Real-Time Updates using Polling
* Role-Based Access Control
* MySQL Database Integration

---

## User Roles

### Admin

Administrators can:

* Manage Users
* Create and Manage Boards
* Create and Assign Tasks
* View All Tasks
* Monitor Team Progress

### Member

Members can:

* View Only Their Assigned Tasks
* Update Task Status
* Mark Tasks as Completed
* Track Their Assigned Work

---

## Technology Stack

### Backend

* Java 21
* Spring Boot
* Spring Data JPA
* Hibernate

### Frontend

* JSP
* Bootstrap 5
* HTML
* CSS
* JavaScript

### Database

* MySQL

### Build Tool

* Maven

---

## Prerequisites

Before running the project, make sure you have:

* Java 21 or above
* MySQL Server
* Maven
* Eclipse IDE (or any Java IDE)

---

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/pkavyamandira/azentrix-fullstack-task2.git
```

### 2. Create the Database

```sql
CREATE DATABASE taskflow;
```

### 3. Configure Database Credentials

Update the following file:

```text
src/main/resources/application.properties
```

Example:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/taskflow
spring.datasource.username=root
spring.datasource.password=your_password
```

### 4. Run the Application

Run the Spring Boot application from Eclipse or your preferred IDE.

Open:

```text
http://localhost:8081
```

---

## Project Structure

* Controllers
* Services
* Repositories
* Entities
* JSP Views

---

## Screenshots

The **screenshots** folder contains:

* Login Page
* Registration Page
* Admin Dashboard
* Manage Users
* Boards Management
* Create Task
* Kanban Board
* Admin – All Tasks
* Member Dashboard
* Member Assigned Tasks

---

## Demo Video

Loom Recording:

https://www.loom.com/share/cdc599cf889d4746a735232dd20d67d9

---

## Author

**Kavya Mandira Pendyala**

B.Tech – Computer Science and Engineering (Cyber Security)

KL University
