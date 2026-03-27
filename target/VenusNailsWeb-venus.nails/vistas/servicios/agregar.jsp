<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Agregar Servicio - Venus Nails</title>
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
        }
        h2 {
            color: #7b5ea7;
            text-align: center;
            margin-bottom: 24px;
        }
        label {
            color: #555;
            font-weight: bold;
            font-size: 14px;
        }
        input, textarea {
            width: 100%;
            padding: 10px;
            margin: 6px 0 16px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 14px;
        }
        textarea {
            height: 80px;
            resize: vertical;
        }
        input[type="submit"] {
            background-color: #7b5ea7;
            color: white;
            border: none;
            padding: 12px;
            width: 100%;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #9c7cc4;
        }
        .error {
            color: red;
            text-align: center;
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
        <h2>🌸 Agregar Servicio</h2>
        <form action="${pageContext.request.contextPath}/ServicioServlet" method="post">
            <label>Nombre:</label>
            <input type="text" name="nombre" required>

            <label>Descripción:</label>
            <textarea name="descripcion" required></textarea>

            <label>Duración (minutos):</label>
            <input type="number" name="duracion" min="1" required>

            <label>Precio:</label>
            <input type="number" step="0.01" name="precio" min="0" required>

            <input type="submit" value="Agregar Servicio">
        </form>

        <% if (request.getAttribute("error") != null) { %>
            <p class="error">Error: <%= request.getAttribute("error") %></p>
        <% } %>

        <a href="${pageContext.request.contextPath}/vistas/admin/panel.jsp" class="volver">← Volver al panel</a>
    </div>
</body>
</html>