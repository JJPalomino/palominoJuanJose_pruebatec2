package com.hackaboss.servlets.cita;

import com.hackaboss.logica.Cita;
import com.hackaboss.logica.ControladoraLogica;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "EliminarCitaSv", urlPatterns = {"/EliminarCitaSv"})
public class EliminarCitaSv extends HttpServlet {
    
    ControladoraLogica control = new ControladoraLogica();

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            Long id = Long.parseLong(request.getParameter("id_cita"));
            control.eliminarCita(id);
            List<Cita> listaCitas =control.traerCitas();
            HttpSession miSesion = request.getSession();
            miSesion.setAttribute("listaCitas", listaCitas);
            
            response.sendRedirect("registroCita");
        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al eliminar la cita");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
