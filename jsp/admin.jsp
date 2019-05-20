<html>

<%@ page import="java.sql.*"%>
<%-- <%@ page import="java.util.ArrayList"%> --%>

    <center>
    <span style="font-size:40; margin-right:40; font-family:sans-serif">Welcome Administrator</span>
    <a href="http://localhost:8080/BankWebProject/html/index.html"> <input type="button" class="logBtn" onclick="deleteSess()" value="Log out"><a><br><br><br><br>
    </center>

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
            out.println("<td style='width:50%'> <button value='"+rs.getString(2)+","+rs.getString(3)+","+rs.getString(1)+",edit' id='logBtn' class='open-button' style='font-size:20; width:21%; background-color:orange' onclick='openForm(this.value)"+"'>Edit</button>");
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
<div class="form-popup" id="inForm">
  <form action="http://localhost:8080/BankWebProject/jsp/operation.jsp" class="form-container">
    <center><h1>Edit Account Details</h1></center>

    <label for="name"> <b>Edit Name</b></label>
    <input id="name" type="text" name="name" required>

    <label for="add"> <b>Edit Address</b></label>
    <input id="addre" type="text" name="address" required>

    <button type="submit" class="btn">Save</button>
    <button type="button" class="btn cancel" onclick="closeForm()">Close</button>

    <input id="edit" style="visibility:hidden" name="operation">
    <input id="idd" style="visibility:hidden" name="acnoEdit">
  </form>
</div>
</center>

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

    }catch(Exception e) {
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

/* Button used to open the contact form - fixed at the bottom of the page */
/* .open-button {
  background-color: #555;
  color: white;
  border: none;
  cursor: pointer;
  opacity: 0.8;
  width: 151px;
} */

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

/* The popup form - hidden by default */
.form-popup {
  display: none;
  /* position: fixed; */
  /* bottom: 90; */
  /* right: 567px; */
  border: 3px solid #f1f1f1;
  z-index: 9;
  float:inherit;
}

/* Add styles to the form container */
.form-container {
  width: 300px;
  padding: 10px;
  background-color: white;

}

/* Full-width input fields */
.form-container input[type=text], .form-container input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
}

/* When the inputs get focus, do something */
.form-container input[type=text]:focus, .form-container input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for the submit/login button */
.form-container .btn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  margin-bottom:10px;
  opacity: 0.8;
}

/* Add a red background color to the cancel button */
.form-container .cancel {
  background-color: red;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
  opacity: 1;
}
</style>

<script>
    function deleteSess(){
            window.open("http://localhost:8080/BankWebProject/jsp/deleteSession.jsp");
            window.close();
    }

    function closeForm() {
        document.getElementById("inForm").style.display = "none";
    }

    function openForm(na) {
      document.getElementById("inForm").style.display = "block";
      var array = na.split(",");

      document.getElementById('name').value = array[0];
      document.getElementById('addre').value = array[1];
      document.getElementById('idd').value = array[2];
      document.getElementById('edit').value = array[3];
    }


</script>

</html>
