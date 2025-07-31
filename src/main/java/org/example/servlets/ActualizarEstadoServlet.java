package org.example.servlets;

import jakarta.persistence.*;
import org.example.entities.EstadoTurnos;
import org.example.entities.Turno;
import org.example.utils.*;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/actualizarEstado")

public class ActualizarEstadoServlet extends HttpServlet {
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("miUnidad");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        EntityManager em = emf.createEntityManager();

        String idTurno  = req.getParameter("idTurno");

        // codigo anterior a JPA pendiente de borrar
       /* em.getTransaction().begin();
        Turno turnoActualizar = em.find(Turno.class, idTurno);
        turnoActualizar.setEstado(EstadoTurnos.ATENDIDO);
        em.persist(turnoActualizar);
        em.getTransaction().commit();
        em.close();*/

        TurnoJPA turnoJPA = new TurnoJPA();
        Turno turnoActualizar = turnoJPA.atenderTurno(idTurno);


        req.setAttribute("turnoActualizar", turnoActualizar);
        req.getRequestDispatcher("turnoActualizado.jsp").forward(req, res);

    }




}
