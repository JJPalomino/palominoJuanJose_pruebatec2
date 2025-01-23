
package com.hackaboss.logica;

import java.io.Serializable;
import java.time.LocalDate;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;

@Entity
public class Ciudadano implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String nombre;
    private String apellido;
    private LocalDate fechaNocimiento;
            
    @Column(unique = true)   //Hacemos queb la CURP (La Clave Única de Registro de Población) se única 
    private String CURP;
    
    private String direccion;
    private String telefono;
    
    @Column(nullable = true)   //Permitimos valores nulos, ya que en algunas comunidades las personas no tienen correo electrónico
    private String email;
    
    private Boolean estado = true;
    

    public Ciudadano() {
        
    }

    public Ciudadano(String nombre, String apellido, LocalDate fechaNocimiento, String CURP, String direccion, String telefono, String email) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.fechaNocimiento = fechaNocimiento;
        this.CURP = CURP;
        this.direccion = direccion;
        this.telefono = telefono;
        this.email = email;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public LocalDate getFechaNocimiento() {
        return fechaNocimiento;
    }

    public void setFechaNocimiento(LocalDate fechaNocimiento) {
        this.fechaNocimiento = fechaNocimiento;
    }

    public String getCURP() {
        return CURP;
    }

    public void setCURP(String CURP) {
        this.CURP = CURP;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    @PrePersist
    protected void prePersist(){
        if(this.estado == null){
            this.estado = true;
        }
    }

    
}
