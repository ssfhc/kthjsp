<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my jsp file</title>
</head>
<body>
<h3>noticeReg</h3>
<form action="noticeRegPro.do" method="post">
	<dl>
		<dt>제목</dt>
		<dt>
			<input type="text" name="title" />
		</dt>
	</dl>
	<dl>
		<dt>첨부파일</dt>
		<dt>
			<input type="file" name="txtFile" />
		</dt>
	</dl>aaa
	<div>
		<textarea name="content" id="txtcontent" class="txtcontent">aaa</textarea>
	
	
	</div>
	<input type="submit" value="save" />
	<input type="button" value="cancel" class="cancel" />



</form>
</body>
</html>