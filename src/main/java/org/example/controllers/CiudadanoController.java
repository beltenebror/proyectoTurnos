package org.example.controllers;

import org.example.entities.Ciudadano;
import org.example.servlets.CiudadanoServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CiudadanoController extends CiudadanoServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellido");

        Ciudadano ciudadano = new Ciudadano();
        ciudadano.setNombre(nombre);
        ciudadano.setApellidos(apellidos);
        response.sendRedirect("creado.jsp");
    }
}
