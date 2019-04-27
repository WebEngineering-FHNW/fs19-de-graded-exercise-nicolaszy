<%--
  Created by IntelliJ IDEA.
  User: nicolaskalousek
  Date: 2019-04-27
  Time: 12:40
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>

<form action="/myBooks/createUsers?userName=test&password=test" method="get">
    user name: <input type="text" name="userName" value="test" />
    password: <input type="text" name="password" value="test" />
    <input type="submit"/>
</form>

</body>
</html>