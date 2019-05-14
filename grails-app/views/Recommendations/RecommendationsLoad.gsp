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
    <a href="/logout/index">log out</a>

    <nav>
    <ul>
        <li><a href="#" class="active">My Books</a></li>
        <li><a href="#">Recommendation</a></li>
    </ul>
    </nav>

    <h2>My Books</h2>

    <h3>generating your personal recommendations...</h3>

    <g:each in="${books}" var="book" status="i">
        <input type="hidden" name="author" value="${book.author}">
    </g:each>

    <script>
        var authors = [...document.getElementsByName('author')].map(el => el.value)
        var authorsCompleted = 0

        authors.forEach(author => {
            fetch('http://openlibrary.org/search.json?author=' + author)
                .then(response => {
                    if (response.status === 200) {
                        response.json()
                            .then(data => {
                                var books = data.docs;
                                var randomBook;
                                do {
                                    randomBook = books[Math.floor(Math.random() * books.length) - 1];
                                } while (typeof randomBook === 'undefined' ||
                                         typeof randomBook.isbn === 'undefined' ||
                                         randomBook.author_name[0] === 'No Author' ||
                                         randomBook.author_name[0] === 'Author Unknown')

                                var formData = new FormData();
                                formData.append('title', randomBook.title);
                                formData.append('isbn', randomBook.isbn[0]);
                                formData.append('authorName', randomBook.author_name[0]);

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