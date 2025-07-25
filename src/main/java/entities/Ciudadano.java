package entities;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name="ciudadanos")
public class Ciudadano {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String nombre;
    private String apellido;
    @OneToMany(mappedBy = "ciudadano", cascade = CascadeType.ALL)
    private List<Turno> turnos;

    public Ciudadano() {
    }

    public Ciudadano(String nombre, String apellido) {
        this.nombre = nombre;
        this.apellido = apellido;
    }
}
