package org.example.utils;

import jakarta.persistence.EntityManager;
import org.example.entities.Ciudadano;

import javax.servlet.ServletException;

public class CiudadanoJPA {
    public void agregarCiudadano(Ciudadano ciudadano) throws ServletException {
        EntityManager em = ConfigJPA.getEntityManager();
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
    }
}
