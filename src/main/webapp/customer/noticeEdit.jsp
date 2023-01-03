
<%-- <%@page import="notice.vo.Notice"%>
<%@page import="notice.dao.NoticeDao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <%
/*  String seq = request.getParameter("c");
 if(seq==null)
	 seq="1";
 NoticeDao dao = new NoticeDao();
 Notice n = dao.getNotice(seq); */
 
 
 
/* String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "hr";
String pw = "123456";
 
Class.forName(driver);
Connection conn = DriverManager.getConnection(url,user,pw);
//접속성공상태
//String sql = "select * from notices where seq='"+seq+"'";
String sql = "select * from notices where seq=?";  
 //실행
 //Statement st = conn.createStatement();
 PreparedStatement pstmt = conn.prepareStatement(sql);
 pstmt.setString(1, seq);
 ResultSet rs = pstmt.executeQuery();
rs.next();
System.out.print("value : "+rs.getString("title")); */
%>     
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my jsp file</title>
<link rel="stylesheet" href="../css/nstyle.css" />
</head>
<body>
<h3>noticeEdit</h3>

<form action="noticeEditProc.do "method="get">

<table class="twidth">

	<colgroup>
		<col width="15%" />
		<col width="35%" />
		<col width="5%" />
		<col width="35%" />
	</colgroup>
	<caption>Modify</caption>
	<tbody>
		<tr>
			<th class="left">글번호</th>		
			<td>${n.seq }</td>
			<th class="left">조회수</th>		
			<td>${n.hit }</td>
		</tr>
		<tr>
			<th class="left">작성자</th>		
			<td>${n.writer }</td>
			<th class="left">작성시간</th>		
			<td>${n.regdate }</td>
		</tr>
		<tr>
			<th class="left">제목</th>		
			<td colspan="3" id="title">
			<input type="text"  name="title" value="${n.title }"/>
			</td>

		</tr>
		<tr>
			<th class="left">내용</th>		
			<td colspan="3" id="content">
			<textarea class="txt" name="content">${n.content }</textarea>
			</td>

		</tr>
		<tr>
			<th class="left">첨부</th>		
			<td colspan="3" id="addfile">첨부</td>

		</tr>
	</tbody>


</table>
<div>
	<input type="hidden" name="c" value="${n.seq }" />      <!-- (input type="hidden") 숨겨진 입력 필드는 폼 제출 시에 사용자가 변경해서는 안 되는 데이터를 함께 보낼 때 유용하게 사용된다. -->
																			<!-- 예를 들면, 수정할 게시글이 데이터베이스 테이블에서 가지고 있는 Primary Key 값이 이에 해당될 수 있다. -->
	<input type="submit" value="수정" />
	<a href="noticeDetail.jsp?c=${n.seq }">취소</a>

</div>
</form>

</body>
</html>


<%

%>
