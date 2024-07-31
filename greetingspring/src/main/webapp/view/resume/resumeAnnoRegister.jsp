<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Job Application Form</title>
    <style>
        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */
        }

        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        /* Input fields */
        .input-field {
            width: 95%;
            padding: 10px;
            margin: 10px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        /* Apply button */
        .applyBtn {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }

        .applyBtn:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <!-- Trigger/Open The Modal -->
    <button id="myBtn">Open Application Form</button>

    <!-- The Modal -->
    <div id="myModal" class="modal">

        <!-- Modal content -->
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>2024 LOUIS VUITTON 신입 및 경력 채용</h2>
            <p>지원분야를 선택해 주세요.</p>
            <input type="text" placeholder="Email" class="input-field">
            <input type="text" placeholder="Phone Number" class="input-field">
            <p>Attachments:</p>
            <ul>
                <li><a href="#">Link to GitHub project 1</a></li>
                <li><a href="#">Link to GitHub project 2</a></li>
                <li><a href="#">Link to Resume PDF</a></li>
            </ul>
            <button class="applyBtn">지원하기</button>
        </div>
    </div>

    <script>
        // Get the modal
        const modal = document.getElementById("myModal");

        // Get the button that opens the modal
        const btn = document.getElementById("myBtn");

        // Get the <span> element that closes the modal
        const span = document.getElementsByClassName("close")[0];

        // Get the apply button inside the modal
        const applyBtn = document.querySelector('.applyBtn');

        // When the user clicks the button, open the modal 
        btn.onclick = function() {
            modal.style.display = "block";
        }

        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
            modal.style.display = "none";
        }

        // When the user clicks the apply button, close the modal
        applyBtn.onclick = function() {
            modal.style.display = "none";
            alert('지원 완료'); // Optionally show a confirmation message
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>
</body>
</html>
