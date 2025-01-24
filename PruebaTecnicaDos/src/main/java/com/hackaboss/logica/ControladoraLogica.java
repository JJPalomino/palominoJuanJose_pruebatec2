package com.hackaboss.logica;

import com.hackaboss.persistencia.ControladoraPersistencia;
import java.time.LocalDate;
import java.time.Month;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

public class ControladoraLogica {
    
    ControladoraPersistencia controlPersis = new ControladoraPersistencia();

    
    public void crearTramite(String nombre, String descripcion) {
        Tramite tramite = new Tramite(nombre, descripcion);
        controlPersis.crearTramite(tramite);
    }
    
    public void eliminarTramite(Long id) throws Exception{
        controlPersis.eliminarTramite(id);
    }

    public List<Tramite> traterTramites() {
        List<Tramite> tramites = new ArrayList<>();
        return tramites = controlPersis.traerTramites();
    }

    public void editarTramite(Tramite tram) {
        controlPersis.editarTramite(tram);
    }

    public Tramite buscarTramite(Long id) {
        return controlPersis.buscarTramite(id);
    }

    public void crearCiudadano(String nombre, String apellido, String curp, LocalDate fecha, String email, String telefono, String direccion) {
        Ciudadano ciudadano = new Ciudadano(nombre, apellido, fecha, curp, direccion, telefono, email);
        controlPersis.crearCiudadano(ciudadano);
    }

    public List<Ciudadano> traerCiudadanos() {
        List<Ciudadano> ciudadanos = new ArrayList<>();
        return ciudadanos = controlPersis.traerCiudadanos();
    }

    public void eliminarCiudadano(Long id) throws Exception{
        controlPersis.eliminarCiudadano(id);
    }

    public Ciudadano buscarCiudadano(Long id) {
        return controlPersis.buscarCiudadano(id);
    }

    public void editarCiudadano(Ciudadano ciudadano) {
        controlPersis.editarCiudadano(ciudadano);
    }


    public Ciudadano buscarCiudadanoCURP(String ciudadanoCURP) {
        return controlPersis.buscarCiudadanoCURP(ciudadanoCURP);
        
    }

    public Tramite buscarTramiteNom(String tramiteNombre) {
        return controlPersis.buscarTramiteNom(tramiteNombre);
    }
    
    public void crearCita(String CURP, String nombreTramite, LocalDate fecha, String hora, String descripcion, boolean estado) {
        Ciudadano ciudadano = controlPersis.buscarCiudadanoCURP(CURP);
        Tramite tramite = controlPersis.buscarTramiteNom(nombreTramite);
        Cita cita = new Cita();
        cita.setCiudadano(ciudadano);
        cita.setTramite(tramite);
        cita.setFecha(fecha);
        cita.setHora(hora);
        cita.setDescripcion(descripcion);
        cita.setEstado(estado);
        
        controlPersis.crearCita(cita);
    }

    public List<Cita> traerCitas() {
        List<Cita> citas = new ArrayList<>();
        return citas  =controlPersis.traerCitas();
    }

    public void eliminarCita(Long id) {
        controlPersis.eliminarCita(id);
    }

    public Cita buscarCita(Long id) {
        return controlPersis.buscarCita(id);
    }


    

    
    

   

    
    
}
