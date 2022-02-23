<%--
  Created by IntelliJ IDEA.
  User: mukesh
  Date: 12-03-2021
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="sharma.srishti.controller.WelcomeController" %>
<html>
<head>
    <title>Room Information</title>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

    <style>
        .button {
            background-color: #4b0082; /* purple */
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/hotel-reservation" user="root" password=""/>

<%
    int stateID = Integer.parseInt(request.getParameter("state"));
    int hotelID = Integer.parseInt(request.getParameter("hotel"));

%>

<form>
    <table border="2" align="center" width="50%" cellpadding="6" style="margin-top: 50px">
        <tr>
            <th align="center" bgcolor="#4b0082" style="color: white" colspan="6"><h1> Room Information </h1></th>
        </tr>

        <tr>
            <th hidden> hotel ID</th>
            <th> Room  </th>
            <th> Price </th>
            <th> GST </th>
            <th> Total </th>
        </tr>

        <tr>
            <%
                try {
                    String query = "SELECT * FROM hotel_information WHERE hotel_id="+hotelID;
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel-reservation","root","");
                    Statement stm = conn.createStatement();
                    ResultSet rs = stm.executeQuery(query);
                    while(rs.next()){
            %>
                        <td hidden> <input name="hotel_id" value="<%=rs.getString("hotel_id")%>"> </td>
                        <td> <%=rs.getString("room_type")%> </td>
                        <td> <%=rs.getDouble("price")%> </td>
                        <td> <%=rs.getDouble("gst")%> </td>
                        <td> <%=rs.getDouble("total")%> </td>
            <%
                    }
                }
                catch (Exception e){
                    e.printStackTrace();
                }
            %>
        </tr>
    </table>
    <br>
    <center>
        <button class="button" type="submit" formaction="<%=request.getContextPath()%>/reservation"> Confirm </button>

        <button class="button" type="submit" formaction="/SpringXMLMVChibernate_HotelReservation_war_exploded/"> Back </button>

    </center>
</form>


</body>
</html>
