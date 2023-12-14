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
			  rs=smt.executeQuery("select * from reservation where reser_id='"+t1+"'");
%>
			   <table border=1>
			   <form name=f method=post action=reservation.jsp>
				  <tr>
			 					<th>RESERVATION ID</th>
			 					<th>CUSTOMER ID</th>
			 					<th>ROOM ID</th>
			 					<th>RESERVATION DATE</th>
			 					<th>DATE IN</th>
			 					<th>DATE OUT</th>
			 				
			 	</tr>
				<%
					while(rs.next())
					{
		   		%>
		   			    <tr>
		   					<th><input type=text name=t1 value=<%=rs.getString(1)%> /></th>
		   					<th><input type=text name=t2 value=<%=rs.getString(2)%> /></th>
		   					<th><input type=text name=t3 value=<%=rs.getString(3)%> /></th>
		   					<th><input type=text name=t4 value=<%=rs.getString(4)%> /></th>
		   					<th><input type=text name=t5 value=<%=rs.getString(5)%> /></th>
		   					<th><input type=text name=t6 value=<%=rs.getString(6)%> /></th>
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
