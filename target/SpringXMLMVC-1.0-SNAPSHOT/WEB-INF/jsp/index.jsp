<%--
  Created by IntelliJ IDEA.
  User: mukesh
  Date: 10-03-2021
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <%@include file="./base.jsp"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script type="text/javascript">
        var x = document.getElementById("state");
        var selectedState = x.options[x.selectedIndex].value;

        var y = document.getElementById("hotel");
        var selectedHotel = y.options[y.selectedIndex].value;
    </script>
</head>
<body>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/hotel-reservation" user="root" password=""/>
<form action="" method="post"> <!-- {pageContext.request.contextPath}/ -->
    <table border="2" align="center" width="50%" cellpadding="6" style="margin-top: 50px">
        <tr>
            <th align="center" bgcolor="#4b0082" style="color: white" colspan="6"><h1> Search Hotels </h1></th>
        </tr>

        <tr>
            <th align="=right">State Name : </th>
            <td>
                <input list="states" name="state" id="state">
                <datalist id="states">
                    <%
                        try{
                            String Query = "SELECT * FROM `state`";
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel-reservation","root","");
                            Statement stm = conn.createStatement();
                            ResultSet rs = stm.executeQuery(Query);
                            while (rs.next()){
                    %>
                    <option value="<%=rs.getString("state_name")%>"
                            <%
                                if(request.getParameter("state")!=null)
                                {
                                    if(rs.getString("state_name").equals(request.getParameter("state"))){
                                        out.print("selected");
                                    }
                                }
                            %>
                    >
                    </option>
                    <%
                            }
                        }
                        catch (Exception e){
                            e.printStackTrace();
                        }

                    %>
                </datalist>
            </td>
        </tr>

        <tr>
            <th align="=right">Hotel Name : </th>
            <td>
                <input list="hotels" name="hotel" id="hotel">
                <datalist id="hotels">
                    <%
                        try {
                            String query1 = "SELECT * FROM hotel where state_name";
                            String query2 = " = '?'";
                            String query = query1 + query2;
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel-reservation","root","");

                            PreparedStatement psmt = con.prepareStatement(query);
                            psmt.setString(1, request.getParameter("state"));

                            ResultSet rs = psmt.executeQuery();
                            while(rs.next()){
                    %>
                    <option value="<%=rs.getInt("hotel_id")%>"><%=rs.getString("hotel_name")%></option>
                    <%
                            }
                        }
                        catch (Exception e){
                            e.printStackTrace();
                        }
                    %>
                </datalist>

            </td>
        </tr>

        <tr>
            <th align="=right"> Date : </th>
            <td>
                <input type="date" min="2021-04-01" max="2021-12-31">
            </td>
        </tr>

    </table>
    <br>
    <center>
        <button class="button" type="submit"> Check Availability </button>
    </center>
    </form>
</body>
</html>
