<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="DBPKG.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원 정보수정</title>
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
	String sql = "SELECT CUSTNO, CUSTNAME, PHONE, ADDRESS, " +
			"TO_CHAR(JOINDATE,'YYYY-MM-DD') JOINDATE, " +
			"GRADE, CITY " +
			"FROM MEMBER_TBL_02 "
			+ "WHERE CUSTNO = " + request.getParameter("custno");
	Connection con = DBConnection.getConnection(); // db 접속
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	rs.next(); // db에서 가져온 자료가 한개
	
	%>

	<section class="section">
		<h2>쇼핑몰 회원 정보수정</h2>
		<form action="dbUpdate.jsp" method="POST" name="mInform" onsubmit="return inputCheck('mo')">
			<table>
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="text" name="custno" readonly value="<%=rs.getString("custno") %>"></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname" value="<%=rs.getString("custname") %>"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone" value="<%=rs.getString("phone") %>"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address" size="50" value="<%=rs.getString("address") %>"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate" value="<%=rs.getString("joindate") %>"></td>
				</tr>
				<tr>
					<th>고객등급</th>
					<td><input type="text" name="grade" value="<%=rs.getString("grade") %>"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city" value="<%=rs.getString("city") %>"></td>
				</tr>
				<tr>
					<td class = "btn" colspan="2"><input type="submit" value="수정"> <input type="button"
						value="조회" onclick="return search()"></td>
				</tr>
			</table>
		</form>
	</section>
</body>
</html>