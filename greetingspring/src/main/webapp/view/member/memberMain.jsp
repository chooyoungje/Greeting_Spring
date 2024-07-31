<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon"
	href="https://framerusercontent.com/images/2JM2En4ZikryoxRiHtpLKZJIQo.png" />
<title>그리팅 | 그리팅 가이드</title>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
	rel="stylesheet">
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
img, video {
    display: inline;
    width: 70%;
    border-radius: 10px;
    height: auto;
}
</style>
</head>
<body class="bg-gray-100">
	<div class="flex h-screen">
		<!-- Sidebar -->
		<div class="w-1/5 bg-white shadow-lg p-4 flex flex-col">
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
							href="${pageContext.request.contextPath}/anno/business-anno-list"
							class="text-blue-500"><b>공고목록</b></a></li>
						<li class="mb-2"><a
							href="${pageContext.request.contextPath}/anno/business-anno-insert-form"
							class="text-blue-500">공고작성</a></li>
					</ul>
				</c:if>
				<ul>
					<li class="mb-2"><a
						href="${pageContext.request.contextPath}/member/member-main"
						class="text-blue-500"><b>회원정보</b></a></li>
					<li class="mb-2"><a
						href="${pageContext.request.contextPath}/business/business-list"
						class="text-blue-500"><b>기업리스트</b></a></li>
				</ul>
			</div>
			<c:if
				test="${sessionScope.memberId != null || sessionScope.businessId != null}">
				<div class="login-inquiry mt-auto">
					<a href="${pageContext.request.contextPath}/member/member-logout"
						method="post">
						<button type="submit" class="inquiry-button">로그아웃</button>
					</a> <a href="${pageContext.request.contextPath}/member/member-info"
						method="post">
						<button type="submit" class="inquiry-button">내 정보</button>
					</a>
				</div>
			</c:if>
		</div>
		<!-- Main Content -->
		<div class="flex-1 p-6">
			<!-- Header -->
			<form
				action="${pageContext.request.contextPath}/member/update-profileImage"
				method="post" enctype="multipart/form-data">
				<div class="flex bg-white shadow-lg rounded p-4 mb-4">
					<!-- 왼쪽에 프로필 사진 -->
					<div class="w-1/3 mr-8">
						<h2 class="text-lg font-semibold mb-4">프로필 사진</h2>
						<input type="hidden" name="num" value="${member.memberId}" /> <input
							type="hidden" name="originfile" value="${member.profileImage}" />
						<div class="w-48 h-48 bg-gray-200 rounded-full overflow-hidden">
							<img
								src="${pageContext.request.contextPath}/img/member/${member.profileImage}"
								alt="프로필 사진" class="w-full h-full object-cover">
						</div>
						<input type="file" name="profileImageFile" id="profile-pic"
							class="mt-4"><br>
						<button type="submit" class="inquiry-button">변경하기</button>
					</div>
					<!-- 오른쪽에 개인 정보 -->
					<div class="w-2/3">
						<h2 class="text-lg font-semibold mb-4">개인 정보</h2>
						<form action="member-update-pro" method="post"
							enctype="multipart/form-data">
							<div class="mb-4">
								<label for="name"
									class="block text-sm font-medium text-gray-700">이름</label> <input
									type="text" name="name" id="name"
									class="mt-1 p-2 border border-gray-300 rounded w-full"
									value="${member.name}" readonly>
							</div>
							<div class="mb-4">
								<label for="email"
									class="block text-sm font-medium text-gray-700">이메일</label> <input
									type="email" name="email" id="email"
									class="mt-1 p-2 border border-gray-300 rounded w-full"
									value="${member.email}" readonly>
							</div>
							<div class="mb-4">
								<label for="phone"
									class="block text-sm font-medium text-gray-700">전화번호</label> <input
									type="tel" name="phone" id="phone"
									class="mt-1 p-2 border border-gray-300 rounded w-full"
									value="${member.phone}" readonly>
							</div>
							<div class="mb-4">
								<label for="birth"
									class="block text-sm font-medium text-gray-700">생년월일</label> <input
									type="text" name="birth" id="birth"
									class="mt-1 p-2 border border-gray-300 rounded w-full"
									value="${member.birth}" readonly>
							</div>
						</form>
					</div>
				</div>
			</form>

			<!-- 이력서 관리 -->
			<div class="flex flex-col bg-white shadow-lg rounded p-4 mb-4">
				<div class="flex justify-between mb-2">
					<h2 class="text-lg font-semibold">이력서 관리</h2>
					<a
						href="${pageContext.request.contextPath}/resume/resume-register-form"
						method="post">
						<button type="submit" class="inquiry-button">이력서 작성하러 가기</button>
					</a>
				</div>
				<div class="border-t border-gray-200 pt-4">
					<table class="w-full">
						<thead class="text-left text-gray-500">
							<tr>
								<th>기본 이력서</th>
								<th>이력서 제목</th>
								<th>이력서 작성날짜</th>
								<th>이력서 관리</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="resume" items="${memberResumeList}">
								<tr>
									<td class="py-2">
										<div class="flex items-center">
											<c:if test="${resume.isDefault == 1}">
												<span
													class="bg-blue-100 text-blue-700 text-xs font-semibold px-2 py-1 rounded">기본이력서</span>
											</c:if>
										</div>
									</td>
									<td class="text-sm text-gray-500">${resume.resumeTitle}</td>
									<td class="text-sm text-gray-500">${resume.registDate}</td>
									<td>
										<div class="flex space-x-2">
											<a
												href="${pageContext.request.contextPath}/resume/update-resume-default?resumeId=${resume.resumeId}"
												class="inquiry-button">기본이력서 설정</a> <a
												href="${pageContext.request.contextPath}/resume/update-resume-form?resumeId=${resume.resumeId}"
												class="inquiry-button">수정</a>
											<button onclick="deleteResume('${resume.resumeId}')"
												class="inquiry-button">삭제</button>
											<a
												href="${pageContext.request.contextPath}/resume/resume-info?resumeId=${resume.resumeId}"
												class="inquiry-button">이력서 보기</a>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<script>
		function deleteResume(resumeId) {
			const ok = confirm("이력서를 지우시겠습니까??");
			if (ok == true) {
				location.href = "${pageContext.request.contextPath}/resume/delete-resume?resumeId="
						+ resumeId;
			} else {

			}
		}
	</script>
</body>
</html>
