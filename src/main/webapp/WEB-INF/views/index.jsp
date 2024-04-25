<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Todo List</title>
</head>
<body>

<h1>Todo List</h1>

<form action="/todo-app/add" method="post">
    <input type="text" name="text" placeholder="Enter todo">
    <button type="submit">Add Todo</button>
    <c:out value="${todos}" /> 
</form>

   <c:if test="${not empty todos}">
    <ul>
        <c:forEach var="todo" items="${todos}" varStatus="status">
            <li>
                <form action="/todo-app/edit" method="post">
                    <input type="hidden" name="index" value="${status.index}">
                    <input type="text" name="newText" value="${todo.text}">
                    <button type="submit">Update</button>
                </form>
                <form action="/todo-app/delete" method="post">
                    <input type="hidden" name="index" value="${status.index}">
                    <button type="submit">Delete</button>
                </form>
            </li>
        </c:forEach>
    </ul>
</c:if>
<c:if test="${empty todos}">
    <p>No todos yet.</p>
</c:if>
   

</body>
</html>

