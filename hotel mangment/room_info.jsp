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
		
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hotel", "hotel");
			PreparedStatement psmt=conn.prepareStatement("insert into room_info values(?,?)");
			psmt.setString(1,t1);
			psmt.setString(2,t2);
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
					PreparedStatement psmt=conn.prepareStatement("delete from room_info where room_id=?");
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
			  rs=smt.executeQuery("select * from room_info");
		%>
			   <table border=1>
				  <tr>
			 					<th>ROOM ID</th>
			 					<th>ROOM TYPE</th>
			 					
			 	</tr>
				<%
				while(rs.next())
				{
		   		%>
		   			    <tr>
		   					<th><%=rs.getString(1)%></th>
		   					<th><%=rs.getString(2)%></th>
		   					
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
			  rs=smt.executeQuery("select * from room_info where room_id='"+t1+"' order by room_id");
		%>
			   <table border=1>
				  <tr>
			 					<th>ROOM ID</th>
			 					<th>ROOM TYPE</th>
			 					
			 	</tr>
				<%
				while(rs.next())
				{
		   		%>
		   			    <tr>
		   					<th><%=rs.getString(1)%></th>
		   					<th><%=rs.getString(2)%></th>
		   					
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

	//update
	
		if(btnval.equalsIgnoreCase("update"))   //from room_class_updateinfo
		{
			String t1=request.getParameter("t1");
			String t2=request.getParameter("t2");
		
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hotel", "hotel");
				PreparedStatement psmt=conn.prepareStatement("update room_info set room_type=? where room_id=?");
				psmt.setString(2,t1);
				psmt.setString(1,t2);
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