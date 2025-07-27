<%@ page contentType="text/html;charset=UTF-8" %>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de turnos</title>
</head>

<body>

<form action="/proyectoTurnos/ciudadano" method="POST">
    <h2>Crear del Ciudadano</h2>

    <label for="nombre">Nombre:</label>
    <input type="text" id="nombre" name="nombre" required>

    <label for="apellido">Apellido:</label>
    <input type="text" id="apellidos" name="apellidos" required>

    <button type="submit">Enviar</button>
</form>

</body>

</html>
