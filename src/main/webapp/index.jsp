<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de turnos</title>
</head>

<body>

    <h2>Crear Ciudadano</h2>
    <form action="/proyectoTurnos/ciudadano" method="POST">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" required>

        <label for="apellido">Apellido:</label>
        <input type="text" id="apellido" name="apellido" required>

        <button type="submit">Enviar</button>
    </form>

    <br>

    <!-- Botón para ir al formulario de turnos -->
    <button type="button" onclick="window.location.href='AgregarTurno.jsp'">
        Ir a Agregar Turno
    </button>

</body>
</html>


