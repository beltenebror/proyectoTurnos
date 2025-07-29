<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.example.entities.Turno" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Lista turnos</title>
</head>
<body>
<jsp:include page="menu.jsp" />
<h1>Mostrando todos los turnos</h1>



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

</body>
</html>
