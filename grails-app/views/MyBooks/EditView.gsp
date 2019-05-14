<%--
  Created by IntelliJ IDEA.
  User: nicolaskalousek
  Date: 2019-04-28
  Time: 16:21
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>Edit Book Details</title>
</head>

<body>
<form id="form" action="/MyBooks/changeBookDetails">
    <input type="hidden" name="id" id="id" value="${book.id}">
    <input type="hidden" name="title" id="title" minlength="2" required="true" value="test">
isbn: <input type="text" name="isbn" id="isbn" minlength="10" maxlength="13" required="true" aria-required="true" value="${book.isbn}">
</br>
rating: <input type="range" name="rating" id="rating" min="1" max="5" step="1" required="true" value="${book.rating}">
    <input type="hidden" name="author" id="author">
    <input type="submit">
</form>

<script>
    var form = document.getElementById("form");
    function addAuthorAndSubmit(e){
        e.preventDefault()
        var isbn = document.getElementById("isbn").value;
        fetch("https://openlibrary.org/api/books?bibkeys="+isbn+"&format=json&jscmd=details")
            .then(response => {
            if (response.status === 200) {
            response.json()
                .then(data => {
                var formData = new FormData();
                formData.append('id',document.getElementById("id").value);
                formData.append('title', data[isbn]["details"]["title"]);
                formData.append('isbn', isbn);
                formData.append('rating', document.getElementById("rating").value);
                if(typeof ["details"]["authors"] !== 'undefined') {
                    formData.append('author', data[isbn]["details"]["authors"][0]["name"]);
                }
                else{
                    formData.append('author', 'no author available');
                }

                fetch('/MyBooks/changeBookDetails', {
                    body: formData,
                    method: 'post'
                }).then(response => {
                    redirect();
                })
        })
        }
        })
    };
    function redirect () {
        window.location = "/MyBooks/index";
    }
    form.addEventListener("submit", addAuthorAndSubmit);
</script>
</body>
</html>