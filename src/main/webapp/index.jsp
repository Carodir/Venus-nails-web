<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Venus Nails Spa</title>
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
    }
    h1 {
        color: #7b5ea7;
        font-size: 2.5em;
    }
    p {
        color: #9e9e9e;
        font-size: 1.1em;
    }
    .btn {
        display: inline-block;
        margin: 10px;
        padding: 12px 30px;
        border-radius: 25px;
        text-decoration: none;
        font-size: 1em;
        font-weight: bold;
    }
    .btn-registrar {
        background-color: #9c7cc4;
        color: white;
    }
    .btn-login {
        background-color: white;
        color: #9c7cc4;
        border: 2px solid #9c7cc4;
    }
    .btn:hover {
        opacity: 0.85;
    }
</style>
    </style>
</head>
<body>
    <div class="contenedor">
        <h1> Venus Nails Spa</h1>
        <p>Bienvenida a Venus nails un espacio diseñado para tu cuidado</p>
        <br>
        <a href="vistas/usuarios/registrar.jsp" class="btn btn-registrar">Registrarse</a>
        <a href="vistas/login.jsp" class="btn btn-login">Ya soy usuario</a>
    </div>
</body>
</html>