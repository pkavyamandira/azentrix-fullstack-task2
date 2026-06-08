<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>

<title>My Tasks</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>

body{
    background:#f1f5f9;
    font-family:'Segoe UI',sans-serif;
    padding:30px;
}

.container{
    max-width:1200px;
    margin:auto;
}

.task-card{
    background:white;
    padding:35px;
    border-radius:20px;
    box-shadow:0 8px 25px rgba(0,0,0,0.08);
}

.admin-title{
    color:#2563eb;
    font-size:42px;
    font-weight:800;
    text-transform:uppercase;
    letter-spacing:1px;
    border-left:6px solid #2563eb;
    padding-left:15px;
    margin-bottom:10px;
}

.page-title{
    color:#0f172a;
    font-size:38px;
    font-weight:800;
    margin-bottom:10px;
}

.subtitle{
    color:#64748b;
    margin-bottom:25px;
    font-size:15px;
}

.table{
    border-radius:12px;
    overflow:hidden;
}

th{
    background:#0f172a !important;
    color:white !important;
    padding:15px !important;
}

td{
    padding:15px !important;
    vertical-align:middle;
}

tr:hover{
    background:#f8fafc;
}

.complete-btn{
    background:#22c55e;
    color:white;
    padding:8px 15px;
    border-radius:8px;
    text-decoration:none;
    font-weight:600;
}

.complete-btn:hover{
    background:#16a34a;
    color:white;
}

.high{
    color:#ef4444;
    font-weight:bold;
}

.medium{
    color:#f59e0b;
    font-weight:bold;
}

.low{
    color:#22c55e;
    font-weight:bold;
}

.done{
    display:inline-block;
    background:#22c55e;
    color:white;
    padding:6px 14px;
    border-radius:20px;
    font-size:12px;
    font-weight:600;
}

.todo{
    display:inline-block;
    background:#f59e0b;
    color:white;
    padding:6px 14px;
    border-radius:20px;
    font-size:12px;
    font-weight:600;
}

.progress-status{
    display:inline-block;
    background:#3b82f6;
    color:white;
    padding:6px 14px;
    border-radius:20px;
    font-size:12px;
    font-weight:600;
}

</style>

</head>

<body>

<div class="container">

<div class="task-card">

<%
com.azentrix.taskflowpro.entity.User user =
(com.azentrix.taskflowpro.entity.User)
session.getAttribute("loggedUser");
%>

<% if(user != null &&
"ADMIN".equals(user.getRole())) { %>

<h1 class="admin-title">
 ALL TASKS
</h1>

<p class="subtitle">
View and manage all tasks across the organization.
</p>

<div class="alert alert-primary">
Total Tasks :
<strong>${tasks.size()}</strong>
</div>

<% } else { %>

<h1 class="page-title">
My Assigned Tasks
</h1>

<p class="subtitle">
View and manage tasks assigned to you.
</p>

<div class="alert alert-info">
My Assigned Tasks :
<strong>${tasks.size()}</strong>
</div>

<% } %>

<table class="table table-bordered">

<thead>

<tr>
<th>Task Title</th>
<th>Assignee</th>
<th>Priority</th>
<th>Status</th>
<th>Action</th>
</tr>

</thead>

<tbody>

<c:forEach items="${tasks}" var="task">

<tr>

<td>${task.title}</td>

<td>${task.assignee}</td>

<td>

<c:choose>

<c:when test="${task.priority=='HIGH'}">
<span class="high">HIGH</span>
</c:when>

<c:when test="${task.priority=='MEDIUM'}">
<span class="medium">MEDIUM</span>
</c:when>

<c:otherwise>
<span class="low">LOW</span>
</c:otherwise>

</c:choose>

</td>

<td>

<c:choose>

<c:when test="${task.status=='DONE'}">
<span class="done">DONE</span>
</c:when>

<c:when test="${task.status=='IN_PROGRESS'}">
<span class="progress-status">
IN PROGRESS
</span>
</c:when>

<c:otherwise>
<span class="todo">TODO</span>
</c:otherwise>

</c:choose>

</td>

<td>

<c:if test="${task.status!='DONE'}">

<a href="/completeTask/${task.id}"
class="complete-btn">

Mark Complete

</a>

</c:if>

<c:if test="${task.status=='DONE'}">

<span class="done">
Completed
</span>

</c:if>

</td>

</tr>

</c:forEach>

</tbody>

</table>

<div class="mt-4 text-center">

<a href="/dashboard"
class="btn btn-primary px-4">

Back To Dashboard

</a>

</div>

</div>

</div>

</body>

</html>