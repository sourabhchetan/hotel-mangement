<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@ page import="java.sql.*" %> 
<%@ page import="javax.swing.*" %>
<%
	String btnval=request.getParameter("b1");
	if(btnval.equalsIgnoreCase("login"))
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
				rs=smt.executeQuery("select * from admin_login");
				while(rs.next())
				{
					if(rs.getString(1).equals(t1) && rs.getString(2).equals(t2))
					{
						f=1;
						break;
					}
				}
				if(f==0)
				{
					JOptionPane.showMessageDialog(null,"unsucessful");
					//out.println("<script>alert('Credentials are wrong') </script>");
				}
				else
				{
					out.println("<script>window.open('signup.html','_self') </script>");
					//JOptionPane.showMessageDialog(null,"sucessful");
				}
				
			}
			catch(Exception ex)
			{
				JOptionPane.showMessageDialog(null, ex);
			}
		}
%>