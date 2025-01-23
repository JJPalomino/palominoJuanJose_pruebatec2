
package com.hackaboss.servlets.cita;

import com.hackaboss.logica.Cita;
import com.hackaboss.logica.Ciudadano;
import com.hackaboss.logica.ControladoraLogica;
import com.hackaboss.logica.Tramite;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.eclipse.persistence.jpa.jpql.parser.DateTime;

@WebServlet(name = "CrearCitaSv", urlPatterns = {"/CrearCitaSv"})
public class CrearCitaSv extends HttpServlet {
    
    ControladoraLogica control = new ControladoraLogica();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Ciudadano> listaCiudadanos = control.traerCiudadanos();
        if (listaCiudadanos == null) {
            listaCiudadanos = new ArrayList<>(); 
        }
        
        List<Tramite> listaTramites = control.traterTramites();
        if (listaTramites == null) {
            listaTramites = new ArrayList<>(); // Evita que sea null para no generar excepciones
        }
 
        request.setAttribute("listaCiudadanos", listaCiudadanos);
        request.setAttribute("listaTramites", listaTramites);
        
        request.getRequestDispatcher("registroCita.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
        // Capturar parámetros del formulario
        String ciudadanoCURP = request.getParameter("ciudadano");
        String tramiteNombre = request.getParameter("tramite");
        String fechaTexto = request.getParameter("fecha");
        String hora = request.getParameter("hora");

        // Validaciones básicas
        if (ciudadanoCURP == null || ciudadanoCURP.isEmpty() ||
            tramiteNombre == null || tramiteNombre.isEmpty() ||
            fechaTexto == null || fechaTexto.isEmpty() ||
            hora == null || hora.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Todos los campos son obligatorios");
            return;
        }

        // Parseo de la fecha
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate fecha = LocalDate.parse(fechaTexto, formatter);

        // Búsqueda de entidades
        Ciudadano ciudadano = control.buscarCiudadanoCURP(ciudadanoCURP);
        Tramite tramite = control.buscarTramiteNom(tramiteNombre);

        if (ciudadano == null || tramite == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Ciudadano o trámite no válido");
            return;
        }

        // Crear cita
        Cita cita = new Cita(fecha, hora, tramite, ciudadano);
        control.crearCita(cita);

        // Respuesta exitosa
        response.setStatus(HttpServletResponse.SC_OK);
        response.getWriter().println("Cita creada con éxito");

    } catch (Exception e) {
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al procesar la solicitud");
        e.printStackTrace();
    }
        
        }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
