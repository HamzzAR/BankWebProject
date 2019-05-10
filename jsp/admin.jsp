<html>
    <span style="font-size:40; margin-right:40">Welcome Administrator</span>
    <a href="http://localhost:8080/BankWebProject/html/index.html"> <input type="button" onclick="deleteSess()" style="font-size:30"value="Log out"><a><br><br>

<%@ page import="java.sql.*"%>

<%
    if((Integer)session.getAttribute("role") == 0) {
        Class.forName("com.mysql.cj.jdbc.Driver"); //load the driver
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/webBank","root","012345");
        Statement st = con.createStatement();
        int sNo = 1;
        ResultSet rs = st.executeQuery("select * from accounts");
        out.println("<table border='1'>");
        out.println("<tr> <td>S.NO</td> <td>Account No</td> <td>Name</td> <td>Operation</td> </tr>");
        while(rs.next()){
            out.println("<tr> <td>"+sNo+"</td>");
            out.println("<td> <a href='http://localhost:8080/BankWebProject/jsp/accountDetails.jsp?acno="+rs.getString(1)+"'>"+rs.getString(1)+"</a></td>"+"<td>"+rs.getString(2)+"</td>");
            out.println("<td> <a href='http://localhost:8080/BankWebProject/jsp/operation.jsp?operation=edit&acno="+rs.getString(1)+"'><input type='button' style='font-size:30' value='Edit'>"+"</a>");
            out.println("<a href='http://localhost:8080/BankWebProject/jsp/operation.jsp?operation=block&acno="+rs.getString(1)+"'><input type='button' style='font-size:30' value='Block'>"+"</a>");
            out.println("<a href='http://localhost:8080/BankWebProject/jsp/operation.jsp?operation=unblock&acno="+rs.getString(1)+"'><input type='button' style='font-size:30' value='Unblock'>"+"</a>");
            out.println("<a href='http://localhost:8080/BankWebProject/jsp/operation.jsp?operation=delete&acno="+rs.getString(1)+"'><input type='button' style='font-size:30' value='Delete'>"+"</a> </td>");
            sNo++;
        }
        out.println("</table>");
    }
%>

<script>
    function deleteSess(){
            window.open("http://localhost:8080/BankWebProject/jsp/deleteSession.jsp");
            window.close();
    }

</script>

</html>
