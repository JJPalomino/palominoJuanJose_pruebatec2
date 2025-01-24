package com.hackaboss.persistencia;

import com.hackaboss.logica.Cita;
import com.hackaboss.logica.Ciudadano;
import com.hackaboss.logica.Tramite;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ControladoraPersistencia {
    
    
    TramiteJpaController tramiteJpa = new TramiteJpaController();
    CiudadanoJpaController ciudadanoJpa = new CiudadanoJpaController();
    CitaJpaController citaJpa = new CitaJpaController();

    public void crearTramite(Tramite tramite) {
        tramiteJpa.create(tramite);      
    }
    
    public void eliminarTramite(Long id) throws Exception{
        tramiteJpa.softDelete(id);
    }

    public List<Tramite> traerTramites() {
        return tramiteJpa.findTramiteEntities();
    }

    public void editarTramite(Tramite tram) {
        try {
            tramiteJpa.edit(tram);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Tramite buscarTramite(Long id) {
        return tramiteJpa.findTramite(id);
    }

    public void crearCiudadano(Ciudadano ciudadano) {
        ciudadanoJpa.create(ciudadano);
    }

    public List<Ciudadano> traerCiudadanos() {
        return ciudadanoJpa.findTramiteEntities();
    }

    public void eliminarCiudadano(Long id) {
        try {
            ciudadanoJpa.softDelete(id);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Ciudadano buscarCiudadano(Long id) {
        return ciudadanoJpa.findCiudadano(id);
    }

    public void editarCiudadano(Ciudadano ciudadano) {
        try {
            ciudadanoJpa.edit(ciudadano);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Ciudadano buscarCiudadanoCURP(String ciudadanoCURP) {
        return ciudadanoJpa.findByCURP(ciudadanoCURP);
    }

    public Tramite buscarTramiteNom(String tramiteNombre) {
        return tramiteJpa.findByNombre(tramiteNombre);
    }
      
    public void crearCita(Cita cita) {
        citaJpa.create(cita);
    }

    public List<Cita> traerCitas() {
        return citaJpa.findCitaEntities();
    }

    public void eliminarCita(Long id) {
        citaJpa.softDelete(id);
    }

    public Cita buscarCita(Long id) {
        return citaJpa.findCita(id);
    }

}
