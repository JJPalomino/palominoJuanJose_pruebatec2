
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
import javax.servlet.http.HttpSession;
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
        List<Cita> citas = control.traerCitas();
        
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("listaCitas", citas);
        request.getRequestDispatcher("registroCita.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String CURP = request.getParameter("ciudadano");
        String nombreTramite = request.getParameter("tramite");
        LocalDate fecha = LocalDate.parse(request.getParameter("fecha"));
        String hora = request.getParameter("hora");
        String descripcion = request.getParameter("descripcion");
        boolean estado = Boolean.parseBoolean(request.getParameter("estado"));

        try {

            control.crearCita(CURP, nombreTramite, fecha, hora, descripcion, estado);

            response.sendRedirect("index.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "No se pudo registrar la cita");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
