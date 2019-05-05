<%--
  Created by IntelliJ IDEA.
  User: nicolaskalousek
  Date: 2019-04-28
  Time: 16:21
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>Details</title>
</head>

<body>
<form action="/MyBooks/changeBookDetails">
    <input type="hidden" name="id" value="${book.id}">
book title: <input type="text" name="title" id="title" minlength="2" required="true" value="${book.bookTitle}">
</br>
isbn: <input type="text" name="isbn" id="isbn" minlength="10" maxlength="13" required="true" aria-required="true" aria-errormessage="test" value="${book.isbn}">
</br>
rating: <input type="range" name="rating" id="rating" min="1" max="5" step="1" required="true" value="${book.rating}">
    <input type="submit">
</form>

</body>
</html>