<html>

<%@ page import="java.sql.*"%>

<div class='split left'>
<div class="title">
<center>
<span class="title">Account Information for <%= session.getAttribute("username") %> </span>
<a href="http://localhost:8080/BankWebProject/html/index.html"> <input type="button" class="logBtn" onclick="deleteSess()" value="Log out"><a><br><br>
</center>
</div>
<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver"); //load the driver
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/webBank","root","012345");
    Statement st = con.createStatement();
    Statement st2 = con.createStatement();
    String username = (String)session.getAttribute("username");
    String query = "select * from accounts where acno ='"+username+"'";
    String query2 = "select * from transactions where acno ='"+username+"'";
    ResultSet rs = st.executeQuery(query);
    ResultSet rs2 = st2.executeQuery(query2);
    if (rs.next()) {

        out.println("<center>");
        out.println("<table border='1' class='table2'>");
          out.println("<colgroup>");
            out.println("<col span='2' style='background-color:grey'>");
          out.println("</colgroup>");
          out.println("<tr>");
            out.println("<th>Account No</th>");
            out.println("<th>"+session.getAttribute("username")+"</td>");
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

        out.println("<br><br><center>");
        out.println("<input type='button' class='open-button2' id='deposit' onClick='deposit()' value='Deposit'>");
        out.println("<input type='button' class='open-button' id='withdraw' onClick='withdraw()' value='Withdraw'>");
        out.println("</center>");
        out.println("</div>");

        out.println("<div class='split right'>");
        out.println("<br><br><center><h2 style='color:white'>Account Transactions<h2></center>");

        out.println("<table border='1' class='table1'>");
        out.println("<tr class='header'>");
        out.println("<td>Serial No</td> <td>Account No</td> <td>Amount</td> <td>Transaction Type</td> <td>Date</td>");
        out.println("</tr>");
        int sNo = 1;
        int bal = 0;
        while(rs2.next()){
            out.println("<tr>");
            out.println("<td>"+sNo+"</td>");
            out.println("<td>"+rs2.getString(1)+"</td>");
            out.println("<td>"+rs2.getString(2)+"</td>");
            if (rs2.getString(3).equals("d")) {
                out.println("<td>Deposit</td>");
                bal+=rs2.getInt(2);
            }else{
                out.println("<td>Withdraw</td>");
                bal-=rs2.getInt(2);
            }
            out.println("<td>"+rs2.getString(4)+"</td>");
            out.println("</tr>");

            sNo++;
        }

        out.println("<tr><h3 style='color: white; margin-left:20px;'>Current Balance: "+bal+"</h3></td>");
        out.println("</table>");


        out.println("</div>");

    }

}catch(Exception e){
    out.println(e.toString());
}

%>
<script>
function deposit(){
    var amount = prompt("How much would you like to deposit?", "100");
    window.open("http://localhost:8080/BankWebProject/jsp/doTransaction.jsp?t=d&amount="+amount);
    window.close();
}
function withdraw(){
    var amount = prompt("How much would you like to withdraw?", "100");
    window.open("http://localhost:8080/BankWebProject/jsp/doTransaction.jsp?t=w&amount="+amount);
    window.close();
}

function deleteSess(){
    window.open("http://localhost:8080/BankWebProject/jsp/deleteSession.jsp");
    window.close();
}

</script>

<style>
.open-button {
  background-color: red;
  color: white;
  padding: 12px 20px;
  border: none;
  cursor: pointer;
  opacity: 0.8;
  width: 125px;
  border-radius: 12px;
  box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);

}
.logBtn {
  background-color: red;
  color: white;
  padding: 12px 5px;
  float: right;
  border: none;
  cursor: pointer;
  opacity: 0.8;
  width: 100px;
  margin: 4px;
  border-radius: 12px;
  box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);

}
.open-button2 {
  background-color: green;
  color: white;
  padding: 12px 20px;
  border: none;
  cursor: pointer;
  opacity: 0.8;
  width: 125px;
  border-radius: 12px;
  box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

.table1 {
 border-collapse: collapse;
 border-spacing: 0;
 width: 90%;
 color: white;
 border: 1px solid #ddd;
 margin-left: 20px;
 box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

.split {
  height: 100%;
  width: 50%;
  position: fixed;
  z-index: 1;
  top: 0;
  overflow-x: hidden;
}

.left {
  left: 0;
  background-color: #90A4AE;
}

.right {
  right: 0;
  background-color: #455A64;
  box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
  transition: 0.3s;

}

.right:hover {
  box-shadow: 0 24px 26px 0 rgba(0,0,0,0.7);
}

.table2{
  border-collapse: collapse;
  border-spacing: 0;
  border: 1px solid #ddd;
  height: 30%;
  width: 70%;
  color: white;
  margin-top: 65px;
  box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

.header{
    font-size: 18px;
    font-weight: bold;
    color: orange;
    font-family:sans-serif;
    box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

.title{
    padding-top: 20px;
    font-size: 25px;
    font-family:sans-serif;
}

</style>

</html>
