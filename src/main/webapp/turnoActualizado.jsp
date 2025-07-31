<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.example.entities.Turno" %>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Turno actualizado</title>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/baseCreado.css">
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/menu.css">

</head>
<body>
  <jsp:include page="partials/menu.jsp" />

  <div class="content">
        <div class="box">
  <div class="mensaje">
    <h2>✔ ¡Turno atendido correctamente!</h2>

    <%
      Turno turno = (Turno) request.getAttribute("turnoActualizar");
      if (turno != null) {
    %>
      <p><strong>Código:</strong> <%= turno.getCodigo() %></p>
      <p><strong>Descripción:</strong> <%= turno.getDescripcion() != null ? turno.getDescripcion() : "—" %></p>
      <p><strong>Fecha:</strong> <%= turno.getFecha() %></p>
      <p><strong>Hora:</strong> <%= turno.getHora() %></p>
      <p><strong>Estado:</strong> <%= turno.getEstado() %></p>
      <p><strong>Ciudadano:</strong> <%= turno.getCiudadano().getNombre() %> <%= turno.getCiudadano().getApellidos() != null ? turno.getCiudadano().getApellidos() : "" %></p>
    <%
      } else {
    %>
      <p>No se pudo actualizar el turno.</p>
    <%
      }
    %>

    <div class="volver">
      <a href="<%= request.getContextPath() %>/">Volver al inicio</a>
    </div>
  </div>
  </div>
  </div>
</body>
</html>


