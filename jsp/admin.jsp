<html>

<%@ page import="java.sql.*"%>

<%
    if((Integer)session.getAttribute("role") == 0) {
        Class.forName("com.mysql.cj.jdbc.Driver"); //load the driver
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/webBank","root","012345");
        Statement st = con.createStatement();
        int sNo = 1;
        ResultSet rs = st.executeQuery("select * from accounts");
        out.println("<table border:'1'>");
        out.println("<tr> <td>S.NO</td> <td>Account No</td> <td>Name</td> <td>Operation</td> </tr>");
        while(rs.next()){
            out.println("<tr> <td>"+sNo+"</td>"+"<td>"+rs.getString(1)+"</td> <td>"+rs.getString(2)+"</td> </tr>");
            sNo++;
        }
        out.println("</table>");
    }
%>

</html>
