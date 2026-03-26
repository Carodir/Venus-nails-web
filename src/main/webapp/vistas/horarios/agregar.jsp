<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Agregar Horario - Venus Nails</title>
</head>
<body>
    <h2>Agregar Horario Disponible</h2>
    <form action="../../HorarioServlet" method="post">
        <label>ID Usuario:</label><br>
        <input type="number" name="idUsuario" required><br><br>
        <label>Día de la semana:</label><br>
        <select name="diaSemana">
            <option value="Lunes">Lunes</option>
            <option value="Martes">Martes</option>
            <option value="Miércoles">Miércoles</option>
            <option value="Jueves">Jueves</option>
            <option value="Viernes">Viernes</option>
            <option value="Sábado">Sábado</option>
        </select><br><br>
        <label>Hora Inicio:</label><br>
        <input type="time" name="horaInicio" required><br><br>
        <label>Hora Fin:</label><br>
        <input type="time" name="horaFin" required><br><br>
        <input type="submit" value="Agregar Horario">
    </form>
    <% if (request.getAttribute("error") != null) { %>
        <p style="color:red">Error: <%= request.getAttribute("error") %></p>
    <% } %>
</body>
</html>