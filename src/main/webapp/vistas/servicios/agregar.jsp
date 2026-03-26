<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Agregar Servicio - Venus Nails</title>
</head>
<body>
    <h2>Agregar Servicio</h2>
    <form action="../../ServicioServlet" method="post">
        <label>Nombre:</label><br>
        <input type="text" name="nombre" required><br><br>
        <label>Descripción:</label><br>
        <textarea name="descripcion" required></textarea><br><br>
        <label>Duración (ej: 00:45:00):</label><br>
        <input type="text" name="duracion" required><br><br>
        <label>Precio:</label><br>
        <input type="number" step="0.01" name="precio" required><br><br>
        <input type="submit" value="Agregar Servicio">
    </form>
    <% if (request.getAttribute("error") != null) { %>
        <p style="color:red">Error: <%= request.getAttribute("error") %></p>
    <% } %>
</body>
</html>