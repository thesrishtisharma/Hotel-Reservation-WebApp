<%--
  Created by IntelliJ IDEA.
  User: mukesh
  Date: 08-03-2021
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Hotel Reservation System</title>
    <style>
        select{
            height: 25px;
            width: 250px;
        }
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
<form >
    <table border="2" align="center" width="50%" cellpadding="6" style="margin-top: 50px">
        <tr>
            <th align="center" bgcolor="#4b0082" style="color: white" colspan="6"><h1> Search Hotels </h1></th>
        </tr>

        <tr>
            <th align="=right">State Name : </th>
            <td>
                <select name="state" id="state" onchange="this.form.submit();" required>
                    <option value="" disabled selected> Select State </option>
                    <%
                        try{
                            String Query = "SELECT * FROM `state`";
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel-reservation","root","");
                            Statement stm = conn.createStatement();
                            ResultSet rs = stm.executeQuery(Query);
                            while (rs.next()){
                    %>
                    <option value="<%=rs.getInt("id")%>"

                            <%
                                if(request.getParameter("state")!=null)
                                {
                                    if(rs.getInt("id")==Integer.parseInt(request.getParameter("state"))){
                                        out.print("selected");
                                    }
                                }
                            %>


                    ><%=rs.getString("state_name")%></option>
                    <%
                            }
                        }
                        catch (Exception e){
                            e.printStackTrace();
                        }

                    %>
                </select>
            </td>
        </tr>

        <tr>
            <th align="=right">Hotel Name : </th>
            <td>
                <select name="hotel" id="hotel" required onchange="textValue()">
                    <option value="" disabled selected> Select Hotel </option>
                    <%
                        try {
                            String query = "SELECT * FROM hotel WHERE state_id=?";
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel-reservation","root","");

                            PreparedStatement psmt = con.prepareStatement(query);
                            psmt.setString(1, request.getParameter("state"));

                            ResultSet rs = psmt.executeQuery();
                            while(rs.next()){
                    %>

                    <option placeholder="select" value="<%=rs.getInt("hotel_id")%>"

                            <%
                                if(request.getParameter("hotel")!=null)
                                {
                                    if(rs.getInt("hotel_id")==Integer.parseInt(request.getParameter("hotel"))){
                                        out.print("selected");
                                    }
                                }
                            %>


                    ><%=rs.getString("hotel_name")%></option>
                    <%
                            }
                        }
                        catch (Exception e){
                            e.printStackTrace();
                        }
                    %>

                </select>
            </td>
        </tr>

        <tr>
            <th align="=right"> Date : </th>
            <td>
                <input type="date" min="2021-04-01" max="2021-12-31" required>
            </td>
        </tr>
    </table>
    <br>
    <center>
        <button class="button" type="submit" formaction="<%=request.getContextPath()%>/checkAvailability" formmethod="post"> Check Availability </button>
    </center>
</form>
</body>
</html>

