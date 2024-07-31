<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>기업 리스트</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	flex-direction: column;
}

.container {
	width: 90%;
	max-width: 1200px;
}

.search-bar {
	display: flex;
	justify-content: center;
	margin-bottom: 20px;
}

.search-bar input[type="text"] {
	width: 65%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.search-bar button {
	padding: 10px 20px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	margin-left: 10px;
	cursor: pointer;
}

.search-bar button:hover {
	background-color: #0056b3;
}

.btn-home {
	padding: 10px 20px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	margin-left: 10px;
	cursor: pointer;
	text-decoration: none;
	font-size: 14px;
}

.btn-home:hover {
	background-color: #0056b3;
}

.card-container {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
	justify-content: center;
}

.card {
	background-color: white;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 250px;
	overflow: hidden;
	display: flex;
	flex-direction: column;
}

.card-header {
	padding: 10px;
	background-color: #007bff;
	color: white;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.badge {
	background-color: #28a745;
	color: white;
	padding: 5px 10px;
	border-radius: 5px;
	font-size: 12px;
}

.card-body {
	padding: 15px;
	text-align: center;
}

.card-body img {
	max-width: 100%;
	height: auto;
	margin-bottom: 15px;
}

.card-body h3 {
	margin: 0 0 10px;
	font-size: 18px;
}

.card-body p {
	margin: 0;
	font-size: 14px;
	color: #666;
}
</style>
</head>
<body>
	<div class="container">
		<form action="search-business-list" method="post" novalidate>
			<div class="search-bar">
				<select name="part">
					<option value="businessName">기업명</option>
					<option value="industry">산업</option>
					<option value="detailIndustry">세부 산업</option>
				</select> <input type="text" name="searchData" placeholder="기업명을 입력해주세요."
					id="search-input">
				<button type="submit" id="search-button">검색</button>
				<a class="btn-home"
					href="${pageContext.request.contextPath}/business/business-main">홈</a>
			</div>
		</form>
		<form action="sort-business-list" method="post" novalidate>
			<div class="search-bar">
				<select name="sortData" id="sortData" onchange="this.form.submit()">
					<option selected disabled>선택</option>
					<option value="businessName">기업명순</option>
					<option value="type">유형순</option>
					<option value="industry">산업순</option>
				</select>
			</div>
		</form>
		<!--         <div class="search-bar"> -->
		<!--         	<form action="sort-business-list" method="post" novalidate> -->
		<!--             <select name="sortData" id="sortData" >  onchange="sortBusinessList(this)" -->
		<!-- <!--                 <option value="">선택</option> -->
		<!--                 <option value="businessName">기업명순</option> -->
		<!--                 <option value="type">유형순</option> -->
		<!--                 <option value="industry">산업순</option> -->
		<!--             </select> -->
		<!--             <button type="submit" id="sort-button">정렬</button> -->
		<!--             </form> -->
		<!--         </div> -->
		<div class="card-container">
			<c:forEach var="business" items="${businessList}">
<%-- 				<c:if test="${sessionScope.busineeId eq business.businessId}"> --%>
					<form action="business-list" method="post" novalidate>
						<a
							href="${pageContext.request.contextPath}/business/business-info?businessId=${business.businessId}">
							<input type="hidden" name="businessId"
							value="${business.businessId}">
							<div class="card">
								<div class="card-body">
									<h3>${business.businessName}</h3>
									<p>${business.industry}</p>
									<p>${business.detailIndustry}</p>
								</div>
							</div>
						</a>
					</form>
<%-- 				</c:if> --%>
			</c:forEach>
		</div>
	</div>
</body>
</html>
