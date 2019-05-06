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
    <input type="hidden" name="isbn" value="${book.isbn}">
book title: ${book.bookTitle}
</br>
isbn: ${book.isbn}
</br>
rating: ${book.rating}
</br>
    description: <span id="description"></span>
</br>
    <img id="backdrop">
</form>

<script>

    var loaded = false
    var Http = new XMLHttpRequest()
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

</body>
</html>