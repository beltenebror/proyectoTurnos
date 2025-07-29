package org.example.servlets;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import org.example.entities.Ciudadano;
import org.example.entities.EstadoTurnos;
import org.example.entities.Turno;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;

@WebServlet(urlPatterns = "/agregarTurno")
public class ServletAgregarTurno extends HttpServlet {
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("miUnidad");

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String descripcion = req.getParameter("descripcion");
        int dia = Integer.parseInt(req.getParameter("dia"));
        int mes = Integer.parseInt(req.getParameter("mes"));
        int year = Integer.parseInt(req.getParameter("year"));
        LocalDate fecha = LocalDate.of(year, mes, dia);

        String horaStr = req.getParameter("hora");
        LocalTime hora = LocalTime.parse(horaStr);

        String estadoStr = req.getParameter("estado");
        EstadoTurnos estado = EstadoTurnos.valueOf(estadoStr); // Asegura conversión segura

        Long ciudadanoId = Long.parseLong(req.getParameter("ciudadanoId"));

        EntityManager em = emf.createEntityManager();

        try {
            Ciudadano ciudadano = em.find(Ciudadano.class, ciudadanoId);

            if (ciudadano != null) {
                Turno turno = new Turno();
                turno.setDescripcion(descripcion);
                turno.setFecha(fecha);
                turno.setHora(hora);
                turno.setEstado(estado);
                turno.setCiudadano(ciudadano);

                em.getTransaction().begin();
                em.persist(turno);
                em.getTransaction().commit();
            }
        } finally {
            em.close();
        }

        // Redireccionar a página confirmación o listado
        res.sendRedirect("listaTurnos.jsp");
    }
}
