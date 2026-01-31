<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Patient Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #eef6fa, #d1e9f9);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }

        .dashboard-container {
            background: rgba(255, 255, 255, 0.95);
            padding: 50px 40px;
            border-radius: 16px;
            box-shadow: 0 0 20px rgba(135, 206, 250, 0.25);
            text-align: center;
            width: 90%;
            max-width: 500px;
        }

        h2 {
            color: #007acc;
            margin-bottom: 30px;
        }

        ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        li {
            margin: 20px 0;
        }

        a {
            display: inline-block;
            background-color: #00bfff;
            color: white;
            padding: 12px 25px;
            font-size: 1.1em;
            text-decoration: none;
            border-radius: 10px;
            transition: 0.3s ease;
            box-shadow: 0 0 10px rgba(0, 191, 255, 0.2);
        }

        a:hover {
            background-color: #00a3cc;
            box-shadow: 0 0 15px #00bfff;
        }

        i {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h2><i class="fas fa-user"></i> Welcome Patient</h2>
        <ul>
            <li><a href="ViewPrescription.jsp"><i class="fas fa-notes-medical"></i> View Your Prescription</a></li>
            <li><a href="ViewDoctorTimetable.jsp"><i class="fas fa-calendar-alt"></i> View Doctor Timetable</a></li>
            <li><a href="ChatBot.jsp"><i class="fas fa-robot"></i> Chat with Health Bot</a></li>
            <li><a href="../LogoutServlet"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </div>
</body>
</html>
