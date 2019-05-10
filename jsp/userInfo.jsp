<html>

<%@ page import="java.sql.*"%>

<span style="font-size:40; margin-right:40">Account Information for <%= session.getAttribute("username") %> </span>
<a href="http://localhost:8080/BankWebProject/html/index.html"> <input type="button" onclick="deleteSess()" style="font-size:30"value="Log out"><a><br><br>
Account No: <%= session.getAttribute("username") %>
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
        out.println("<br>Name: "+rs.getString(2));
        out.println("<br>Address: "+rs.getString(3)+"<br><br>");

        out.println("<input type='button' id='deposit' onClick='deposit()' value='Deposit'>");
        out.println("<input type='button' id='withdraw' onClick='withdraw()' value='Withdraw'>");

        out.println("<br><br><h2>Account Transactions<h2>");

        out.println("<table border='1'>");
        out.println("<tr>");
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

        out.println("</table>");
        out.println("<br>Current Balance: "+bal);

    }

}catch(Exception e){
    out.println(e.toString());
}

%>
<script>
function deposit(){
    var amount = prompt("How much would you like to deposit?", "100");
    window.open("http://localhost:8080/BankWebProject/jsp/doTransaction.jsp?t=d&amount="+amount);
}
function withdraw(){
    var amount = prompt("How much would you like to withdraw?", "100");
    window.open("http://localhost:8080/BankWebProject/jsp/doTransaction.jsp?t=w&amount="+amount);
}

function deleteSess(){
    window.open("http://localhost:8080/BankWebProject/jsp/deleteSession.jsp");
    window.close();
}

</script>

</html>
