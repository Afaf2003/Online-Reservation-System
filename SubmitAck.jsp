<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@ page import="java.sql.*"%>
           <%@ page import="java.util.Random"%>
      <%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Style.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans:wght@700&family=Poppins:wght@400;500;600&display=swap');

*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
}
body{
  background: linear-gradient(-135deg, #404258, #474E68);
  padding: 0 10px;
}
.wrapper{
  max-width: 500px;
  width: 100%;
  background: #fff;
  margin: 80px auto;
  box-shadow: 1px 1px 2px rgba(0,0,0,0.125);
  padding: 30px;
  border-radius: 15px;
}

.wrapper .title{
  font-size: 24px;
  font-weight: 700;
  margin-bottom: 25px;
  text-transform: uppercase;
  text-align: center;
}

.wrapper .form{
  width: 100%;
}

.wrapper .form .inputfield{
  margin-bottom: 15px;
  display: flex;
  align-items: center;
}

.wrapper .form .inputfield label{
   width: 200px;
   color: #757575;
   margin-right: 10px;
  font-size: 14px;
}

.wrapper .form .inputfield .input,
.wrapper .form .inputfield .textarea{
  width: 100%;
  outline: none;
  border: 1px solid #d5dbd9;
  font-size: 15px;
  padding: 8px 10px;
  border-radius: 3px;
  transition: all 0.3s ease;
}

.wrapper .form .inputfield .textarea{
  width: 100%;
  height: 125px;
  resize: none;
}

.wrapper .form .inputfield .custom_select{
  position: relative;
  width: 100%;
  height: 37px;
}

.wrapper .form .inputfield .custom_select:before{
  content: "";
  position: absolute;
  top: 12px;
  right: 10px;
  border: 8px solid;
  border-color: #d5dbd9 transparent transparent transparent;
  pointer-events: none;
}

.wrapper .form .inputfield .custom_select select{
  -webkit-appearance: none;
  -moz-appearance:   none;
  appearance:        none;
  outline: none;
  width: 100%;
  height: 100%;
  border: 0px;
  padding: 8px 10px;
  font-size: 15px;
  border: 1px solid #d5dbd9;
  border-radius: 3px;
}


.wrapper .form .inputfield .input:focus,
.wrapper .form .inputfield .textarea:focus,
.wrapper .form .inputfield .custom_select select:focus{
  border: 1px solid #fec107;
}

.wrapper .form .inputfield p{
   font-size: 14px;
   color: #757575;
}
.wrapper .form .inputfield .check{
  width: 15px;
  height: 15px;
  position: relative;
  display: block;
  cursor: pointer;
}
.wrapper .form .inputfield .check input[type="checkbox"]{
  position: absolute;
  top: 0;
  left: 0;
  opacity: 0;
}
.wrapper .form .inputfield .check .checkmark{
  width: 15px;
  height: 15px;
  border: 1px solid #fec107;
  display: block;
  position: relative;
}
.wrapper .form .inputfield .check .checkmark:before{
  content: "";
  position: absolute;
  top: 1px;
  left: 2px;
  width: 5px;
  height: 2px;
  border: 2px solid;
  border-color: transparent transparent #fff #fff;
  transform: rotate(-45deg);
  display: none;
}
.wrapper .form .inputfield .check input[type="checkbox"]:checked ~ .checkmark{
  background: #fec107;
}

.wrapper .form .inputfield .check input[type="checkbox"]:checked ~ .checkmark:before{
  display: block;
}

.wrapper .form .inputfield .btn{
  width: 100%;
   padding: 8px 10px;
  font-size: 15px; 
  border: 0px;
  background: #2691d9;
  color: #fff;
  cursor: pointer;
  border-radius: 3px;
  outline: none;
}

.wrapper .form .inputfield .btn:hover{
  background: #B9E0FF;
  border-color: #2691d9;
  transition: .5s;
}

.wrapper .form .inputfield:last-child{
  margin-bottom: 0;
}

@media (max-width:420px) {
  .wrapper .form .inputfield{
    flex-direction: column;
    align-items: flex-start;
  }
  .wrapper .form .inputfield label{
    margin-bottom: 5px;
  }
  .wrapper .form .inputfield.terms{
    flex-direction: row;
  }
}
</style>
</head>
<body>

<%
try {
	String name="";
	Class.forName("com.mysql.jdbc.Driver");  
	
	Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/ors ","root","2009");
    String no=request.getParameter("trainno");
	PreparedStatement stm=connection.prepareStatement("select Train_Name from train where Train_No=?");
	stm.setString(1, no);
	
	ResultSet rs=stm.executeQuery();
	
	if(rs.next())
	{	
		name=rs.getString(1);
}
	else
	{
		%>
		<h1>Invalid Credentials</h1>
		<%
	}
%>
<div class="wrapper">
    <div class="title">
      Registration Form
    </div>
 
    <div class="form">
    <form action = "SubmitAck2.jsp">
       <div class="inputfield">
          <label>Name</label>
          <input type="text" name="name" class="input" value=<%=request.getParameter("name") %>>
       </div>  
       <!--    
       <div class="inputfield">
          <label>Password</label>
          <input type="password" class="input" >
       </div>  
       --> 
       <div class="inputfield">
          <label>Class Type</label>
          <div class="custom_select">
            <select name = "class" >
              <option value=<%=request.getParameter("class") %>>Select</option>
              <option value=<%=request.getParameter("class") %>>AC</option>
              <option value=<%=request.getParameter("class") %>>SL</option>
            </select>
       </div>
       </div> 
       <div class="inputfield">
          <label>Train Number</label>
          <input type="text" class="input" name="trainno" value=<%=request.getParameter("trainno") %>>
       </div>
       <div class="inputfield">
          <label>Train Name</label>
          <input type="text" class="input" name="trainname" value=<%=name%>>
       </div>
<%
}
catch (SQLException e) {
	
	e.printStackTrace();
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}
%>
<div class="inputfield">
          <label>Phone Number</label>
          <input type="text" class="input" name = "number" value=<%=request.getParameter("number") %>>
       </div> 
      <div class="inputfield">
          <label>Date of Journey</label>
          <input type="Date" class="input" name = "date" value=<%=request.getParameter("date") %>>
       </div> 
      <div class="inputfield">
          <label>From City</label>
          <input type="text" class="input" name="src" value=<%=request.getParameter("src") %>>
       </div> 
       <div class="inputfield">
          <label>To City</label>
          <input type="text" class="input" name ="dest" value=<%=request.getParameter("dest") %>>
       </div> 
      <div class="inputfield">
        <input type="submit" value="Register" class="btn">
      </div>
    
    </form>
    </div>
</div>
</body>
</html>