<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, conexion.conexion" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Agendar Cita - Venus Nails</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f0f8;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }
        .card {
            background: white;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(123,94,167,0.15);
            width: 450px;
        }
        h2 {
            color: #7b5ea7;
            text-align: center;
            margin-bottom: 24px;
        }
        label {
            color: #555;
            font-weight: bold;
            font-size: 14px;
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin: 6px 0 16px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 14px;
        }
        input[type="submit"] {
            background-color: #7b5ea7;
            color: white;
            border: none;
            padding: 12px;
            width: 100%;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #9c7cc4;
        }
        .error {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
        .volver {
            display: block;
            text-align: center;
            margin-top: 16px;
            color: #7b5ea7;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="card">
        <h2>💅 Agendar Cita</h2>
        <form action="${pageContext.request.contextPath}/CitaServlet" method="post">

            <label>ID Usuario:</label>
            <input type="number" name="idUsuario" required>

            <label>Servicio:</label>
            <select name="idServicio" required>
                <option value="">-- Selecciona un servicio --</option>
                <%
                    try {
                        Connection cn = new conexion().conectar();
                        PreparedStatement ps = cn.prepareStatement(
                            "SELECT id_servicio, nombre, precio FROM servicio");
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                %>
                    <option value="<%= rs.getInt("id_servicio") %>">
                        <%= rs.getString("nombre") %> - $<%= rs.getDouble("precio") %>
                    </option>
                <%
                        }
                    } catch (SQLException e) {
                %>
                    <option disabled>Error cargando servicios</option>
                <%
                    }
                %>
            </select>

            <label>Fecha:</label>
            <input type="date" name="fecha" required>

            <label>Hora Inicio:</label>
            <select name="horaInicio" required>
                <option value="">-- Selecciona una hora --</option>
                <option value="09:00:00">09:00 AM</option>
                <option value="09:30:00">09:30 AM</option>
                <option value="10:00:00">10:00 AM</option>
                <option value="10:30:00">10:30 AM</option>
                <option value="11:00:00">11:00 AM</option>
                <option value="11:30:00">11:30 AM</option>
                <option value="12:00:00">12:00 PM</option>
                <option value="12:30:00">12:30 PM</option>
                <option value="13:00:00">01:00 PM</option>
                <option value="13:30:00">01:30 PM</option>
                <option value="14:00:00">02:00 PM</option>
                <option value="14:30:00">02:30 PM</option>
                <option value="15:00:00">03:00 PM</option>
                <option value="15:30:00">03:30 PM</option>
                <option value="16:00:00">04:00 PM</option>
                <option value="16:30:00">04:30 PM</option>
                <option value="17:00:00">05:00 PM</option>
                <option value="17:30:00">05:30 PM</option>
                <option value="18:00:00">06:00 PM</option>
                <option value="18:30:00">06:30 PM</option>
                <option value="19:00:00">07:00 PM</option>
            </select>

            <input type="submit" value="Agendar Cita">
        </form>

        <% if (request.getAttribute("error") != null) { %>
            <p class="error">Error: <%= request.getAttribute("error") %></p>
        <% } %>

        <a href="${pageContext.request.contextPath}/vistas/cliente/panel.jsp" class="volver">← Volver al panel</a>
    </div>
</body>
</html>