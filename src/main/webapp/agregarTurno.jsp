<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.entities.Ciudadano" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Agregar Turno</title>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/menu.css">
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/baseCrear.css">
</head>
<body>
  <jsp:include page="partials/menu.jsp" />
  <div class="overlay"></div>

  <div class="content">
    <form action="<%= request.getContextPath() %>/agregarTurno" method="post" class="form-box">
      <h2>Nuevo Turno</h2>

      <!-- Solo se pueden generar turnos a partir del día siguiente al que nos encontramos -->
      <label for="fecha">Fecha:
        <%
          String diaSiguiente = LocalDate.now().plusDays(1).toString();
        %>
        <input type="date" id="fecha" name="fecha" required min="<%= diaSiguiente%>">
      </label>

      <!-- Solo se pueden generar turnos en horario de 8:30 a 14:00 cada 15 minutos -->
      <label for="hora">Hora:
        <select id="hora" name="hora" required>
          <%
          java.time.LocalTime inicio = java.time.LocalTime.of(8, 30);
          java.time.LocalTime fin = java.time.LocalTime.of(14, 0);
          while (!inicio.isAfter(fin)) {
          %>
          <option value="<%= inicio.toString() %>"><%= inicio.toString() %></option>
          <%
          inicio = inicio.plusMinutes(15);
          }
          %>
        </select>
      </label>

      <label for="estado">Estado:
        <select id="estado" name="estado">
          <option value="ESPERA">En espera</option>
        </select>
      </label>

      <label for="ciudadano">Ciudadano:
        <select id="ciudadano" name="ciudadanoId">
          <%
            List<Ciudadano> ciudadanos = (List<Ciudadano>) request.getAttribute("ciudadanos");
            if (ciudadanos != null) {
              for (Ciudadano c : ciudadanos) {
          %>
            <option value="<%= c.getId() %>">
              <%= c.getNombre() %> <%= c.getApellidos() %>
            </option>
          <%
              }
            }
          %>
        </select>
      </label>

      <label for="descripcion">Descripción:
        <input type="text" id="descripcion" name="descripcion" />
      </label>

      <button type="submit">Agregar Turno</button>
    </form>
  </div>
</body>
</html>
