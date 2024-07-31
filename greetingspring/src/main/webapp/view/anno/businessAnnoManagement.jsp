<%@page import="model.Anno"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>칸반 보드</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css"
	rel="stylesheet">
<style>
.card {
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	border-radius: 0.5rem;
}

.column {
	min-height: 80vh;
	position: relative;
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

img, video {
	display: inline;
	width: 69.8%;
	border-radius: 10px;
	height: auto;
}

header .text-2xl {
	/* 	display: block; */
	margin-left: 200px;
}


</style>
</head>
<body class="bg-gray-100">
	<div class="flex flex-col h-screen">
		<header class="header bg-white p-4 shadow-md">
			<div class="container mx-auto flex justify-between items-center">
				<h1 class="text-2xl font-bold">이력서 관리</h1>
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
								href="${pageContext.request.contextPath}/anno/business-anno-update-form?annoId=${anno.annoId}"
								class="text-blue-500"><b>공고수정</b></a></li>
							<li class="mb-2"><a
								href="${pageContext.request.contextPath}/anno/business-anno-info?annoId=${anno.annoId}"
								class="text-blue-500">공고정보</a></li>
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
			<!-- 컬럼 컨테이너 -->
			<div class="main-content w-5/6 p-4 overflow-x-auto"
				id="columns-container">
				<form
					action="${pageContext.request.contextPath}/anno/business-column-save?annoId=${anno.annoId}"
					method="post">
					<input type="hidden" name="columnCount" id="columnCountInput"
						value="${column.columnStage}">
					<button class="bg-blue-500 text-white px-4 py-2 rounded mt-4"
						id="add-column" type="submit">저장</button>
					<div class="flex space-x-4" id="column-wrapper">
						<!-- 예제 컬럼 -->

						<!--  -->
						<c:if test="${columnList != null }">
							<c:forEach begin="0" end="${column.columnStage}" var="c"
								items="${columnList}">
								<div id="column-line"
									class="column bg-white rounded-lg shadow p-4 w-60">
									<h2
										class="text-lg font-bold mb-4 flex justify-between items-center">
										<input name="columnTitle"
											value="${empty c.columnTitle ? '컬럼 제목' : c.columnTitle}"
											placeholder="컬럼 제목" />
										<div>
											<button type="button" class="text-red-500 delete-column">x</button>
										</div>
									</h2>


									<c:forEach var="r" items="${resumeList}">
										<c:if test="${r.columnStage == c.columnStage}">
											<div class="card bg-gray-50 p-4 mb-4 relative">
												<span class="arrow arrow-left" style="display: none;">&lt;</span>
												<a
													href="${pageContext.request.contextPath}/anno/anno-resume-evaluate?annoId=${anno.annoId}&resumeId=${r.resumeId}&resumeColumnStage=${r.columnStage}">
													<input type="hidden" name="resumeId" value="${r.resumeId}">
													<h3 class="font-bold text-sm">${r.resumeTitle}</h3>
													<p class="text-gray-600 text-xs">${r.name}</p>
													<p class="text-gray-600 text-xs">${r.registerToCompanyDate}</p>
													<c:if test="${r.resumeScore != 0 }">
														<p class="text-gray-600 text-xs text-green-500">${r.resumeScore}점</p>
													</c:if> <c:if test="${r.resumeScore == 0 }">
														<p class="text-gray-600 text-xs text-red-500">평가 이전</p>
													</c:if>

												</a> <span class="arrow arrow-right" style="display: none;">&gt;</span>
											</div>
										</c:if>
									</c:forEach>
								</div>
							</c:forEach>
						</c:if>

						<c:if test="${columnList == null}">
							<div id="column-line"
								class="column bg-white rounded-lg shadow p-4 w-60">
								<h2
									class="text-lg font-bold mb-4 flex justify-between items-center">
									<input name="columnTitle"
											value="${empty c ? '컬럼 제목' : c}"
											placeholder="컬럼 제목" />
<%-- 									<input name="columnTitle" value="${c}" placeholder="컬럼 제목" /> --%>
									<div>
										<button type="button" class="text-red-500 delete-column">x</button>
									</div>
								</h2>
								<c:forEach var="r" items="${resumeList}">
									<div class="card bg-gray-50 p-4 mb-4 relative">
										<span class="arrow arrow-left" style="display: none;">&lt;</span>
										<a
											href="${pageContext.request.contextPath}/anno/anno-resume-evaluate?annoId=${anno.annoId}&resumeId=${r.resumeId}">
											<input type="hidden" name="resumeId" value="${r.resumeId}">
											<h3 class="font-bold text-sm">${r.resumeTitle}</h3>
											<p class="text-gray-600 text-xs">${r.name}</p>
											<p class="text-gray-600 text-xs">${r.registerToCompanyDate}</p>
											<c:if test="${r.resumeScore != 0 }">
												<p class="text-gray-600 text-xs text-green-500">${r.resumeScore}점</p>
											</c:if> <c:if test="${r.resumeScore == 0 }">
												<p class="text-gray-600 text-xs text-red-500">평가 이전</p>
											</c:if>
										</a> <span class="arrow arrow-right" style="display: none;">&gt;</span>
									</div>
								</c:forEach>
							</div>
						</c:if>
						<!-- 칼럼 추가 버튼 -->
						<div class="flex items-center">
							<button type="button" class="text-blue-500 text-2xl"
								id="dynamic-add-column">+</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
    $(document).ready(function () {
        let columnCount = parseInt($('#columnCountInput').val()) || 1;
        updateColumnCountInput();

        $('#dynamic-add-column').on('click', function () {
            addColumn();
            columnCount++;
            updateColumnCountInput();
        });

        function addCard(button) {
            const $column = $(button).closest('.column');
            const $card = $('<div>', {class: 'card bg-gray-50 p-4 mb-4'});
            $card.html('<h3 class="font-bold text-sm">New Task</h3><p class="text-gray-600 text-xs">Details about the new task</p>');
            $column.find('h2').after($card);
        }

        function addColumn() {
            const $container = $('#column-wrapper');
            const $column = $('<div>', {class: 'column bg-white rounded-lg shadow p-4 w-60'});

            $column.html(`
                <h2 class="text-lg font-bold mb-4 flex justify-between items-center">
                    <input name="columnTitle" value="새 컬럼" />
                    <div>
                        <button class="text-red-500 delete-column">x</button>
                    </div>
                </h2>
            `);

            // 칼럼을 추가한 후 버튼을 이동합니다.
            $('#dynamic-add-column').closest('.flex.items-center').before($column);
        }

        function deleteColumn(button) {
            $(button).closest('.column').remove();
            columnCount--;
            updateColumnCountInput();
        }

        function updateColumnCountInput() {
            $('#columnCountInput').val(columnCount);
        }

        // Delete column event delegation
        $(document).on('click', '.delete-column', function () {
            deleteColumn(this);
        });

        window.addCard = addCard;
    });
</script>
</body>
</html>
