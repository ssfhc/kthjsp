
<%@page import="notice.dao.NoticeDao"%>
<%@page import="notice.vo.Notice"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my jsp file</title>
</head>
<body>
<h3>noticeDelProc</h3>
<%
request.setCharacterEncoding("utf-8");

String num = request.getParameter("c");

//Notice n = new Notice();
//n.setSeq(num);

NoticeDao dao = new NoticeDao();
//int cnt = dao.delete(n);
int cnt = dao.delete(num);

/* String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "hr";
String pw = "123456";

Class.forName(driver);
Connection conn = DriverManager.getConnection(url,user,pw);

String sql = "delete from notices where seq = ?";

PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, num);


int cnt = pstmt.executeUpdate(); */
if(cnt>0){
	response.sendRedirect("notice.jsp");
}
%>
</body>
</html>