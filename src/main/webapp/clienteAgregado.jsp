<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Ciudadano Creado</title>
  <style>
    html, body {
      margin: 0;
      padding: 0;
      height: 100%;
      font-family: Arial, sans-serif;
    }

    body {
      background-image: url("<%= request.getContextPath() %>/imagenes/recepcion-hospital.jpg");
      background-size: cover;
      background-position: center center;
      background-attachment: fixed;
      position: relative;
    }

    .overlay {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.4);
      pointer-events: none;
    }

    .content {
      position: relative;
      z-index: 1;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100%;
      padding: 20px;
      box-sizing: border-box;
    }

    .box {
      background-color: rgba(255, 255, 255, 0.9);
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
      max-width: 400px;
      width: 100%;
      text-align: center;
    }

    .box h2 {
      margin-top: 0;
      margin-bottom: 1em;
      color: #333;
    }

    .box p {
      margin: 0.5em 0;
      color: #555;
    }

    .box a {
      display: inline-block;
      margin-top: 1.5em;
      color: #0066cc;
      text-decoration: underline;
      font-weight: bold;
    }
  </style>
</head>
<body>
<jsp:include page="partials/menu.jsp" />
  <div class="overlay"></div>
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

