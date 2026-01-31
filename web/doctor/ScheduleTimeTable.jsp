<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Schedule Timetable</title>
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
            padding: 40px;
            box-sizing: border-box;
            color: #333;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px 35px;
            border-radius: 16px;
            box-shadow: 0 0 20px rgba(135, 206, 250, 0.25);
            width: 100%;
            max-width: 500px;
        }

        h2 {
            text-align: center;
            color: #007acc;
            margin-bottom: 30px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: 500;
            margin-bottom: 5px;
            color: #005f8d;
        }

        input[type="text"],
        input[type="date"] {
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 10px;
            border: 1px solid #87cefa;
            font-size: 1em;
            background-color: #f4fbff;
        }

        input[type="text"]:focus,
        input[type="date"]:focus {
            outline: none;
            border-color: #00bfff;
            background-color: #e6f7ff;
        }

        input[type="submit"] {
            background-color: #00bfff;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 10px;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #00a3cc;
        }

        .msg {
            text-align: center;
            margin-top: 20px;
            color: green;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2><i class="fas fa-calendar-plus"></i> Schedule Your Timetable</h2>
        <form action="../ScheduleTimeTableServlet" method="post">
            <label>Date:</label>
            <input type="date" name="t1" required />
            <label>Available Slots:</label>
            <input type="text" name="t2" placeholder="e.g. 10AM - 1PM" required />
            <input type="submit" value="Schedule" />
        </form>
        <% if(request.getParameter("msg") != null) { %>
            <p class="msg"><%= request.getParameter("msg") %></p>
        <% } %>
    </div>
</body>
</html>
