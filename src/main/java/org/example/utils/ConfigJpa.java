package org.example.utils;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class ConfigJpa {

    private static final EntityManagerFactory emf =
            Persistence.createEntityManagerFactory("miUnidad");

    private ConfigJpa() {}

    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public static void cerrar() {
        if (emf.isOpen()) {
            emf.close();
        }
    }
}
