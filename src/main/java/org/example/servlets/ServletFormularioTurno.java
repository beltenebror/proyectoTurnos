package org.example.servlets;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import org.example.entities.Ciudadano;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/formularioTurno")
public class ServletFormularioTurno extends HttpServlet {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("miUnidad");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        EntityManager em = emf.createEntityManager();
        List<Ciudadano> listaCiudadanos = em.createQuery("SELECT c FROM Ciudadano c", Ciudadano.class).getResultList();
        req.setAttribute("ciudadanos", listaCiudadanos);
        req.getRequestDispatcher("agregarTurno.jsp").forward(req, res);
    }
}