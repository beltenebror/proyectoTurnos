package org.example.servlets;

import jakarta.persistence.*;
import org.example.entities.*;
import org.example.utils.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.*;
import java.util.*;

@WebServlet(urlPatterns = "/agregarTurno")
public class ServletAgregarTurno extends HttpServlet {
    List<Turno> turnos = new ArrayList<>();
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
        String estado = req.getParameter("estado");

        // Obtener ciudadano
        Long ciudadanoId = Long.parseLong(req.getParameter("ciudadanoId"));
        EntityManager em = emf.createEntityManager();
        Ciudadano ciudadano = em.find(Ciudadano.class, ciudadanoId);
        em.close();

        // Crear turno
        Turno turno = new Turno();

        //presistir turnos desde la clase turnosJPA
        TurnoJPA turnoJPA = new TurnoJPA();
        turnoJPA.agregarTurno(turno);

        //Redirigir a listaAgregarTurno.jsp
        res.sendRedirect("AgregarTurno.jsp");
    }

}
