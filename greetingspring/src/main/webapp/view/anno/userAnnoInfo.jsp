<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Anno Info</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
<style>
  .container {
    max-width: 800px;
    margin: 0 auto;
    padding: 2rem;
  }
  .info {
    display: grid;
    grid-template-columns: 1fr 2fr;
    gap: 0.5rem;
    margin-bottom: 1rem;
  }
  .info div:nth-child(odd) {
    font-weight: bold;
  }
  .actions {
    display: flex;
    gap: 1rem;
    margin-top: 1rem;
  }
  .header {
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  }
  .btn-apply {
    background-color: #FFA07A; /* 옅은 주황색 */
    color: white;
    padding: 8px 16px;
    border-radius: 4px;
    text-decoration: none;
  }
  .btn-list {
    background-color: #ADD8E6; /* 옅은 파란색 */
    color: white;
    padding: 8px 16px;
    border-radius: 4px;
    text-decoration: none;
  }
  .btn-disabled {
    background-color: #D3D3D3; /* 밝은 회색 */
    color: white;
    padding: 8px 16px;
    border-radius: 4px;
    text-decoration: none;
  }
  .btn-active {
    background-color: #FFA500; /* 주황색 */
    color: white;
    padding: 8px 16px;
    border-radius: 4px;
    text-decoration: none;
  }
</style>
</head>
<body class="bg-gray-100">
  <div class="container bg-white p-6 rounded-lg shadow-md">
    <h2 class="text-2xl font-bold mb-4">Anno Info</h2>
    
    <div class="info">
      <div>annoId:</div>
      <div>${anno.annoId}</div>
      
      <div>annodate:</div>
      <div>${anno.annoDate}</div>
      
      <div>기업명:</div>
      <div>${anno.businessName}</div>
      
      <div>복지:</div>
      <div>${anno.welfare}</div>
      
      <div>공고 제목:</div>
      <div>${anno.annoTitle}</div>
      
      <div>경력:</div>
      <div>${anno.annoCareer}</div>
      
      <div>연봉:</div>
      <div>${anno.annoSalary}</div>
      
      <div>학력:</div>
      <div>${anno.annoEdu}</div>
      
      <div>직급:</div>
      <div>${anno.annoGrade}</div>
      
      <div>근무 형태:</div>
      <div>${anno.annoWorkType}</div>
      
      <div>근무 요일:</div>
      <div>${anno.annoWorkDay}</div>
      
      <div>근무지:</div>
      <div>${anno.annoWorkPlace}</div>
      
      <div>공통 자격:</div>
      <div>${anno.annoCommon}</div>
      
      <div>지원 자격:</div>
      <div>${anno.annoQualification}</div>
      
      <div>채용 인원:</div>
      <div>${anno.annoPickNum}</div>
      
      <div>공고 내용:</div>
      <div>${anno.annoContent}</div>
      
      <div>기업 ID:</div>
      <div>${anno.businessId}</div>
    </div>
    
    <!-- Skill Selection -->
    <div class="form-group">
      <label for="skills" class="form-label">스킬:</label>
      <div id="skills">
        <div>${skills.skills}</div>
      </div>
    </div>
    
    <div class="actions">
      <c:if test="${findResult >= 1}">
        <button id="openNewPageBtn" disabled class="btn-disabled">지원완료</button>
      </c:if>
      <c:if test="${findResult == 0 or findResult == null}">
        <button id="openNewPageBtn" onclick="openNewPage('${anno.annoId}')" class="btn-active">지원하기</button>
      </c:if>
      <a href="${pageContext.request.contextPath}/anno/user-anno-list" class="btn-list">목록보기</a>
    </div>
  </div>
  <script>
    var width = 430;
    var height = 660;

    // Calculate the position to center the window
    var left = (screen.width / 2) - (width / 2);
    var top = (screen.height / 2) - (height / 2);

    function openNewPage(annoId) {
      window.open("${pageContext.request.contextPath}/resume/resume-anno-register-form?annoId=" + annoId, 
        'NewPage',
        'width=' + width + ',height=' + height + ',top=' + top + ',left=' + left);
    }
  </script>
</body>
</html>
