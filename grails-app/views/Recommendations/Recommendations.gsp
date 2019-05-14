<%--
  Created by IntelliJ IDEA.
  User: nicolaskalousek
  Date: 2019-04-27
  Time: 12:40
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Overview</title>
</head>

<body>
<a href="/logout/index">log out</a>
<nav>
    <ul>
    <li><a href="/MyBooks/index">My Books</a></li>
    <li><a href="#" class="active">Recommendation</a></li>
    </ul>
</nav>
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
       <td><a href="/Recommendations/addBook?isbn=${book.isbn}">add</a></td>
    </tr>
</g:each>

</table>

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