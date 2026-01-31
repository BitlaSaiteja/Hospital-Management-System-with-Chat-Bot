<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Write Prescription</title>
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
            max-width: 600px;
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

        textarea {
            padding: 12px;
            font-size: 1em;
            border-radius: 10px;
            border: 1px solid #87cefa;
            background-color: #f4fbff;
            resize: vertical;
            min-height: 100px;
            margin-bottom: 20px;
        }

        textarea:focus {
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

        .back-link {
            display: block;
            margin-top: 20px;
            text-align: center;
            color: #007acc;
            text-decoration: none;
            font-size: 0.95em;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2><i class="fas fa-prescription"></i> Give Prescription to Patient</h2>
        <form action="../UpdatePrescriptionServlet" method="post">
            <input type="hidden" name="pid" value="<%= request.getParameter("pid") %>" />
            <input type="hidden" name="date" value="<%= request.getParameter("date") %>" />
            <label for="prescription">Prescription:</label>
            <textarea name="prescription" placeholder="Enter prescription here..." required></textarea>
            <input type="submit" value="Submit Prescription" />
        </form>
        <a class="back-link" href="ViewPatients.jsp"><i class="fas fa-arrow-left"></i> Back to Patients</a>
    </div>
</body>
</html>
