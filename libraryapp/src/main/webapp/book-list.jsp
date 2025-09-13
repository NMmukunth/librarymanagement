<%@ page import="java.util.*, com.nm.model.book" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Books</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Roboto', sans-serif;
            min-height: 100vh;
            background: linear-gradient(135deg, rgba(102, 255, 102, 0.6), rgba(255, 102, 102, 0.6), rgba(153, 102, 255, 0.6));
            background-blend-mode: overlay;
        }

        .container {
            width: 90%;
            max-width: 900px;
            margin: 40px auto;
            background: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.3);
        }

        h2 {
            text-align: center;
            color: #4a2c2a;
            margin-bottom: 20px;
        }

        p {
            text-align: center;
            margin-bottom: 20px;
        }

        a {
            text-decoration: none;
            font-weight: bold;
            color: #9966ff;
            margin: 0 10px;
            transition: all 0.3s ease;
        }

        a:hover {
            text-decoration: underline;
            color: #ff6666;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            padding: 12px 10px;
            border: 1px solid #ccc;
            text-align: center;
            border-radius: 5px;
        }

        th {
            background: linear-gradient(135deg, #66ff66, #ff6666, #9966ff);
            color: #fff;
        }

        tr:nth-child(even) {
            background: rgba(240, 240, 240, 0.6);
        }

        tr:hover {
            background: rgba(200, 200, 255, 0.4);
        }

        .action-links a {
            margin: 0 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Books</h2>
        <p>
            <a href="BookServlet?action=new">Add New Book</a> |
            <a href="logout">Logout</a>
        </p>

        <table>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Author</th>
                <th>Category</th>
                <th>Qty</th>
                <th>Actions</th>
            </tr>
            <%
                List<book> list = (List<book>) request.getAttribute("listBook");
                if (list != null) {
                    for (book b : list) {
            %>
            <tr>
                <td><%= b.getId() %></td>
                <td><%= b.getTitle() %></td>
                <td><%= b.getAuthor() %></td>
                <td><%= b.getCategory() %></td>
                <td><%= b.getQuantity() %></td>
                <td class="action-links">
                    <a href="BookServlet?action=edit&id=<%=b.getId()%>">Edit</a>
                    <a href="BookServlet?action=delete&id=<%=b.getId()%>" onclick="return confirm('Delete?')">Delete</a>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </table>
    </div>
</body>
</html>
