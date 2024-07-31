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
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f9f9f9;
	margin: 0;
	padding: 0;
}

.container {
	display: flex;
	height: 100vh;
	width: 100%;
}

.sidebar {
	width: 250px;
	background-color: #fff;
	box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
	padding: 20px;
}

.sidebar h2 {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 20px;
}

.sidebar ul {
	list-style: none;
	padding: 0;
}

.sidebar ul li {
	margin-bottom: 10px;
}

.sidebar ul li a {
	text-decoration: none;
	color: #333;
	font-size: 16px;
}

.sidebar ul li a:hover {
	color: #007bff;
}

.main-content {
	flex-grow: 1;
	padding: 20px;
	overflow-y: auto;
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #fff;
	padding: 10px 20px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
}

.header h1 {
	font-size: 24px;
	margin: 0;
}

.header button {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
}

.filters {
	display: flex;
	gap: 10px;
	margin-bottom: 20px;
}

.filters button, .filters select, .filters input {
	padding: 8px 12px;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fff;
	cursor: pointer;
}

.filters button.active {
	background-color: #007bff;
	color: #fff;
}

.filters input {
	flex-grow: 1;
}

.card-container {
	display: flex;
	flex-wrap: wrap;
	gap: 16px;
	justify-content: center;
}

.card {
	border: 1px solid #ddd;
	border-radius: 8px;
	width: 300px;
	background-color: #fff;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	transition: transform 0.2s, box-shadow 0.2s;
	overflow: hidden;
	text-decoration: none;
	color: inherit;
}

.card-content {
	padding: 16px;
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
}

.card:hover {
	transform: scale(1.05);
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}
</style>
</head>
<body>
	<div class="container">
		<!-- Sidebar -->
		<aside class="sidebar">
			<div class="flex items-center justify-between mb-4">
				<h2 class="text-lg font-bold">공고리스트</h2>
<!-- 				<button class="bg-blue-500 text-white px-2 py-1 rounded">+</button> -->
			</div>
			<ul>
				<li class="mb-2"><a href="${pageContext.request.contextPath}/member/main" class="text-blue-500">메인화면</a></li>
				<li class="mb-2"><a href="${pageContext.request.contextPath}/member/member-main" class="text-blue-500">내 정보</a></li>
			</ul>
		</aside>

		<!-- Main Content -->
		<div class="main-content">
			<!-- Header -->
			<div class="header">
				<h1>공고 리스트</h1>
<%-- 				<a href="${pageContext.request.contextPath}/member/member-main">메인으로</a> --%>
			</div>
			<!-- Filters -->
			<div class="filters">
				<a href="${pageContext.request.contextPath}/anno/user-my-anno-list"><button class="active">내 공고</button></a>
				<button>모든 공고</button>
				<form action="search-anno-list" method="post">
					<select name="part">
						<option value="annoTitle">공고 제목</option>
						<option value="businessName">공고 기업</option>
					</select> <input type="text" name="searchData" placeholder="공고 검색">
										<input type="submit" value="검색">
				</form>
				<select>
					<option>전체</option>
					<option>진행중</option>
					<option>마감</option>
				</select> <select>
					<option>자동 마감일 순</option>
					<option>생성일 순</option>
					<option>가나다 순</option>
				</select> <select>
					<option>직군</option>
					<option>개발</option>
					<option>디자인</option>
				</select>
			</div>
			<div class="card-container">
				
				<c:set var="annoId" value="${annoId}" />
				<c:forEach var="userAnno" items="${li}">
					<a
						href="${pageContext.request.contextPath}/anno/user-anno-info?annoId=${userAnno.annoId}"
						class="card">
						<div class="card-content">
							<div class="card-title">${userAnno.annoId}</div>
							<div class="card-title">${userAnno.businessId}</div>
							<div class="card-title">${userAnno.businessName}</div>
							<div class="card-text">Title: ${userAnno.annoTitle}</div>
							<div class="card-text">Grade: ${userAnno.annoGrade}</div>
							<div class="card-text">Type: ${userAnno.annoWorkType}</div>
							<div class="card-text">Place: ${userAnno.annoWorkPlace}</div>
						</div>
						<div class="card-footer">
							<fmt:formatDate value="${userAnno.annoDate}" pattern="yyyy-MM-dd" />
						</div>
					</a>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>
