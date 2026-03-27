<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registrarse - Venus Nails</title>
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
        .contenedor {
            text-align: center;
            background-color: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            width: 380px;
        }
        h2 { color: #7b5ea7; }
        p { color: #9e9e9e; }
        input, select {
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
        .exito {
            color: #5a7a5a;
            font-size: 1em;
            background-color: #e8f5e9;
            padding: 15px;
            border-radius: 8px;
            margin: 10px 0;
            border: 1px solid #c8e6c9;
        }
    </style>
</head>
<body>
    <div class="contenedor">
        <h2>🌸 Crear cuenta</h2>
        <p>Venus Nails Spa</p>

        <% if (request.getAttribute("exito") != null) { %>
            <div class="exito">
                ✅ ¡Registro exitoso! Bienvenida a Venus Nails Spa 💅
                <br><br>
                <a href="${pageContext.request.contextPath}/vistas/login.jsp" class="link">Iniciar sesión →</a>
            </div>
        <% } else { %>
            <form action="${pageContext.request.contextPath}/UsuarioServlet" method="post">
                <input type="text" name="nombre" placeholder="Nombre" required><br>
                <input type="text" name="apellido" placeholder="Apellido" required><br>
                <input type="email" name="correo" placeholder="Correo electrónico" required><br>
                <input type="text" name="telefono" placeholder="Teléfono" required><br>
                <input type="password" name="contrasena" placeholder="Contraseña" required><br>
                <select name="rol">
                    <option value="cliente">Cliente</option>
                    <option value="manicurista">Manicurista</option>
                    <option value="admin">Admin</option>
                </select><br>
                <button type="submit" class="btn">Registrarse</button>
            </form>

            <% if (request.getAttribute("error") != null) { %>
                <p class="error">⚠️ <%= request.getAttribute("error") %></p>
            <% } %>

            <p>¿Ya tienes cuenta? <a href="${pageContext.request.contextPath}/vistas/login.jsp" class="link">Inicia sesión</a></p>
            <a href="${pageContext.request.contextPath}/index.jsp" class="link">← Volver</a>
        <% } %>
    </div>
</body>
</html>