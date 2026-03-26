<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="modelo.Cita" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Citas - Venus Nails</title>
</head>
<body>
    <h2>Lista de Citas</h2>
    <a href="agendar.jsp">Agendar nueva cita</a><br><br>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>ID Usuario</th>
            <th>ID Servicio</th>
            <th>Fecha</th>
            <th>Hora Inicio</th>
            <th>Hora Fin</th>
            <th>Estado</th>
            <th>Acción</th>
        </tr>
        <%
            List<Cita> lista = (List<Cita>) request.getAttribute("listaCitas");
            if (lista != null) {
                for (Cita c : lista) {
        %>
        <tr>
            <td><%= c.getIdCita() %></td>
            <td><%= c.getIdUsuario() %></td>
            <td><%= c.getIdServicio() %></td>
            <td><%= c.getFecha() %></td>
            <td><%= c.getHoraInicio() %></td>
            <td><%= c.getHoraFin() %></td>
            <td><%= c.getEstado() %></td>
            <td>
                <a href="../../CancelarCitaServlet?idCita=<%= c.getIdCita() %>"
                   onclick="return confirm('¿Cancelar esta cita?')">Cancelar</a>
            </td>
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