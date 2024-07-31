<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>New Application Page</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css"
	rel="stylesheet">
<style>
.container {
	max-width: 600px;
	margin: 0 auto;
	padding: 2rem;
}

.resume-container {
	max-height: 300px;
	overflow-y: auto;
}

.support-button {
	background-color: #4CAF50; /* Green */
	color: white;
	text-align: center;
	padding: 12px 0;
	border-radius: 4px;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	width: 100%;
}
</style>
</head>
<body class="bg-gray-100">
	<div class="container bg-white p-6 rounded-lg shadow-md">
		<h1 class="text-blue-600 font-bold text-lg mb-2">${anno.businessName}</h1>
		<h2 class="text-xl font-bold mb-4">${anno.annoTitle}</h2>



		<div class="border p-4 mb-4">
			<h3 class="text-lg font-bold mb-2">지원이력서</h3>
			<p>${resume.resumeTitle }</p>
			<div class="mt-2">
				<span class="block text-gray-700">이메일: ${resume.email}</span> <span
					class="block text-gray-700">휴대폰번호: ${resume.phone }</span>
			</div>
		</div>


		<p class="text-sm text-gray-500 mb-4">* 개인정보보호를 위해 개인정보가 포함된 파일은
			사전에 동의 없이 삭제될 수 있습니다.</p>
		<p class="text-sm text-gray-500 mb-4">* 채용시스템에 따른 마감 90일까지 지원기기에서
			삭제 가능합니다.</p>


		<button class="bg-orange-500 text-white w-full py-2 rounded mb-4"
			onclick="submitData('${resume.resumeId}', '${anno.annoId}')">지원하기</button>
		<button type="button" class="support-button"
			onclick="submitData(`${resume.resumeId}`,`${anno.annoId}`)">지원하기</button>

	</div>

	<script>
    // 폼 제출 이벤트 처리
    
   
    function submitData(resumeId, annoId) {
        console.log("Resume ID: ", resumeId);  // 값을 확인하기 위해 로그 출력
        console.log("Anno ID: ", annoId);      // 값을 확인하기 위해 로그 출력
        // 여기까지는 값이 잘 넘어온다
    
        const url = `${pageContext.request.contextPath}/resume/resume-anno-register?resumeId=`+ resumeId + `&annoId=`+ annoId;
        
        fetch(url, { // 여기에 실제 서버 URL 입력
            method: 'GET'
        })
        .then(response => {
            if (!response.ok) { // 응답 상태 확인
                throw new Error('Network response was not ok ' + response.status);
            }
            return response; // 응답을 JSON으로 파싱
        })
        .then(data => {
            console.log(data); // 서버로부터 받은 데이터 출력
            alert('이력서 지원이 완료되었습니다');
            if (window.opener) {
                window.opener.location.reload(); // 부모 창 새로 고침
            }
            window.close(); // 현재 창 닫기
        })
        .catch(error => {
            console.error('There has been a problem with your fetch operation:', error);
        });
    }
</script>

</body>
</html>
