<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="DBPKG.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
.btn{
text-align: center;
}
input{
height: 30px;
line-height: 30px;
}
</style>
<script src="./js/basic.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
<%
String sql = "select max(custno)+1 from member_tbl_02"; // db의 마지막번호+1 처리
Connection con = DBConnection.getConnection(); // db 접속
PreparedStatement pstmt = con.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
rs.next(); // db에서 가져온 자료가 한개
int maxCustno = rs.getInt(1); // db의 마지막번호 +1, 회원번호
%>

	<section class="section">
		<h2>쇼핑몰 회원관리 프로그램</h2>
		<form action="dbInsert.jsp" method="POST" name="mInform" onsubmit="return inputCheck('in')">
			<table>
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="text" name="custno" readonly="readonly" value="<%=maxCustno%>"></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address" size="50"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate"></td>
				</tr>
				<tr>
					<th>고객등급</th>
					<td><input type="text" name="grade"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city"></td>
				</tr>
				<tr>
					<td class = "btn" colspan="2"><input type="submit" value="등록"> <input type="button"
						value="조회" onclick="return search()"></td>
				</tr>
			</table>
		</form>
	</section>
</body>
<%
DBConnection.getClose(con, pstmt, rs);
%>
</html>