<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Three Column Layout with Resume</title>
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
	rel="stylesheet">
<style>
/* Your existing CSS styles with modifications */
body {
    font-family: Arial, sans-serif;
    background-color: #f9f9f9;
    margin: 0;
    padding: 0;
    display: flex;
    height: 100vh;
}

.sidebar {
    width: 15%;
    margin-left: 10px;
    background-color: #fff;
    box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
    overflow-y: auto;
    padding: 20px;
    flex-shrink: 0;
}

.main-content {
    flex-grow: 1;
    padding: 20px;
    background-color: #fff;
    box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
    overflow-y: auto;
}

.review-panel {
    width: 450px;
    margin-right: 10px;
    background-color: #fff;
    box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
    overflow-y: auto;
    padding: 20px;
    flex-shrink: 0;
}

.header, .filters, .card-container {
    margin-bottom: 20px;
}

.card-container {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 16px;
}

.card {
    border: 1px solid #ddd;
    border-radius: 8px;
    background-color: #fff;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    transition: transform 0.2s, box-shadow 0.2s;
    overflow: hidden;
    text-decoration: none;
    color: inherit;
}

.card img {
    width: 100%;
    height: 200px;
    object-fit: cover;
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

.button-container {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
}

.button-container button {
    background-color: #4CAF50;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    border: none;
    border-radius: 4px;
}

.button-container button:hover {
    background-color: #45a049;
}

.slider-container {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
}

.slider-container input[type="range"] {
    flex-grow: 1;
    margin: 0 10px;
}

.slider-container input[type="text"] {
    width: 50px;
    text-align: center;
}

.main-content-resume {
    width: 100%;
}

.resume {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 100%;
}

.resume-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
    border-bottom: 3px solid #000;
    padding-bottom: 10px;
}

.resume-header img {
    border-radius: 50%;
    width: 200px;
    height: 200px;
    object-fit: cover;
}

.resume-header .name {
    font-size: 31px;
    font-weight: bold;
}

.section {
    position: relative;
    margin-bottom: 20px;
    border-bottom: 3px solid #000;
    padding-bottom: 10px;
    padding-left: 300px; /* 섹션 타이틀을 위한 공간을 더 늘림 */
}

.section-title {
    position: absolute;
    left: 0;
    top: 0;
    width: 130px; /* 타이틀 너비를 늘림 */
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 10px;
}

.info-table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0 8px;
}

.info-table th {
    width: 30%; /* th의 너비를 조금 늘림 */
    padding-right: 15px;
    text-align: left;
    vertical-align: top;
    border-bottom: 2px solid lightgray;
}

.info-table td {
    width: 75%; /* td의 너비를 조정 */
    text-align: left;
    vertical-align: top;
    border-bottom: 2px solid lightgray;
}

.info-table th,
.info-table td {
    text-align: left;
    vertical-align: top;
}

.name-resume {
    color: #777;
}

.total-score-text {
    font-size: 20px;
    font-weight: bold;
}

.total-score-num {
    font-size: 20px;
    font-weight: bold;
}

.sidebar ul li a:hover {
	font-weight: bold;
	color: darkblue;
}
</style>
</head>
<body>
	<aside class="sidebar">
		<h2 class="text-lg font-bold mb-4">지원서류</h2>
		<ul>
			<li class="mb-2"><a href="#" class="text-blue-500">지원서류</a></li>
			<li class="mb-2"><a href="#" class="text-blue-500">서류 추천</a></li>
			<li class="mb-2"><a href="#" class="text-blue-500">추가정보</a></li>
			<li class="mb-2"><a href="#" class="text-blue-500">사전질문</a></li>
			<li class="mb-2"><a href="#" class="text-blue-500">설문 응답</a></li>
			<li class="mb-2"><a
				href="${pageContext.request.contextPath}/anno/business-anno-management?annoId=${anno.annoId}" class="text-blue-500">이력서
					관리</a></li>
		</ul>
	</aside>

	<div class="main-content">
		<div class="header flex justify-between items-center mb-4">
			<h1 class="text-xl font-bold">이력서</h1>
		</div>
		<div class="main-content-resume">
			<div class="resume">
				<div class="resume-header">
					<div class="name">
						<h1 class="name-resume">이력서</h1>
						<h2>${resume.name}</h2>
					</div>
					<img
						src="${pageContext.request.contextPath}/img/member/${resume.profileImage}"
						alt="Profile Picture">
				</div>
				<div class="section">
					<div class="section-title">인적사항</div>
					<div class="section-content">
						<table class="info-table">
							<tr>
								<th>성명</th>
								<td>${resume.name}</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td>${resume.birth}</td>
							</tr>
							<tr>
								<th>주소</th>
								<td>${resume.address}</td>
							</tr>
							<tr>
								<th>휴대전화</th>
								<td>${resume.phone}</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>${resume.email}</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="section">
					<div class="section-title">학력사항</div>
					<div class="section-content">
						<table class="info-table">
							<tr>
								<th>대학교</th>
								<td>${resume.edu.schoolName}</td>
							</tr>
							<tr>
								<th>학과
								</td>
								<td>${resume.edu.major}</td>
							</tr>
							<tr class="last-tr">
								<th>학점</th>
								<td>${resume.edu.score}/${resume.edu.totalScore}</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="section">
					<div class="section-title">경력사항</div>
					<div class="section-content">
						<table class="info-table">
							<tr>
								<th>직장</th>
								<td>${resume.career.companyName}</td>
							</tr>
							<tr>
								<th>직급</th>
								<td>${resume.career.position}</td>
							</tr>
							<tr class="last-tr">
								<th>직무</th>
								<td>${resume.career.workPart}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="review-panel">
		<form name="evaluate"
			action="${pageContext.request.contextPath}/anno/anno-resume-evaluate-save"
			method="POST">
			<input type="hidden" name="resumeId" value="${resume.resumeId}">
			<input type="hidden" name="annoId" value="${anno.annoId}"> <input
				type="hidden" name="evaluateStage" value="${resumeColumnStage}">
			<input type="hidden" name="avgScore"
				value="${resumeEvaluate.avgScore}">

			<div class="flex justify-between items-center mb-4">
				<div>
					<span class="text-green-500 total-score-text">평점</span> <span
						id="rating" class="font-bold text-lg total-score-num">75</span>
				</div>
			</div>
			<div class="mb-4">
				<h2 class="text-lg font-bold">직무 적합성</h2>
				<div class="slider-container">
					<c:if test="${resumeEvaluate != null}">
						<input type="text" id="fit-value" name="suitableScore"
							value="${resumeEvaluate.suitableScore}" readonly>
						<input type="range" id="fit-slider" name="fit" min="0" max="100"
							value="${resumeEvaluate.suitableScore}" oninput="updateRating()">
					</c:if>
					<c:if test="${resumeEvaluate == null}">
						<input type="text" id="fit-value" name="suitableScore" value="50"
							readonly>
						<input type="range" id="fit-slider" name="fit" min="0" max="100"
							value="50" oninput="updateRating()">
					</c:if>
				</div>
				<textarea rows="10" name="suitableContent"
					placeholder="평가 내용을 입력해 주세요" class="border rounded p-2 w-full mt-2">${resumeEvaluate.suitableContent}</textarea>
			</div>
			<div class="mb-4">
				<h2 class="text-lg font-bold">실무 역량</h2>
				<div class="slider-container">
					<c:if test="${resumeEvaluate != null}">
						<input type="text" id="competency-value" name="practicalScore"
							value="${resumeEvaluate.practicalScore}" readonly>
						<input type="range" id="competency-slider" name="competency"
							min="0" max="100" value="${resumeEvaluate.practicalScore}"
							oninput="updateRating()">
					</c:if>

					<c:if test="${resumeEvaluate == null}">
						<input type="text" id="competency-value" name="practicalScore"
							value="50" readonly>
						<input type="range" id="competency-slider" name="competency"
							min="0" max="100" value="50" oninput="updateRating()">
					</c:if>


				</div>
				<textarea rows="10" name="practicalContent"
					placeholder="평가 내용을 입력해 주세요" class="border rounded p-2 w-full mt-2">${resumeEvaluate.practicalContent}</textarea>
			</div>
			<div class="button-container">
				<button type="button" onclick="navigateToList(`${anno.annoId}`)">목록</button>
				<button type="submit">저장</button>
				<button type="button"
					onclick="nextStage(`${anno.annoId}`,`${resume.resumeId}`,`${resumeColumnStage}`)">합격</button>
			</div>
		</form>
	</div>

	<script>
		function updateRating() {
			const fitSlider = document.getElementById('fit-slider');
			const competencySlider = document
					.getElementById('competency-slider');
			const fitValue = document.getElementById('fit-value');
			const competencyValue = document.getElementById('competency-value');
			const rating = document.getElementById('rating');
			const avgScore = document.querySelector('input[name="avgScore"]');

			fitValue.value = fitSlider.value;
			competencyValue.value = competencySlider.value;

			const averageRating = (parseInt(fitSlider.value) + parseInt(competencySlider.value)) / 2;
			rating.textContent = averageRating.toFixed(0);
			avgScore.value = averageRating.toFixed(0);
		}

		function navigateToList(annoId) {
			window.location.href = "${pageContext.request.contextPath}/anno/business-anno-management?annoId="
					+ annoId;
		}

		function nextStage(annoId, resumeId, resumeColumnStage) {
			window.location.href = "${pageContext.request.contextPath}/anno/anno-resume-nextstage?annoId="
					+ annoId
					+ "&resumeId="
					+ resumeId
					+ "&resumeColumnStage="
					+ resumeColumnStage;
		}
	</script>
</body>
</html>
