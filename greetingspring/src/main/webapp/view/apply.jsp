<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>지원자 등록</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            width: 400px;
            padding: 20px;
        }
        .container h2 {
            margin-top: 0;
            text-align: center;
        }
        .container form {
            display: flex;
            flex-direction: column;
        }
        .container form label {
            margin-bottom: 5px;
            font-weight: bold;
        }
        .container form input,
        .container form select,
        .container form textarea {
            margin-bottom: 20px;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .container form input[type="radio"] {
            margin-right: 10px;
        }
        .container form .radio-group {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        .container form button {
            background-color: #007bff;
            color: #fff;
            padding: 10px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .container form button:hover {
            background-color: #0056b3;
        }
        .file-upload {
            display: flex;
            align-items: center;
        }
        .file-upload input[type="file"] {
            margin-left: 10px;
        }
        .container .actions {
            display: flex;
            justify-content: space-between;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>지원자 등록</h2>
        <form>
            <label for="name">이름 <span style="color: red;">*</span></label>
            <input type="text" id="name" name="name" placeholder="김철수">

            <label for="email">이메일 주소</label>
            <input type="email" id="email" name="email" placeholder="example@greetinghr.com">

            <label for="phone">전화번호</label>
            <input type="text" id="phone" name="phone" placeholder="010-0000-0000">

            <label for="apply-path">지원경로</label>
            <input type="text" id="apply-path" name="apply-path" placeholder="채용사이트, 블로그, 소셜 등">

            <label for="apply-date">지원일</label>
            <input type="date" id="apply-date" name="apply-date">

            <label for="tag">태그</label>
            <input type="text" id="tag" name="tag" placeholder="#태그입력">

            <label>지원 서류</label>

            <div class="radio-group">
                <input type="radio" id="resume-file" name="resume" value="file" checked>
                <label for="resume-file">파일 업로드</label>
                <input type="radio" id="resume-link" name="resume" value="link">
                <label for="resume-link">링크</label>
            </div>

            <div class="file-upload">
                <label for="resume-upload">이력서</label>
                <input type="file" id="resume-upload" name="resume-upload">
            </div>

            <div class="radio-group">
                <input type="radio" id="cover-letter-file" name="cover-letter" value="file" checked>
                <label for="cover-letter-file">파일 업로드</label>
                <input type="radio" id="cover-letter-link" name="cover-letter" value="link">
                <label for="cover-letter-link">링크</label>
            </div>

            <div class="file-upload">
                <label for="cover-letter-upload">자기소개서</label>
                <input type="file" id="cover-letter-upload" name="cover-letter-upload">
            </div>

            <div class="actions">
                <button type="button">취소</button>
                <button type="submit">등록</button>
            </div>
        </form>
    </div>
</body>
</html>
