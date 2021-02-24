<%@ page language="java" import="utils.DBUtils,java.util.*,java.sql.*,java.io.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>新增</title>
</head>
<body>
	<%
	
	request.setCharacterEncoding("utf-8");
	
	%>
	
	<%!
	public int update(String sql, Object... agrs) {
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
	
	
	<form action="insert.jsp" method="post">
		订餐人：<input type="text" name="name"><br>
		菜品信息：<input type="text" name="mation"><br>
		送餐时间：<input type="text" name="times"><br>
		送餐地址：<input type="text" name="address"><br>
		总金额：<input type="text" name="amount"><br>
		订单状态：<input type="text" name="state"><br>
		<input type="submit" value="提交"><br>
		
	</form>
	
	
	<%
	String method=request.getMethod();
	
		if(method.equals("POST")){
		String name=request.getParameter("name");
		String mation=request.getParameter("mation");
		String times=request.getParameter("times");
		String address=request.getParameter("address");
		String amount=request.getParameter("amount");
		String state=request.getParameter("state");
		
		int time=Integer.parseInt(times);
		double 	amounts=	Double.parseDouble(amount);
		
		String sql="insert into `order`(name,mation,times,address,amount,state) values(?,?,?,?,?,?)";
		int i=update(sql,name,mation,time,address,amounts,state);
		if(i>0){
				response.sendRedirect("query.jsp");
		}
		}
	

	
	%>
	

</body>
</html>