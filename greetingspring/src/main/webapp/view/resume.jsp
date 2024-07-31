<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Profile Form</title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
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
      padding-bottom: 100px; /* To ensure there's space for the fixed bottom bar */
    }
    .image-upload-wrapper {
      position: relative;
      width: 150px;
      height: 150px;
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
  </style>
</head>
<body class="bg-gray-100">
  <div class="container mx-auto p-6 bg-white shadow-md rounded-lg mt-10 container-fixed">
    <header class="text-center mb-6">
      <h1 class="text-2xl font-bold">이름을 입력해 주세요.</h1>
      <p class="text-gray-500">직업을 입력해 주세요. (ex-백엔드 개발자)</p>
    </header>
    <div class="w-full md:w-1/2 text-center mt-4 md:mt-0">
        <label class="block text-gray-700 text-sm font-bold mb-2" for="upload">이미지 업로드</label>
        <div class="image-upload-wrapper">
          <img id="profileImage" src="https://via.placeholder.com/150" alt="Profile Image">
          <input type="file" id="imageUpload" accept="image/*" onchange="loadFile(event)">
        </div>
        <p class="text-gray-500 text-xs mt-2">가로 600px, 세로 600px / 5MB이하</p>
        <p class="text-gray-500 text-xs">등록 가능 확장자: jpg, png, jpeg</p>
      </div>
    <form>
      <!-- Phone Number and Email -->
      <div class="flex flex-wrap mb-4">
        <div class="w-full md:w-1/2 px-2 mb-4 md:mb-0">
          <label class="block text-gray-700 text-sm font-bold mb-2" for="phone">휴대폰 번호 *</label>
          <div class="flex">
            <select class="appearance-none border rounded-l-lg px-3 py-2">
              <option>+82</option>
              <option>+1</option>
              <option>+44</option>
            </select>
            <input class="flex-grow border rounded-r-lg px-3 py-2" type="text" placeholder="01012345678">
          </div>
        </div>
        <div class="w-full md:w-1/2 px-2">
          <label class="block text-gray-700 text-sm font-bold mb-2" for="email">이메일 *</label>
          <input class="appearance-none border rounded-lg w-full px-3 py-2" type="email" value="joonho2008@naver.com">
        </div>
      </div>

      <!-- Address -->
      <div class="mb-4 px-2">
        <label class="block text-gray-700 text-sm font-bold mb-2" for="address">주소 *</label>
        <input class="appearance-none border rounded-lg w-full px-3 py-2" type="text" placeholder="주소">
        <p class="text-gray-500 text-xs mt-1">좋은 정보 추천을 위해 도로명(번지)까지 입력해 주세요!</p>
      </div>

      <!-- Introduction -->
      <div class="mb-4 px-2">
        <label class="block text-gray-700 text-sm font-bold mb-2" for="introduction">한줄 소개</label>
        <textarea class="appearance-none border rounded-lg w-full px-3 py-2" rows="4" placeholder="채용담당자에게 특별한 인상을 줄 수 있는 지원자님만의 소개 글을 작성해 보세요!"></textarea>
        <p class="text-gray-500 text-xs mt-1">600자 이내</p>
      </div>

      <!-- Image Upload and Job Selection -->
      <div class="mb-4 px-2 flex items-center">
        <div class="w-full md:w-1/2">
          <label class="block text-gray-700 text-sm font-bold mb-2" for="job">관심 직군</label>
          <select class="appearance-none border rounded-lg w-full px-3 py-2">
            <option>전체</option>
            <option>개발</option>
            <option>디자인</option>
          </select>
        </div>

      </div>

      <!-- Skill Tags -->
      <div class="mb-4 px-2">
        <label class="block text-gray-700 text-sm font-bold mb-2" for="skills">내로 표현하는 태그 (최대 5개)</label>
        <div class="flex flex-wrap gap-2">
          <span class="px-3 py-1 bg-gray-200 rounded-full text-sm">백엔드</span>
          <span class="px-3 py-1 bg-gray-200 rounded-full text-sm">프론트엔드</span>
          <span class="px-3 py-1 bg-gray-200 rounded-full text-sm">디자인</span>
          <!-- Add more tags as needed -->
        </div>
      </div>

      <!-- Skill Stack -->
      <div class="mb-4 px-2">
        <label class="block text-gray-700 text-sm font-bold mb-2" for="skill-stack">기술 스택</label>
        <input class="appearance-none border rounded-lg w-full px-3 py-2" type="text" placeholder="기술 스택을 입력하세요 (예: ms-office, java, photoshop)">
      </div>

      <!-- Experience -->
      <div class="mb-4 px-2">
        <label class="block text-gray-700 text-sm font-bold mb-2" for="experience">경력</label>
        <textarea class="appearance-none border rounded-lg w-full px-3 py-2" rows="4" placeholder="경력을 입력하세요"></textarea>
      </div>
    </form>
  </div>

  <!-- Fixed Bottom Bar -->
  <div class="fixed-bottom-bar flex justify-between items-center">
    <button class="bg-gray-300 text-gray-700 px-4 py-2 rounded">일반 PDF 다운</button>
    <button class="bg-gray-300 text-gray-700 px-4 py-2 rounded">테마 PDF 다운</button>
    <button class="bg-green-500 text-white px-4 py-2 rounded">프로필 저장</button>
  </div>

  <script>
    function loadFile(event) {
      const image = document.getElementById('profileImage');
      image.src = URL.createObjectURL(event.target.files[0]);
    }
  </script>
</body>
</html>
