<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.entities.Ciudadano" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Agregar Turno</title>
  <style>
    html, body {
      margin: 0; padding: 0;
      height: 100%; font-family: Arial, sans-serif;
    }

    body {
      background-image: url("<%= request.getContextPath() %>/imagenes/recepcion-hospital.jpg");
      background-size: cover;
      background-position: center;
      background-attachment: fixed;
      position: relative;
    }

    .overlay {
      position: absolute; top: 0; left: 0;
      width: 100%; height: 100%;
      background-color: rgba(0, 0, 0, 0.4);
      pointer-events: none;
    }

    .content {
      position: relative; z-index: 1;
      display: flex; justify-content: center;
      align-items: center; height: 100%;
    }

    .box {
      background-color: rgba(255, 255, 255, 0.9);
      padding: 30px; border-radius: 8px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.3);
      max-width: 400px; width: 100%;
      text-align: center;
    }

    .box h2 { margin-top: 0; color: #333; }
    .box label, .box select, .box input {
      display: block; margin: 10px auto;
      font-size: 1em; width: 80%;
    }

    .box button {
      margin-top: 1em;
      padding: 10px 20px;
      font-size: 1em; background-color: #0066cc;
      color: white; border: none; border-radius: 4px;
      cursor: pointer;
    }
  </style>
</head>
<body>
  <div class="overlay"></div>
  <div class="content">
    <div class="box">
      <h2>Nuevo turno</h2>
      <form action="agregarTurno" method="post">
        <label>Fecha:</label>
        <input type="date" name="fecha" required>

        <label>Hora:</label>
        <input type="time" name="hora" required>

        <label>Estado:</label>
        <select name="estado">
          <option value="ESPERA">En espera</option>
          <option value="ATENDIDO">Atendido</option>
        </select>

        <label>Elige el ciudadano:</label>
        <select name="idCiudadano">
        <%
        List<Ciudadano> ciudadanos = (List<Ciudadano>) request.getAttribute("listado");
        if(ciudadanos != null){
          for(Ciudadano ciudadano : ciudadanos){
        %>
          <option value="<%=ciudadano.getId()%>"><%= ciudadano.getNombre() %> <%= ciudadano.getApellidos()%></option>
          <%} }%>

        </select>
        <label>descripcion</label>
                <input type="text" name="descripcion" required>
        <button type="submit">Agregar Turno</button>
      </form>
    </div>
  </div>
</body>
</html>
