<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.sql.*" %> 
<%@ page import="javax.swing.*" %>
<%

//Saving
	String btnval=request.getParameter("b1");
	if(btnval.equalsIgnoreCase("create")) 
	{
		String t1=request.getParameter("t1");
		String t2=request.getParameter("t2");
		int f=0;
		
		try
		{
			ResultSet rs;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hotel", "hotel");
			
			Statement smt=conn.createStatement();
			rs=smt.executeQuery("select * from login");
			while(rs.next())
			{
				if(rs.getString(1).equals(t1))
				{
					f=1;
					break;
				}
			}
			if(f==0)
			{
				PreparedStatement psmt=conn.prepareStatement("insert into login values(?,?)");
				psmt.setString(1,t1);
				psmt.setString(2,t2);
				psmt.executeQuery();
				out.println("<script> alert('User created');</script>");
			}
			else
			{
				JOptionPane.showMessageDialog(null,"User already exist");
			}
			

		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}
	%>
</body>
</html>