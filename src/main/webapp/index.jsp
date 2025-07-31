<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Inicio – Crear Ciudadano</title>

<link rel="stylesheet" href="css/baseCrear.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/menu.css">

</head>
<body>
<jsp:include page="partials/menu.jsp" />

  <div class="overlay"></div>

  <div class="content">
    <form action="<%= request.getContextPath() %>/ciudadano"
          method="post"
          class="form-box">
      <h2>Crear Ciudadano</h2>

      <label for="nombre">
        Nombre:
        <input type="text" id="nombre" name="nombre" required autofocus />
      </label>

      <label for="apellidos">
        Apellidos:
        <input type="text" id="apellidos" name="apellidos" required />
      </label>

      <button type="submit">Crear</button>
    </form>
  </div>
</body>
</html>