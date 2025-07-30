<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.entities.Ciudadano" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Agregar Turno</title>
  <link rel="stylesheet" href="css/styles.css">

</head>
<body>
<jsp:include page="partials/menu.jsp" />

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
        <label>Descripción:</label>
                <input type="text" name="descripcion" required>
        <button type="submit">Agregar Turno</button>
      </form>
    </div>
  </div>
</body>
</html>
