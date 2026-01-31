<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Doctor</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #eef6fa, #d1e9f9);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow-y: auto;
            padding: 40px 0;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px 35px;
            border-radius: 16px;
            width: 100%;
            max-width: 600px;
            box-shadow: 0 0 20px rgba(135, 206, 250, 0.25);
        }

        h2 {
            text-align: center;
            color: #007acc;
            margin-bottom: 25px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 5px;
            font-weight: 500;
            color: #005f8d;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"] {
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 10px;
            border: 1px solid #87cefa;
            font-size: 1em;
            background-color: #f4fbff;
            color: #333;
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        input[type="email"]:focus {
            border-color: #00bfff;
            background-color: #e6f7ff;
            outline: none;
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

        .success-msg {
            color: green;
            margin-top: 15px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2><i class="fas fa-user-md"></i> Add Doctor</h2>
        <form action="../AddDoctorServlet" method="post">
            <label>Username:</label>
            <input type="text" name="username" required />
            
            <label>Password:</label>
            <input type="password" name="password" required />
            
            <label>Email ID:</label>
            <input type="email" name="emailid" required />
            
            <label>Contact No:</label>
            <input type="text" name="contact_no" required />
            
            <label>Qualification:</label>
            <input type="text" name="qualification" required />
            
            <label>Experience:</label>
            <input type="text" name="experience_details" required />
            
            <label>Hospital Name:</label>
            <input type="text" name="hospital_name" required />
            
            <label>Address:</label>
            <input type="text" name="address" required />
            
            <label>Speciality:</label>
            <input type="text" name="speciality" required />
            
            <input type="submit" value="Add Doctor" />
        </form>
        <% 
            String msg = request.getParameter("msg"); 
            if (msg != null) { 
        %>
            <p class="success-msg"><%= msg %></p>
        <% } %>
    </div>
</body>
</html>
