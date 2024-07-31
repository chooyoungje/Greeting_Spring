<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>기업 회원가입</title>
<style>
body {
	font-family: Pretendard-Regular, Arial, sans-serif;
	background-color: #f5f5f5;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100%;
	margin: 0;
	padding-top: 20px; /* 상단 여백 추가 */
}

.container {
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	width: 600px;
	padding: 20px;
	box-sizing: border-box; /* 패딩 포함하여 크기 계산 */
}

.container h2 {
	margin-top: 0;
	text-align: center;
}

.container form {
	display: flex;
	flex-wrap: wrap;
	gap: 20px 2%;
}

.form-group {
	display: flex;
	flex-direction: column;
	width: 48%;
}

.form-group-full {
	width: 100%;
}

.form-group label {
	margin-bottom: 5px;
	font-weight: bold;
}

.form-group input, .form-group textarea, .form-group select {
	margin-bottom: 10px;
	padding: 10px;
	font-size: 14px;
	border: 1px solid #ddd;
	border-radius: 5px;
}

.form-group textarea {
	resize: vertical;
}

.form-group .error-message {
	color: red;
	font-size: 12px;
	display: none;
}

.container form .button-group {
	display: flex;
	justify-content: space-between;
	width: 100%;
}

.container form .button-group button,
.container form .button-group a {
	background-color: #007bff;
	color: #fff;
	padding: 10px;
	font-size: 16px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	flex: 1;
	margin: 0 5px;
}

.container form .button-group button:hover,
.container form .button-group a:hover {
	background-color: #0056b3;
}
</style>
<script>
function validateInput(event) {
	const input = event.target;
	const value = input.value;
	const regex = /^\d{0,10}$/;
	const errorMessage = input.nextElementSibling;

	if (!regex.test(value)) {
		errorMessage.style.display = 'block';
		input.setCustomValidity("숫자를 입력하세요 (최대 10자리).");
	} else {
		errorMessage.style.display = 'none';
		input.setCustomValidity("");
	}
}

window.addEventListener('DOMContentLoaded', (event) => {
	const input = document.getElementById('businessId');
	input.addEventListener('input', validateInput);
});
</script>
</head>
<body>
	<div class="container">
		<h2>기업 정보수정</h2>
		<form action="business-update-pro" method="post" novalidate>
			<div class="form-group">
				<label for="businessId">사업자번호</label> <input type="text"
					id="businessId" name="businessId" placeholder="사업자번호" required
					pattern="\d{1,10}" value="${businessId}" >
				<div class="error-message">숫자를 입력하세요 (최대 10자리).</div>
			</div>
			<div class="form-group">
				<label for="businessPw">비밀번호</label> <input type="password"
					id="businessPw" name="businessPw" placeholder="비밀번호" required>
			</div>
			<div class="form-group">
				<label for="businessName">회사명</label> <input type="text"
					id="businessName" name="businessName" placeholder="회사명" required
					value="${business.businessName}">
			</div>
			<div class="form-group">
				<label for="address">주소</label> <input type="text" id="address"
					name="address" placeholder="주소" required
					value="${business.address}">
			</div>
			<div class="form-group">
				<label for="salary">급여</label> <input type="number" id="salary"
					name="salary" placeholder="급여" required value="${business.salary}">
			</div>
			<div class="form-group form-group-full">
				<label for="welfare">복지</label>
				<textarea id="welfare" name="welfare" rows="4" placeholder="복지">${business.welfare}</textarea>
			</div>
			<div class="form-group">
				<label for="ceo">CEO</label> <input type="text" id="ceo" name="ceo"
					placeholder="CEO" required value="${business.ceo}">
			</div>
			<div class="form-group">
				<label for="sales">매출</label> <input type="number" id="sales"
					name="sales" placeholder="매출" value="${business.sales}">
			</div>
			<div class="form-group">
				<label for="employees">직원 수</label> <input type="number"
					id="employees" name="employees" placeholder="직원 수"
					value="${business.employees}">
			</div>
			<div class="form-group">
				<label for="type">유형</label>
				<select name="type" id="type">
					<option value="대기업" <c:if test="${checkType == business.type}">selected</c:if>>대기업</option>
          <option value="중견기업" <c:if test="${checkType == business.type}">selected</c:if>>중견기업</option>
          <option value="중소기업" <c:if test="${checkType == business.type}">selected</c:if>>중소기업</option>
				</select>
			</div>
			<div class="form-group">
				<label for="industry">산업</label> <input type="text" id="industry"
					name="industry" placeholder="산업" value="${business.industry}">
			</div>
			<div class="form-group">
				<label for="detailIndustry">세부 산업</label> <input type="text"
					id="detailIndustry" name="detailIndustry" placeholder="세부 산업"
					value="${business.detailIndustry}">
			</div>
			<div class="form-group">
				<label for="homepage">홈페이지</label> <input type="url" id="homepage"
					name="homepage" placeholder="홈페이지" value="${business.homepage}">
			</div>
			<div class="form-group form-group-full">
				<label for="content">설명</label>
				<textarea id="content" name="content" rows="4" placeholder="설명">${business.content}</textarea>
			</div>
			<div class="button-group">
				<button type="submit">수정하기</button>
				<a href="${pageContext.request.contextPath}/business/business-info?businessId=${sessionScope.businessId}">이전으로</a>
			</div>
		</form>
	</div>
</body>
</html>
