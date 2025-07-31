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
    private static Long contador = 100L;

    public Turno() {
    }
    public Turno(String descripcion, LocalDate fecha,LocalTime hora, EstadoTurnos estado, String codigo) {
        this.descripcion = descripcion;
        this.fecha = fecha;
        this.hora = hora;
        this.estado = estado;
        this.codigo = generarCodigo();
        }

    public String generarCodigo() {
        String year = String.valueOf(fecha.getYear()).substring(2);
        String horaFormateada = LocalTime.now().format(DateTimeFormatter.ofPattern("HHmmss"));
        String fechaFormateada = LocalDate.now().format(DateTimeFormatter.ofPattern("MMdd"));
        return "T" + year + "-" + fechaFormateada + "-" + horaFormateada ;
    }

    public Long getId() {
        return id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public LocalTime getHora() {
        return hora;
    }

    public void setHora(LocalTime hora) {
        this.hora = hora;
    }

    public EstadoTurnos getEstado() {
        return estado;
    }

    public void setEstado(EstadoTurnos estado) {
        this.estado = estado;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public Ciudadano getCiudadano() {
        return ciudadano;
    }

    public void setCiudadano(Ciudadano ciudadano) {
        this.ciudadano = ciudadano;
    }
}