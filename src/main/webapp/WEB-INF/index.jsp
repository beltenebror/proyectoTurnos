<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Inicio – Crear Ciudadano</title>
  <style>
    /* Reset básico y 100% de altura */
    html, body {
      margin: 0;
      padding: 0;
      height: 100%;
      font-family: Arial, sans-serif;
    }

    /* Fondo fijo */
    body {
      background-image: url("<%= request.getContextPath() %>/imagenes/hospital.jpg");
      background-size: cover;
      background-position: center center;
      background-attachment: fixed;
      position: relative;
    }

    /* Capa semitransparente para mejorar contraste */
    .overlay {
      position: absolute;
      top: 0; left: 0;
      width: 100%; height: 100%;
      background-color: rgba(0, 0, 0, 0.4);
      pointer-events: none;
    }

    /* Contenedor centrado de contenido */
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

    /* Formulario con fondo claro */
    .form-box {
      background-color: rgba(255, 255, 255, 0.9);
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.3);
      max-width: 360px;
      width: 100%;
    }

    .form-box h2 {
      margin-top: 0;
      margin-bottom: 1em;
      color: #333;
      text-align: center;
    }

    .form-box label {
      display: block;
      margin-bottom: 0.8em;
      color: #333;
    }

    .form-box input {
      width: 100%;
      padding: 8px 10px;
      margin-top: 4px;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
    }

    .form-box button {
      width: 100%;
      padding: 10px;
      background-color: #0066cc;
      border: none;
      color: #fff;
      font-size: 1em;
      border-radius: 4px;
      cursor: pointer;
    }

    .form-box button:hover {
      background-color: #005bb5;
    }
  </style>
</head>
<body>
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











