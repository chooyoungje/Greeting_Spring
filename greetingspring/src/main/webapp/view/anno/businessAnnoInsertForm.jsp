<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert Anno</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
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

.fixed-sidebar {
	position: fixed;
	top: 0;
	left: 0;
	height: 100%;
	width: 16.66%;
}

.fixed-sidebar .flex {
	flex-direction: column;
}

.fixed-sidebar .flex .items-center {
	display: flex;
	align-items: center;
}

.fixed-sidebar .flex .items-center img {
	margin-right: 0.5rem; /* TailwindCSS의 mr-2에 해당 */
}

.fixed-sidebar .flex .text-lg {
	font-size: 1.125rem; /* TailwindCSS의 text-lg에 해당 */
	font-weight: bold;
}

.fixed-sidebar ul {
	list-style-type: none;
	padding-left: 0;
}

.fixed-sidebar ul li {
	margin-bottom: 0.5rem; /* TailwindCSS의 mb-2에 해당 */
}

.fixed-sidebar ul li a {
	color: #3b82f6; /* TailwindCSS의 text-blue-500에 해당 */
	text-decoration: none;
}

.fixed-sidebar ul li a:hover {
	text-decoration: underline;
}

.mt-auto {
	margin-top: auto;
}

.container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 2rem;
}

.header {
	position: fixed;
	top: 0;
	left: 50%;
	transform: translateX(-50%);
	width: 1200px;
	height: auto;
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
	width: 1200px;
	margin: 0 auto;
}

.btn {
	cursor: pointer;
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

.form-group textarea {
	height: 260px;
}

.form-input {
	width: 100%;
	padding: 0.5rem;
	border: 1px solid #ddd;
	border-radius: 0.375rem;
}

.skill-button {
	display: inline-block;
	padding: 0.5rem 1rem;
	border: 1px solid #ddd;
	border-radius: 0.375rem;
	margin: 0.25rem;
	cursor: pointer;
}

.skill-button.selected {
	background-color: #3182ce;
	color: white;
}

.error-message {
	color: #e53e3e;
	font-size: 0.875rem;
	margin-top: 0.5rem;
}

input.form-input {
	font-size: 0.875rem;
	color: #6b7280;
}

img, video {
	display: inline;
	width: 69.8%;
	border-radius: 10px;
	height: auto;
}
</style>
<script>
document.addEventListener('DOMContentLoaded', function () {
    const skillButtons = document.querySelectorAll('.skill-button');
    const form = document.querySelector('form');
    const annoContent = document.getElementById('annoContent');
    const welfare = document.getElementById('welfare');
    const selectedSkillsInput = document.getElementById('selectedSkills');
    
    skillButtons.forEach(button => {
        button.addEventListener('click', () => {
            button.classList.toggle('selected');
            updateSelectedSkills();
        });
    });

    form.addEventListener('submit', function (event) {
        const selectedSkills = document.querySelectorAll('.skill-button.selected');
        const skillNames = Array.from(selectedSkills).map(button => button.dataset.skillname);
        selectedSkillsInput.value = skillNames.join(',');

        let valid = true;

        if (annoContent.value.trim() === '') {
            showErrorMessage(annoContent, '공고 내용을 작성하세요');
            valid = false;
        } else {
            hideErrorMessage(annoContent);
        }

        if (welfare.value.trim() === '') {
            showErrorMessage(welfare, '복지를 작성하세요');
            valid = false;
        } else {
            hideErrorMessage(welfare);
        }

        if (skillNames.length === 0) {
            showErrorMessage(document.getElementById('skills'), '최소 1개의 스킬을 선택하세요');
            valid = false;
        } else {
            hideErrorMessage(document.getElementById('skills'));
        }

        if (!valid) {
            event.preventDefault();
        }
    });

    function updateSelectedSkills() {
        const selectedSkills = document.querySelectorAll('.skill-button.selected');
        const skillNames = Array.from(selectedSkills).map(button => button.dataset.skillname);
        selectedSkillsInput.value = skillNames.join(',');
    }

    function showErrorMessage(element, message) {
        let errorMessage = element.nextElementSibling;
        if (!errorMessage || !errorMessage.classList.contains('error-message')) {
            errorMessage = document.createElement('div');
            errorMessage.classList.add('error-message');
            element.parentNode.insertBefore(errorMessage, element.nextSibling);
        }
        errorMessage.textContent = message;
    }

    function hideErrorMessage(element) {
        let errorMessage = element.nextElementSibling;
        if (errorMessage && errorMessage.classList.contains('error-message')) {
            errorMessage.textContent = '';
        }
    }
});

</script>
</head>
<body class="bg-gray-100">
	<div class="flex flex-col h-screen">
		<header class="header bg-white p-4 shadow-md">
			<div class="container mx-auto flex justify-between items-center">
				<h1 class="text-2xl font-bold">공고 작성</h1>
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
								class="text-blue-500">공고목록</a></li>
						</ul>
					</c:if>
					<c:if test="${sessionScope.businessId != null }">
						<ul>
							<li class="mb-2"><a
								href="${pageContext.request.contextPath}/anno/business-anno-list?businessId=${sessionScope.businessId}"
								class="text-blue-500">공고목록</a></li>
							<li class="mb-2"><a
								href="${pageContext.request.contextPath}/anno/business-anno-insert-form"
								class="text-blue-500"><b>공고작성</b></a></li>
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
			<div class="main-content overflow-x-auto">
				<div
					class="container bg-white p-6 rounded-lg shadow-md body-section">
					<h2 class="text-2xl font-bold mb-4"></h2>
					<form action="anno-insert-pro" method="post">
						<input type="hidden" name="businessId"
							value="${sessionScope.businessId}">
						<div class="form-group"></div>
						<div class="form-group">
							<label for="businessName" class="form-label">기업명:</label> <input
								type="text" id="businessName" name="businessName"
								class="form-input" value="${business.businessName}">
						</div>
						<div class="form-group">
							<label for="welfare" class="form-label">복지:</label>
							<textarea id="welfare" name="welfare" class="form-input">${business.welfare}</textarea>
						</div>
						<div class="form-group">
							<label for="annoTitle" class="form-label">공고 제목:</label> <input
								type="text" id="annoTitle" name="annoTitle" class="form-input">
						</div>
						<div class="form-group">
							<label for="annoCareer" class="form-label">경력:</label> <input
								type="text" id="annoCareer" name="annoCareer" class="form-input">
						</div>
						<div class="form-group">
							<label for="annoSalary" class="form-label">연봉:</label> <input
								type="text" id="annoSalary" name="annoSalary" class="form-input">
						</div>
						<div class="form-group">
							<label for="annoEdu" class="form-label">학력:</label> <input
								type="text" id="annoEdu" name="annoEdu" class="form-input">
						</div>
						<div class="form-group">
							<label for="annoGrade" class="form-label">직급:</label> <input
								type="text" id="annoGrade" name="annoGrade" class="form-input">
						</div>
						<div class="form-group">
							<label for="annoWorkType" class="form-label">근무 형태:</label> <input
								type="text" id="annoWorkType" name="annoWorkType"
								class="form-input">
						</div>
						<div class="form-group">
							<label for="annoWorkDay" class="form-label">근무 요일:</label> <input
								type="text" id="annoWorkDay" name="annoWorkDay"
								class="form-input">
						</div>
						<div class="form-group">
							<label for="annoWorkPlace" class="form-label">근무지:</label> <input
								type="text" id="annoWorkPlace" name="annoWorkPlace"
								class="form-input">
						</div>
						<div class="form-group">
							<label for="annoCommon" class="form-label">공통 자격:</label> <input
								type="text" id="annoCommon" name="annoCommon" class="form-input">
						</div>
						<div class="form-group">
							<label for="annoQualification" class="form-label">지원 자격:</label>
							<input type="text" id="annoQualification"
								name="annoQualification" class="form-input">
						</div>
						<div class="form-group">
							<label for="annoPickNum" class="form-label">채용 인원:</label> <input
								type="text" id="annoPickNum" name="annoPickNum"
								class="form-input">
						</div>
						<div class="form-group">
							<label for="annoContent" class="form-label">공고 내용:</label>
							<textarea id="annoContent" name="annoContent" class="form-input"></textarea>
						</div>
						<div class="form-group">
							<label for="annoDeadline" class="form-label">지원 마감:</label> <input
								type="date" id="annoDeadline" name="annoDeadline"
								class="form-input">
						</div>

						<!-- Skill Selection -->
						<div class="form-group">
							<label for="skills" class="form-label">스킬:</label>
							<div id="skills">
								<div class="skill-button" data-skillname="java">java</div>
								<div class="skill-button" data-skillname="jsp">jsp</div>
								<div class="skill-button" data-skillname="html">html</div>
								<div class="skill-button" data-skillname="css">css</div>
								<div class="skill-button" data-skillname="javascript">javascript</div>
								<div class="skill-button" data-skillname="react">react</div>
								<div class="skill-button" data-skillname="springframework">springframework</div>
								<div class="skill-button" data-skillname="springboot">springboot</div>
								<div class="skill-button" data-skillname="python">python</div>
								<div class="skill-button" data-skillname="typescript">typescript</div>
								<div class="skill-button" data-skillname="express">express</div>
								<div class="skill-button" data-skillname="oracle">oracle</div>
								<div class="skill-button" data-skillname="mysql">mysql</div>
								<div class="skill-button" data-skillname="mongodb">mongodb</div>
							</div>
						</div>

						<input type="hidden" id="selectedSkills" name="selectedSkills">
						<div class="form-group">
							<input type="submit" value="Submit"
								class="bg-blue-500 text-white px-4 py-2 rounded cursor-pointer">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
