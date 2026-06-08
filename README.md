# TaskFlow Pro - Multi User Task Management System

## Overview

TaskFlow Pro is a full-stack web application inspired by Trello that helps teams organize projects, assign tasks, and track progress efficiently.

The system supports multiple users, board management, task assignment, Kanban workflow management, and role-based access control.

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

Admins have full access to the system and can:

* Manage Users
* Create and Manage Boards
* Create and Assign Tasks
* View All Tasks
* Monitor Team Progress

### Member

Members can:

* View Assigned Tasks
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

## Setup Instructions

### 1. Clone Repository

```bash
git clone <[repository-url](https://github.com/pkavyamandira/azentrix-fullstack-task2.git)>
```

### 2. Create Database

```sql
CREATE DATABASE taskflow;
```

### 3. Configure Database

Update database credentials in:

```text
src/main/resources/application.properties
```

Example:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/taskflow
spring.datasource.username=root
spring.datasource.password=your_password
```

### 4. Run Application

Start the Spring Boot application and open:

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

The project screenshots are available in the **screenshots** folder.

Included Screenshots:

* Login Page
* Registration Page
* Admin Dashboard
* Manage Users
* Boards Management
* Create Task
* Kanban Board
* Admin - All Tasks
* Member Dashboard
* Member Assigned Tasks

---

## Demo Video

Loom Recording:

https://www.loom.com/share/cdc599cf889d4746a735232dd20d67d9

---

## Author

**Kavya Mandira Pendyala**
