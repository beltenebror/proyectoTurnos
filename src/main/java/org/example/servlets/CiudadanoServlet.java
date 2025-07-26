package org.example.servlets;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import org.example.entities.Ciudadano;
import org.example.utils.ConfigJpa;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/ciudadano")
public class CiudadanoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");

        Ciudadano producto = new Ciudadano(nombre,apellido);

        EntityManager em = ConfigJpa.getEntityManager();
        em.getTransaction().begin();
        em.persist(producto);
        em.getTransaction().commit();


        em.getTransaction().begin();

        request.getRequestDispatcher("creado.jsp").forward(request,response);

    }
}
