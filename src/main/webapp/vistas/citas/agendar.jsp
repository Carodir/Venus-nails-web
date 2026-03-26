<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Agendar Cita - Venus Nails</title>
</head>
<body>
    <h2>Agendar Cita</h2>
    <form action="../../CitaServlet" method="post">
        <label>ID Usuario:</label><br>
        <input type="number" name="idUsuario" required><br><br>
        <label>ID Servicio:</label><br>
        <input type="number" name="idServicio" required><br><br>
        <label>Fecha:</label><br>
        <input type="date" name="fecha" required><br><br>
        <label>Hora Inicio:</label><br>
        <input type="time" name="horaInicio" required><br><br>
        <input type="submit" value="Agendar Cita">
    </form>
    <% if (request.getAttribute("error") != null) { %>
        <p style="color:red">Error: <%= request.getAttribute("error") %></p>
    <% } %>
</body>
</html>