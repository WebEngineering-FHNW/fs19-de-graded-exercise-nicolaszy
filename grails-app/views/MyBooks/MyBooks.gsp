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

<nav>
<li><a href="#" class="active">My Books</a></li>
    <li><a href="#">Recommendation</a></li>
</nav>
<h2>My Books</h2>

<table>

    <tr>
    <th>book title</th>
    <th>isbn</th>
    <th>rating</th>
%{--    <th>edit</th>--}%
    </tr>

<g:each in="${books}" var="book" status="i">
    <tr>
        <td><a href="/MyBooks/details?id=${book.id}">${book.bookTitle}</a></td>
        <td><a href="/MyBooks/details?id=${book.id}">${book.isbn}</a></td>
        <td><a href="/MyBooks/details?id=${book.id}">${book.rating}</a></td>
%{--        <td><a href="/book/edit/${book.id}">edit</a></td>--}%
    </tr>
</g:each>

</table>

<a href="/MyBooks/add">add a book</a>
</body>
</html>