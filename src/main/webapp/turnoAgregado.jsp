<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.example.entities.Turno" %>

<html>
<head>
<meta charset="UTF-8">
  <title>Turno agregado</title>
<link rel="stylesheet" href="css/baseCreado.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/menu.css">

</head>
<body>
<jsp:include page="partials/menu.jsp" />


  <div class="content">
      <div class="box">
    <div class="recuadro-turno">
      <h2>Turno agregado correctamente</h2>
      <table>
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
          <td><%= turno.getDescripcion() != null ? turno.getDescripcion() : "—" %></td>
          <td><%= turno.getFecha() %></td>
          <td><%= turno.getHora() %></td>
          <td><%= turno.getEstado() %></td>
          <td><%= turno.getCiudadano().getNombre() %> <%= turno.getCiudadano().getApellidos() != null ? turno.getCiudadano().getApellidos() : "" %></td>
        </tr>
        <%
          } else {
        %>
        <tr><td colspan="6">No se pudo cargar el turno.</td></tr>
        <%
          }
        %>
      </table>
      <div class="volver">
        <a href="index.jsp">Volver al inicio</a>
      </div>
    </div>
  </div>
</body>
</html>

