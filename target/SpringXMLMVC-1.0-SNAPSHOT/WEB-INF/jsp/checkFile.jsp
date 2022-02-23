<%--
  Created by IntelliJ IDEA.
  User: mukesh
  Date: 14-03-2021
  Time: 01:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Check</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/checkAvailability" name="myForm1" method="post">
    <input type="text" name="myName">
    <input type="submit" value="Submit">
</form>
</body>
</html>
