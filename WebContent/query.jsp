<%@ page language="java" import="utils.DBUtils,java.util.*,java.sql.*,java.io.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>列表</title>
</head>
<body>

		<table  border="1" >
		<tr>
		<th>订单编号</th> 
		<th>订单人</th> 
		<th>点餐信息</th> 
		
		<th>订餐时间</th>
		<th>订餐地址</th>
		<th>价格</th>
		<th>状态</th>
		
		<th colspan="3">操作</th>
		</tr>
		
		
		
		<%
		String URI=request.getRequestURI();
			String sql="select * from `order`";
			Connection conn=DBUtils.getConnection();
			PreparedStatement ps= conn.prepareStatement(sql);
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
				<tr>
				<td><%=id %></td>
				<td><%=name %></td>
				<td><%=mation %></td>
				<td><%=time %></td>
				<td><%=address %></td>
				<td><%=amount %></td>
				<td><%=amount %></td>
				<td><a href="delete.jsp?id=<%=id%>" >删除</a></td>
				<td><a href="update.jsp?id=<%=id%>"  >更新</a></td>
				
				
				</tr>
				
				
				
				
				<!-- out.print("<tr> <td>"+id+"</td> <td>"
				+name+"</td> <td>"+mation+"</td> <td>"
						+time+"</td>  <td>"+address+"</td> <td>"
				+amount+"</td> <td>"+state+"</td> <td><a href="+URL+">删除</a></td></tr>"); -->
			<%}%>
			
			<a href="insert.jsp" >新增</a>
			
			
		
		
		
		</table>
		
		
</body>
</html>