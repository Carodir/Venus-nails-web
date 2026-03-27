<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Agregar Reseña - Venus Nails</title>
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
            width: 420px;
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
        input, select, textarea {
            width: 100%;
            padding: 10px;
            margin: 6px 0 16px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 14px;
        }
        textarea { height: 100px; resize: vertical; }
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
        input[type="submit"]:hover { background-color: #9c7cc4; }
        .estrellas {
            display: flex;
            gap: 8px;
            margin: 6px 0 16px 0;
        }
        .estrellas label {
            font-size: 28px;
            cursor: pointer;
            color: #ccc;
        }
        .estrellas input[type="radio"] { display: none; }
        .estrellas input[type="radio"]:checked ~ label { color: #ccc; }
        .estrellas label:hover,
        .estrellas label:hover ~ label { color: #f5a623; }
        .error { color: red; text-align: center; margin-top: 10px; }
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
        <h2>⭐ Agregar Reseña</h2>
        <form action="${pageContext.request.contextPath}/ResenaServlet" method="post">

            <label>ID Usuario:</label>
            <input type="number" name="idUsuario" required>

            <label>Comentario:</label>
            <textarea name="comentario" required></textarea>

            <label>Calificación:</label>
            <select name="calificacion" required>
                <option value="">-- Selecciona --</option>
                <option value="1">⭐ 1 - Muy malo</option>
                <option value="2">⭐⭐ 2 - Malo</option>
                <option value="3">⭐⭐⭐ 3 - Regular</option>
                <option value="4">⭐⭐⭐⭐ 4 - Bueno</option>
                <option value="5">⭐⭐⭐⭐⭐ 5 - Excelente</option>
            </select>

            <label>Fecha:</label>
            <input type="date" name="fecha" required>

            <input type="submit" value="Agregar Reseña">
        </form>

        <% if (request.getAttribute("error") != null) { %>
            <p class="error">Error: <%= request.getAttribute("error") %></p>
        <% } %>

        <a href="${pageContext.request.contextPath}/ResenaServlet" class="volver">← Ver todas las reseñas</a>
    </div>
</body>
</html>