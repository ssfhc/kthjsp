<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "hr";
String pw = "123456";

Class.forName(driver);
Connection conn = DriverManager.getConnection(url,user,pw);

String sql = "select * from boardmission order by to_number(gnum) desc";

Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(sql);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my jsp file</title>
</head>
<body>
<h3>goodsboard</h3>
<table width="500" border = "1" >
	<tr>
		<td>번호</td>
		<td>이름</td>
		<td>설명</td>
		<td>가격</td>
		<td>등록날짜</td>		
	</tr>
<%
	while(rs.next()){	
%>
	<tr>
		<td><%=rs.getString("gnum") %></td>
		<td>
		<a href="goodsboardDetail.jsp?c=<%=rs.getString("gnum") %>"><%=rs.getString("gname") %></a>
		</td>
		<td><%=rs.getString("gdescribe") %></td>
		<td><%=rs.getString("gprice") %></td>
		<td><%=rs.getString("gdate") %></td>
	</tr>
<%
}
%>
</table>
<a href="goodsboardreg.jsp">글쓰기</a>
</body>
</html>
<%
rs.close();
st.close();
conn.close();
%>