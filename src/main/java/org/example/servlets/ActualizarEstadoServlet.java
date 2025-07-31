package org.example.servlets;

import org.example.entities.Turno;
import org.example.utils.TurnoJPA;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/actualizarEstado")
public class ActualizarEstadoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("idTurno");

        if (idStr == null || idStr.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de turno no proporcionado.");
            return;
        }

        Long idTurno;
        try {
            idTurno = Long.parseLong(idStr);
        } catch (NumberFormatException e) {
            throw new ServletException("ID de turno inválido", e);
        }

        TurnoJPA turnoJPA = new TurnoJPA();
        Turno turnoActualizado;
        try {
            turnoActualizado = turnoJPA.atenderTurno(idTurno);
        } catch (Exception e) {
            throw new ServletException("No se pudo actualizar el estado del turno", e);
        }

        if (turnoActualizado == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Turno no encontrado.");
            return;
        }

        request.setAttribute("turnoActualizar", turnoActualizado);
        request.getRequestDispatcher("turnoActualizado.jsp").forward(request, response);
    }
}

