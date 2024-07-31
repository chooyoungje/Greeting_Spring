<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<style>
body {
	font-family: Arial, sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
	background-color: #f5f5f5;
}

.container {
	text-align: center;
	background-color: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.logo {
	width: 200px;
	height: 100%;
}

.title {
	font-size: 24px;
	margin-top: 10px;
}

.subtitle {
	color: gray;
	margin-top: 5px;
	margin-bottom: 20px;
}

.input-group {
	margin-bottom: 20px;
}

.input-group input {
	width: 90%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
	text-align: center;
}

.button {
	width: 100%;
	padding: 10px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 4px;
	font-size: 16px;
	cursor: pointer;
}

.signup {
	margin-top: 20px;
	color: gray;
}

.signup a {
	color: #007bff;
	text-decoration: none;
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 100%;
	margin-bottom: 20px;
}

.header .left {
	flex: 1;
	display: flex;
	justify-content: flex-start;
}

.header .right {
	flex: 1;
	display: flex;
	justify-content: flex-end;
}

.header a {
	color: #000;
	text-decoration: none;
	font-size: 14px;
	margin-right: 20px;
}

.header a:hover {
	color: #007bff;
}
</style>
</head>
<body>
	<div class="container">
		<form action="member-login-pro" novalidate name="loginForm"
			method="post">
			<div class="header">
				<div class="left">
					<a href="${pageContext.request.contextPath}/member/main">홈</a>
				</div>
				<div class="right">
					<a href="${pageContext.request.contextPath}/member/member-login">개인</a>
					<a href="${pageContext.request.contextPath}/business/business-login">기업</a>
				</div>
			</div>
			<img src="https://ifh.cc/g/hqvWJG.png" alt="Logo" class="logo">
			<div class="title">개인 로그인</div>
			<div class="subtitle">사용중이신 개인 아이디를 입력해 주세요.</div>
			<div class="input-group">
				<input type="text" id="memberId" name="memberId" placeholder="아이디">
				<input type="password" id="memberPw" name="memberPw" placeholder="비밀번호">
			</div>
			<button class="button">계속</button>
			<div class="signup">
				계정이 없으신가요? <a
					href="${pageContext.request.contextPath}/member/member-join">가입하기</a>
			</div>
<!-- 			<ul> -->
<!-- 				<li onclick="kakaoLogin();"><a href="javascript:void(0)"> <span>카카오 -->
<!-- 							로그인</span> -->
<!-- 				</a></li> -->
<!-- 				<li onclick="kakaoLogout();"><a href="javascript:void(0)"> -->
<!-- 						<span>카카오 로그아웃</span> -->
<!-- 				</a></li> -->
<!-- 			</ul> -->

		</form>
	</div>
</body>
</html>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('48f115071e6b4e6f19812ba3b37d7502'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>
