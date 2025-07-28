package org.example.servlets;

import jakarta.persistence.EntityManager;
import jakarta.persistence.*;
import org.example.entities.Ciudadano;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/formularioTurno")
public class ServletFormularioTurno extends HttpServlet {
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("miUnidad");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        EntityManager em = emf.createEntityManager();

        List<Ciudadano> listaCiudadanos = em.createQuery("SELECT c FROM Ciudadano c", Ciudadano.class).getResultList();

        req.setAttribute("listado", listaCiudadanos);
        req.getRequestDispatcher("AgregarTurno.jsp").forward(req, res);
    }

}
