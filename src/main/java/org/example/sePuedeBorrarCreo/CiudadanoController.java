package org.example.sePuedeBorrarCreo;

import jakarta.persistence.EntityManager;
import org.example.entities.Ciudadano;
import org.example.utils.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CiudadanoController extends org.example.servlets.CiudadanoServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");

        System.out.println("Nombre: " + nombre);
        System.out.println("Apellidos: " + apellidos);

        Ciudadano ciudadano = new Ciudadano(nombre, apellidos);
        EntityManager em = ConfigJpa.getEntityManager();

        request.getRequestDispatcher("/WEB-INF/clienteAgregado.jsp").forward(request, response);
    }
}