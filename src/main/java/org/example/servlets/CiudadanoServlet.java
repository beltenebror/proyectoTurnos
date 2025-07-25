package org.example.servlets;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import org.example.entities.Ciudadano;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/ciudadano")
public class CiudadanoServlet extends HttpServlet {
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("miUnidad");

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");

        Ciudadano producto = new Ciudadano(nombre,apellido);

        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(producto);
        em.getTransaction().commit();





        em.getTransaction().begin();


        em.close();
        request.getRequestDispatcher("creado.jsp").forward(request,response);

    }
}
