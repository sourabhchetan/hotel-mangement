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
	if(btnval.equalsIgnoreCase("save")) 
	{
		String t1=request.getParameter("t1");
		String t2=request.getParameter("t2");
		String t3=request.getParameter("t3");
		String t4=request.getParameter("t4");
		String t5=request.getParameter("t5");
		String t6=request.getParameter("t6");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hotel", "hotel");
			PreparedStatement psmt=conn.prepareStatement("insert into reservation values(?,?,?,?,?,?)");
			psmt.setString(1,t1);
			psmt.setString(2,t2);
			psmt.setString(3,t3);
			psmt.setString(4,t4);
			psmt.setString(5,t5);
			psmt.setString(6,t6);
			psmt.executeQuery();
			out.println("<script> alert('RECORD SAVED');</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}
	//deleting the data
		if(btnval.equalsIgnoreCase("delete")) 
			{
				String t1=request.getParameter("t1");
				
				try
				{
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hotel", "hotel");
					PreparedStatement psmt=conn.prepareStatement("delete from reservaion where reser_id=?");
					psmt.setString(1,t1);
					psmt.executeQuery();
					out.println("<script> alert('RECORD DELETED');</script>");
				}
				catch(Exception e)
				{
					out.println(e.toString());
				}
			}
	
		//Searching
		if(btnval.equalsIgnoreCase("allsearch"))
		{
		 try
		 {
			  ResultSet rs;
			  Class.forName("oracle.jdbc.driver.OracleDriver");
			  Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hotel","hotel");
			  Statement smt=conn.createStatement();
			  rs=smt.executeQuery("select * from reservation");
		%>
			   <table border=1>
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
		   					<th><%=rs.getString(1)%></th>
		   					<th><%=rs.getString(2)%></th>
		   					<th><%=rs.getString(3)%></th>
		   					<th><%=rs.getString(4)%></th>
		   					<th><%=rs.getString(5)%></th>
		   					<th><%=rs.getString(6)%></th>
		   				</tr>
		   		<%
		   		}
		   		%>
				</table>
		<%		
		}
			catch(Exception ex)
			{
			       JOptionPane.showMessageDialog(null,ex);

			}
	}

//Particular Search
	if(btnval.equalsIgnoreCase("psearch"))
		{
		 try
		 {
			  String t1=request.getParameter("t1");
			  ResultSet rs;
			  Class.forName("oracle.jdbc.driver.OracleDriver");
			  Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hotel","hotel");
			  Statement smt=conn.createStatement();
			  rs=smt.executeQuery("select * from reservation where reser_id='"+t1+"' order by reser_id");
		%>
			   <table border=1>
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
		   					<th><%=rs.getString(1)%></th>
		   					<th><%=rs.getString(2)%></th>
		   					<th><%=rs.getString(3)%></th>
		   					<th><%=rs.getString(4)%></th>
		   					<th><%=rs.getString(5)%></th>
		   					<th><%=rs.getString(6)%></th>
		   				</tr>
		   		<%
		   		}
		   		%>
				</table>
		<%		
		}
			catch(Exception ex)
			{
			       JOptionPane.showMessageDialog(null,ex);

			}
	}

	//UPDATE
	if(btnval.equalsIgnoreCase("update"))   //from room_class_updateinfo
	{
		String t1=request.getParameter("t1");
		String t2=request.getParameter("t2");
		String t3=request.getParameter("t3");
		String t4=request.getParameter("t4");
		String t5=request.getParameter("t5");
		String t6=request.getParameter("t6");
	
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hotel", "hotel");
			PreparedStatement psmt=conn.prepareStatement("update reservation set cust_id=?,room_id=?,reser_date=?,date_in=?,date_out=? where reser_id=?");
			psmt.setString(6,t1);
			psmt.setString(1,t2);
			psmt.setString(2,t3);
			psmt.setString(3,t4);
			psmt.setString(4,t5);
			psmt.setString(5,t6);
			psmt.executeQuery();
			out.println("<script> alert('RECORD UPDATED');</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}
%>
</body>
</html>