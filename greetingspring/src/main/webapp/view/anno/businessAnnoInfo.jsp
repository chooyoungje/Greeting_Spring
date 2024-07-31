<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="model.Anno"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>채용 공고</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css"
	rel="stylesheet">
<style>
body {
	font-family: 'Roboto', sans-serif;
}

.dropdown-menu {
	display: none;
	position: absolute;
	right: 2rem;
	top: 4rem;
	background-color: white;
	border: 1px solid #ddd;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	border-radius: 0.5rem;
	width: 200px;
	z-index: 1000;
}

.dropdown-menu.show {
	display: block;
}

.login-inquiry {
	height: 100%;
	width: 100%;
	margin-top: 586px;
	/*  	display: flex;  */
	/* 	flex-direction: row; */
	gap: 10px;
	/*  	align-items: flex-end; */
	/*  	flex-wrap: nowrap; */
}

.inquiry-button {
	background-color: #007bff;
	color: white;
	margin-top: 20px;
	padding: 10px 20px;
	border-radius: 5px;
	text-decoration: none;
	border: none;
	cursor: pointer;
	transition: background-color 0.3s;
	margin-right: 4px
}

.inquiry-button:hover {
	background-color: #0056b3;
}

.font-semibold {
	font-size: 16px;
}

.w-1\/5 {
	width: 16.66%;
}

.w-2\/3 {
	margin-left: -200px;
	width: 66.666667%;
}

.card-container {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 16px;
	width: 100%;
}

.card {
	border: 1px solid #ddd;
	border-radius: 8px;
	width: 60%;
	padding: 0;
	background-color: #fff; /* 카드 배경색을 흰색으로 설정 */
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	transition: transform 0.2s, box-shadow 0.2s;
	overflow: hidden;
	text-decoration: none;
	color: inherit;
	display: flex;
	flex-direction: column;
}

.card-content-wrapper {
	display: flex;
}

.card-content {
	padding: 16px;
	width: 66.67%;
}

.card-extra {
	padding: 16px;
	width: 33.33%;
	border-left: 1px solid #ddd;
}

.card-title {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 8px;
}

.card-text {
	font-size: 14px;
	color: #555;
	margin-bottom: 4px;
}

.card-footer {
	font-size: 12px;
	color: #777;
	padding: 16px;
	align-self: flex-start;
}

.card:hover {
	transform: scale(1.05);
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

.header {
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	padding: 1rem 2rem;
}

.fixed-sidebar {
	position: fixed;
	top: 0;
	left: 0;
	height: 100%;
	width: 16.66%;
}

.main-content {
	margin-left: 16.66%;
}

.text-2xl {
	font-size: 1.5rem;
	line-height: 2rem;
}

.container {
	max-width: 1200px; /* 현재 사이즈의 3배 */
	margin: 0 auto;
	padding: 2rem;
}

.header {
	position: fixed;
	top: 0;
	left: 50%;
	transform: translateX(-50%);
	width: 1200px; /* 현재 사이즈의 3배 */
	height: auto; /* 높이 복구 */
	background-color: #fff;
	z-index: 1000;
	padding: 1rem 2rem;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.header .business-name {
	position: relative;
	top: -6%;
	left: 1%;
	font-size: 1.2rem;
	color: #6b7280;
}

.header .title-date-container {
	position: relative;
	margin-left: 10%;
}

.header h2 {
	position: relative;
	margin-left: -10%;
}

.header .date {
	position: absolute;
	bottom: -80%;
	right: -1%;
	font-size: 0.975rem;
	color: #6b7280;
}

.main-content {
	margin-left: 16.66%;
	padding-top: 6rem;
	width: 1200px; /* 현재 사이즈의 3배 */
	margin: 0 auto;
}

.btn {
	cursor: pointer;
}

#skills .skill-item {
	display: inline-block;
	background-color: #e0f2fe;
	border: 1px solid #0284c7;
	color: #0369a1;
	padding: 0.5rem 1rem;
	margin-right: 0.5rem;
	margin-bottom: 0.5rem;
	border-radius: 9999px;
	font-size: 0.875rem;
	font-weight: 500;
}

.form-label {
	font-weight: bold;
	color: #374151;
	margin-bottom: 0.5rem;
	display: block;
}

.form-group {
	margin-bottom: 1rem;
}

h2, h3 {
	color: #1f2937;
}

.body-section {
	margin-top: 1rem;
}

.image-placeholder {
	width: 100%;
	height: 600px;
	background-color: #e5e7eb;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 1.25rem;
	color: #9ca3af;
	margin-bottom: 1rem;
}

.days-left {
	font-size: 1.25rem;
	font-weight: bold;
	color: #ef4444;
	margin-bottom: 1rem;
}

.info-grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 0.5rem;
	font-size: 0.875rem;
}

.info-item {
	display: flex;
	justify-content: space-between;
}

.actions {
	display: flex;
	gap: 1rem;
	margin-top: 1.5rem;
	flex-wrap: wrap;
}

img, video {
	display: inline;
	width: 69.7%;
	border-radius: 10px;
	height: auto;
}

/*
.countdown {
    animation: pulse 2s infinite;
}
*/
  
@keyframes pulse {
    0% { opacity: 1; }
    50% { opacity: 0.5; }
    100% { opacity: 1; }
}
</style>
<script>
	function removeCheck() {
		return confirm("정말 삭제하시겠습니까?");
	}
</script>
</head>
<body class="bg-gray-100">
	<div class="flex flex-col h-screen">
		<header class="header">
			<div class="business-name">${anno.businessName}</div>
			<div class="title-date-container">
				<h2 class="text-2xl font-bold mb-4">${anno.annoTitle}</h2>
				<span class="date"><fmt:formatDate value="${anno.annoDate}"
						pattern="yyyy년 M월 d일 E요일 a hh시 mm분" /></span>
			</div>
		</header>
		<div class="flex flex-grow">

			<!-- Sidebar -->
			<div class="fixed-sidebar bg-white shadow-lg p-4 flex flex-col">
				<div>
					<div class="flex items-center mb-4">
						<a href="${pageContext.request.contextPath}/member/main"> <img
							src="https://ifh.cc/g/8x0DFF.png" alt="Logo" class="mr-2">
						</a>
					</div>
					<ul>
						<li class="mb-2"><a
							href="${pageContext.request.contextPath}/anno/business-anno-list?busineessId=${sessionScope.businessId}"
							class="text-blue-500">공고목록</a></li>
						<li class="mb-2"><a
							href="${pageContext.request.contextPath}/anno/business-anno-info?annoId=${anno.annoId}"
							class="text-blue-500"><b>공고정보</b></a></li>
						<li class="mb-2"><a
							href="${pageContext.request.contextPath}/anno/business-anno-insert-form"
							class="text-blue-500">공고작성</a></li>
						<li class="mb-2"><a
							href="${pageContext.request.contextPath}/business/business-main"
							class="text-blue-500">홈으로</a></li>
						<li class="mb-2"><a
							href="${pageContext.request.contextPath}/anno/business-anno-management?annoId=${anno.annoId}"
							class="text-blue-500">이력서 관리</a></li>
					</ul>
				</div>

				<div class="login-inquiry mt-auto">
					<a
						href="${pageContext.request.contextPath}/business/business-logout"
						method="post">
						<button type="submit" class="inquiry-button">로그아웃</button>
					</a> <a
						href="${pageContext.request.contextPath}/business/business-info?businessId=${sessionScope.businessId}"
						method="post">
						<button type="submit" class="inquiry-button">기업 정보</button>
					</a>
				</div>
			</div>

			<!-- Main Content -->
			<div class="main-content overflow-x-auto">
				<div
					class="container bg-white p-6 rounded-lg shadow-md body-section">
					<div class="info-grid mb-6">
						<div class="info-item">
							<span class="font-semibold text-gray-700">경력</span> <span
								class="bg-blue-100 text-blue-800 px-2 py-1 rounded">${anno.annoCareer}</span>
						</div>
						<div class="info-item">
							<span class="font-semibold text-gray-700">급여</span> <span
								class="bg-green-100 text-green-800 px-2 py-1 rounded">${anno.annoSalary}</span>
						</div>
						<div class="info-item">
							<span class="font-semibold text-gray-700">학력</span> <span
								class="bg-yellow-100 text-yellow-800 px-2 py-1 rounded">${anno.annoEdu}</span>
						</div>
						<div class="info-item">
							<span class="font-semibold text-gray-700">근무지역</span> <span
								class="bg-purple-100 text-purple-800 px-2 py-1 rounded">${anno.annoWorkPlace}</span>
						</div>
						<div class="info-item">
							<span class="font-semibold text-gray-700">근무형태</span> <span
								class="bg-red-100 text-red-800 px-2 py-1 rounded">${anno.annoWorkType}</span>
						</div>
					</div>
					<hr>

					<!-- Image and Recruitment Info Section -->
					<div
						class="recruitment-info bg-white shadow-lg rounded-lg overflow-hidden mb-8">
						<!-- Image Placeholder -->
						<img class="w-full h-64 object-cover"
							src="https://ifh.cc/g/Pqhd8G.jpg" alt="Recruitment Image" />

						<div class="p-6">
							<!-- Days Left -->
							<div class="days-left text-2xl font-bold text-red-600 mb-4">
								남은 기간: <span class="countdown">${daysLeft}일</span>
							</div>

							<!-- Start and End Dates -->
							<div class="grid grid-cols-2 gap-4">
								<div class="date-info">
									<p class="font-semibold text-gray-700">시작일</p>
									<p class="text-blue-600">
										<fmt:formatDate value="${anno.annoDate}"
											pattern="yyyy년 M월 d일 E요일 a hh시 mm분" />
									</p>
								</div>
								<div class="date-info">
									<p class="font-semibold text-gray-700">마감일</p>
									<p class="text-red-600">
										<fmt:formatDate value="${anno.annoDeadline}"
											pattern="yyyy년 M월 d일 E요일 a hh시 mm분" />
									</p>
								</div>
							</div>
						</div>
					</div>
					<!-- Company Info -->
					<h3 class="text-xl font-bold mt-6 mb-4">기업 정보</h3>
					<div class="info-content bg-gray-50 p-4 rounded-lg">
						<div class="mb-4">
							<h4 class="text-lg font-semibold mb-2">복지</h4>
							<p>${anno.welfare}</p>
						</div>
						<div class="mb-4">
							<h4 class="text-lg font-semibold mb-2">공통 자격</h4>
							<p>${anno.annoCommon}</p>
						</div>
						<div class="mb-4">
							<h4 class="text-lg font-semibold mb-2">지원 자격</h4>
							<p>${anno.annoQualification}</p>
						</div>
						<div class="mb-4">
							<h4 class="text-lg font-semibold mb-2">채용 인원</h4>
							<p>${anno.annoPickNum}</p>
						</div>
						<div>
							<h4 class="text-lg font-semibold mb-2">공고 내용</h4>
							<p>${anno.annoContent}</p>
						</div>
					</div>

					<!-- Skill Selection -->
					<div class="form-group">
						<label for="skills" class="form-label">스킬:</label>
						<div id="skills">
							<c:forEach var="skill" items="${skills.skills}">
								<div class="skill-item">${skill}</div>
							</c:forEach>
						</div>
					</div>

					<div class="actions">
						<a
							href="${pageContext.request.contextPath}/anno/business-anno-update-form?annoId=${anno.annoId}"
							class="bg-blue-500 text-white px-4 py-2 rounded">공고수정</a>
						<form action="anno-delete-pro" method="post"
							onsubmit="return removeCheck();" class="btn">
							<input type="hidden" name="annoId" value="${anno.annoId}">
							<input type="submit" value="공고삭제"
								class="bg-red-500 text-white px-4 py-2 rounded btn">
						</form>
						<a
							href="${pageContext.request.contextPath}/anno/business-anno-list"
							class="bg-gray-500 text-white px-4 py-2 rounded">목록보기</a>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>
