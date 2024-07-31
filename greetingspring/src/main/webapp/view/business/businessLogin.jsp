<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- content에 자신의 OAuth2.0 클라이언트ID를 넣습니다. -->
<meta name="google-signin-client_id"
	content="559616951878-e04ehark7jfvelqs12rr4au9o4nqe6s3.apps.googleusercontent.com">
<script src="https://accounts.google.com/gsi/client" async defer></script>
<!-- 구글 api 사용을 위한 스크립트 -->
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
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
<script>
	//처음 실행하는 함수
	function init() {
		gapi
				.load(
						'auth2',
						function() {
							gapi.auth2.init();
							options = new gapi.auth2.SigninOptionsBuilder();
							options.setPrompt('select_account');
							// 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
							options
									.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
							// 인스턴스의 함수 호출 - element에 로그인 기능 추가
							// GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
							gapi.auth2.getAuthInstance().attachClickHandler(
									'GgCustomLogin', options, onSignIn,
									onSignInFailure);
						})
	}

	function onSignIn(googleUser) {
		var access_token = googleUser.getAuthResponse().access_token
		$.ajax({
			// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
			url : 'https://people.googleapis.com/v1/people/me'
			// key에 자신의 API 키를 넣습니다.
			,
			data : {
				personFields : 'birthdays',
				key : 'AIzaSyAZ8BkKotaKPcdMqo-YXi4slS1GLZo4e3U',
				'access_token' : access_token
			},
			method : 'GET'
		}).done(function(e) {
			//프로필을 가져온다.
			var profile = googleUser.getBasicProfile();
			console.log(profile)
		}).fail(function(e) {
			console.log(e);
		})
	}
	function onSignInFailure(t) {
		console.log(t);
	}
</script>
<body>
<div class="container">
		<form action="business-login-pro" novalidate name="loginForm"
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
			<div class="title">기업 로그인</div>
			<div class="subtitle">사용중이신 사업자 번호를 입력해 주세요.</div>
			<div class="input-group">
				<input type="text" id="businessId" name="businessId" placeholder="사업자 번호">
				<input type="password" id="businessPw" name="businessPw" placeholder="비밀번호">
			</div>
			<button class="button">계속</button>
			<div class="signup">
				계정이 없으신가요? <a
					href="${pageContext.request.contextPath}/business/business-join">가입하기</a>
			</div>
<!-- 			<ul> -->
<!-- 				<li id="GgCustomLogin"><a href="javascript:void(0)"> <span>Login -->
<!-- 							with Google</span> -->
<!-- 				</a></li> -->
<!-- 			</ul> -->
		</form>
	</div>
</body>
</html>