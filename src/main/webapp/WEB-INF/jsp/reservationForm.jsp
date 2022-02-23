<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: mukesh
  Date: 14-03-2021
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reservation Form</title>
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

<%
    int hotelID = Integer.parseInt(request.getParameter("hotel_id"));
%>

    <form>
        <table border="2" align="center" width="50%" cellpadding="6" style="margin-top: 50px">
            <tr>
                <th align="center" bgcolor="#4b0082" style="color: white" colspan="6"><h1> Reservation Form </h1></th>
            </tr>

            <tr>
                <input value="<%= hotelID %>" name="hotelID" hidden>
            </tr>

            <tr>
                <th> Guest Name : </th>
                <td> <input type="text" name="guest_name" required> </td>
            </tr>

            <tr>
                <th> Gender : </th>
                <td>
                    <select name="gender" required>
                        <option value="" disabled selected> Select your gender </option>
                        <option value="male"> Male </option>
                        <option value="female"> Female </option>
                        <option value="other"> Other </option>
                    </select>
                </td>
            </tr>

            <tr>
                <th> Age : </th>
                <td> <input type="number" min="18" name="age" required> </td>
            </tr>

            <tr>
                <th> Email ID : </th>
                <td> <input type="email" name="email" required> </td>
            </tr>

            <tr>
                <th> Mobile Number : </th>
                <td> <input type="number" pattern="[7-9]{1}[0-9]{9}" required> </td>
            </tr>

        </table>

        <center>
            <button class="button" type="submit" formaction="<%=request.getContextPath()%>/confirm" formmethod="post"> Reserve </button>
        </center>
    </form>
</body>
</html>
