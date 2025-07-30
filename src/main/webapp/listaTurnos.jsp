<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.example.entities.Turno" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Lista turnos</title>
</head>
<body>
<jsp:include page="menu.jsp" />
<% String mostrando = (String) request.getAttribute("mostrando");%>
<h1>Mostrando <%= mostrando %></h1>



    <table border="1">
        <tr>
            <th>Código</th>
            <th>Descripción</th>
            <th>Fecha</th>
            <th>Hora</th>
            <th>Estado</th>
            <th>Ciudadano</th>
        </tr>
        <%
        List<Turno> listaTurnos = (List<Turno>) request.getAttribute("listaTurnos");
        if(listaTurnos != null){
            for(Turno turno : listaTurnos){
        %>


        <tr>
            <td><%= turno.getCodigo() %></td>
            <td><%= turno.getDescripcion() %></td>
            <td><%= turno.getFecha() %></td>
            <td><%= turno.getHora() %></td>
            <td><%= turno.getEstado() %></td>
            <td><%= turno.getCiudadano().getNombre() %> <%= turno.getCiudadano().getApellidos() %></td>
        </tr>
        <%  }
        } else { %>
        <tr><td colspan="6">No hay turnos disponibles.</td></tr>
        <% } %>

    </table>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Filtrar Turnos</title>
    <style>
        body {
          font-family: 'Segoe UI', sans-serif;
          background: #f9f9f9;
          padding: 40px;
          display: flex;
          justify-content: center;
        }
        form {
          background: #ffffff;
          padding: 20px 30px;
          border-radius: 10px;
          box-shadow: 0 2px 8px rgba(0,0,0,0.1);
          max-width: 500px;
          width: 100%;
        }
        h2 {
          margin-top: 0;
          text-align: center;
        }
        label {
          display: block;
          margin-top: 15px;
          font-weight: bold;
        }
        input[type="date"],
        select {
          width: 100%;
          padding: 8px;
          margin-top: 5px;
          border: 1px solid #ccc;
          border-radius: 5px;
        }
        button {
          margin-top: 20px;
          background-color: #6c63ff;
          color: white;
          padding: 10px 15px;
          border: none;
          border-radius: 5px;
          cursor: pointer;
          width: 100%;
        }
        button:hover {
          background-color: #574edc;
        }
    </style>
</head>
<body>

<form action="filtrarTurnos" method="get">
    <h2>Filtrar Turnos</h2>

    <label for="estado">Estado:</label>
    <select name="estado" id="estado">
        <option value="">-- Todos --</option>
        <option value="ESPERA">En espera</option>
        <option value="ATENDIDO">Ya atendido</option>
    </select>

    <label for="fechaInicio">Fecha de inicio:</label>
    <input type="date" name="fechaInicio" id="fechaInicio">

    <label for="fechaFin">Fecha de fin:</label>
    <input type="date" name="fechaFin" id="fechaFin">

    <button type="submit">Aplicar Filtros</button>
</form>

</body>
</html>
