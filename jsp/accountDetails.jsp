<html>

<%@ page import="java.sql.*"%>

<center><h1 class="title">Account Details</h1></center>

<%
String acno = request.getParameter("acno");
Class.forName("com.mysql.cj.jdbc.Driver"); //load the driver
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/webBank","root","012345");
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from accounts where acno='"+acno+"'");
if (rs.next()) {
    out.println("<center>");
    out.println("<table border='1' class='table2'>");
      out.println("<colgroup>");
        out.println("<col span='2' style='background-color:grey'>");
      out.println("</colgroup>");
      out.println("<tr>");
        out.println("<th>Account No</th>");
        out.println("<th>"+rs.getString(1)+"</td>");
      out.println("</tr>");

      out.println("<tr>");
        out.println("<th>Name</th>");
        out.println("<th>"+rs.getString(2)+"</td>");
      out.println("</tr>");

      out.println("<tr>");
        out.println("<th>Address</th>");
        out.println("<th>"+rs.getString(3)+"</td>");
      out.println("</tr>");

    out.println("</table>");
    out.println("</center>");

}
%>

<style>
    .table2{
      border-collapse: collapse;
      border-spacing: 0;
      border: 1px solid #ddd;
      height: 30%;
      width: 70%;
      color: white;
      font-size: 20px;
      margin-top: 100px;
      box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
      transition: 0.3s;
}

.table2:hover {
  box-shadow: 0 24px 26px 0 rgba(0,0,0,0.3);
}

.title{
    padding-top: 20px;
    font-size: 25px;
    font-family:sans-serif;
}
</style>

</html>
