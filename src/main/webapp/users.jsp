<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>

<title>User Management - TaskFlow Pro</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
background:#f4f7fc;
}

.header{
background:#0d6efd;
color:white;
padding:20px;
border-radius:12px;
margin-bottom:20px;
}

.card-custom{
background:white;
border-radius:15px;
padding:20px;
box-shadow:0px 2px 10px rgba(0,0,0,0.1);
}

.table th{
background:#0d6efd;
color:white;
}

.role-admin{
background:#198754;
color:white;
padding:5px 10px;
border-radius:20px;
font-size:12px;
}

.role-member{
background:#6c757d;
color:white;
padding:5px 10px;
border-radius:20px;
font-size:12px;
}

</style>

</head>

<body>

<div class="container mt-4">

<div class="header">

<h2>User Management</h2>

<p class="mb-0">
Manage all registered users in TaskFlow Pro
</p>

</div>

<div class="card-custom">

<div class="d-flex justify-content-between mb-3">

<h4>Registered Users</h4>



</div>

<table class="table table-hover table-bordered align-middle">

<thead>

<tr>

<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Role</th>
<th>Action</th>

</tr>

</thead>

<tbody>

<c:forEach items="${users}" var="user">

<tr>

<td>${user.id}</td>

<td>${user.name}</td>

<td>${user.email}</td>

<td>

<c:choose>

<c:when test="${user.role=='ADMIN'}">

<span class="role-admin">

ADMIN

</span>

</c:when>

<c:otherwise>

<span class="role-member">

MEMBER

</span>

</c:otherwise>

</c:choose>

</td>

<td>

<a href="/deleteUser/${user.id}"
class="btn btn-danger btn-sm"
onclick="return confirm('Delete this user?')">

 Delete



</td>

</tr>

</c:forEach>

</tbody>

</table>
</a>
<a href="/dashboard"
class="btn btn-primary">

 Dashboard

</a>

</div>

</div>

</body>
</html>
