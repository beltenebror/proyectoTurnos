package org.example.servlets;

import jakarta.persistence.EntityManager;
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");

        System.out.println("Nombre recibido: " + nombre);
        System.out.println("Apellidos recibidos: " + apellidos);

        if (nombre == null || apellidos == null || nombre.trim().isEmpty() || apellidos.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Nombre y apellidos son obligatorios.");
            return;
        }

        Ciudadano ciudadano = new Ciudadano(nombre.trim(), apellidos.trim());

        EntityManager em = ConfigJpa.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(ciudadano);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw new ServletException("Error al guardar el ciudadano", e);
        } finally {
            em.close();
        }

        request.getRequestDispatcher("creado.jsp").forward(request, response);
    }
}

