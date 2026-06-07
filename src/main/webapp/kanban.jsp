<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>

<title>TaskFlow Pro - Kanban Board</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
background:#f4f7fc;
padding:20px;
}

.board-header{
margin-bottom:25px;
}

.board{
display:flex;
gap:20px;
}

.column{
flex:1;
border-radius:15px;
padding:15px;
min-height:600px;
}

.todo{
background:#e3f2fd;
}

.progress{
background:#fff3cd;
}

.done{
background:#d1e7dd;
}

.task-card{
background:white;
padding:15px;
margin-bottom:15px;
border-radius:12px;
cursor:move;
box-shadow:0px 3px 10px rgba(0,0,0,0.1);
}

.badge-high{
background:red;
color:white;
}

.badge-medium{
background:orange;
color:white;
}

.badge-low{
background:green;
color:white;
}

</style>

</head>

<body>

<div class="board-header d-flex justify-content-between">

<div>

<h2> TaskFlow Pro Kanban Board</h2>

<p>Drag tasks between columns to update status.</p>

</div>

<div>

<a href="/tasks" class="btn btn-primary">
Manage Tasks
</a>

<a href="/dashboard" class="btn btn-secondary">
Dashboard
</a>

</div>

</div>

<div class="board">

<!-- TODO -->

<div class="column todo" data-status="TODO">

<h4> TO DO</h4>

<c:forEach items="${todoTasks}" var="task">

<div class="task-card"
draggable="true"
data-id="${task.id}">

<h5>${task.title}</h5>

<p>${task.description}</p>

<div class="mb-2">

<span class="badge
${task.priority=='HIGH' ? 'badge-high' :
task.priority=='MEDIUM' ? 'badge-medium' :
'badge-low'}">

${task.priority}

</span>

</div>

<small>
 ${task.assignee}
</small>

<br>

<small>
 ${task.dueDate}
</small>

</div>

</c:forEach>

</div>

<!-- IN PROGRESS -->

<div class="column progress"
data-status="IN_PROGRESS">

<h4> IN PROGRESS</h4>

<c:forEach items="${progressTasks}" var="task">

<div class="task-card"
draggable="true"
data-id="${task.id}">

<h5>${task.title}</h5>

<p>${task.description}</p>

<div class="mb-2">

<span class="badge
${task.priority=='HIGH' ? 'badge-high' :
task.priority=='MEDIUM' ? 'badge-medium' :
'badge-low'}">

${task.priority}

</span>

</div>

<small>
 ${task.assignee}
</small>

<br>

<small>
 ${task.dueDate}
</small>

</div>

</c:forEach>

</div>

<!-- DONE -->

<div class="column done"
data-status="DONE">

<h4> DONE</h4>

<c:forEach items="${doneTasks}" var="task">

<div class="task-card"
draggable="true"
data-id="${task.id}">

<h5>${task.title}</h5>

<p>${task.description}</p>

<div class="mb-2">

<span class="badge
${task.priority=='HIGH' ? 'badge-high' :
task.priority=='MEDIUM' ? 'badge-medium' :
'badge-low'}">

${task.priority}

</span>

</div>

<small>
 ${task.assignee}
</small>

<br>

<small>
 ${task.dueDate}
</small>

</div>

</c:forEach>

</div>

</div>

<script>

let draggedCard = null;

document.querySelectorAll('.task-card')
.forEach(card => {

card.addEventListener('dragstart',function(){

draggedCard=this;

});

});

document.querySelectorAll('.column')
.forEach(column => {

column.addEventListener('dragover',
function(e){

e.preventDefault();

});

column.addEventListener('drop',
function(){

this.appendChild(draggedCard);

let taskId =
draggedCard.getAttribute('data-id');

let status =
this.getAttribute('data-status');

fetch('/updateStatus',{

method:'POST',

headers:{
'Content-Type':
'application/x-www-form-urlencoded'
},

body:'taskId='+
taskId+
'&status='+
status

});

});

});

/* Near Real-Time Updates */

setInterval(function(){

location.reload();

},5000);

</script>

</body>
</html>
