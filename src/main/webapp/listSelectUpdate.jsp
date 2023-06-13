<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="DBPKG.*" %>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록조회/수정</title>
</head>
<style>
th{
width:120px;
}
td{
text-align: center;
}
th:nth-child(2){

}
th:nth-child(4){
width: 250px;
}

</style>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section class="section">
<%
	String sql = "SELECT CUSTNO, CUSTNAME, PHONE, ADDRESS, " +
				"TO_CHAR(JOINDATE,'YYYY-MM-DD') JOINDATE, " +
				"GRADE, CITY " +
				"FROM MEMBER_TBL_02";

	Connection con = DBConnection.getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	// DECODE(GRADE, 'A', 'VIP', 'B', '일반', 'C', '직원') 대신 사용해볼 수 있는 방법

%>
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
<%
while(rs.next()){
	String newGrade = rs.getString("grade");
	switch(newGrade){
	case "A" : {
		newGrade = "VIP";
		break;
	}
	case "B" : {
		newGrade = "일반";
		break;
	}
	case "C" : {
		newGrade = "직원";
		break;
	}
	}
%>
<tr>
<td><a href="update.jsp?custno=<%=rs.getString("custno")%>"><%=rs.getString("custno")%></a></td>
<td><%=rs.getString("custname") %></td>
<td><%=rs.getString("phone") %></td>
<td><%=rs.getString("address") %></td>
<td><%=rs.getString("joindate") %></td>
<td><%=newGrade %></td>
<td><%=rs.getString("city") %></td>
</tr>
<%} 
DBConnection.getClose(con, pstmt, rs);
%>
</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>