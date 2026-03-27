<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Agregar Horario - Venus Nails</title>
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
            width: 420px;
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
        input[type="submit"]:hover { background-color: #9c7cc4; }
        .error { color: red; text-align: center; margin-top: 10px; }
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
        <h2>🗓️ Agregar Horario</h2>
        <form action="${pageContext.request.contextPath}/HorarioServlet" method="post">

            <label>ID Usuario (Manicurista):</label>
            <input type="number" name="idUsuario" required>

            <label>Día de la semana:</label>
            <select name="diaSemana" required>
                <option value="">-- Selecciona un día --</option>
                <option value="Lunes">Lunes</option>
                <option value="Martes">Martes</option>
                <option value="Miércoles">Miércoles</option>
                <option value="Jueves">Jueves</option>
                <option value="Viernes">Viernes</option>
                <option value="Sábado">Sábado</option>
            </select>

            <label>Hora Inicio:</label>
            <input type="time" name="horaInicio" required>

            <label>Hora Fin:</label>
            <input type="time" name="horaFin" required>

            <input type="submit" value="Agregar Horario">
        </form>

        <% if (request.getAttribute("error") != null) { %>
            <p class="error">Error: <%= request.getAttribute("error") %></p>
        <% } %>

        <a href="${pageContext.request.contextPath}/HorarioServlet" class="volver">← Ver todos los horarios</a>
    </div>
</body>
</html>