<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.example.entities.Turno" %>

<html>
<head>
    <title>Turno agregado</title>
</head>
<body>
<jsp:include page="menu.jsp" />
<h2>Turno agregado correctamente</h2>
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
        Turno turno = (Turno) request.getAttribute("turno");
        if (turno != null) {
    %>
    <tr>
        <td><%= turno.getCodigo() %></td>
        <td><%= turno.getDescripcion() %></td>
        <td><%= turno.getFecha() %></td>
        <td><%= turno.getHora() %></td>
        <td><%= turno.getEstado() %></td>
        <td><%= turno.getCiudadano().getNombre() %> <%= turno.getCiudadano().getApellidos() %></td>
    </tr>
    <%
        } else {
    %>
    <tr><td colspan="6">No se pudo cargar el turno.</td></tr>
    <%
        }
    %>
</table><br>
</body>
</html>
