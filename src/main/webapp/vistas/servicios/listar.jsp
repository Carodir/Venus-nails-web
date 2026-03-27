<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="modelo.Servicio" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Servicios - Venus Nails</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f0f8;
            padding: 40px;
        }
        h2 {
            color: #7b5ea7;
            text-align: center;
        }
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
        tr:last-child td {
            border-bottom: none;
        }
        tr:hover td {
            background-color: #f3f0f8;
        }
        .btn {
            display: inline-block;
            margin: 20px auto;
            padding: 10px 24px;
            background-color: #7b5ea7;
            color: white;
            border-radius: 8px;
            text-decoration: none;
            font-size: 14px;
        }
        .btn:hover {
            background-color: #9c7cc4;
        }
        .top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .error {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="top">
        <h2>🌸 Lista de Servicios</h2>
        <a href="${pageContext.request.contextPath}/vistas/servicios/agregar.jsp" class="btn">+ Agregar Servicio</a>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Descripción</th>
            <th>Duración (min)</th>
            <th>Precio</th>
        </tr>
        <%
            List<Servicio> lista = (List<Servicio>) request.getAttribute("listaServicios");
            if (lista != null && !lista.isEmpty()) {
                for (Servicio s : lista) {
        %>
        <tr>
            <td><%= s.getIdServicio() %></td>
            <td><%= s.getNombre() %></td>
            <td><%= s.getDescripcion() %></td>
            <td><%= s.getDuracion() %></td>
            <td>$<%= s.getPrecio() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="5" style="text-align:center; color:#999;">No hay servicios registrados</td>
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