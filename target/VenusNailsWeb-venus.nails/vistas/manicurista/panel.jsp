<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("rol") == null || !session.getAttribute("rol").equals("manicurista")) {
        response.sendRedirect("../../vistas/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Panel Manicurista - Venus Nails</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f0f8;
            margin: 0;
            padding: 0;
        }
        .navbar {
            background-color: #b39ddb;
            padding: 15px 30px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .navbar h2 { margin: 0; }
        .navbar a {
            color: white;
            text-decoration: none;
        }
        .contenido {
            padding: 30px;
        }
        h3 { color: #7b5ea7; }
        .grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            margin-top: 20px;
        }
        .card {
            background-color: white;
            border-radius: 12px;
            padding: 25px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
        }
        .card h4 { color: #7b5ea7; margin-bottom: 15px; }
        .btn {
            display: inline-block;
            margin: 5px;
            padding: 8px 18px;
            border-radius: 20px;
            text-decoration: none;
            font-size: 0.85em;
            font-weight: bold;
        }
        .btn-ver {
            background-color: #b39ddb;
            color: white;
        }
        .btn-agregar {
            background-color: white;
            color: #b39ddb;
            border: 2px solid #b39ddb;
        }
        .btn:hover { opacity: 0.85; }
    </style>
</head>
<body>
    <div class="navbar">
        <h2>💅 Venus Nails</h2>
        <span>Hola, <%= session.getAttribute("nombre") %> |
        <a href="../../LogoutServlet">Cerrar sesión</a></span>
    </div>
    <div class="contenido">
        <h3>Mi Panel</h3>
        <div class="grid">
            <div class="card">
                <h4>Mis Citas</h4>
                <a href="../../CitaServlet" class="btn btn-ver">Ver citas</a>
            </div>
            <div class="card">
                <h4>Mi Horario</h4>
                <a href="../../HorarioServlet" class="btn btn-ver">Ver horario</a>
                <a href="../horarios/agregar.jsp" class="btn btn-agregar">Agregar horario</a>
            </div>
        </div>
    </div>
</body>
</html>