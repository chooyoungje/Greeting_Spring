<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="shortcut icon" href="https://framerusercontent.com/images/2JM2En4ZikryoxRiHtpLKZJIQo.png"/><title>그리팅 | 채용에 경쟁력을 더하다</title>
   <style>
      @font-face {
         font-family: 'Pretendard-Regular';
         src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
         font-weight: 400;
         font-style: normal;
      }

      * {
         margin: 0;
         padding: 0;
         box-sizing: border-box;
         font-family: Pretendard-Regular;
      }

      body {
         font-family: Arial, sans-serif;
         line-height: 1.6;
      }

      .top-bar {
         background: #007bff;
         color: #fff;
         text-align: center;
         padding: 10px 0;
         font-size: 14px;
      }

      .top-bar a {
         color: #fff;
         text-decoration: none;
         margin-left: 5px;
      }

      header {
         background: #fff;
         border-bottom: 1px solid #ddd;
         padding: 10px 0;
      }

      .container {
         width: 80%;
         margin: 0 auto;
         display: flex;
         justify-content: space-between;
         align-items: center;
      }

      .logo {
         display: flex;
         align-items: center;
      }

      .logo img {
         height: 40px;
         margin-right: 10px;
      }

      .logo a {
         text-decoration: none;
         font-size: 26px;
         font-weight: bold;
         color: #000;
         display: flex;
         align-items: center;
      }

      nav ul {
         list-style: none;
         display: flex;
         align-items: center;
      }

      nav ul li {
         margin: 0 10px;
         position: relative;
      }

      nav ul li a {
         color: #333;
         text-decoration: none;
         padding: 5px 0;
      }

      nav ul li:hover a {
         color: #007bff;
      }

      .dropdown {
         display: none;
         position: absolute;
         top: 30px;
         left: 0;
         background: #fff;
         border: 1px solid #ddd;
         box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
         z-index: 1000;
      }

      nav ul li:hover .dropdown {
         display: block;
      }

      .dropdown ul {
         display: block;
      }

      .dropdown ul li {
         margin: 0;
      }

      .dropdown ul li a {
         padding: 10px;
         display: block;
         color: #333;
      }

      .login-inquiry {
         display: flex;
         align-items: center;
      }

      .login-inquiry a {
         color: #333;
         text-decoration: none;
         margin-left: 20px;
      }

      .inquiry-button {
         background: #333;
         color: white;
         padding: 5px 10px;
         border-radius: 5px;
         text-decoration: none;
      }

      .main-section {
         position: relative;
         width: 100%;
         height: 60vh;
         background: url('https://ifh.cc/g/TcbpOv.jpg') no-repeat center center/cover;
         display: flex;
         justify-content: center;
         align-items: center;
      }

      .main-section h1 {
         color: #fff;
         font-size: 48px;
         padding: 10px 20px;
      }

      .chat-button {
         position: fixed;
         bottom: 20px;
         right: 20px;
         width: 155px;
         height: 60px;
      }

      .highlight-section {
         padding: 100px 0;
         text-align: center;
         font-size: 24px;
      }

      .highlight-section p {
         color: #ccc;
         transition: color 0.3s;
      }

      .highlight {
         color: #000 !important;
      }
      .logosize {
         border-radius: 30%;
      }
   </style>
</head>

<body>
   <div class="top-bar">
      그리팅 도입이 고민이라면? 제안서 먼저 받아보세요 <a href="#">더 알아보기</a>
   </div>

   <header>
      <div class="container">
         <div class="logo">
            <a href="${pageContext.request.contextPath}/business/business-main"><img src="https://ifh.cc/g/HL86Yz.png" alt="Greeting Logo" class="logosize">Greeting</a>
         </div>
         <nav>
            <ul>
               <li><a href="#">제품</a>
                  <div class="dropdown">
                     <ul>
                        <li><a href="#">제품1</a></li>
                        <li><a href="#">제품2</a></li>
                     </ul>
                  </div>
               </li>
               <li><a href="#">엔터프라이즈</a></li>
               <li><a href="#">요금제</a></li>
               <li><a href="#">고객사례</a></li>
               <li><a href="#">인사이트</a></li>
               <li><a href="#">정부지원 바우처</a></li>
            </ul>
         </nav>
         <c:if test="${sessionScope.businessId==null }">
         <div class="login-inquiry">
            <a href="${pageContext.request.contextPath}/business/business-login">로그인</a>
            <a href="${pageContext.request.contextPath}/business/business-list" class="inquiry-button" style="color: white;">기업리스트</a>
         </div>
         </c:if>
         
          <c:if test="${sessionScope.businessId!=null }">
         <div class="login-inquiry">
            <a href="${pageContext.request.contextPath}/business/business-info?businessId=${businessId}">${business.businessName}님</a>
            <a href="${pageContext.request.contextPath}/business/business-logout">로그아웃</a>
            <a href="${pageContext.request.contextPath}/business/business-list" class="inquiry-button" style="color: white;">기업리스트</a>
          <a href="${pageContext.request.contextPath}/anno/business-anno-list" class="text-blue-500"><b>공고목록</b></a>
				   <a href="${pageContext.request.contextPath}/anno/business-anno-insert-form" class="text-blue-500">공고작성</a>
         </div>
         </c:if>
      </div>
   </header>

   <section class="main-section">
      <h1>채용경쟁력.</h1>
   </section>

   <section class="highlight-section">
      <p>더 나은 채용 프로세스를 만드는 능력.</p>
      <p>모든 지원자 경험을 긍정적으로 만드는 능력.</p>
      <p>결국 다니고 싶은 회사로 만드는 능력.</p>
   </section>

   <img class="chat-button" src="https://ifh.cc/g/bHw5s5.png" alt="">
   <!-- <a href="#">채팅상담</a> -->

   <script>
      document.addEventListener('scroll', function () {
         const paragraphs = document.querySelectorAll('.highlight-section p');
         paragraphs.forEach(paragraph => {
            const rect = paragraph.getBoundingClientRect();
            if (rect.top >= 0 && rect.bottom <= window.innerHeight) {
               paragraph.classList.add('highlight');
            } else {
               paragraph.classList.remove('highlight');
            }
         });
      });
   </script>
</body>

</html>