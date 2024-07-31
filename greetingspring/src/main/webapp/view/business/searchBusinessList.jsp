<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardSearchList</title>
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

.btn-home, .back-blist {
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

.btn-home:hover, .back-blist:hover {
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
                    <option value="businessName" <c:if test="${searchPart == 'businessName'}">selected</c:if>>기업명</option>
                    <option value="industry" <c:if test="${searchPart == 'industry'}">selected</c:if>>산업</option>
                    <option value="detailIndustry" <c:if test="${searchPart == 'detailIndustry'}">selected</c:if>>세부 산업</option>
                </select> 
                <input type="text" name="searchData" placeholder="기업명을 입력해주세요." id="search-input" value="${searchData}">
                <button type="submit" id="search-button">검색</button>
                <a class="btn-home" href="${pageContext.request.contextPath}/business/business-main">홈</a>
                <a class="back-blist" href="${pageContext.request.contextPath}/business/business-list">기업 리스트</a>
            </div>
        </form>
        <form action="search-business-list" method="post" novalidate>
            <input type="hidden" name="part" value="${searchPart}">
            <input type="hidden" name="searchData" value="${searchData}">
            <div class="search-bar">
                <select name="sortData" id="sortData" onchange="this.form.submit()">
                    <option selected disabled>선택</option>
                    <option value="businessName" <c:if test="${selectedSortData == 'businessName'}">selected</c:if>>기업명순</option>
                    <option value="type" <c:if test="${selectedSortData == 'type'}">selected</c:if>>유형순</option>
                    <option value="industry" <c:if test="${selectedSortData == 'industry'}">selected</c:if>>산업순</option>
                </select>
            </div>
        </form>
        <div class="card-container">
            <c:if test="${empty searchBusinessList}">
                <div align="center">
                    해당 기업이 없습니다.
                </div>
            </c:if>
            <c:if test="${searchBusinessList != null}">
                <c:forEach var="business" items="${searchBusinessList}">
                    <a href="${pageContext.request.contextPath}/business/business-info?businessid=${business.businessId}">
                        <div class="card">
                            <div class="card-body">
                                <h3>${business.businessName}</h3>
                                <p>${business.industry}</p>
                                <p>${business.detailIndustry}</p>
                            </div>
                        </div>
                    </a>
                </c:forEach>
            </c:if>
        </div>
    </div>
</body>
</html>
