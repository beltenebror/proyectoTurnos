<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Ciudadano Creado</title>
<link rel="stylesheet" href="css/baseCreado.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/menu.css">

</head>
<body>
<jsp:include page="partials/menu.jsp" />

  <div class="content">
    <div class="box">
      <h2>¡Ciudadano creado con éxito!</h2>

      <p><strong>Nombre:</strong>
        <%= request.getAttribute("nombre") != null
            ? request.getAttribute("nombre")
            : "Desconocido" %>
      </p>

      <p><strong>Apellidos:</strong>
        <%= request.getAttribute("apellidos") != null
            ? request.getAttribute("apellidos")
            : "Desconocido" %>
      </p>

      <a href="<%= request.getContextPath() %>/">Volver al inicio</a>
    </div>
  </div>
</body>
</html>

