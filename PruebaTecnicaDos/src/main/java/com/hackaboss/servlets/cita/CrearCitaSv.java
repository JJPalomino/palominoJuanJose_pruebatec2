
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
        String ciudadanoCURP = request.getParameter("ciudadano");
        String tramiteNombre = request.getParameter("tramite");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDate fecha = LocalDate.parse(request.getParameter("fecha"),formatter);
        String hora = request.getParameter("hora");
        if (ciudadanoCURP == null || ciudadanoCURP.isEmpty()
                || tramiteNombre == null || tramiteNombre.isEmpty()
                || hora == null || hora.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Todos los campos son obligatorios");
            return;
        }else{
            Ciudadano ciudadano = control.buscarCiudadanoCURP(ciudadanoCURP);
            Tramite tramite = control.buscarTramiteNom(tramiteNombre);

            Cita cita = new Cita(fecha, hora, tramite, ciudadano);
            control.crearCita(cita);
        
        }
        
        }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
