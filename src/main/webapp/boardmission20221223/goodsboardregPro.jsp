<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my jsp file</title>
</head>
<body>
<h3>goodsboardregPro</h3>
    
<%
String gname = request.getParameter("gname");
String gdescribe = request.getParameter("gdescribe");
String gprice = request.getParameter("gprice");




Connection conn = null;
PreparedStatement pstmt = null;

String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "hr";
String pw = "123456";


try{
	Class.forName(driver);
	conn = DriverManager.getConnection(url,user,pw);
	String sql = "insert into boardmission(gnum,gname,gdescribe,gprice,gdate)";
			sql +="values((select max(to_number(gnum))+1 from boardmission),?,?,?,systimestamp)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, gname);
	pstmt.setString(2, gdescribe);
	pstmt.setString(3, gprice);
	pstmt.executeUpdate();
}catch(Exception e){
	e.printStackTrace();
}
response.sendRedirect("goodsboard.jsp");
%>  
    
    
    

</body>
</html>