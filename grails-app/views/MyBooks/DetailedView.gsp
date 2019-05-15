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
    <link href="https://fonts.googleapis.com/css?family=Karla:700" rel="stylesheet">

</head>

<body>
 <button onclick="location.href = 'index'">back</button>
</br>
<img id="backdrop" style="float: left; width: 30%; margin-left: 10%; margin-right: 10%; margin-top: 2%;">
<form action="/MyBooks/changeBookDetails" style="padding-right: 50px; padding-top: 20px; width: calc(50% - 50px); float:right;">
    <input type="hidden" name="id" value="${book.id}">
    <input type="hidden" name="isbn" id="isbn" value="${book.isbn}">
    <h1>${book.bookTitle}</h1>
    <p style="padding-top: 10px;">ISBN: ${book.isbn}</p>
    <p>Rating: ${book.rating}</p>
    <p>Genres: <span id="genres"></span></p>
    <p>Description: <span id="description"></span></p>
    <p>Author: <span id="author">${book.author}</span></p>
</form>

<script>

    var authorName;
    fetch("https://openlibrary.org/api/books?bibkeys=${book.isbn}&format=json&jscmd=details")
        .then(response => {
        if (response.status === 200) {
        response.json()
            .then(data => {
                console.log(data);
                var isbn = document.getElementById("isbn").value;
                var thumbnail_url;
                var description;
                if(typeof data[isbn]["thumbnail_url"] !== 'undefined') {
                    thumbnail_url = data[isbn]["thumbnail_url"];
                    thumbnail_url = thumbnail_url.substr(0, thumbnail_url.length - 5) + "L.jpg";
                }
                if(typeof data[isbn]["details"]["description"] !== 'undefined'){
                    document.getElementById("description").innerText = data[isbn]["details"]["description"]["value"];
                }
                else{
                    document.getElementById("description").innerText = "no description available";
                }
                if(typeof data[isbn]["details"]["genres"] !== 'undefined'){
                    var genres = ""
                    for(var i=0; i<data[isbn]["details"]["genres"].length; i++){
                        var genre = data[isbn]["details"]["genres"][i];
                        genres += genre.substring(0,genre.length-1)+","
                    }
                    document.getElementById("genres").innerText = genres.substring(0,genres.length-1);
                }
                else{
                    document.getElementById("genres").innerText = "no genres available";
                }
                document.getElementById("backdrop").src = thumbnail_url;
        })
    }
    })

</script>


<style>
    div{
        padding-bottom: 10px;
    }
</style>

</body>
</html>