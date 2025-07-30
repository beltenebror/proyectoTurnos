package org.example.servlets;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import org.example.entities.EstadoTurnos;
import org.example.entities.Turno;

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

        em.getTransaction().begin();


        Turno turnoActualizar = em.find(Turno.class, idTurno);

        turnoActualizar.setEstado(EstadoTurnos.ATENDIDO);

        em.persist(turnoActualizar);
        em.getTransaction().commit();

        em.close();

        req.setAttribute("turnoActualizar", turnoActualizar);


        req.getRequestDispatcher("turnoActualizado.jsp").forward(req, res);

    }




}
