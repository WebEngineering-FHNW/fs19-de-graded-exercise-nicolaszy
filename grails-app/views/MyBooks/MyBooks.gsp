<%--
  Created by IntelliJ IDEA.
  User: nicolaskalousek
  Date: 2019-04-27
  Time: 12:40
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>

<nav>
<li><a href="#" class="active">My Books</a></li>
    <li><a href="#">Recommendation</a></li>
</nav>
<h2>My Books</h2>

<g:each in="${books}" var="book" status="i">
    <pre><p>${book.bookTitle}    <a href="/book/edit/${book.id}">edit</a></p></pre>
</g:each>
<pre><a href="/book/create">add a book</a></pre>
</body>
</html>