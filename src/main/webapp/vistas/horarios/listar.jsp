<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="modelo.Horario" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Horarios - Venus Nails</title>
</head>
<body>
    <h2>Lista de Horarios Disponibles</h2>
    <a href="agregar.jsp">Agregar nuevo horario</a><br><br>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>ID Usuario</th>
            <th>Día</th>
            <th>Hora Inicio</th>
            <th>Hora Fin</th>
        </tr>
        <%
            List<Horario> lista = (List<Horario>) request.getAttribute("listaHorarios");
            if (lista != null) {
                for (Horario h : lista) {
        %>
        <tr>
            <td><%= h.getIdHorario() %></td>
            <td><%= h.getIdUsuario() %></td>
            <td><%= h.getDiaSemana() %></td>
            <td><%= h.getHoraInicio() %></td>
            <td><%= h.getHoraFin() %></td>
        </tr>
        <%
                }
            }
        %>
    </table>
    <% if (request.getAttribute("error") != null) { %>
        <p style="color:red">Error: <%= request.getAttribute("error") %></p>
    <% } %>
</body>
</html>