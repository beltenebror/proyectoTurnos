<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.example.entities.Turno" %>

<html>
<head>
<meta charset="UTF-8">
  <title>Turno agregado</title>
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

    .recuadro-turno {
      background-color: rgba(255, 255, 255, 0.95);
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.4);
      max-width: 700px;
      width: 100%;
      text-align: center;
    }

    .recuadro-turno h2 {
      margin-top: 0;
      margin-bottom: 20px;
      color: #222;
    }

    .recuadro-turno table {
      width: 100%;
      border-collapse: collapse;
    }

    .recuadro-turno th {
      background-color: #004c99;
      color: white;
      padding: 12px;
      font-weight: bold;
      text-align: left;
    }

    .recuadro-turno td {
      background-color: #f5f8ff;
      padding: 12px;
      border-bottom: 1px solid #ccc;
      color: #333;
    }

    .recuadro-turno tr:hover td {
      background-color: #dce8ff;
    }

    .recuadro-turno .volver {
      margin-top: 20px;
    }

    .recuadro-turno .volver a {
      padding: 10px 20px;
      background-color: #0066cc;
      color: #fff;
      border-radius: 6px;
      text-decoration: none;
      font-weight: bold;
      box-shadow: 0 2px 4px rgba(0,0,0,0.3);
    }

    .recuadro-turno .volver a:hover {
      background-color: #004080;
    }
  </style>
</head>
<body>
  <div class="overlay"></div>
  <div class="content">
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

