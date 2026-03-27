<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Iniciar Sesión - Venus Nails</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f0f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .contenedor {
            text-align: center;
            background-color: white;
            padding: 50px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            width: 350px;
        }
        h2 { color: #7b5ea7; }
        input {
            width: 90%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #d8cce8;
            border-radius: 8px;
            font-size: 1em;
        }
        .btn {
            width: 95%;
            padding: 12px;
            background-color: #9c7cc4;
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 1em;
            font-weight: bold;
            cursor: pointer;
            margin-top: 10px;
        }
        .btn:hover { background-color: #7b5ea7; }
        .link { color: #9c7cc4; text-decoration: none; }
        .error {
            color: red;
            font-size: 0.9em;
            background-color: #ffe0e0;
            padding: 10px;
            border-radius: 8px;
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <div class="contenedor">
        <h2>💅 Iniciar Sesión</h2>
        <p style="color:#9e9e9e">Venus Nails Spa</p>
        <form action="<%= request.getContextPath() %>/LoginServlet" method="post">
            <input type="email" name="correo" placeholder="Correo electrónico" required><br>
            <input type="password" name="contrasena" placeholder="Contraseña" required><br>
            <button type="submit" class="btn">Ingresar</button>
        </form>
        <br>
        <% if ("1".equals(request.getParameter("error"))) { %>
            <div class="error">❌ Correo o contraseña incorrectos</div>
        <% } else if ("2".equals(request.getParameter("error"))) { %>
            <div class="error">❌ Error de conexión a la base de datos</div>
        <% } %>
        <p>¿No tienes cuenta? <a href="<%= request.getContextPath() %>/vistas/usuarios/registrar.jsp" class="link">Regístrate aquí</a></p>
        <a href="<%= request.getContextPath() %>/index.jsp" class="link">← Volver</a>
    </div>
</body>
</html>