<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cancelar Cita - Venus Nails</title>
</head>
<body>
    <h2>Cancelar Cita</h2>
    <form action="../../CancelarCitaServlet" method="post">
        <label>ID de la Cita a cancelar:</label><br>
        <input type="number" name="idCita" required><br><br>
        <input type="submit" value="Cancelar Cita">
    </form>
    <% if (request.getAttribute("error") != null) { %>
        <p style="color:red">Error: <%= request.getAttribute("error") %></p>
    <% } %>
    <br>
    <a href="../../CitaServlet">Ver todas las citas</a>
</body>
</html>