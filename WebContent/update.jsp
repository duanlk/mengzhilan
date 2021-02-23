<%@ page language="java" import="utils.DBUtils,java.util.*,java.sql.*,java.io.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String sql="select * from `order` where id = " +id;
	Connection conn=DBUtils.getConnection();
	PreparedStatement ps= conn.prepareStatement(sql);
	ResultSet resultSet=ps.executeQuery();
	
	while(resultSet.next()){
		int id1=resultSet.getInt(1);
		String name=resultSet.getString(2);
		String mation=resultSet.getString(3);
		int time=resultSet.getInt(4);
		String address=resultSet.getString(5);
		double amount=resultSet.getDouble(6);
		String state=resultSet.getString(7);
		%>
		<form method= "post">
		订餐人:<input value="<%=name%>" name = "name"><br>
		点餐信息:<input value="<%=mation%>" name = "mation"><br>
		订餐时间:<input value="<%=time%>" name = "time"><br>
		订餐地址:<input value="<%=address%>" name = "adress"><br>
		价格:<input value="<%=amount%>" name = "amount"><br>
		状态:<input value="<%=state%>" name = "state"><br>
		<input type = "submit" name="Submit" value="修改提交"/>
		</form>
	<%
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
	String id1 = request.getParameter("id");
	String methodName = request.getMethod();
	out.print(methodName);
	if(methodName.equals("POST")){
	 	String name1 = request.getParameter("name");
		String mation1 = request.getParameter("mation");
	 	String time1 = request.getParameter("time");
	 	String adress1 = request.getParameter("adress");
	 	String amount1 = request.getParameter("amount");
	 	String state = request.getParameter("state");
	 	
	 	String sql1="update `order` set name = ?,mation = ?,times = ?,address = ?,amount = ?,state = ? where id= " +id1;
	 	int i=update(sql1,name1,mation1,time1,adress1,amount1,state);
	 	if(i>0){
		 	response.sendRedirect("query.jsp");
	 	}
	}
	%>
</body>
</html>