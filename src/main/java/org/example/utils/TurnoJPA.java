package org.example.utils;

import jakarta.persistence.*;
import org.example.entities.Ciudadano;
import org.example.entities.EstadoTurnos;
import org.example.entities.Turno;

import java.time.LocalDate;
import java.time.LocalTime;

public class TurnoJPA {
//    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("miUnidad");

    // Añadimos los Turnos
    public void agregarTurno(Turno turno){
        EntityManager em = ConfigJPA.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(turno);
            em.getTransaction().commit();
        }
        finally {
            em.close();
        }
    }
    public Turno atenderTurno(String idTurno){
        EntityManager em = ConfigJPA.getEntityManager();
        Turno turno;
        try {
            em.getTransaction().begin();
            turno = em.find(Turno.class,idTurno);
            if (turno != null){
                turno.setEstado(EstadoTurnos.ATENDIDO);
                em.persist(turno);
            }
            em.getTransaction().commit();
        }finally {
            em.close();
        }
        return turno;
    }

    public static Turno agregarTurno(LocalDate fecha, LocalTime hora, EstadoTurnos estado, String idCiudadano, String descripcion){
        EntityManager em = ConfigJPA.getEntityManager();
        Turno turno = new Turno();

        try {
            em.getTransaction().begin();

            Ciudadano ciudadano = em.createQuery("SELECT c FROM Ciudadano c WHERE c.id="+idCiudadano, Ciudadano.class).getSingleResult();

//            Turno turno = new Turno();
            turno.setFecha(fecha);
            turno.setHora(hora);
            turno.setEstado(estado);
            turno.setCiudadano(ciudadano);
            turno.setCodigo(turno.generarCodigo());
            turno.setDescripcion(descripcion);
            em.persist(turno);
            em.getTransaction().commit();
    } finally {
            em.close();
        }
        return turno;
        }
}
