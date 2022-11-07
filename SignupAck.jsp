<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Acknowledgement for Sign Up</title>
</head>
<body>
<%try {
		String sql;
		Class.forName("com.mysql.jdbc.Driver");  
		Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/ors","root","2009");
		Statement stmt=connection.createStatement(); 
		String name=request.getParameter("username");
		String email=request.getParameter("useremail");
		String pass=request.getParameter("password");
		//String user = request.getParameter("UserType");
		sql = "insert into user values (?, ?, ?)";
		PreparedStatement stm=connection.prepareStatement(sql);
		stm.setString(1, name);
		stm.setString(2, email);
		stm.setString(3, pass);	
	
		int i=stm.executeUpdate();
		if(i!=0)
		{
			session.setAttribute("name", name);
			%>
			<script>
				alert("Successfully Submittd!!");
				window.location = 'home.jsp';
			</script>
			<%
			
		}
		
    }
	 catch (SQLException e) {
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} 
	%>
</body>
</html>