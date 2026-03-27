<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="modelo.Horario" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Horarios - Venus Nails</title>
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
        .dia { 
            background-color: #f0eaf8;
            color: #7b5ea7;
            font-weight: bold;
            padding: 4px 10px;
            border-radius: 20px;
            display: inline-block;
        }
    </style>
</head>
<body>
    <div class="top">
        <h2>🗓️ Lista de Horarios</h2>
        <a href="${pageContext.request.contextPath}/vistas/horarios/agregar.jsp" class="btn">+ Agregar Horario</a>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>ID Usuario</th>
            <th>Día</th>
            <th>Hora Inicio</th>
            <th>Hora Fin</th>
        </tr>
        <%
            List<Horario> lista = (List<Horario>) request.getAttribute("listaHorarios");
            if (lista != null && !lista.isEmpty()) {
                for (Horario h : lista) {
        %>
        <tr>
            <td><%= h.getIdHorario() %></td>
            <td><%= h.getIdUsuario() %></td>
            <td><span class="dia"><%= h.getDiaSemana() %></span></td>
            <td><%= h.getHoraInicio() %></td>
            <td><%= h.getHoraFin() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="5" style="text-align:center; color:#999;">No hay horarios registrados</td>
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