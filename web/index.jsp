<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hospital Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #eef6fa, #d1e9f9);
            color: #333;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .container {
            text-align: center;
            background: rgba(255, 255, 255, 0.9);
            padding: 50px 40px;
            border-radius: 16px;
            max-width: 500px;
            width: 90%;
            box-shadow: 0 0 20px rgba(135, 206, 250, 0.3);
        }

        h2 {
            color: #007acc;
            margin-bottom: 30px;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        li {
            margin: 15px 0;
        }

        a {
            text-decoration: none;
            color: #fff;
            background-color: #00bfff;
            padding: 12px 30px;
            border-radius: 10px;
            font-size: 1.1em;
            display: inline-block;
            transition: 0.3s ease;
        }

        a:hover {
            background-color: #00a3cc;
        }

        i {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2><i class="fas fa-hospital"></i> Welcome to Hospital Management System</h2>
        <ul>
            <li><a href="AdminLogin.jsp"><i class="fas fa-user-shield"></i> Admin Login</a></li>
            <li><a href="DoctorLogin.jsp"><i class="fas fa-user-md"></i> Doctor Login</a></li>
            <li><a href="PatientLogin.jsp"><i class="fas fa-procedures"></i> Patient Login</a></li>
            <li><a href="patient/ChatBot.jsp"><i class="fas fa-robot"></i> ChatBot</a></li>
        </ul>
    </div>
</body>
</html>
