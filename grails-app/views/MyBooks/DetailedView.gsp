<%--
  Created by IntelliJ IDEA.
  User: nicolaskalousek
  Date: 2019-04-28
  Time: 16:21
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Details</title>
</head>

<body>
<form action="/MyBooks/changeBookDetails">
    <input type="hidden" name="id" value="${book.id}">
book title: <input type="text" name="title" value="${book.bookTitle}">
isbn: <input type="text" name="isbn" value="${book.isbn}">
rating: <input type="text" name="rating" value="${book.rating}">
    <input type="submit">
</form>
</body>
</html>