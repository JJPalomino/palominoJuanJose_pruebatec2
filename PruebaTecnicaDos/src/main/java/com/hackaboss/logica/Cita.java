
package com.hackaboss.logica;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;

@Entity
public class Cita implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Boolean estado = true;
    private LocalDate fecha;
    private String hora;
 
    
    @ManyToOne
    @JoinColumn(name= "tramite", referencedColumnName = "id")
    private Tramite tramite;
    
    @ManyToOne
    @JoinColumn(name= "ciudadano", referencedColumnName = "id")
    private Ciudadano ciudadano;
    
    public Cita() {
    }

    public Cita(LocalDate fecha, String hora, Tramite tramite, Ciudadano ciudadano) {
        this.fecha = fecha;
        this.hora = hora;
        this.tramite = tramite;
        this.ciudadano = ciudadano;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public Tramite getTramite() {
        return tramite;
    }

    public void setTramite(Tramite tramite) {
        this.tramite = tramite;
    }

    public Ciudadano getCiudadano() {
        return ciudadano;
    }

    public void setCiudadano(Ciudadano ciudadano) {
        this.ciudadano = ciudadano;
    }

    @PrePersist
    protected void prePersist(){
        if(this.estado == null){
            this.estado = true;
        }
    }
    

    
}
