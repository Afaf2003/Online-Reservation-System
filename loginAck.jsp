<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	try {
		String sql;
		Class.forName("com.mysql.jdbc.Driver");  
		Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/ors","root","2009");
		Statement stmt=connection.createStatement(); 
		String name=request.getParameter("useremail");
		String pass=request.getParameter("password");
		//String user = request.getParameter("UserType");
		sql = "select * from user where useremail=? and password=?";
		PreparedStatement stm=connection.prepareStatement(sql);
		stm.setString(1, name);
		stm.setString(2, pass);	
		ResultSet rs=stm.executeQuery();
		if(rs.next())
		{	
			String user = rs.getString("username");
			session.setAttribute("user",user);
			%>
			<script>alert("Sucessfully Login");
			window.location = 'home.jsp';
			</script>
			
			<%
			
		}
		else
		{
			%>
			<script>alert("Invalid Details!!");
			window.location = 'Dashboard.jsp';
			</script>
			<%
			
		}
	}
	catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	%>
	
</body>
</html>