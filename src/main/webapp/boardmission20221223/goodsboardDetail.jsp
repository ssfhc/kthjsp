<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 String gnum = request.getParameter("c");
 if(gnum==null)
	 gnum="1";
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "hr";
String pw = "123456";
 
Class.forName(driver);
Connection conn = DriverManager.getConnection(url,user,pw);
//접속성공상태
//String sql = "select * from notices where seq='"+seq+"'";
String sql = "select * from boardmission where gnum=?";  
 //실행
 //Statement st = conn.createStatement();
 PreparedStatement pstmt = conn.prepareStatement(sql);
 pstmt.setString(1, gnum);
 ResultSet rs = pstmt.executeQuery();
rs.next();
System.out.print("value : "+rs.getString("gname"));
%>




     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my jsp file</title>
<link rel="stylesheet" href="../css/goodsboardmission.css" />
</head>
<body>
<h3>goosboardDetail</h3>

<table class="twidth">
	<colgroup>
		<col width=15%/>
		<col width=35%/>
		<col width=5%/>
		<col width=35%/>
	</colgroup>
	<caption>detail</caption>
	<tbody>
		<tr>
			<th class="left">번호</th>		
			<td><%=rs.getString("gnum") %></td>
			<th class="left">이름</th>		
			<td><%=rs.getString("gname") %></td>
		</tr>
		<tr>
			<th class="left">설명</th>		
			<td><%=rs.getString("gdescribe") %></td>
			<th class="left">가격</th>		
			<td><%=rs.getString("gprice") %></td>
		</tr>
		<tr>
			<th class="left">등록날짜</th>		
			<td><%=rs.getDate("gdate") %></td>

		</tr>
	</tbody>


</table>
<a href="goodsboard.jsp">목록으로</a>
</body>
</html>

<%
rs.close();
pstmt.close();
conn.close();
%>