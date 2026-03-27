<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="modelo.Pago" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Pagos - Venus Nails</title>
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
        .monto { color: #4caf50; font-weight: bold; }
    </style>
</head>
<body>
    <div class="top">
        <h2>💳 Lista de Pagos</h2>
        <a href="${pageContext.request.contextPath}/vistas/pagos/agregar.jsp" class="btn">+ Registrar Pago</a>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>ID Cita</th>
            <th>Fecha</th>
            <th>Monto</th>
            <th>Método</th>
        </tr>
        <%
            List<Pago> lista = (List<Pago>) request.getAttribute("listaPagos");
            if (lista != null && !lista.isEmpty()) {
                for (Pago p : lista) {
        %>
        <tr>
            <td><%= p.getIdPago() %></td>
            <td><%= p.getIdCita() %></td>
            <td><%= p.getFecha() %></td>
            <td class="monto">$<%= p.getMonto() %></td>
            <td><%= p.getMetodo() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="5" style="text-align:center; color:#999;">No hay pagos registrados</td>
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