package org.example.utils;

import jakarta.persistence.*;
import org.example.entities.EstadoTurnos;
import org.example.entities.Turno;

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
}
