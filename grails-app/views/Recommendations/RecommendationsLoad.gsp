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
<script>
    var isbns = "";
    var titles = "";
    var finished = false;
</script>
<a href="/logout/index">log out</a>
<nav>
<li><a href="#" class="active">My Books</a></li>
    <li><a href="#">Recommendation</a></li>
</nav>
<h2>My Books</h2>


    <form action="/Recommendations/addRecommendedWithIsbn">
        <input type="hidden" name="titles" id="titles" minlength="2" required="true">
        <input type="hidden" name="isbns" id="isbns" minlength="10" maxlength="13" required="true" aria-required="true">
        <input type="submit" hidden id="submit">
    </form>

    <h3>generating your personal recommendations...</h3>

<g:each in="${books}" var="book" status="i">
    <input type="hidden" name="author" value="${book.author}">
    <script>
        var author = document.getElementsByName("author")[document.getElementsByName("author").length-1].value;
        //alert(author);

        if(author != "author"){

        var relatedBooks = "http://openlibrary.org/search.json?author="+author;

        var Http = new XMLHttpRequest();
        var Http2 = new XMLHttpRequest();

        //openlibrary (an open source api for books) is used to get book information based on teh isbn
        Http.open("Get",relatedBooks);
        Http.send();
        Http.onreadystatechange = function(){

            var json= JSON.parse(Http.response)["docs"];

            var i = Math.floor(Math.random()*(json.length-1)+1);

                //TODO: maybe add title automatically based on isbn?
                if(json[i]["title_suggest"]!='${book.bookTitle}') {

                    //add book title as suggestion with edition key
                    var isbn = json[i]["edition_key"][0];

                    Http2.open("Get", "https://openlibrary.org/api/books?bibkeys=" + isbn + "&format=json&jscmd=details");
                    Http2.send();
                    Http2.onreadystatechange = function () {

                        //used w3schools XMLHttpRequest tutorial and a lot of trial and error for this part
                        var json = JSON.parse(Http2.response);

                        var title = json[Object.keys(json)[0]]["details"]["title"];

                        isbns = isbns + isbn + ";";

                        titles = titles + title + ";";

                    }
                }
                }
         }
    </script>
</g:each>

</table>

<script>
    setTimeout(function() {
        // rest of code here
        alert(titles)
        alert(isbns)
        document.getElementById("titles").value = titles;
        document.getElementById("isbns").value = isbns;
        document.getElementById("submit").click();
    }, 10000);
    //after this onclick, the actual recommendations will be loaded
</script>
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