<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<style>
body {
	font-family: Pretendard-Regular, Arial, sans-serif;
	background-color: #f5f5f5;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.container {
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	width: 400px;
	padding: 20px;
}

.container h2 {
	margin-top: 0;
	text-align: center;
}

.container form {
	display: flex;
	flex-direction: column;
}

.container form label {
	margin-bottom: 5px;
	font-weight: bold;
}

.container form input {
	margin-bottom: 10px;
	padding: 10px;
	font-size: 14px;
	border: 1px solid #ddd;
	border-radius: 5px;
}

.container form input[type="password"] {
	position: relative;
}

.password-requirements {
	display: none;
	flex-wrap: wrap;
	margin-bottom: 10px;
}

.password-requirements span {
	display: flex;
	align-items: center;
	margin-bottom: 5px;
	margin-right: 5px;
	padding: 5px;
	border-radius: 5px;
}

.password-requirements span.invalid {
	color: #dc3545;
	background-color: #f8d7da;
}

.password-requirements span.valid {
	color: #28a745;
	background-color: #d4edda;
}

.password-requirements span::before {
	content: '✖';
	margin-right: 5px;
}

.password-requirements span.valid::before {
	content: '✔';
}

.email {
	display: flex;
}

.email input {
	display: inline-block;
	align-content: center;
}

.email input:last-of-type {
	width: 201px;
}

.email span {
	display: inline-block;
	padding: 0 2px;
	padding-top: 10px;
}

.address input#postcode {
	margin-bottom: 2px;
}

.address-detail {
	display: flex;
	flex-direction: column;
}

.address-detail input#address {
	margin-bottom: 2px;
}

.container form button {
	background-color: #007bff;
	color: #fff;
	padding: 10px;
	font-size: 16px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.container form button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<div class="container">
		<h2>회원가입</h2>
		<form action="member-join-pro" novalidate name="joinForm" method="post" onsubmit ="return chkform(this)">

			<label for="memberId">아이디</label> <input type="text" id="memberId"
				name="memberId" placeholder="아이디"> <label for="pw">비밀번호</label>
			<input type="password" id="pw" name="memberPw" oninput="validatePassword()">
			<div class="password-requirements" id="password-requirements">
				<span id="uppercase" class="invalid">영어 대문자</span> <span
					id="lowercase" class="invalid">영어 소문자</span> <span id="number"
					class="invalid">숫자</span> <span id="special" class="invalid">특수문자</span>
				<span id="length" class="invalid">8자 이상</span>
				<!-- <span id="no-personal-info" class="invalid">개인정보 미포함</span> -->
			</div>

			<label for="checkPw">비밀번호 확인</label> <input type="password"
				id="checkPw" name="checkPw"
				onfocus="showPasswordRequirements()"> <label for="name">이름</label>
			<input type="text" id="name" name="name" placeholder="이름"> <label
				for="gender">성별</label>
			<div class="gender">
				<input type="radio" id="gender" name="gender" value="1">남자 <input
					type="radio" id="gender" name="gender" value="2">여자
			</div>

			<label for="email">이메일</label> <input type="text" name="email"
				class="form-control" id="email" placeholder="you@example.com"
				required> <label for="phone">전화번호</label> <input type="text"
				id="phone" name="phone" placeholder="010-1234-5678"> <label
				for="birth">생년월일</label> <input type="text" id="birth" name="birth"
				placeholder="YYYY-MM-DD">

			<button type="submit">가입하기</button>
		</form>
	</div>

	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script>
//         function showPasswordRequirements() {
//             document.getElementById('password-requirements').style.display = 'flex';
//             validatePassword();
//         }

//         function validatePassword() {
//             const pw= document.getElementById('memberPw').value;
//             const name = document.getElementById('name').value;
//             const phone = document.getElementById('phone').value;

//             const uppercase = /[A-Z]/.test(password);
//             const lowercase = /[a-z]/.test(password);
//             const number = /[0-9]/.test(password);
//             const special = /[~!@#$%^&*(),.?":{}|<>]/.test(password);
//             const length = password.length >= 8;
//             const noPersonalInfo = !password.includes(name) && !password.includes(phone);

//             document.getElementById('uppercase').classList.toggle('invalid', !uppercase);
//             document.getElementById('uppercase').classList.toggle('valid', uppercase);
//             document.getElementById('lowercase').classList.toggle('invalid', !lowercase);
//             document.getElementById('lowercase').classList.toggle('valid', lowercase);
//             document.getElementById('number').classList.toggle('invalid', !number);
//             document.getElementById('number').classList.toggle('valid', number);
//             document.getElementById('special').classList.toggle('invalid', !special);
//             document.getElementById('special').classList.toggle('valid', special);
//             document.getElementById('length').classList.toggle('invalid', !length);
//             document.getElementById('length').classList.toggle('valid', length);
//             document.getElementById('no-personal-info').classList.toggle('invalid', !noPersonalInfo);
//             document.getElementById('no-personal-info').classList.toggle('valid', noPersonalInfo);
//         }
        
        function chkform(f){
        	   alert(f.memberPw.value==f.checkPw.value)
        	   if(f.memberPw.value != f.checkPw.value){
        	      f.focus()
        	      return false
        	   }
        	   return true
        }
        
    </script>
</body>
</html>
