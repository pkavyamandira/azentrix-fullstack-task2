<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>

<h1 style="
color:#0f172a;
margin-bottom:25px;
font-weight:bold;">

 Project Boards

</h1>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background:#f1f5f9;
    font-family:'Segoe UI',sans-serif;
    padding:30px;
}

body{
min-height:100vh;s
background: linear-gradient(
135deg,
#667eea 0%,
#764ba2 100%
);
padding-bottom:40px;
}

.board-card{
background:rgba(255,255,255,0.95);
border:none;
border-radius:20px;
box-shadow:0 8px 32px rgba(0,0,0,0.15);
transition:0.3s;
backdrop-filter: blur(8px);
}

.board-card:hover{
transform:translateY(-5px);
}

.header{
background:rgba(255,255,255,0.9);
padding:25px;
border-radius:20px;
margin-bottom:25px;
backdrop-filter: blur(8px);
}
.main-container{
    background:white;
    padding:30px;
    border-radius:15px;
    box-shadow:0 4px 15px rgba(0,0,0,0.1);
}
</style>

</head>

<body>

<div class="container mt-4">

<div class="header">

<h2> TaskFlow Pro Boards</h2>
<p>
Manage projects, collaborate with teams,
and track progress efficiently.
</p>
</div>
<div class="card create-card p-4 mb-4">

<form action="/saveBoard" method="post">

<div class="row">

<div class="col-md-9">

<input type="text"
name="boardName"
class="form-control"
placeholder="Enter Board Name"
required>

</div>

<div class="col-md-3">

<button class="btn btn-primary w-100">
Create Board
</button>

</div>

</div>

</form>

</div>

<div class="row">

<c:forEach items="${boards}" var="board">

<div class="col-md-4 mb-4">

<div class="card board-card p-4">

<h4>${board.boardName}</h4>

<p>Workspace for managing tasks.</p>

<div>

<a href="/tasks/${board.id}"
class="btn btn-success btn-sm">
Open
</a>

<a href="/deleteBoard/${board.id}"
class="btn btn-danger btn-sm">
Delete </a>

</div>

</div>

</div>

</c:forEach>

</div>

<a href="/dashboard"
class="btn btn-secondary">
Back to Dashboard </a>

</div>

</body>
</html>
