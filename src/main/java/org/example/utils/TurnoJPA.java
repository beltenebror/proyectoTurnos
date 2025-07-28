package org.example.utils;

import jakarta.persistence.*;
import org.example.entities.Turno;

public class TurnoJPA {
//    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("miUnidad");

    // Añadimos los Turnos
    public void agregarTurno(Turno turno){
        EntityManager em = ConfigJpa.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(turno);
            em.getTransaction().commit();
        }
        finally {
            em.close();
        }
    }
}
