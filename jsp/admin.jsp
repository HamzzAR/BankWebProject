<html>
    <center>
    <span style="font-size:40; margin-right:40; font-family:sans-serif">Welcome Administrator</span>
    <a href="http://localhost:8080/BankWebProject/html/index.html"> <input type="button" class="logBtn" onclick="deleteSess()" value="Log out"><a><br><br><br><br>
    </center>
<%@ page import="java.sql.*"%>

<%
    if((Integer)session.getAttribute("role") == 0) {
        Class.forName("com.mysql.cj.jdbc.Driver"); //load the driver
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/webBank","root","012345");
        Statement st = con.createStatement();
        int sNo = 1;
        ResultSet rs = st.executeQuery("select * from accounts");
        out.println("<center>");
        out.println("<table class='table1' border='1'>");
        out.println("<tr style='background-color:orange; font-size: 20px; font-weight: bold'> <td>S.NO</td> <td>Account No</td> <td>Name</td> <td>Operation</td> </tr>");
        while(rs.next()){
            out.println("<tr> <td>"+sNo+"</td>");
            out.println("<td> <a href='http://localhost:8080/BankWebProject/jsp/accountDetails.jsp?acno="+rs.getString(1)+"'>"+rs.getString(1)+"</a></td>"+"<td>"+rs.getString(2)+"</td>");
            out.println("<td style='width:50%;'> <a href='http://localhost:8080/BankWebProject/jsp/operation.jsp?operation=edit&acno="+rs.getString(1)+"'><input type='button' style='font-size:20; width:21%; background-color:yellow' value='Edit'>"+"</a>");
            out.println("<a href='http://localhost:8080/BankWebProject/jsp/operation.jsp?operation=block&acno="+rs.getString(1)+"'><input type='button' style='font-size:20; width:25%; background-color:orange' value='Block'>"+"</a>");
            out.println("<a href='http://localhost:8080/BankWebProject/jsp/operation.jsp?operation=unblock&acno="+rs.getString(1)+"'><input type='button' style='font-size:20; width:25%; background-color:green' value='Unblock'>"+"</a>");
            out.println("<a href='http://localhost:8080/BankWebProject/jsp/operation.jsp?operation=delete&acno="+rs.getString(1)+"'><input type='button' style='font-size:20; width:25%; background-color:red' value='Delete'>"+"</a> </td>");
            sNo++;
        }
        out.println("</table>");
        out.println("</center>");
    }
%>
<center>
<div class="alert" id="msg" style="display: none">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
  <strong>Success!! </strong> Operation completed.
</div>
</center>
<%
    try {
        String operation = request.getParameter("operation");

            if (operation.equals("n")) {
                out.println("<script>");
                out.println("document.getElementById('msg').style.display ='block'");
                out.println("</script>");
            }else{

            }

    }catch (Exception e) {
        //out.println(e.toString());
    }

 %>

<style>
.table1 {
 border-collapse: collapse;
 border-spacing: 0;
 width: 50%;
 color: white;
 border: 1px solid black;
 color: black;
 font-family: sans-serif;
}
.logBtn {
  background-color: red;
  color: white;
  padding: 12px 5px;
  float: right;
  border: none;
  cursor: pointer;
  opacity: 0.8;
  font-size: 15px;
  border-radius: 12px;
  width: 100px;
}

.alert {
  padding: 20px;
  background-color: green;
  color: white;
  margin-top: 80px;
  width: 30%;
}

.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: black;
}
</style>


<script>
    function deleteSess(){
            window.open("http://localhost:8080/BankWebProject/jsp/deleteSession.jsp");
            window.close();
    }

</script>

</html>
