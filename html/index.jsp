<html>
<body>
<br>
<center><h1 id="titleH1">I HATE YOU THE WHOLE UNIVERSE</h1></center>
<center>
<div>
<button id="logBtn" class="open-button" onclick="openForm()">Login</button>
<button id="accBtn" class="open-button" onclick="openForm2()">Create Account</button>
</div>
</center>

<div class="form-popup" id="inForm">
  <form action="http://localhost:8080/BankWebProject/jsp/login.jsp" class="form-container">
    <center><h1>Login</h1></center>

    <label for="email"><b>UserName</b></label>
    <input type="text" placeholder="Enter Username" name="username" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" required>

    <button type="submit" class="btn">Login</button>
    <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
  </form>
</div>

<div class="form-popup" id="createForm">
  <form action="http://localhost:8080/BankWebProject/jsp/createAccount.jsp" method="post" class="form-container">
    <center><h1>Create New Account</h1></center>

    <label for="name"><b>Name</b></label>
    <input type="text" placeholder="Enter Name" name="name" required>

    <label for="address"><b>Address</b></label>
    <input type="text" placeholder="Enter Address" name="address" required>

    <pre style="font:bold; font-size:18">Gender     Account Type</pre>
    <input type="radio" name="gender" value="m" required> Male
    <input  style="margin-left:58px" type="radio" name="account" value="c"> Current<br>
    <br><input type="radio" name="gender" value="f"> Female
    <input style="margin-left:39px" type="radio" name="account" value="s"> Saving <br><br><br>

    <button type="submit" class="btn">Create Account</button>
    <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
  </form>
</div>

<center>
<div class="alert" id="msg" style="display: none">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
  <strong>Erro!! </strong> Username or Password incorrect.
</div>
</center>

<%
try {
    String operation = request.getParameter("do");
    if (operation.equals("t")) {
        out.println("<script>");
        out.println("document.getElementById('msg').style.display ='block'");
        out.println("</script>");
        operation = "f";
    }
} catch(Exception e) {

}

%>

<script>
function openForm() {
  document.getElementById("inForm").style.display = "block";
  document.getElementById("createForm").style.display = "none";
}
function openForm2() {
  document.getElementById("createForm").style.display = "block";
  document.getElementById("inForm").style.display = "none";
}

function closeForm() {
  document.getElementById("inForm").style.display = "none";
  document.getElementById("createForm").style.display = "none";
}
    setInterval(
    function () {
      var randomColor = Math.floor(Math.random()*16777215).toString(16);
      var randomColor2 = Math.floor(Math.random()*16777215).toString(16);
      document.getElementById('logBtn').style.backgroundColor = "#"+randomColor2;
      document.getElementById('accBtn').style.backgroundColor = "#"+randomColor2;
      document.getElementById('titleH1').style.color = "#"+randomColor2;
      document.body.style.backgroundColor = "#"+randomColor;
  },1500);

</script>

<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Button used to open the contact form - fixed at the bottom of the page */
.open-button {
  background-color: #555;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  opacity: 0.8;
  float: left;
  width: 151px;
}

/* The popup form - hidden by default */
.form-popup {
  display: none;
  float:right;
  width: 100%;
  /* z-index: 9; */
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

.alert {
  padding: 20px;
  background-color: red;
  color: white;
  margin-top: 80px;
  width: 30%;
}
</style>


</body>
</html>
