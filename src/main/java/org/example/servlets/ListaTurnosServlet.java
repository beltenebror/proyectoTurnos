package org.example.servlets;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import org.example.entities.Turno;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Comparator;
import java.util.List;

@WebServlet("/listaTurnos")

public class ListaTurnosServlet extends HttpServlet {
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("miUnidad");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        EntityManager em = emf.createEntityManager();

        // Consulta sin filtros: obtener todos los turnos
        List<Turno> listaTurnosBurdo = em.createQuery("FROM Turno", Turno.class).getResultList();
        List<Turno> listaTurnos = listaTurnosBurdo.stream().sorted(Comparator.comparing(Turno::getCodigo)).toList();

        String mostrando = "todos los turnos";

        req.setAttribute("mostrando", mostrando);
        req.setAttribute("listaTurnos", listaTurnos);
        em.close();

        req.getRequestDispatcher("listaTurnos.jsp").forward(req, res);

    }
}
