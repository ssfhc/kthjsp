<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my jsp file</title>
</head>
<body>
<h3>goodsboardreg</h3>
<form action="goodsboardregPro.jsp" method="post">
	<dl>
		<dt>이름</dt>
		<dt>
			<input type="text" name="gname" />
		</dt>
		<dt>설명</dt>
		<dt>
			<input type="text" name="gdescribe" />
		</dt>
		<dt>가격</dt>
		<dt>
			<input type="text" name="gprice" />
		</dt>
	</dl>
	<input type="submit" value="작성" />
</form>
</body>
</html>