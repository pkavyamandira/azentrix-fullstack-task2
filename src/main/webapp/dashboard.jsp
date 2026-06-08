<%@ page contentType="text/html;charset=UTF-8" %>
<%
com.azentrix.taskflowpro.entity.User user =
(com.azentrix.taskflowpro.entity.User)
session.getAttribute("loggedUser");
%>
<!DOCTYPE html>

<html>
<head>

<title>TaskFlow Pro Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
background:#f5f7fb;
}

.sidebar{
height:100vh;
background:#212529;
color:white;
padding:20px;
}

.sidebar h3{
margin-bottom:30px;
}

.sidebar a{
display:block;
color:white;
text-decoration:none;
padding:12px 15px;
margin:8px 0;
border-radius:8px;
font-size:16px;
}
.sidebar a:hover{
background:#343a40;
}

.card-box{
border:none;
border-radius:15px;
box-shadow:0px 4px 15px rgba(0,0,0,0.1);
}

.header{
padding:20px;
background:white;
border-radius:15px;
margin-bottom:20px;
}

</style>

</head>

<body>

<div class="container-fluid">

<div class="row">

<div class="col-md-2 sidebar">

<h3>TaskFlow Pro</h3>

<a href="/dashboard">Dashboard</a>

<% if(user != null &&
"ADMIN".equals(user.getRole())) { %>
<a href="/users">Manage Users</a>
<a href="/boards">Boards</a>

<% } %>

<% if(user != null &&
"ADMIN".equals(user.getRole())) { %>

<a href="/myTasks">All Tasks</a>

<% } else { %>

<a href="/myTasks">My Assigned Tasks</a>

<% } %>

<a href="/logout">
Logout
</a>
</div>

<div class="col-md-10 p-4">

<div class="header">

<h2>Welcome to TaskFlow Pro</h2>

<p>Manage projects, collaborate with teams and track progress efficiently.</p>

</div>

<div class="row">

<div class="col-md-4">

<div class="card card-box p-4">

<h5>Total Boards</h5>



<p>Create and manage multiple boards.</p>

</div>

</div>

<div class="col-md-4">

<div class="card card-box p-4">

<h5>Tasks</h5>



<p>Track task progress easily.</p>

</div>

</div>

<div class="col-md-4">

<div class="card card-box p-4">

<h5>Team Collaboration</h5>


<p>Work together in real-time.</p>
<h4>Logged User: <%= user.getEmail() %></h4>
<h4>Role: <%= user.getRole() %></h4>
</div>

</div>

</div>

<div class="mt-4">

<div class="card card-box p-4">

<h4>Quick Actions</h4>

<% if(user != null &&
"ADMIN".equals(user.getRole())) { %>

<a href="/boards" class="btn btn-primary m-1">
Manage Boards
</a>

<a href="/boards" class="btn btn-warning m-1">
Open Boards
</a>

<% } %>

<% if(user != null &&
"ADMIN".equals(user.getRole())) { %>

<a href="/myTasks" class="btn btn-info m-1">
All Tasks
</a>

<% } else { %>

<a href="/myTasks" class="btn btn-info m-1">
My Assigned Tasks
</a>

<% } %>

</div>

</div>

</div>

</div>

</div>


</body>
</html>
