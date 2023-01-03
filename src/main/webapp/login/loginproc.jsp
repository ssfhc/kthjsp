<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%
String id = request.getParameter("id");
String password = request.getParameter("password");

String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "hr";
String pw = "123456";
	 
Class.forName(driver);
Connection conn = DriverManager.getConnection(url,user,pw);
//접속성공상태
String sql = "select id,pwd from nmember where id=?";		
PreparedStatement pstmt=conn.prepareStatement(sql);
pstmt.setString(1 , id);
ResultSet rs = pstmt.executeQuery();
/* rs.next();
System.out.println("id : "+rs.getString("id")+":: pwd : "+rs.getString("pwd")); */


//아이디 , 비밀번호 일치판정해보기--------------------------------------------------------------------------------
String ypass="";
int x = -1;
String msg = "";
if(rs.next()){ // 입력한 아이디가 nmember에 데이터로 존재할때 
	//System.out.println("아이디있음");
	ypass = rs.getString("pwd");
	if(ypass.equals(password)){ //입력한 password가 nmember의 pwd데이터와 일치하면
		x = 1;
	}else{ // 아이디는 일치하는데 password가 불일치
		x = 0;
	}
}else{ // 입력한 아이디가 nmember에 존재하지않을때
	//System.out.println("아이디없음");
	x = -1;
}
System.out.println("x value : "+x);

//x값으로 전송위치를 결정해보기----------------------------------------------------------------------------------
if(x==1){ //login성공시 세션에 저장 , MainForm.jsp로
	session.setAttribute("sessionID", id);
	msg = "../index.jsp";
}else if(x==0){
	msg = "loginForm.jsp?msg=0";
}else{
	msg = "loginForm.jsp?msg=-1";
}
response.sendRedirect(msg);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my jsp file</title>
</head>
<body>
<h3>loginproc</h3>
아이디 : <%=id %> <br />
비밀번호 : <%=password %>
</body>
</html>