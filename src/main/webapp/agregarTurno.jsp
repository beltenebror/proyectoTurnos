<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.entities.Ciudadano" %>
<%@ page import="java.util.List" %>
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

      <label for="fecha">Fecha:
        <input type="date" id="fecha" name="fecha" required />
      </label>

      <label for="hora">Hora:
        <input type="time" id="hora" name="hora" required />
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
