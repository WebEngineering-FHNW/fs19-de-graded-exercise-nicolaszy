<%--
  Created by IntelliJ IDEA.
  User: nicolaskalousek
  Date: 2019-04-28
  Time: 16:21
--%>

<asset:stylesheet src="application.css"/>
<%@ page contentType="text/html;charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>Details</title>
</head>

<body>
<button><a href="index">back</a></button>
</br>
<img id="backdrop" style="float: left; width: 50%;">
<form action="/MyBooks/changeBookDetails" style="padding-left: 10px; padding-top: 20px; width: calc(50% - 10px); float:right;">
    <input type="hidden" name="id" value="${book.id}">
    <input type="hidden" name="isbn" value="${book.isbn}">
    <div><h1>${book.bookTitle}</h1></div>
    <div>isbn: ${book.isbn}</div>
    <div>rating: ${book.rating}</div>
    <div>description: <span id="description"></span></div>
</form>

<script>

    var loaded = false
    var Http = new XMLHttpRequest()
    //openlibrary (an open source api for books) is used to get book information based on teh isbn
    Http.open("Get","https://openlibrary.org/api/books?bibkeys=${book.isbn}&format=json&jscmd=details")
    Http.send()
    Http.onreadystatechange=function(){

        //used w3schools XMLHttpRequest tutorial and a lot of trial and error for this part
        if(!loaded) {
            console.log(Http.response)
            var json = JSON.parse(Http.response)
            var thumbnail_url = json[Object.keys(json)[0]]["thumbnail_url"]
            thumbnail_url = thumbnail_url.substr(0,thumbnail_url.length-5)+"L.jpg"
            console.log(thumbnail_url)
            document.getElementById("backdrop").src = thumbnail_url
            document.getElementById("description").innerHTML = json[Object.keys(json)[0]]["details"]["description"].value

            loaded = true
        }
    }
</script>


<style>
    div{
        padding-bottom: 10px;
    }
</style>

</body>
</html>