<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
       
        body {
            margin: 0;
            padding: 0;
            font-family: 'Roboto', sans-serif;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, rgba(102, 255, 102, 0.6), rgba(255, 102, 102, 0.6), rgba(153, 102, 255, 0.6));
            background-blend-mode: overlay;
        }

        
        .register-container {
            background: rgba(255, 255, 255, 0.9); 
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.3);
            width: 350px;
        }

        h2 {
            text-align: center;
            color: #4a2c2a;
            margin-bottom: 30px;
        }

        
        form {
            display: flex;
            flex-direction: column;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 10px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        input[type="submit"] {
            padding: 12px;
            border: none;
            border-radius: 10px;
            background: linear-gradient(135deg, #66ff66, #ff6666, #9966ff);
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        input[type="submit"]:hover {
            filter: brightness(1.2);
        }

        p {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }

        a {
            color: #9966ff;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h2>Register</h2>
        <form action="userServlet" method="post">
            <input type="hidden" name="action" value="register" />
            Name: <input type="text" name="name" required />
            Email: <input type="email" name="email" required />
            Password: <input type="password" name="password" required />
            <input type="submit" value="Register"/>
        </form>
        <p>Already have an account? <a href="login.jsp">Login</a></p>
    </div>
</body>
</html>

