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

<script>

    var authorName;
    //we make an api request to open library, getting the book information with the isbn the user entered
    fetch("https://openlibrary.org/api/books?bibkeys=${book.isbn}&format=json&jscmd=details")
        .then(response => {
        if (response.status === 200) {
        response.json()
            .then(data => {
                //we get all the information we need and then fill it into our html layout
                var isbn = document.getElementById("isbn").value;
                var thumbnail_url;
                var description;
                if(typeof data[isbn]["thumbnail_url"] !== 'undefined') {
                    thumbnail_url = data[isbn]["thumbnail_url"];
                    thumbnail_url = thumbnail_url.substr(0, thumbnail_url.length - 5) + "L.jpg";
                }
                if(typeof data[isbn]["details"]["description"] !== 'undefined'){
                    document.getElementById("description").innerText = data[isbn]["details"]["description"];
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