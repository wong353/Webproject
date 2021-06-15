<%@page import="java.io.PrintWriter"%>
<%@page import="com.mysql.cj.x.protobuf.MysqlxCursor.Open"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="include/dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	let confirm = confirm('상품을 삭제하시겠습니까?');
	if(confirm==false){
		location.href=history.back(-1);
	}
</script>
<%
	request.setCharacterEncoding("utf-8");
	
	String p_id = request.getParameter("p_id");
	String pg = request.getParameter("pg");
	
	try{
		String sql = "DELETE FROM product WHERE p_id = ? ";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, p_id);
		pstmt.executeUpdate();
%>	
		<script type="text/javascript">
			alert('삭제 성공했습니다.');
			location.href= productList.jsp?pg=<%=pg%>;
		</script>
<%		
	}catch (Exception e){
		e.printStackTrace();
		out.print(e.getMessage());
	}finally{
		if(pstmt!=null)pstmt.close();
		if(conn!=null)conn.close();
	}
%>
</body>
</html>