<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Ciudadano Creado</title>
  <style>
    html, body { margin:0; padding:0; height:100%; }
    body {
      background-image: url("<%= request.getContextPath() %>/imagenes/recepcion-hospital.jpg");
      background-size: cover;
      background-position: center center;
      font-family: Arial, sans-serif;
      position: relative;
    }
    .overlay {
      position: absolute;
      top:0; left:0; width:100%; height:100%;
      background: rgba(0,0,0,0.4);
      pointer-events: none;
    }
    .content {
      position: relative; z-index:1;
      display:flex; flex-direction:column;
      justify-content:center; align-items:center;
      height:100%; color:#fff;
      text-shadow:1px 1px 2px #000;
      padding: 0 20px; box-sizing:border-box;
    }
    .content h1 { margin-bottom:1em; }
    .content p  { margin:0.5em 0; }
    .content a  {
      margin-top:1.5em;
      color:#fff;
      text-decoration:underline;
    }
  </style>
</head>
<body>
  <div class="overlay"></div>
  <div class="content">
    <h1>¡Ciudadano creado con éxito!</h1>

    <!-- Aquí mostramos los atributos -->
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
</body>
</html>
