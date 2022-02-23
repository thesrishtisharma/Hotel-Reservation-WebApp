<%--
  Created by IntelliJ IDEA.
  User: mukesh
  Date: 14-03-2021
  Time: 09:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error Page</title>
</head>
<body>
    <div class="error" id="error" name="error">
        <table border="2" align="center" width="50%" cellpadding="6" style="margin-top: 50px">
            <tr>
                <th align="center" bgcolor="#4b0082" style="color: white" colspan="6"><h1> Oh snap!! We regret the inconvenience </h1></th>
            </tr>

            <tr>
                <td align="center"> <h2> Sorry! this hotel is not available for the chosen date. Please click on the below link to choose another hotel </h2> </td>
            </tr>

            <tr>
                <td colspan="6"> <center> <a href = "/SpringXMLMVChibernate_HotelReservation_war_exploded/"> Choose Again </a> </center> </td>
            </tr>
        </table>
    </div>
</body>
</html>
