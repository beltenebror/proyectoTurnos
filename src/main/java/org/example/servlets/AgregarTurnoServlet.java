package org.example.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

import org.example.entities.Turno;
import org.example.entities.Ciudadano;
import org.example.entities.EstadoTurnos;

@WebServlet("/agregarTurno")
public class AgregarTurnoServlet extends HttpServlet {

    private EntityManagerFactory emf;

    @Override
    public void init() throws ServletException {
        emf = Persistence.createEntityManagerFactory("miUnidad");
    }

    @Override
    public void destroy() {
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fechaStr  = request.getParameter("fecha");    // "yyyy-MM-dd"
        String horaStr   = request.getParameter("hora");     // "HH:mm"
        String estadoStr = request.getParameter("estado");   // "En espera" o "Atendido"
        String idCiudadano = request.getParameter("idCiudadano");
        String descripcion = request.getParameter("descripcion");

        // 1. Parseo de fecha (ISO y fallback corto)
        LocalDate fecha;
        try {
            fecha = LocalDate.parse(fechaStr);
        } catch (DateTimeParseException ex) {
            DateTimeFormatter altFmt = DateTimeFormatter.ofPattern("d M uuuu");
            fecha = LocalDate.parse(fechaStr, altFmt);
        }

        // 2. Parseo de hora
        LocalTime hora;
        try {
            hora = LocalTime.parse(horaStr);
        } catch (DateTimeParseException ex) {
            throw new ServletException("Formato de hora inválido: " + horaStr, ex);
        }

        // 3. Normalizar estado a enum
        String norm = estadoStr.trim()
                .replace(" ", "_")
                .toUpperCase();    // "En espera" → "EN_ESPERA"
        EstadoTurnos estadoEnum;
        try {
            estadoEnum = EstadoTurnos.valueOf(norm);
        } catch (IllegalArgumentException ex) {
            throw new ServletException("Estado inválido: " + estadoStr, ex);
        }

        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();

            Ciudadano ciudadano = em.createQuery("SELECT c FROM Ciudadano c WHERE c.id="+idCiudadano, Ciudadano.class).getSingleResult();


            Turno turno = new Turno();
            turno.setFecha(fecha);
            turno.setHora(hora);
            turno.setEstado(estadoEnum);
            turno.setCiudadano(ciudadano);
            turno.setCodigo(turno.generarCodigo());
            turno.setDescripcion(descripcion);
            em.persist(turno);

            em.getTransaction().commit();

            request.setAttribute("turno", turno);
            request.getRequestDispatcher("turnoAgregado.jsp").forward(request, response);

        } catch (Exception e) {
            if (em.getTransaction().isActive()) em.getTransaction().rollback();
            throw new ServletException("Error agregando turno", e);
        } finally {
            em.close();
        }
    }
}