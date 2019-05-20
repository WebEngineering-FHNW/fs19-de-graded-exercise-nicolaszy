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
    <link href="https://fonts.googleapis.com/css?family=Karla:700" rel="stylesheet">
    <asset:stylesheet src="bookStyle.css"/>
</head>

<body>
<button onclick="location.href = 'index'">My Books</button>
<button onclick="location.href = '/Recommendations/index'">Recommendations</button>
</br>
<img id="backdrop" style="float: left; width: 34%; margin-left: 8%; margin-right: 8%; margin-top: 2%; clear: both;">
<form action="/MyBooks/changeBookDetails" style="padding-right: 50px; padding-top: 10px; width: calc(50% - 50px); float:right;">
    <input type="hidden" name="id" value="${book.id}">
    <input type="hidden" name="isbn" id="isbn" value="${book.isbn}">
    <h1>${book.bookTitle}</h1>
    <p style="padding-top: 2px;">ISBN: ${book.isbn}</p>
    <p>Rating: ${book.rating}</p>
    <p>Genres: <span id="genres"></span></p>
    <p>Description: <span id="description"></span></p>
    <p>Author: <span id="author">${book.author}</span></p>
</form>


<style>
    div{
        padding-bottom: 10px;
    }
</style>

</body>
</html>