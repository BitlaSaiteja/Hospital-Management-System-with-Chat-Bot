<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Doctor ChatBot</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #2193b0, #6dd5ed);
            color: #fff;
            padding: 50px 20px;
            margin: 0;
        }

        .container {
            background: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 16px;
            width: 90%;
            max-width: 700px;
            margin: auto;
            box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.3);
            text-align: center;
        }

        h2 {
            margin-bottom: 25px;
            font-size: 26px;
        }

        form {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
        }

        input[type="text"] {
            padding: 12px;
            width: 70%;
            max-width: 400px;
            border-radius: 8px;
            border: none;
            font-size: 16px;
        }

        input[type="submit"] {
            padding: 12px 20px;
            font-size: 16px;
            background-color: #00b894;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin-left: 10px;
        }

        input[type="submit"]:hover {
            background-color: #019875;
        }

        .response {
            margin-top: 30px;
        }

        .doctor-card {
            background-color: rgba(255, 255, 255, 0.15);
            padding: 20px;
            border-radius: 12px;
            text-align: left;
            line-height: 1.8;
            font-size: 16px;
            color: #fffbe7;
            margin-top: 15px;
        }

        .no-result {
            background: rgba(255, 0, 0, 0.1);
            color: #ffecec;
            padding: 12px;
            border-radius: 10px;
            margin-top: 20px;
        }

        .greeting {
            font-size: 20px;
            color: #fff;
            background-color: rgba(0, 191, 255, 0.2);
            padding: 15px;
            border-radius: 10px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>🩺 Ask Our Doctor Bot</h2>
        <form method="get">
            <input type="text" name="query" placeholder="Describe your symptoms or say hello..." required />
            <input type="submit" value="Ask" />
        </form>

        <div class="response">
            <%
                String query = request.getParameter("query");
                if (query != null && !query.trim().isEmpty()) {
                    query = query.toLowerCase();

                    // Greeting detection
                    if (query.matches(".*\\b(hi|hello|hey|hii|hola|good morning|good evening|good afternoon)\\b.*")) {
                        out.println("<div class='greeting'>👋 Hello there! I'm your Health Assistant. Tell me your symptoms and I’ll help you find the right doctor 😊</div>");
                    } else {
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalDB", "root", "root");

                            PreparedStatement ps = con.prepareStatement("SELECT * FROM adddoctor");
                            ResultSet rs = ps.executeQuery();

                            boolean found = false;

                            while (rs.next()) {
                                String speciality = rs.getString("speciality").toLowerCase();
                                String[] specialityWords = speciality.split("\\s+");

                                for (String word : specialityWords) {
                                    if (query.contains(word)) {
                                        out.println("<div class='doctor-card'>");
                                        out.println("<strong>👨‍⚕️ Doctor Name:</strong> " + rs.getString("username") + "<br>");
                                        out.println("<strong>📧 Email:</strong> " + rs.getString("emailid") + "<br>");
                                        out.println("<strong>📞 Contact:</strong> " + rs.getString("contact_no") + "<br>");
                                        out.println("<strong>🎓 Qualification:</strong> " + rs.getString("qualification") + "<br>");
                                        out.println("<strong>🏥 Experience:</strong> " + rs.getString("experience_details") + "<br>");
                                        out.println("<strong>📋 Speciality:</strong> " + rs.getString("speciality") + "<br>");
                                        out.println("<strong>🏨 Hospital:</strong> " + rs.getString("hospital_name") + "<br>");
                                        out.println("<strong>📍 Address:</strong> " + rs.getString("address"));
                                        out.println("</div>");
                                        found = true;
                                        break;
                                    }
                                }
                                if (found) break;
                            }

                            if (!found) {
                                out.println("<div class='no-result'>❌ Sorry, I couldn’t find a doctor for that. Please try a different symptom.</div>");
                            }

                            con.close();
                        } catch (Exception e) {
                            out.println("<div class='no-result'>⚠️ Error: " + e.getMessage() + "</div>");
                        }
                    }
                }
            %>
        </div>
    </div>
</body>
</html>
