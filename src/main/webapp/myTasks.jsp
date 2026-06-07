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
    padding:30px;
    border-radius:15px;
    box-shadow:0 4px 15px rgba(0,0,0,0.1);
}

.page-title{
    color:#0f172a;
    font-size:36px;
    font-weight:bold;
    margin-bottom:10px;
}

.subtitle{
    color:#64748b;
    margin-bottom:25px;
    font-size:15px;
}

table{
    width:100%;
    border-collapse:collapse;
}

th{
    background:#0f172a !important;
    color:white !important;
    padding:15px !important;
}

td{
    padding:15px !important;
    border-bottom:1px solid #e5e7eb;
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
    background:#22c55e;
    color:white;
    padding:5px 12px;
    border-radius:20px;
    font-size:13px;
}

.todo{
    background:#f59e0b;
    color:white;
    padding:5px 12px;
    border-radius:20px;
    font-size:13px;
}

.progress{
    background:#3b82f6;
    color:white;
    padding:5px 12px;
    border-radius:20px;
    font-size:13px;
}

.back-btn{
    background:#2563eb;
    color:white;
    padding:10px 18px;
    border-radius:8px;
    text-decoration:none;
    display:inline-block;
    margin-bottom:20px;
}

.back-btn:hover{
    color:white;
    background:#1d4ed8;
}

</style>

</head>

<body>

<div class="container">

<div class="task-card">

<h1 class="page-title">
 My Assigned Tasks
</h1>

<p class="subtitle">
View and manage tasks assigned to you.
</p>



<table class="table table-bordered">

<thead>

<tr>
<th>Title</th>
<th>Priority</th>
<th>Status</th>
<th>Action</th>
</tr>

</thead>

<tbody>

<c:forEach items="${tasks}" var="task">

<tr>

<td>${task.title}</td>

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
<span class="progress">IN PROGRESS</span>
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
<a href="/dashboard" class="back-btn">
 Back to Dashboard
</a>

</c:if>

</td>

</tr>

</c:forEach>

</tbody>

</table>

</div>

</div>

</body>

</html>