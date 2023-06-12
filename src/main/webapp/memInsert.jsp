<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script>
function inputCheck(){
	
	let fr=document.mInform;
	console.log(fr.custname.value);
	// let custname=document.querySelector('[name=custname]').value;
	if(fr.custno.value==''){
		// custno 데이터가 없으면
		alert("회원번호가 입력되지 않았습니다.");
		fr.custno.focus();
		return false;
	}
	if(fr.custname.value==''){
		// custname 데이터가 없으면
		alert("회원이름이 입력되지 않았습니다.");
		fr.custname.focus();
		return false;
	}
	if(fr.phone.value==''){
		// phone 데이터가 없으면
		alert("회원전화가 입력되지 않았습니다.");
		fr.phone.focus();
		return false;
	}
	if(fr.address.value==''){
		// address 데이터가 없으면
		alert("회원주소가 입력되지 않았습니다.");
		fr.address.focus();
		return false;
	}
	if(fr.joindate.value==''){
		// joindate 데이터가 없으면
		alert("가입일자가 입력되지 않았습니다.");
		fr.joindate.focus();
		return false;
	}
	if(fr.custname.value==''){
		// custno 데이터가 없으면
		alert("회원이름이 입력되지 않았습니다.");
		fr.custname.focus();
		return false;
	}
	if(fr.city.value==''){
		// city 데이터가 없으면
		alert("도시코드가 입력되지 않았습니다.");
		fr.city.focus();
		return false;
	}
	
	alert('회원등록이 완료되었습니다.');
	return true;
}

function search(){
	window.location.href="listSelectUpdate.jsp";
}
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section class="section">
		<h2>쇼핑몰 회원관리 프로그램</h2>
		<form action="dbInsert.jsp" method="POST" name="mInform" onsubmit="return inputCheck()">
			<table>
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="text" name="custno"></td>
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
</html>