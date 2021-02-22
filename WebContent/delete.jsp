<%@ page language="java" import="utils.DBUtils,java.util.*,java.sql.*,java.io.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<%
		String id=request.getParameter("id");
		%>
		<%!
		
		public int delete(String id){
			String sql = "delete * from order where id=?";
			Connection conn = DBUtils.getConnection();
			int result = 0; 
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, Integer.valueOf(id));
			result = ps.executeUpdate();
			return result;
		} 
	
		
		
		%>
		<%=id %>
</body>
</html>