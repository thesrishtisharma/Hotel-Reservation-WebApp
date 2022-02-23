<%--
  Created by IntelliJ IDEA.
  User: mukesh
  Date: 14-03-2021
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Booking Confirmed</title>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
</head>
<body>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/hotel-reservation" user="root" password=""/>

    <%
        String name = request.getParameter("guest_name");
        int hotelID = Integer.parseInt(request.getParameter("hotelID"));
    %>

    <table border="2" align="center" width="50%" cellpadding="6" style="margin-top: 50px">
        <tr>
            <th align="center" bgcolor="#4b0082" style="color: white" colspan="6"><h1> Confirmation Success </h1></th>
        </tr>

        <tr>
            <td align="center">
                <h2> Dear <span style="color:#4b0082"> <%= name %> </span>, thank you for choosing

                    <sql:query dataSource="${db}" var="rs">
                        SELECT * FROM `hotel` WHERE hotel_id = <%=hotelID%>;
                    </sql:query>
                    <c:forEach items="${rs.rows}" var="q">
                        <span style="color:#4b0082"> ${q.hotel_name}</span>
                    </c:forEach>. <br>

                It is our pleasure to confirm your reservation. </h2>
            </td>
        </tr>

    </table>

</body>
</html>
