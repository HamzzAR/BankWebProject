<html>

<%@ page import="java.sql.*"%>

<%
String acno = request.getParameter("acno");
Class.forName("com.mysql.cj.jdbc.Driver"); //load the driver
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/webBank","root","012345");
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from accounts where acno='"+acno+"'");
if (rs.next()) {
    out.println("<table border='1'>");
    out.println("<tr> <td>Account No</td> <td>Name</td> <td>Address</td> </tr>");
    out.println("<tr> <td>"+rs.getString(1)+"</td>"+ "<td>"+rs.getString(2)+ "</td>"+ "<td>"+rs.getString(3)+"</td>"+ "</tr>");
}


%>

</html>
