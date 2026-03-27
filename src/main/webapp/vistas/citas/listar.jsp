<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="modelo.Cita" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Citas - Venus Nails</title>
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
        .estado-pendiente { color: #e6a817; font-weight: bold; }
        .estado-confirmada { color: #4caf50; font-weight: bold; }
        .estado-cancelada { color: #e53935; font-weight: bold; }
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
        .btn-cancelar {
            background-color: #e53935;
            color: white;
            padding: 6px 14px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 13px;
        }
        .btn-cancelar:hover { background-color: #c62828; }
        .top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .error { color: red; text-align: center; }
    </style>
</head>
<body>
    <div class="top">
        <h2>💅 Lista de Citas</h2>
        <a href="${pageContext.request.contextPath}/vistas/citas/agendar.jsp" class="btn">+ Agendar Cita</a>
    </div>

    <table>
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
            if (lista != null && !lista.isEmpty()) {
                for (Cita c : lista) {
                    String estadoClass = "estado-pendiente";
                    if ("Confirmada".equals(c.getEstado())) estadoClass = "estado-confirmada";
                    else if ("Cancelada".equals(c.getEstado())) estadoClass = "estado-cancelada";
        %>
        <tr>
            <td><%= c.getIdCita() %></td>
            <td><%= c.getIdUsuario() %></td>
            <td><%= c.getIdServicio() %></td>
            <td><%= c.getFecha() %></td>
            <td><%= c.getHoraInicio() %></td>
            <td><%= c.getHoraFin() %></td>
            <td class="<%= estadoClass %>"><%= c.getEstado() %></td>
            <td>
                <a href="${pageContext.request.contextPath}/CancelarCitaServlet?idCita=<%= c.getIdCita() %>"
                   class="btn-cancelar"
                   onclick="return confirm('¿Cancelar esta cita?')">Cancelar</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="8" style="text-align:center; color:#999;">No hay citas registradas</td>
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