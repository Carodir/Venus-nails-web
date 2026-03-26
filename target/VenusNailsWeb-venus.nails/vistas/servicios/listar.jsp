<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="modelo.Servicio" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Servicios - Venus Nails</title>
</head>
<body>
    <h2>Lista de Servicios</h2>
    <a href="agregar.jsp">Agregar nuevo servicio</a><br><br>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Descripción</th>
            <th>Duración</th>
            <th>Precio</th>
        </tr>
        <%
            List<Servicio> lista = (List<Servicio>) request.getAttribute("listaServicios");
            if (lista != null) {
                for (Servicio s : lista) {
        %>
        <tr>
            <td><%= s.getIdServicio() %></td>
            <td><%= s.getNombre() %></td>
            <td><%= s.getDescripcion() %></td>
            <td><%= s.getDuracion() %></td>
            <td><%= s.getPrecio() %></td>
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