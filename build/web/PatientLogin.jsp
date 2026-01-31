<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Patient Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #eef6fa, #d1e9f9);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #333;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.85);
            border: 1px solid #bce0fa;
            border-radius: 16px;
            padding: 40px 35px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 0 18px rgba(135, 206, 250, 0.25);
            transition: all 0.3s ease;
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
            margin-bottom: 8px;
            color: #005f8d;
        }

        input[type="text"] {
            padding: 12px;
            margin-bottom: 25px;
            border: 1px solid #87cefa;
            border-radius: 10px;
            font-size: 1em;
            background-color: #f4fbff;
            color: #333;
        }

        input[type="text"]:focus {
            border-color: #00bfff;
            outline: none;
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
            transition: 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #00a3cc;
        }

        .error-msg {
            color: #e60000;
            margin-top: 15px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2><i class="fas fa-procedures"></i> Patient Login</h2>
        <form action="PatientLoginServlet" method="post">
            <label>Patient ID:</label>
            <input type="text" name="patient_id" required />
            <input type="submit" value="Login" />
        </form>
        <% if(request.getParameter("msg") != null) { %>
            <p class="error-msg"><%= request.getParameter("msg") %></p>
        <% } %>
    </div>
</body>
</html>
