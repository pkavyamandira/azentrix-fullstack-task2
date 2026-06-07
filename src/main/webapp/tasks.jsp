<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>

<title>Task Management</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
    margin:0;
    padding:30px;
    min-height:100vh;

    background: linear-gradient(
        135deg,
        #0f172a,
        #1e293b,
        #334155
    );

    font-family: 'Segoe UI', sans-serif;
}

.page-header{
    background:white;
    padding:20px;
    border-radius:20px;
    box-shadow:0 4px 15px rgba(0,0,0,0.08);
    margin-bottom:25px;
}

.page-title{
    font-size:32px;
    font-weight:700;
    color:#1e293b;
}

.board-name{
    color:#2563eb;
    font-weight:600;
}

.card-box{
    border:none;
    border-radius:20px;
    box-shadow:0 8px 25px rgba(0,0,0,0.08);
    transition:0.3s;
}

.card-box:hover{
    transform:translateY(-3px);
}

.form-control,
.form-select{
    border-radius:12px;
}

.btn{
    border-radius:12px;
    padding:10px 18px;
    font-weight:600;
}

.btn-primary{
    background:#2563eb;
    border:none;
}

.btn-success{
    border:none;
}

.priority-high{
    background:#fee2e2;
    color:#dc2626;
    padding:6px 12px;
    border-radius:20px;
    font-weight:600;
}

.priority-medium{
    background:#fef3c7;
    color:#d97706;
    padding:6px 12px;
    border-radius:20px;
    font-weight:600;
}

.priority-low{
    background:#dcfce7;
    color:#16a34a;
    padding:6px 12px;
    border-radius:20px;
    font-weight:600;
}

.table{
    margin-top:15px;
}

.table thead{
    background:#2563eb;
    color:white;
}

.table thead th{
    border:none;
}

.table tbody tr:hover{
    background:#f8fafc;
}

.section-title{
    font-size:22px;
    font-weight:600;
    margin-bottom:20px;
}
.container-box{
    background:white;
    padding:30px;
    border-radius:15px;
    box-shadow:0 8px 25px rgba(0,0,0,0.25);
}

</style>

</head>

<body>

<div class="container mt-4">

<div class="page-header">

<div class="page-title">
TaskFlow Pro
</div>

<p class="text-muted mb-0">
Manage tasks, track progress and collaborate efficiently
</p>

</div>
<div class="card card-box p-4 mb-4">

<h3 class="section-title">
Board :
<span class="board-name">
${board.boardName}
</span>
</h3>
<form action="/saveTask" method="post">

<input type="hidden"
       name="boardId"
       value="${boardId}">



<div class="row">

<div class="col-md-6 mb-3">
<label>Task Title</label>
<input type="text"
name="title"
class="form-control"
required>
</div>

<div class="col-md-6 mb-3">
<label>Assignee</label>
<input type="text"
name="assignee"
class="form-control">
</div>

<div class="col-md-12 mb-3">
<label>Description</label>
<textarea
name="description"
class="form-control"></textarea>
</div>

<div class="col-md-4 mb-3">
<label>Due Date</label>
<input type="date"
name="dueDate"
class="form-control">
</div>

<div class="col-md-4 mb-3">
<label>Priority</label>
<select name="priority" class="form-select">
<option>LOW</option>
<option>MEDIUM</option>
<option>HIGH</option>
</select>
</div>

<div class="col-md-4 mb-3">
<label>Status</label>
<select name="status" class="form-select">
<option>TODO</option>
<option>IN_PROGRESS</option>
<option>DONE</option>
</select>
</div>

</div>

<button class="btn btn-primary">
 Create Task
</button>
<a href="/kanban/${boardId}" class="btn btn-success">
 View Kanban Board
</a>

</form>

</div>

<div class="card card-box p-4">

<h4 class="section-title">
 Task Overview
</h4>
<table class="table table-striped">

<thead>

<tr>
<th>ID</th>
<th>Title</th>
<th>Assignee</th>
<th>Priority</th>
<th>Status</th>
</tr>

</thead>

<tbody>

<c:forEach items="${tasks}" var="task">

<tr>

<td>${task.id}</td>

<td>${task.title}</td>

<td>${task.assignee}</td>

<td>

<span class="priority-${task.priority.toLowerCase()}">

${task.priority}

</span>

</td>

<td>

<c:choose>

<c:when test="${task.status=='DONE'}">

<span class="badge bg-success">

DONE

</span>

</c:when>

<c:otherwise>

<span class="badge bg-warning">

${task.status}

</span>

</c:otherwise>

</c:choose>

</td>
</tr>

</c:forEach>

</tbody>

</table>

</div>

<br>

<a href="/dashboard"
class="btn btn-secondary">
Back to Dashboard </a>

</div>

</body>
</html>
