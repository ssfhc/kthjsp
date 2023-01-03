
<%@page import="notice.dao.NoticeDao"%>
<%@page import="notice.vo.Notice"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 전달된 param 받아서 데이터베이스의 해당글을 수정
이 페이지를 noticeDetail.jsp로 보내기 -->
<%
/* request.setCharacterEncoding("utf-8");

String num = request.getParameter("c");
String title = request.getParameter("title");
String content = request.getParameter("content");

Notice n = new Notice();
n.setTitle(title);
n.setContent(content);
n.setSeq(num);

NoticeDao dao = new NoticeDao();
int cnt = dao.update(n); */

/* String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "hr";
String pw = "123456";
 
Class.forName(driver);
Connection conn = DriverManager.getConnection(url,user,pw);
//접속성공상태
//String sql = "select * from notices where seq='"+seq+"'";
String sql = "update notices set title = ? , content = ? where seq = ?";  
 //실행
 //Statement st = conn.createStatement();
 PreparedStatement pstmt = conn.prepareStatement(sql);
 pstmt.setString(1, title);
 pstmt.setString(2, content);
 pstmt.setString(3, num);
 

 int cnt = pstmt.executeUpdate(); */
 
 
/*  if(cnt>0){
	 response.sendRedirect("noticeDetail.do?c="+num);
 } */
%>

