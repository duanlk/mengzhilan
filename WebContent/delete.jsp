<%@ page language="java" import="utils.DBUtils,java.util.*,java.sql.*,java.io.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>删除</title>
</head>
<body>
		<%!
		
		public int update(String sql,Object...agrs) {
			Connection connection=DBUtils.getConnection();
			PreparedStatement prepareStatement = null;
			try {

				prepareStatement = connection.prepareStatement(sql);
				for (int i = 0; i < agrs.length; i++) {
					prepareStatement.setObject(i + 1, agrs[i]);
				}
				int result = prepareStatement.executeUpdate();
				
				return  result;
				
				
			} catch (SQLException e) {

				e.printStackTrace();
			} finally {
				DBUtils.close(null, prepareStatement);
			}
			return 0;
		}
		
		%>
		
		<% 
			 String id=request.getParameter("id");
		
			String sql="delete from `order` where id=?";
			int i=update(sql,Integer.parseInt(id));
			if(i>0){
				response.sendRedirect("query.jsp");
			}
		
		%>
		
		
</body>
</html>