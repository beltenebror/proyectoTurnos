package org.example.servlets;

import org.example.entities.EstadoTurnos;
import org.example.entities.Turno;
import org.example.utils.TurnoJPA;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeParseException;

@WebServlet("/agregarTurno")
public class AgregarTurnoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String fechaStr       = request.getParameter("fecha");
        String horaStr        = request.getParameter("hora");
        String estadoStr      = request.getParameter("estado");
        String ciudadanoIdStr = request.getParameter("ciudadanoId");
        String descripcion    = request.getParameter("descripcion");

        Long ciudadanoId;
        try {
            ciudadanoId = Long.parseLong(ciudadanoIdStr);
        } catch (NumberFormatException e) {
            throw new ServletException("ID de ciudadano inválido", e);
        }

        LocalDate fecha;
        try {
            fecha = LocalDate.parse(fechaStr);
        } catch (DateTimeParseException ex) {
            throw new ServletException("Fecha inválida", ex);
        }

        LocalTime hora;
        try {
            hora = LocalTime.parse(horaStr);
        } catch (DateTimeParseException ex) {
            throw new ServletException("Hora inválida", ex);
        }

        EstadoTurnos estadoEnum;
        try {
            String norm = estadoStr.trim().toUpperCase();
            estadoEnum = EstadoTurnos.valueOf(norm);
        } catch (IllegalArgumentException ex) {
            throw new ServletException("Estado inválido: " + estadoStr, ex);
        }

        try {
            Turno turno = TurnoJPA.agregarTurno(fecha, hora, estadoEnum, ciudadanoId, descripcion);
            request.setAttribute("turno", turno);
            request.getRequestDispatcher("turnoAgregado.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Error al agregar el turno", e);
        }
    }
}
