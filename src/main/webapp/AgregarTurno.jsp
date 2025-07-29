<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.example.entities.*" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Agregar Turno</title>
</head>
<body>
<jsp:include page="menu.jsp" />
<h2>Nuevo turno</h2>
<form action="agregarTurno" method="post">
    Descripción:<input type="text" name="descripcion" required><br>
    Fecha:
    <select name="dia">
        <% for (int d = 1; d <= 31; d++){ %>
            <option value="<%= d %>"><%= d %></option>
        <% } %>
    </select>
    <select name="mes">
        <% for (int m = 1; m <= 12; m++){ %>
        <option value="<%= m %>"><%= m %></option>
            <% } %>
    </select>
    <select name="year">
        <% int a = 2025; %>
        <option value="<%= a %>"><%= a %></option>
    </select><br>

    <!-- <input type="date" name="fecha" required><br> -->
   Hora:
    <select name="hora">
        <% for (int h=8; h<=14; h++){
            for(int m = 0; m <60; m+=30){
        String hh = (h < 10 ? "0" : "") + h;
        String mm = (m == 0 ? "00" : String.valueOf(m));
        String hora = hh + ":" + mm;
        %>
        <option value="<%= hora %>"><%= hora %></option>
        <%  }
                } %>
    </select><br>

    <!--<input type="time" name="hora" required><br> -->

   Estado:
   <select name="estado" required>
       <option value="ESPERA"> En espera</option>
       <option value="ATENDIDO"> Ya atendido</option>
   </select><br>

   <label for="ciudadano">Nombre</label>
   <select name="ciudadanoId" id="ciudadano" required>
       <option value="" disabled selected>Seleccione una opción</option>

       <!-- Iterar los nombres de los ciudadanos-->
        <%   List<Ciudadano> listaCiudadanos = (List<Ciudadano>) request.getAttribute("listado");
        for (Ciudadano ciudadano : listaCiudadanos) { %>
        <option value="<%= ciudadano.getId() %>"> <%= ciudadano.getNombre() %> <%= ciudadano.getApellidos() %>
 </option>
        <% } %>
    </select>
    <input type="submit" value="Agregar Turno">
</form>
</body>
</html>