<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="modelo.Pago" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Pagos - Venus Nails</title>
</head>
<body>
    <h2>Lista de Pagos</h2>
    <a href="agregar.jsp">Registrar nuevo pago</a><br><br>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>ID Cita</th>
            <th>Fecha</th>
            <th>Monto</th>
            <th>Método</th>
        </tr>
        <%
            List<Pago> lista = (List<Pago>) request.getAttribute("listaPagos");
            if (lista != null) {
                for (Pago p : lista) {
        %>
        <tr>
            <td><%= p.getIdPago() %></td>
            <td><%= p.getIdCita() %></td>
            <td><%= p.getFecha() %></td>
            <td><%= p.getMonto() %></td>
            <td><%= p.getMetodo() %></td>
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