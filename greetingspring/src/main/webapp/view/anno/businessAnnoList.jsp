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
<title>Job Announcements</title>
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
	display: flex;
	flex-direction: row;
	gap: 10px;
	align-items: flex-end;
	flex-wrap: nowrap;
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
}

.inquiry-button:hover {
	background-color: #0056b3;
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
	margin-left: 150px;
	font-size: 1.5rem;
	line-height: 2rem;
}

img, video {
	display: inline;
	width: 69%;
	border-radius: 10px;
	height: auto;
}
</style>
</head>
<body class="bg-gray-100">
	<div class="flex flex-col h-screen">
		<header class="header bg-white p-4 shadow-md">
			<div class="container mx-auto flex justify-between items-center">
				<h1 class="text-2xl font-bold">기업 공고 리스트</h1>
				<a
					href="${pageContext.request.contextPath}/business/business-info?businessId=${sessionScope.businessId}">${business.businessName}</a>
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
					<c:if test="${sessionScope.memberId != null }">
						<ul>
							<li class="mb-2"><a
								href="${pageContext.request.contextPath}/anno/user-anno-list"
								class="text-blue-500"><b>공고목록</b></a></li>
							<%-- 				   <li class="mb-2"><a href="${pageContext.request.contextPath}/anno/business-anno-insert-form" class="text-blue-500">공고작성</a></li> --%>
						</ul>
					</c:if>
					<c:if test="${sessionScope.businessId != null }">
						<ul>
							<li class="mb-2"><a
								href="${pageContext.request.contextPath}/anno/business-anno-list?busineessId=${sessionScope.businessId}"
								class="text-blue-500"><b>공고목록</b></a></li>
							<li class="mb-2"><a
								href="${pageContext.request.contextPath}/anno/business-anno-insert-form"
								class="text-blue-500">공고작성</a></li>
							<li class="mb-2"><a
								href="${pageContext.request.contextPath}/business/business-main"
								class="text-blue-500">홈으로</a></li>
						</ul>
					</c:if>
				</div>
				<c:if
					test="${sessionScope.memberId != null || sessionScope.businessId != null}">
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
				</c:if>
			</div>


			<!-- Main Content -->
			<div class="main-content w-5/6 p-4 overflow-x-auto">
				<div class="card-container">

					<c:set var="annoId" value="${annoId}" />
					<c:forEach var="businessAnno" items="${li}">
						<c:if test="${sessionScope.businessId eq businessAnno.businessId}">
							<a
								href="${pageContext.request.contextPath}/anno/business-anno-info?annoId=${businessAnno.annoId}"
								class="card">
								<div class="card-content-wrapper">
									<div class="card-content">
										<div class="card-title">${businessAnno.annoId}</div>
										<div class="card-title">${businessAnno.businessId}</div>
										<div class="card-title">${businessAnno.businessName}</div>
										<div class="card-text">Title: ${businessAnno.annoTitle}</div>
										<div class="card-text">Grade: ${businessAnno.annoGrade}</div>
										<div class="card-text">Type:
											${businessAnno.annoWorkType}</div>
										<div class="card-text">Place:
											${businessAnno.annoWorkPlace}</div>
									</div>
									<div class="card-extra">
										<div class="card-text">지원자 :
											${businessAnno.resumeCount}명</div>
										<div class="card-text">D-day : ${businessAnno.daysLeft}
											days</div>
<!-- 										<div class="card-text">Extra Info 3:</div> -->
									</div>
								</div>
								<div class="card-footer">
									<fmt:formatDate value="${businessAnno.annoDate}"
										pattern="yyyy-MM-dd" />
								</div>
							</a>
						</c:if>
					</c:forEach>
				</div>
			</div>



		</div>
	</div>
</body>
</html>
