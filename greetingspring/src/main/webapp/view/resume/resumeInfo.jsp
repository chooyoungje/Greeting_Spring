<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Profile Form</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css"
	rel="stylesheet">
<style>
.fixed-bottom-bar {
	position: fixed;
	bottom: 0;
	left: 0;
	width: 100%;
	z-index: 10;
	background: white;
	box-shadow: 0 -2px 4px rgba(0, 0, 0, 0.1);
	padding: 10px;
}

.container-fixed {
	padding-bottom: 100px;
	/* To ensure there's space for the fixed bottom bar */
}

.image-upload-wrapper {
	position: relative;
	width: 200px;
	height: 200px;
	border-radius: 50%;
	border: 2px dashed #ccc;
	display: flex;
	align-items: center;
	justify-content: center;
	cursor: pointer;
	overflow: hidden;
}

.image-upload-wrapper img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.image-upload-wrapper input {
	opacity: 0;
	position: absolute;
	width: 100%;
	height: 100%;
	cursor: pointer;
}

.custom-select-icon {
	position: absolute;
	top: 0;
	right: 0;
	height: 100%;
	width: 2.5rem;
	pointer-events: none;
	display: flex;
	align-items: center;
	justify-content: center;
}

.div_line_none {
	border: none;
	box-shadow: none;
}

.w-7-10 {
	width: 50%;
}

.w-3-10 {
	width: 30%;
}

.login-inquiry {
	margin-left: 25px;
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

</style>
</head>
<body class="bg-gray-100">
	<div
		class="container mx-auto p-6 bg-white shadow-md rounded-lg mt-10 container-fixed "
		style="max-width: 1000px;">
		<form method="post" name="resumeForm" action="insert-resume"
			enctype="multipart/form-data">
			<header class="text-center mb-6">
				<input name="resumeTitle" value="${resume.resumeTitle}"
					class="text-2xl font-bold"
					style="width: 70%; height: 40px; text-align: center;" type="text"
					placeholder="이력서 제목을 입력해주세요">
			</header>
			<div class="flex flex-wrap mb-4">
				<div class="w-full md:w-1/3 px-2">
					<label class="block text-gray-700 text-sm font-bold mb-2"
						for="upload">이미지 업로드</label>
					<div class="image-upload-wrapper">
						<img id="profileImage"
							src="${pageContext.request.contextPath}/img/member/${resume.profileImage}"
							alt="Profile Image"> <input name="profileImage"
							value="${resume.profileImage}" type="file" id="imageUpload"
							accept="image/*" onchange="loadFile(event)" disabled>
					</div>
					<p class="text-gray-500 text-xs mt-2">가로 600px, 세로 600px /
						5MB이하</p>
					<p class="text-gray-500 text-xs">등록 가능 확장자: jpg, png, jpeg</p>
				</div>
				<div class="w-full md:w-2/3 px-2">
					<div class="mb-4">
						<label class="block text-gray-700 text-sm font-bold mb-2"
							for="name">이름 *</label> <input name="name" value="${resume.name}"
							class="appearance-none border rounded-lg w-7-10 px-3 py-2"
							type="text" readonly> <label
							class="block text-gray-700 text-sm font-bold mb-2" for="name">생년월일</label>
						<input name="birth" value="${resume.birth}"
							class="appearance-none border rounded-lg w-3-10 px-3 py-2"
							type="text" readonly>
					</div>
					<div class="mb-4">
						<label class="block text-gray-700 text-sm font-bold mb-2"
							for="introduction">한줄 소개</label>
						<textarea name="selfInfo"
							class="appearance-none border rounded-lg w-full px-3 py-2"
							rows="4" readonly>${resume.selfInfo}</textarea>
						<p class="text-gray-500 text-xs mt-1">600자 이내</p>
					</div>
				</div>
			</div>
			<!-- Phone Number and Email -->
			<div class="flex flex-wrap mb-4">
				<div class="w-full md:w-1/2 px-2 mb-4 md:mb-0">
					<label class="block text-gray-700 text-sm font-bold mb-2"
						for="phone">휴대폰 번호 *</label>
					<div class="flex">
						<input name="phone" value="${resume.phone}"
							class="flex-grow border rounded-r-lg px-3 py-2" type="text"
							readonly>
					</div>
				</div>
				<div class="w-full md:w-1/2 px-2">
					<label class="block text-gray-700 text-sm font-bold mb-2"
						for="email">이메일 *</label> <input name="email"
						value="${resume.email}"
						class="appearance-none border rounded-lg w-full px-3 py-2"
						type="email" readonly>
				</div>
			</div>

			<!-- Address -->
			<div class="mb-4 px-2">
				<label class="block text-gray-700 text-sm font-bold mb-2"
					for="address">주소 *</label> <input name="address"
					value="${resume.address}"
					class="appearance-none border rounded-lg w-full px-3 py-2"
					type="text" readonly>
				<p class="text-gray-500 text-xs mt-1">좋은 정보 추천을 위해 도로명(번지)까지 입력해
					주세요!</p>
			</div>


			<!-- 외국어 and 자격증 -->
			<div class="flex flex-wrap mb-4">
				<div class="w-full md:w-1/2 px-2 mb-4 md:mb-0">
					<label class="block text-gray-700 text-sm font-bold mb-2"
						for="phone">외국어</label>
					<div class="flex">
						<input name="language" value="${resume.language}"
							class="flex-grow border rounded-r-lg px-3 py-2" type="text"
							readonly>
					</div>
				</div>
				<div class="w-full md:w-1/2 px-2">
					<label class="block text-gray-700 text-sm font-bold mb-2"
						for="email">자격증</label> <input name="certification"
						value="${resume.certification}"
						class="appearance-none border rounded-lg w-full px-3 py-2"
						type="text" readonly>
				</div>
			</div>
			<!-- Education -->
			<div
				class="container mx-auto p-6 bg-white shadow-md rounded-lg mt-10 container-fixed div_line_none">
				<header class="mb-6">
					<h1 class="text-2xl font-bold">최종학력</h1>
				</header>

				<div class="space-y-4" id="education-fields">
					<!-- Education Entry -->
					<div class="border rounded-lg p-4 bg-gray-50 relative">
						<button type="button"
							class="absolute top-2 right-2 text-gray-500 hover:text-gray-700">&times;</button>
						<div class="flex flex-wrap -mx-2 mb-2">
							<div class="w-full md:w-1/2 px-2">
								<label class="block text-gray-700 text-sm font-bold mb-2"
									for="school-type">학교구분</label>
								<div class="relative">
									<select name="schoolType"
										class="appearance-none border rounded-lg w-full px-3 py-2"
										id="school-type">
										<option value="${resume.edu.schoolType}">${resume.edu.schoolType}</option>
									</select>
									<div class="custom-select-icon">
										<svg class="fill-current text-gray-600 w-4 h-4"
											viewBox="0 0 20 20">
											<path d="M7 10l5 5 5-5H7z" /></svg>
									</div>
								</div>
							</div>
							<div class="w-full md:w-1/2 px-2">
								<label class="block text-gray-700 text-sm font-bold mb-2"
									for="school-name">학교명</label>
								<div class="relative">
									<input name="schoolName" value="${resume.edu.schoolName}"
										class="appearance-none border rounded-lg w-full px-3 py-2"
										type="text" id="school-name" readonly>
								</div>
							</div>
						</div>
						<div class="flex flex-wrap -mx-2 mb-2">
							<div class="w-full md:w-1/2 px-2">
								<label class="block text-gray-700 text-sm font-bold mb-2"
									for="major">전공명</label>
								<div class="relative">
									<input name="major" value="${resume.edu.major}"
										class="appearance-none border rounded-lg w-full px-3 py-2"
										type="text" id="major" readonly>
								</div>
							</div>
						</div>
						<div class="flex flex-wrap -mx-2 mb-2"></div>
						<div class="flex flex-wrap -mx-2 mb-2">
							<div class="w-full md:w-1/3 px-2">
								<label class="block text-gray-700 text-sm font-bold mb-2"
									for="entry-date">입학년월</label> <input name="admissionDate"
									value="${resume.edu.admissionDate}"
									class="appearance-none border rounded-lg w-full px-3 py-2"
									type="text" id="entry-date" placeholder="2022.01" readonly>
							</div>
							<div class="w-full md:w-1/3 px-2">
								<label class="block text-gray-700 text-sm font-bold mb-2"
									for="graduation-date">졸업년월</label> <input name="graduateDate"
									value="${resume.edu.graduateDate}"
									class="appearance-none border rounded-lg w-full px-3 py-2"
									type="text" id="graduation-date" placeholder="2024.02" readonly>
							</div>
							<div class="w-full md:w-1/3 px-2">
								<label class="block text-gray-700 text-sm font-bold mb-2"
									for="graduation-status">졸업상태</label>
								<div class="relative">
									<select name="graduateState"
										class="appearance-none border rounded-lg w-full px-3 py-2"
										id="graduation-status">
										<option value="${resume.edu.graduateState}">${resume.edu.graduateState}</option>
									</select>
									<div class="custom-select-icon">
										<svg class="fill-current text-gray-600 w-4 h-4"
											viewBox="0 0 20 20">
											<path d="M7 10l5 5 5-5H7z" /></svg>
									</div>
								</div>
							</div>
						</div>
						<div class="flex flex-wrap -mx-2">
							<div class="w-full md:w-1/3 px-2 mb-4 md:mb-0">
								<label class="block text-gray-700 text-sm font-bold mb-2"
									for="credits">학점</label> <input name="score"
									value="${resume.edu.score}"
									class="appearance-none border rounded-lg w-full px-3 py-2"
									type="text" id="credits" placeholder="4.3" readonly>
							</div>
							<div class="w-full md:w-1/3 px-2 mb-4 md:mb-0">
								<label class="block text-gray-700 text-sm font-bold mb-2"
									for="total-credits">총점</label> <input name="totalScore"
									value="${resume.edu.totalScore}"
									class="appearance-none border rounded-lg w-full px-3 py-2"
									type="text" id="total-credits" placeholder="4.5" readonly>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Additional Sections -->
			<!-- Career -->
			<div
				class="container mx-auto p-6 bg-white shadow-md rounded-lg mt-10 div_line_none">
				<header class="mb-6">
					<h1 class="text-2xl font-bold">경력</h1>
					<span class="text-gray-500">최대 10개</span>
				</header>

				<div class="mb-4 p-4 bg-green-100 text-green-800 rounded-lg">
					경력 작성시 서류 합격률 3배 증가</div>

				<div class="space-y-4" id="experience-fields">
					<!-- Experience Entry -->
					<div class="border rounded-lg p-4 bg-gray-50 relative">
						<div class="flex justify-between items-center mb-2">
							<h2 class="text-lg font-bold">경력</h2>
						</div>
						<div class="flex flex-wrap -mx-2 mb-4">
							<div class="w-full md:w-1/3 px-2 mb-4 md:mb-0">
								<label class="block text-gray-700 text-sm font-bold mb-2"
									for="company-name">회사명</label> <input name="companyName"
									value="${resume.career.companyName}"
									class="appearance-none border rounded-lg w-full px-3 py-2"
									type="text" id="company-name" placeholder="회사명을 입력하세요" readonly>
							</div>
							<div class="w-full md:w-1/3 px-2 mb-4 md:mb-0">
								<label class="block text-gray-700 text-sm font-bold mb-2"
									for="position">직책</label> <input name="position"
									value="${resume.career.position}"
									class="appearance-none border rounded-lg w-full px-3 py-2"
									type="text" id="position" placeholder="팀장" readonly>
							</div>
							<div class="w-full md:w-1/3 px-2 mb-4 md:mb-0">
								<label class="block text-gray-700 text-sm font-bold mb-2"
									for="department">부서명</label> <input name="department"
									value="${resume.career.department}"
									class="appearance-none border rounded-lg w-full px-3 py-2"
									type="text" id="department" placeholder="인사팀" readonly>
							</div>
						</div>
						<div class="flex flex-wrap -mx-2 mb-4">
							<div class="w-full md:w-1/3 px-2 mb-4 md:mb-0">
								<label class="block text-gray-700 text-sm font-bold mb-2"
									for="employment-type">근무 유형</label>
								<div class="relative">
									<select name="workType"
										class="appearance-none border rounded-lg w-full px-3 py-2"
										id="employment-type">
										<option value="${resume.career.workType}">${resume.career.workType}</option>
									</select>
									<div class="custom-select-icon">
										<svg class="fill-current text-gray-600 w-4 h-4"
											viewBox="0 0 20 20">
											<path d="M7 10l5 5 5-5H7z" /></svg>
									</div>
								</div>
							</div>
							<div class="w-full md:w-1/3 px-2 mb-4 md:mb-0">
								<label class="block text-gray-700 text-sm font-bold mb-2"
									for="employment-status">재직 여부</label>
								<div class="relative">
									<select name="isWorking"
										class="appearance-none border rounded-lg w-full px-3 py-2"
										id="employment-status">
										<option value="${resume.career.isWorking}">${resume.career.isWorking}</option>
									</select>
									<div class="custom-select-icon">
										<svg class="fill-current text-gray-600 w-4 h-4"
											viewBox="0 0 20 20">
											<path d="M7 10l5 5 5-5H7z" /></svg>
									</div>
								</div>
							</div>
							<div class="w-full md:w-1/3 px-2 mb-4 md:mb-0">
								<label class="block text-gray-700 text-sm font-bold mb-2"
									for="employment-period">재직 기간</label> <input name="workPeriod"
									value="${resume.career.workPeriod}"
									class="appearance-none border rounded-lg w-full px-3 py-2"
									type="text" id="employment-period"
									placeholder="YYYY.MM. ~ YYYY.MM." readonly>
							</div>
						</div>
						<div class="mb-4">
							<label class="block text-gray-700 text-sm font-bold mb-2"
								for="job-description">담당 업무 (최대 1,500자)</label>
							<textarea name="workPart"
								class="appearance-none border rounded-lg w-full px-3 py-2"
								id="job-description" rows="4"
								placeholder="구체적인 역할과 성과 위주의 업무 내용을 작성해보세요. 수치와 함께 표현되면 경험이 잘 전달될 수 있습니다."
								readonly>${resume.career.workPart}</textarea>
						</div>
					</div>
				</div>
			</div>


			<!-- Project Section (New) -->
			<div
				class="container mx-auto p-6 bg-white shadow-md rounded-lg mt-10 div_line_none">
				<header class="mb-6">
					<h1 class="text-2xl font-bold">프로젝트</h1>
					<span class="text-gray-500">최대 10개</span>
				</header>

				<div class="space-y-4" id="project-fields">
					<!-- Project Entry -->
					<div class="border rounded-lg p-4 bg-gray-50 relative">
						<div class="flex justify-between items-center mb-2">
							<h2 class="text-lg font-bold">프로젝트</h2>

						</div>
						<div class="mb-4">
							<label class="block text-gray-700 text-sm font-bold mb-2"
								for="project-name">프로젝트명 (최대 300자)</label> <input
								name="projectName" value="${resume.project.projectName}"
								class="appearance-none border rounded-lg w-full px-3 py-2"
								type="text" id="project-name" placeholder="프로젝트명을 입력해 주세요."
								readonly>
						</div>
						<div class="mb-4">
							<label class="block text-gray-700 text-sm font-bold mb-2"
								for="organization">소속/기관</label> <input name="team"
								value="${resume.project.team}"
								class="appearance-none border rounded-lg w-full px-3 py-2"
								type="text" id="organization"
								placeholder="소속/기관이 없을 경우 개인 또는 기타로 입력해 주세요." readonly>
						</div>
						<div class="flex flex-wrap -mx-2 mb-4">
							<div class="w-full md:w-1/2 px-2 mb-4 md:mb-0">
								<label class="block text-gray-700 text-sm font-bold mb-2"
									for="status">진행 여부</label>
								<div class="relative">
									<select name="isGoing"
										class="appearance-none border rounded-lg w-full px-3 py-2"
										id="status">
										<option value="${resume.project.isGoing}">${resume.project.isGoing}</option>
									</select>
									<div class="custom-select-icon">
										<svg class="fill-current text-gray-600 w-4 h-4"
											viewBox="0 0 20 20">
											<path d="M7 10l5 5 5-5H7z" /></svg>
									</div>
								</div>
							</div>
							<div class="w-full md:w-1/2 px-2 mb-4 md:mb-0">
								<label class="block text-gray-700 text-sm font-bold mb-2"
									for="period">프로젝트 기간</label> <input name="projectPeriod"
									value="${resume.project.projectPeriod}"
									class="appearance-none border rounded-lg w-full px-3 py-2"
									type="text" id="period" placeholder="YYYY.MM. ~ YYYY.MM."
									readonly>
							</div>
						</div>
						<div class="mb-4">
							<label class="block text-gray-700 text-sm font-bold mb-2"
								for="description">프로젝트 설명 (최대 1,500자)</label>
							<textarea name="projectInfo"
								class="appearance-none border rounded-lg w-full px-3 py-2"
								id="description" rows="4"
								placeholder="프로젝트 내용과 본인의 역할, 기여도를 작성해보세요." readonly>${resume.project.projectInfo}</textarea>
						</div>
					</div>
				</div>
			</div>


			<div
				class="container mx-auto p-6 bg-white shadow-md rounded-lg mt-10 div_line_none">
				<header class="mb-6">
					<h1 class="text-2xl font-bold">포트폴리오</h1>
					<span class="text-gray-500">최대 15개</span>
				</header>
				<div class="space-y-4">
					<!-- URL Entry -->
					<div class="border rounded-lg p-4 bg-gray-50 relative"
						id="url-section">
						<h2 class="text-lg font-bold mb-4">URL</h2>
						<div class="flex mb-4">
							<input name="portfolioUrl"
								value="${resume.portfolio.portfolioUrl}"
								class="appearance-none border rounded-r-lg w-full px-3 py-2"
								type="text" placeholder="https://" readonly>
						</div>
					</div>
					<!-- File Upload Entry -->
					<div class="border rounded-lg p-4 bg-gray-50 relative"
						id="file-section">
						<h2 class="text-lg font-bold mb-4">첨부 파일</h2>
<!-- 						<button type="button" -->
<!-- 							class="text-blue-500 w-full py-2 mb-4 border border-blue-500 rounded-lg" -->
<!-- 							onclick="addFileField()">+ 파일 추가</button> -->
						<div class="flex items-center mb-4">
<!-- 							<input name="portfolioFileName" -->
<%-- 								value="${resume.portfolio.portfolioFile}" --%>
<!-- 								class="appearance-none border rounded-l-lg w-full px-3 py-2" -->
<!-- 								type="file" -->
<!-- 								onchange="this.nextElementSibling.value = this.value" disabled> -->
							${resume.portfolio.portfolioFile}
						</div>
					</div>
				</div>
			</div>

			<div class="login-inquiry">
				<a class="inquiry-button"
					href="${pageContext.request.contextPath}/resume/update-resume-form?resumeId=${resume.resumeId}">
					수정하기 </a> <a class="inquiry-button"
					href="${pageContext.request.contextPath}/member/member-main">
					홈으로 </a>
			</div>
		</form>
	</div>
	<script>
    function loadFile(event) {
      const image = document.getElementById('profileImage');
      image.src = URL.createObjectURL(event.target.files[0]);
    }

  function addLinkField() {
      const container = document.getElementById('url-section');
      const newField = document.createElement('div');
      newField.className = 'mb-4';
      newField.innerHTML = `
        <div class="flex mb-4">
          <input name="portfolioUrl" class="appearance-none border rounded-r-lg w-full px-3 py-2" type="text" placeholder="https://">
        </div>
      `;
      container.appendChild(newField);
    }

    function addFileField() {
      const container = document.getElementById('file-section');
      const newField = document.createElement('div');
      newField.className = 'mb-4';
      newField.innerHTML = `
        <div class="flex items-center mb-4">
          <input name="portfolioFileName"  class="appearance-none border rounded-l-lg w-full px-3 py-2" type="file" onchange="this.nextElementSibling.value = this.value">
        </div>
      `;
      container.appendChild(newField);
      newField.querySelector('input[type="file"]').click();
    }

    function addProjectEntry() {
      const projectEntries = document.getElementById('projectEntries');
      const newProjectNum = projectEntries.children.length+1;
      const newEntry = document.createElement('div');
      newEntry.className = 'border rounded-lg p-4 mb-4 bg-gray-50';
      newEntry.innerHTML = `
        <h3 class="font-bold">프로젝트</h3>
        <div class="mb-2">
          <label class="block text-gray-700 text-sm font-bold mb-2" for="project-name">프로젝트명 (최대 300자)</label>
          <input name="projects[${newProjectNum}].name" class="appearance-none border rounded-lg w-full px-3 py-2" type="text" placeholder="프로젝트명을 입력해 주세요.">
        </div>
        <div class="mb-2">
          <label class="block text-gray-700 text-sm font-bold mb-2" for="organization">소속/기관</label>
          <input name="projects[${newProjectNum}].team" class="appearance-none border rounded-lg w-full px-3 py-2" type="text" placeholder="소속/기관이 없을 경우 개인 또는 기타로 입력해 주세요.">
        </div>
        <div class="mb-2">
          <label class="block text-gray-700 text-sm font-bold mb-2" for="status">진행 여부</label>
          <select class="appearance-none border rounded-lg w-full px-3 py-2">
            <option>선택</option>
            <option>진행 중</option>
            <option>완료</option>
          </select>
        </div>
        <div class="mb-2">
          <label class="block text-gray-700 text-sm font-bold mb-2" for="duration">프로젝트 기간</label>
          <input name="projects[${newProjectNum}].projectPeriod" class="appearance-none border rounded-lg w-full px-3 py-2" type="text" placeholder="YYYY.MM. ~ YYYY.MM.">
        </div>
        <div class="mb-2">
          <label class="block text-gray-700 text-sm font-bold mb-2" for="description">프로젝트 설명 (최대 1,500자)</label>
          <textarea name="projects[${newProjectNum}].projectInfo" class="appearance-none border rounded-lg w-full px-3 py-2" rows="4" placeholder="프로젝트 내용과 본인의 역할, 기여도를 작성해보세요."></textarea>
        </div>
      `;
      projectEntries.appendChild(newEntry);
    }

    document.querySelector("button[onclick='addProject()']").addEventListener('click', function() {
      document.getElementById('projectSection').classList.remove('hidden');
    });


    function addExperienceField() {
      const container = document.getElementById('experience-fields');
      const newField = document.createElement('div');
      newField.className = 'border rounded-lg p-4 bg-gray-50 relative mt-4';
      newField.innerHTML = `
        <div class="flex justify-between items-center mb-2">
          <h2 class="text-lg font-bold">경력</h2>
          <div>
            <button type="button" class="text-gray-500 hover:text-gray-700">&uarr;</button>
            <button type="button" class="text-gray-500 hover:text-gray-700">&darr;</button>
            <button type="button" class="text-gray-500 hover:text-gray-700">&times;</button>
          </div>
        </div>
        <div class="flex flex-wrap -mx-2 mb-4">
          <div class="w-full md:w-1/3 px-2 mb-4 md:mb-0">
            <label class="block text-gray-700 text-sm font-bold mb-2" for="company-name">회사명</label>
            <input class="appearance-none border rounded-lg w-full px-3 py-2" type="text" id="company-name" placeholder="회사명을 입력하세요">
          </div>
          <div class="w-full md:w-1/3 px-2 mb-4 md:mb-0">
            <label class="block text-gray-700 text-sm font-bold mb-2" for="position">직책</label>
            <input class="appearance-none border rounded-lg w-full px-3 py-2" type="text" id="position" placeholder="팀장">
          </div>
          <div class="w-full md:w-1/3 px-2 mb-4 md:mb-0">
            <label class="block text-gray-700 text-sm font-bold mb-2" for="department">부서명</label>
            <input class="appearance-none border rounded-lg w-full px-3 py-2" type="text" id="department" placeholder="인사팀">
          </div>
        </div>
        <div class="flex flex-wrap -mx-2 mb-4">
          <div class="w-full md:w-1/3 px-2 mb-4 md:mb-0">
            <label class="block text-gray-700 text-sm font-bold mb-2" for="employment-type">근무 유형</label>
            <div class="relative">
              <select class="appearance-none border rounded-lg w-full px-3 py-2" id="employment-type">
                <option>선택</option>
                <option>정규직</option>
                <option>계약직</option>
                <option>인턴</option>
              </select>
              <div class="custom-select-icon">
                <svg class="fill-current text-gray-600 w-4 h-4" viewBox="0 0 20 20"><path d="M7 10l5 5 5-5H7z"/></svg>
              </div>
            </div>
          </div>
          <div class="w-full md:w-1/3 px-2 mb-4 md:mb-0">
            <label class="block text-gray-700 text-sm font-bold mb-2" for="employment-status">재직 여부</label>
            <div class="relative">
              <select class="appearance-none border rounded-lg w-full px-3 py-2" id="employment-status">
                <option>선택</option>
                <option>재직중</option>
                <option>퇴직</option>
              </select>
              <div class="custom-select-icon">
                <svg class="fill-current text-gray-600 w-4 h-4" viewBox="0 0 20 20"><path d="M7 10l5 5 5-5H7z"/></svg>
              </div>
            </div>
          </div>
          <div class="w-full md:w-1/3 px-2 mb-4 md:mb-0">
            <label class="block text-gray-700 text-sm font-bold mb-2" for="employment-period">재직 기간</label>
            <input class="appearance-none border rounded-lg w-full px-3 py-2" type="text" id="employment-period" placeholder="YYYY.MM. ~ YYYY.MM.">
          </div>
        </div>
        <div class="mb-4">
          <label class="block text-gray-700 text-sm font-bold mb-2" for="job-description">담당 업무 (최대 1,500자)</label>
          <textarea class="appearance-none border rounded-lg w-full px-3 py-2" id="job-description" rows="4" placeholder="구체적인 역할과 성과 위주의 업무 내용을 작성해보세요. 수치와 함께 표현되면 경험이 잘 전달될 수 있습니다."></textarea>
        </div>
      `;
      container.appendChild(newField);
    }

    function addProjectField2() {
      const container = document.getElementById('project-fields');
      const newField2 = document.createElement('div');
      newField2.className = 'border rounded-lg p-4 bg-gray-50 relative mt-4';
      newField2.innerHTML = `
        <div class="flex justify-between items-center mb-2">
          <h2 class="text-lg font-bold">프로젝트</h2>
          <div>
            <button type="button" class="text-gray-500 hover:text-gray-700">&uarr;</button>
            <button type="button" class="text-gray-500 hover:text-gray-700">&darr;</button>
            <button type="button" class="text-gray-500 hover:text-gray-700">&times;</button>
          </div>
        </div>
        <div class="mb-4">
          <label class="block text-gray-700 text-sm font-bold mb-2" for="project-name">프로젝트명 (최대 300자)</label>
          <input class="appearance-none border rounded-lg w-full px-3 py-2" type="text" id="project-name" placeholder="프로젝트명을 입력해 주세요.">
        </div>
        <div class="mb-4">
          <label class="block text-gray-700 text-sm font-bold mb-2" for="organization">소속/기관</label>
          <input class="appearance-none border rounded-lg w-full px-3 py-2" type="text" id="organization" placeholder="소속/기관이 없을 경우 개인 또는 기타로 입력해 주세요.">
        </div>
        <div class="flex flex-wrap -mx-2 mb-4">
          <div class="w-full md:w-1/2 px-2 mb-4 md:mb-0">
            <label class="block text-gray-700 text-sm font-bold mb-2" for="status">진행 여부</label>
            <div class="relative">
              <select class="appearance-none border rounded-lg w-full px-3 py-2" id="status">
                <option>선택</option>
                <option>진행 중</option>
                <option>완료</option>
              </select>
              <div class="custom-select-icon">
                <svg class="fill-current text-gray-600 w-4 h-4" viewBox="0 0 20 20"><path d="M7 10l5 5 5-5H7z"/></svg>
              </div>
            </div>
          </div>
          <div class="w-full md:w-1/2 px-2 mb-4 md:mb-0">
            <label class="block text-gray-700 text-sm font-bold mb-2" for="period">프로젝트 기간</label>
            <input class="appearance-none border rounded-lg w-full px-3 py-2" type="text" id="period" placeholder="YYYY.MM. ~ YYYY.MM.">
          </div>
        </div>
        <div class="mb-4">
          <label class="block text-gray-700 text-sm font-bold mb-2" for="description">프로젝트 설명 (최대 1,500자)</label>
          <textarea class="appearance-none border rounded-lg w-full px-3 py-2" id="description" rows="4" placeholder="프로젝트 내용과 본인의 역할, 기여도를 작성해보세요."></textarea>
        </div>
      `;
      container.appendChild(newField2);
    }
  </script>
</body>
</html>
