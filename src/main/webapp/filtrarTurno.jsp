<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.example.entities.Turno" %>

<html>
<head>
    <title>Filtrar turno</title>
</head>
<body>
<h2>Filtro por fecha y estado</h2>
<form action="FiltrarTurnosServlet" method="get">
    <label>Estado:</label>
    <select name = "estado">
        <option value="">Todos</option>
        <option value="ESPERA">En espera</option>
        <option value="ATENDIDO">Ya atendido</option>
    </select>
    <label>Fecha inicio:</label>
    <input type="date" name="fechaInicio">

    <label>Fecha fin:</label>
    <input type="date" name="fechaFin">

    <button type="submit">Filtrar</button>
</form>
</body>
</html>
