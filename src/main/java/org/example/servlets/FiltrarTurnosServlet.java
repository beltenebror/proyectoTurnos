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
import java.time.LocalDate;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import org.example.entities.EstadoTurnos;


@WebServlet("/filtrarTurnos")

public class FiltrarTurnosServlet extends HttpServlet {
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("miUnidad");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        EntityManager em = emf.createEntityManager();

        // Consulta sin filtros: obtener todos los turnos
        List<Turno> listaTurnos = em.createQuery("FROM Turno", Turno.class).getResultList();

        // Obtener parámetros
        String estadoRecibido = req.getParameter("estado");
        String fechaInicioRecibida = req.getParameter("fechaInicio");
        String fechaFinRecibida = req.getParameter("fechaFin");

        // Parseos a tipos correctos
        EstadoTurnos estadoFiltro = (estadoRecibido != null && !estadoRecibido.isEmpty())
                ? EstadoTurnos.valueOf(estadoRecibido)
                : null;
        LocalDate fechaInicio = (fechaInicioRecibida != null && !fechaInicioRecibida.isEmpty())
                ? LocalDate.parse(fechaInicioRecibida)
                : null;
        LocalDate fechaFin = (fechaFinRecibida != null && !fechaFinRecibida.isEmpty())
                ? LocalDate.parse(fechaFinRecibida)
                : null;

            // Filtrado
        List<Turno> turnosFiltrados = listaTurnos.stream()
                .filter(turno -> estadoFiltro == null || turno.getEstado() == estadoFiltro)
                .filter(turno -> fechaInicio == null || !turno.getFecha().isBefore(fechaInicio))
                .filter(turno -> fechaFin == null || !turno.getFecha().isAfter(fechaFin))
                .sorted(Comparator.comparing(Turno::getCodigo))
                .collect(Collectors.toList());

        String mostrando = "turnos filtrados";

        req.setAttribute("mostrando", mostrando);
        req.setAttribute("listaTurnos", turnosFiltrados);
        em.close();

        req.getRequestDispatcher("listaTurnos.jsp").forward(req, res);

    }




}