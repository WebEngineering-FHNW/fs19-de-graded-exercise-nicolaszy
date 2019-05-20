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
    <link href="https://fonts.googleapis.com/css?family=Karla:700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato&display=swap" rel="stylesheet">
    <asset:stylesheet src="bookStyle.css"/>
    <style>
    td,th {
        padding-right: 20px;
        padding-bottom: 5px;
    }
    #addBook {
        padding-left: 3px;
    }
    </style>
</head>

<body>
<button id="logout" onclick="location.href = '/logout/index'">log out</button>
    <nav>
    <ul>
        <li><a href="/MyBooks/index">My Books</a></li>
        <li><a href="#" class="active">Recommendation</a></li>
    </ul>
    </nav>

    <div id="main">

    <h2>My Books</h2>

    <h3>generating your personal recommendations...</h3>

    </div>

    <g:each in="${books}" var="book" status="i">
        <input type="hidden" name="author" value="${book.author}">
    </g:each>

    <script>
        //we get all authors the user has read books of, so far
        var authors = [...document.getElementsByName('author')].map(el => el.value)
        var authorsCompleted = 0

        //we get each author's books and choose 2 random books to recommend
        authors.forEach(author => {
            fetch('http://openlibrary.org/search.json?author=' + author)
                .then(response => {
                    if (response.status === 200) {
                        response.json()
                            .then(data => {
                                var books = data.docs;
                                var randomBook;
                                var maximumIterations = 200;
                                var iterations = 0;
                                do {
                                    randomBook = books[Math.floor(Math.random() * books.length) - 1];
                                    iterations+=1;
                                } while ((typeof randomBook === 'undefined' ||
                                         typeof randomBook.isbn === 'undefined' ||
                                         randomBook.author_name[0] === 'No Author' ||
                                         randomBook.author_name[0] === 'Author Unknown')
                                         && iterations<maximumIterations)

                                //we pass the data of the book we found to the controller as a form
                                var formData = new FormData();
                                if(typeof randomBook!=='undefined') {
                                    formData.append('title', randomBook.title);
                                    formData.append('isbn', randomBook.isbn[0]);
                                    formData.append('authorName', randomBook.author_name[0]);
                                }

                                fetch('/Recommendations/addRecommendedWithIsbn', {
                                    body: formData,
                                    method: 'post'
                                }).then(response => {
                                    authorsCompleted++;
                                    if (authorsCompleted >= authors.length) redirect();
                                })
                            })
                    }
                }
            )
        })

        function redirect () {
            window.location = "/Recommendations/RecommendationsList";
        }
    </script>
</body>
</html>