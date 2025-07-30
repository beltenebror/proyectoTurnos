<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.example.entities.Turno" %>
<%@ page import="org.example.entities.EstadoTurnos" %>
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
            <th>Modificar</th>
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
            <%  if(turno.getEstado() == EstadoTurnos.ESPERA){ %>
            <td>
                <form action="actualizarEstado" method="get">
                    <input type="hidden" name="idTurno" value="<%=turno.getId()%>">
                    <input type="submit" value="Atender">
                </form>
            </td>
            <%}else{ %>
            <td></td>
            <%}%>

        </tr>
        <%  }
        } else { %>
        <tr><td colspan="6">No hay turnos disponibles.</td></tr>
        <% } %>

    </table>


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
