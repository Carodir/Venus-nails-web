<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="modelo.Resena" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Reseñas - Venus Nails</title>
</head>
<body>
    <h2>Lista de Reseñas</h2>
    <a href="agregar.jsp">Agregar nueva reseña</a><br><br>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>ID Usuario</th>
            <th>Comentario</th>
            <th>Calificación</th>
            <th>Fecha</th>
        </tr>
        <%
            List<Resena> lista = (List<Resena>) request.getAttribute("listaResenas");
            if (lista != null) {
                for (Resena r : lista) {
        %>
        <tr>
            <td><%= r.getIdResena() %></td>
            <td><%= r.getIdUsuario() %></td>
            <td><%= r.getComentario() %></td>
            <td><%= r.getCalificacion() %></td>
            <td><%= r.getFecha() %></td>
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