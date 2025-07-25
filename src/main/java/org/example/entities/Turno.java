package org.example.entities;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

@Entity
@Table(name="turnos")
public class Turno {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String descripcion;
    private LocalDate fecha;
    private LocalTime hora;
    private EstadoTurnos estado;

    @Column(unique = true)
    private String codigo;

    @ManyToOne
    private Ciudadano ciudadano;

    public Turno() {
    }

    public Turno(String descripcion, LocalDate fecha, EstadoTurnos estado, String codigo) {
        this.descripcion = descripcion;
        this.fecha = fecha;
        this.estado = estado;
        this.codigo = generarCodigo();
    }

    private String generarCodigo() {
        String year = String.valueOf(fecha.getYear());
        String horaFormateada = hora.format(DateTimeFormatter.ofPattern("HHmmss"));
        return "T"+year+"-"+horaFormateada;
    }


}