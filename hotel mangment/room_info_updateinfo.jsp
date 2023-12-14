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
    String t1=request.getParameter("t1");
	
		//Searching
		if(btnval.equalsIgnoreCase("update"))
		{
		 	try
		 	{
			  ResultSet rs;
			  Class.forName("oracle.jdbc.driver.OracleDriver");
			  Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hotel","hotel");
			  Statement smt=conn.createStatement();
			  rs=smt.executeQuery("select * from room_info where room_id='"+t1+"'");
%>
			   <table border=1>
			   <form name=f method=post action=room_info.jsp>
				  <tr>
			 					<th>ROOM ID</th>
			 					<th>ROOM TYPE</th>
			 					
			 				
			 	</tr>
				<%
					while(rs.next())
					{
		   		%>
		   			    <tr>
		   					<th><input type=text name=t1 value=<%=rs.getString(1)%> /></th>
		   					<th><input type=text name=t2 value=<%=rs.getString(2)%> /></th>
		   					<th><input type=submit name=b1 value="Update">
		   					
		   				</tr>
		   			<%
		   			}
		   			%>
		   		</form>
				</table>
				<%		
			}
	    	catch(Exception ex)
			{
			       JOptionPane.showMessageDialog(null,ex);
			}
	}
	%>
