<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="modelo.Usuario" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Usuarios - Venus Nails</title>
</head>
<body>
    <h2>Lista de Usuarios</h2>
    <a href="registrar.jsp">Registrar nuevo usuario</a><br><br>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Correo</th>
            <th>Teléfono</th>
            <th>Rol</th>
        </tr>
        <%
            List<Usuario> lista = (List<Usuario>) request.getAttribute("listaUsuarios");
            if (lista != null) {
                for (Usuario u : lista) {
        %>
        <tr>
            <td><%= u.getIdUsuario() %></td>
            <td><%= u.getNombre() %></td>
            <td><%= u.getApellido() %></td>
            <td><%= u.getCorreo() %></td>
            <td><%= u.getTelefono() %></td>
            <td><%= u.getRol() %></td>
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