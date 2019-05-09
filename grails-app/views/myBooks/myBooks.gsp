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
<li><a href="#" class="active">My Books</a></li>
    <li><a href="#">Recommendation</a></li>
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
       <td><a href="/MyBooks/edit?id=${book.id}">edit</a></td>
    </tr>
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

                var authorName = json[Object.keys(json)[0]]["details"]["authors"][0]["name"]
                if(authorName != null){
                    ${book.author} = authorName
                }

                loaded = true
            }
        }
    </script>
</g:each>

</table>

<a id="addBook" href="/MyBooks/add">add a book</a>

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