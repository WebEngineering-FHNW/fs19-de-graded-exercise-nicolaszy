<%--
  Created by IntelliJ IDEA.
  User: nicolaskalousek
  Date: 2019-04-27
  Time: 12:40
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Book Overview</title>
    <link href="https://fonts.googleapis.com/css?family=Karla:700" rel="stylesheet">
    <asset:stylesheet src="bookStyle.css"/>
</head>

<body>
<button id="logout" onclick="location.href = '/logout/index'">log out</button>
<nav>
    <ul>
    <li><a href="#" class="active">My Books</a></li>
    <li><a href="/Recommendations/index">Recommendation</a></li>
    </ul>
</nav>

<div id="main">

<h2>My Books</h2>

<table>

    <tr align="left">
    <th>book title</th>
    <th>isbn</th>
    <th>rating</th>
    <th>edit</th>
    </tr>

<g:each in="${books}" var="book" status="i">
    <tr>
        <td><a href="/MyBooks/details?id=${book.id}">${book.bookTitle}</a></td>
        <td><a href="/MyBooks/details?id=${book.id}">${book.isbn}</a></td>
        <td><a href="/MyBooks/details?id=${book.id}">${book.rating}</a></td>
       <td><a class="edit" href="/MyBooks/edit?id=${book.id}">edit</a></td>
    </tr>
</g:each>

</table>

<a id="addBook" href="/MyBooks/add">add a book</a>
</div>

</body>
<style>
    td,th{
        padding-right: 20px;
        padding-bottom: 5px;
    }
    #addBook{
        padding-left: 3px;
    }
</style>
</html>