<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="modelo.Resena" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Reseñas - Venus Nails</title>
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
        .estrellas { color: #f5a623; font-size: 18px; }
    </style>
</head>
<body>
    <div class="top">
        <h2>⭐ Lista de Reseñas</h2>
        <a href="${pageContext.request.contextPath}/vistas/resenas/agregar.jsp" class="btn">+ Agregar Reseña</a>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>ID Usuario</th>
            <th>Comentario</th>
            <th>Calificación</th>
            <th>Fecha</th>
        </tr>
        <%
            List<Resena> lista = (List<Resena>) request.getAttribute("listaResenas");
            if (lista != null && !lista.isEmpty()) {
                for (Resena r : lista) {
                    String estrellas = "";
                    for (int i = 0; i < r.getCalificacion(); i++) estrellas += "⭐";
        %>
        <tr>
            <td><%= r.getIdResena() %></td>
            <td><%= r.getIdUsuario() %></td>
            <td><%= r.getComentario() %></td>
            <td class="estrellas"><%= estrellas %></td>
            <td><%= r.getFecha() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="5" style="text-align:center; color:#999;">No hay reseñas registradas</td>
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