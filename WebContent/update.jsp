<%@ page language="java" import="utils.DBUtils,java.util.*,java.sql.*,java.io.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("utf-8");
%>   

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改</title>
</head>
<body>
	<%
	
	request.setCharacterEncoding("utf-8");
	String id1=request.getParameter("id");
	
	if(id1!=null){
		int id2=Integer.parseInt(id1);
		
		String sql="select * from `order` where id=?";
		Connection conn=DBUtils.getConnection();
		PreparedStatement ps= conn.prepareStatement(sql);
		ps.setInt(1, id2);
		ResultSet resultSet=ps.executeQuery();
		
		while(resultSet.next()){
			int id=resultSet.getInt(1);
			String name=resultSet.getString(2);
			String mation=resultSet.getString(3);
			int time=resultSet.getInt(4);
			String address=resultSet.getString(5);
			double amount=resultSet.getDouble(6);
			String state=resultSet.getString(7);
		
		
		
		%>
		<form action="#" method="post">
			订餐人：<input type="text" name="name" value="<%=name%>"><br>
			菜品信息：<input type="text" name="mation"  value="<%=mation%>"><br>
			送餐时间：<input type="text" name="times" value="<%=time%>"><br>
			送餐地址：<input type="text" name="address" value="<%=address%>"><br>
			总金额：<input type="text" name="amount" value="<%=amount%>"><br>
			订单状态：<input type="text" name="state" value="<%=state%>"><br>
			<input type="submit" value="修改"><br>
			</form>

		<%
		
		}
		
	}
	
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
	
	<%
	String method=request.getMethod();
	
		if(method.equals("POST")){
			String id=request.getParameter("id");
			
		String name=request.getParameter("name");
		String mation=request.getParameter("mation");
		String times=request.getParameter("times");
		String address=request.getParameter("address");
		String amount=request.getParameter("amount");
		String state=request.getParameter("state");
		
		int time=Integer.parseInt(times);
		double 	amounts=	Double.parseDouble(amount);
		String sql1="UPDATE `order` SET  name=?,mation=?,times=?,address=?,amount=?,state=? WHERE id=?";
		
		int i=update(sql1,name,mation,time,address,amounts,state,id);
		if(i>0){
				response.sendRedirect("query.jsp");
		}
	}

	
	%>
	

</body>
</html>