<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.example.entities.*" %>

<html>
<head>
    <title>Turnos</title>

</head>
<body>
<jsp:include page="menu.jsp" />
<h2>Agregar turno</h2>
<table>
    <tr>
        <th>Codigo</th>
        <th>Descripcion</th>
        <th>Fecha</th>
        <th>Hora</th>
        <th>Estado</th>
        <th>Ciudadano</th>
    </tr>
    <%
    List<Turno> turnos =(List<Turno>) request.getAttribute("turnos");
    if(turnos != null){
    for(Turno t : turnos)
    %>
    <tr>
        <td><%= t.getCodigo() %></td>
        <td><%= t.getDescripcion() %></td>
        <td><%= t.getFecha() %></td>
        <td><%= t.getHora() %></td>
        <td><%= t.getEstado() %></td>
        <td><%= t.getCiudadano().getNombre() %> <% t.getCiudadano.getApellido()  %></td>
    </tr>
    <%
        }
            }
    %>
</table><br>
</body>
</html>