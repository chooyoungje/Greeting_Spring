<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Application Form</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
<style>
  .container {
    max-width: 400px;
    margin: 0 auto;
    padding: 2rem;
  }
  .form-container {
    max-height: 400px;
    overflow-y: auto;
  }
</style>
</head>
<body class="bg-gray-100">
  <div class="container bg-white p-6 rounded-lg shadow-md">
    <h2 class="text-2xl font-bold mb-4">제목</h2>
    <div class="form-container">
      <!-- Add your form content here -->
      <form>
        <div class="mb-4">
          <label for="name" class="block text-gray-700">Name</label>
          <input type="text" id="name" name="name" class="mt-1 block w-full p-2 border border-gray-300 rounded-md">
        </div>
        <div class="mb-4">
          <label for="email" class="block text-gray-700">Email</label>
          <input type="email" id="email" name="email" class="mt-1 block w-full p-2 border border-gray-300 rounded-md">
        </div>
        <!-- Add more form fields as needed -->
      </form>
    </div>
    <div class="actions mt-4">
      <button type="button" class="bg-blue-500 text-white px-4 py-2 rounded">즉시지원</button>
      <button type="button" class="bg-gray-500 text-white px-4 py-2 rounded" onclick="window.close()">취소</button>
    </div>
  </div>
</body>
</html>
