package org.example.servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletContext;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/")
public class InicioServlet extends HttpServlet {

    private static final String IMAGES_PREFIX = "/imagenes/";

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String uri     = request.getRequestURI();
        String context = request.getContextPath();

        // Deja pasar las peticiones a /imagenes/... al default servlet
        if (uri.startsWith(context + IMAGES_PREFIX)) {
            ServletContext sc = getServletContext();
            RequestDispatcher defaultDispatcher = sc.getNamedDispatcher("default");
            defaultDispatcher.forward(request, response);
            return;
        }

        // El resto de peticiones van a index.jsp
        request.getRequestDispatcher("/WEB-INF/index.jsp")
                .forward(request, response);
    }
}


