package org.example.utils;

import jakarta.persistence.EntityManager;
import org.example.entities.Ciudadano;
import org.example.entities.EstadoTurnos;
import org.example.entities.Turno;

import javax.servlet.ServletException;
import java.time.LocalDate;
import java.time.LocalTime;

public class TurnoJPA {

    // Método para atender un turno, CORREGIDO para usar Long
    public Turno atenderTurno(Long idTurno) {
        EntityManager em = ConfigJPA.getEntityManager();
        Turno turno;
        try {
            em.getTransaction().begin();

            turno = em.find(Turno.class, idTurno); // el ID es Long, no String

            if (turno != null) {
                turno.setEstado(EstadoTurnos.ATENDIDO);
                // No necesitas em.persist(turno) porque el objeto ya está gestionado
            }

            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            em.close();
        }
        return turno;
    }

    // Método para agregar un nuevo turno, también corregido previamente
    public static Turno agregarTurno(LocalDate fecha, LocalTime hora, EstadoTurnos estado, Long ciudadanoId, String descripcion) throws ServletException {
        EntityManager em = ConfigJPA.getEntityManager();
        Turno turno = new Turno();

        try {
            em.getTransaction().begin();

            Ciudadano ciudadano = em.find(Ciudadano.class, ciudadanoId);
            if (ciudadano == null) {
                throw new ServletException("No se encontró ciudadano con ID: " + ciudadanoId);
            }

            turno.setFecha(fecha);
            turno.setHora(hora);
            turno.setEstado(estado);
            turno.setCiudadano(ciudadano);
            turno.setCodigo(turno.generarCodigo());
            turno.setDescripcion(descripcion);

            em.persist(turno);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw new ServletException("Error al guardar el turno", e);
        } finally {
            em.close();
        }

        return turno;
    }
}
