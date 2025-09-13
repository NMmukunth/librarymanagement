<%@ page import="com.nm.model.book" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Form</title>
    
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

        .form-container {
            background: rgba(255, 255, 255, 0.9);
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.3);
            width: 400px;
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

        label {
            margin-bottom: 5px;
            font-weight: 500;
        }

        input[type="text"],
        input[type="number"] {
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 10px;
            border: 1px solid #ccc;
            font-size: 16px;
            width: 100%;
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
    <div class="form-container">
        <%
            book book = (book) request.getAttribute("book");
            boolean isEdit = (book != null);
        %>
        <h2><%= isEdit ? "Edit Book" : "Add New Book" %></h2>
        <form action="BookServlet" method="post">
            <input type="hidden" name="action" value="<%= isEdit ? "update" : "insert" %>" />
            <% if (isEdit) { %>
                <input type="hidden" name="id" value="<%= book.getId() %>" />
            <% } %>
            
            <label>Title:</label>
            <input type="text" name="title" value="<%= isEdit ? book.getTitle() : "" %>" required />

            <label>Author:</label>
            <input type="text" name="author" value="<%= isEdit ? book.getAuthor() : "" %>" required />

            <label>Category:</label>
            <input type="text" name="category" value="<%= isEdit ? book.getCategory() : "" %>" />

            <label>Quantity:</label>
            <input type="number" name="quantity" value="<%= isEdit ? book.getQuantity() : 1 %>" min="0" required />

            <input type="submit" value="<%= isEdit ? "Update" : "Add" %>" />
        </form>
        <p><a href="BookServlet?action=list">Back to list</a></p>
    </div>
</body>
</html>
