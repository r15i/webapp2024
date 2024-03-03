<%@ page import="com.example.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Simple JSP Example</title>
</head>
<body>
    <h1>Simple JSP Example</h1>
    <%
    User user = new User();
    user.setName("John Doe");
    %>
    <p>Welcome, <%= user.getName() %>!</p>
</body>
</html>

