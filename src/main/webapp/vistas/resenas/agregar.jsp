<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Agregar Reseña - Venus Nails</title>
</head>
<body>
    <h2>Agregar Reseña</h2>
    <form action="../../ResenaServlet" method="post">
        <label>ID Usuario:</label><br>
        <input type="number" name="idUsuario" required><br><br>
        <label>Comentario:</label><br>
        <textarea name="comentario" required></textarea><br><br>
        <label>Calificación (1 al 5):</label><br>
        <select name="calificacion">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
        </select><br><br>
        <label>Fecha:</label><br>
        <input type="date" name="fecha" required><br><br>
        <input type="submit" value="Agregar Reseña">
    </form>
    <% if (request.getAttribute("error") != null) { %>
        <p style="color:red">Error: <%= request.getAttribute("error") %></p>
    <% } %>
</body>
</html>