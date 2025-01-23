package com.hackaboss.logica;

import com.hackaboss.persistencia.ControladoraPersistencia;
import java.time.LocalDate;
import java.util.ArrayList;
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
        return controlPersis.crearCiudadanoCURP(ciudadanoCURP);
        
    }

    public Tramite buscarTramiteNom(String tramiteNombre) {
        return controlPersis.buscarTramiteNom(tramiteNombre);
    }

    public void crearCita(Cita cita) {
        controlPersis.crearCita(cita);
    }

   

    
    
}
