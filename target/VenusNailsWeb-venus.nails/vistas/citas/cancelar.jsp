<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cancelar Cita - Venus Nails</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f0f8;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }
        .card {
            background: white;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(123,94,167,0.15);
            width: 400px;
            text-align: center;
        }
        h2 {
            color: #e53935;
            margin-bottom: 24px;
        }
        label {
            color: #555;
            font-weight: bold;
            font-size: 14px;
        }
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 6px 0 16px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 14px;
        }
        input[type="submit"] {
            background-color: #e53935;
            color: white;
            border: none;
            padding: 12px;
            width: 100%;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #c62828;
        }
        .error {
            color: red;
            margin-top: 10px;
        }
        .volver {
            display: block;
            text-align: center;
            margin-top: 16px;
            color: #7b5ea7;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="card">
        <h2>❌ Cancelar Cita</h2>
        <form action="${pageContext.request.contextPath}/CancelarCitaServlet" method="post">
            <label>ID de la Cita a cancelar:</label>
            <input type="number" name="idCita" required>
            <input type="submit" value="Cancelar Cita"
                   onclick="return confirm('¿Estás segura de cancelar esta cita?')">
        </form>

        <% if (request.getAttribute("error") != null) { %>
            <p class="error">Error: <%= request.getAttribute("error") %></p>
        <% } %>

        <a href="${pageContext.request.contextPath}/CitaServlet" class="volver">← Ver todas las citas</a>
    </div>
</body>
</html>