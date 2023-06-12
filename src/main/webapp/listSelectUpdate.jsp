<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록조회/수정</title>
</head>
<style>
th{
width:100px;
}
th:nth-child(2){

}
th:nth-child(4){
width: 200px;
}

</style>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section class="section">
<h2>회원목록조회/수정</h2>
<table>
<tr>
<th>회원번호</th>
<th>회원성명</th>
<th>전화번호</th>
<th>주소</th>
<th>가입일자</th>
<th>고객등급</th>
<th>거주지역</th>
</tr>
<tr>
<td><a href="update.jsp"></a></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>