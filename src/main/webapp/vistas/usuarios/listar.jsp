<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="modelo.Usuario" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Usuarios - Venus Nails</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f0f8;
            padding: 40px;
        }
        h2 { color: #7b5ea7; text-align: center; }
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(123,94,167,0.15);
        }
        th {
            background-color: #7b5ea7;
            color: white;
            padding: 12px;
            text-align: left;
        }
        td {
            padding: 12px;
            border-bottom: 1px solid #f0eaf8;
        }
        tr:last-child td { border-bottom: none; }
        tr:hover td { background-color: #f3f0f8; }
        .btn {
            display: inline-block;
            padding: 10px 24px;
            background-color: #7b5ea7;
            color: white;
            border-radius: 8px;
            text-decoration: none;
            font-size: 14px;
        }
        .btn:hover { background-color: #9c7cc4; }
        .top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .error { color: red; text-align: center; }
        .rol-admin {
            background-color: #7b5ea7;
            color: white;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 12px;
        }
        .rol-cliente {
            background-color: #9c7cc4;
            color: white;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 12px;
        }
        .rol-manicurista {
            background-color: #f0eaf8;
            color: #7b5ea7;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="top">
        <h2>👤 Lista de Usuarios</h2>
        <a href="${pageContext.request.contextPath}/vistas/usuarios/registrar.jsp" class="btn">+ Registrar Usuario</a>
    </div>

    <table>
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
            if (lista != null && !lista.isEmpty()) {
                for (Usuario u : lista) {
                    String rolClass = "rol-cliente";
                    if ("admin".equals(u.getRol())) rolClass = "rol-admin";
                    else if ("manicurista".equals(u.getRol())) rolClass = "rol-manicurista";
        %>
        <tr>
            <td><%= u.getIdUsuario() %></td>
            <td><%= u.getNombre() %></td>
            <td><%= u.getApellido() %></td>
            <td><%= u.getCorreo() %></td>
            <td><%= u.getTelefono() %></td>
            <td><span class="<%= rolClass %>"><%= u.getRol() %></span></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="6" style="text-align:center; color:#999;">No hay usuarios registrados</td>
        </tr>
        <% } %>
    </table>

    <% if (request.getAttribute("error") != null) { %>
        <p class="error">Error: <%= request.getAttribute("error") %></p>
    <% } %>

    <div style="text-align:center; margin-top:20px;">
        <a href="${pageContext.request.contextPath}/vistas/admin/panel.jsp" class="btn">← Volver al panel</a>
    </div>
</body>
</html>