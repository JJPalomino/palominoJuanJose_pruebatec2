package com.hackaboss.servlets.tramite;

import com.hackaboss.logica.ControladoraLogica;
import com.hackaboss.logica.Tramite;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "EliminarTramiteSv", urlPatterns = {"/EliminarTramiteSv"})
public class EliminarTramiteSv extends HttpServlet {
    
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
        Long id = Long.parseLong(request.getParameter("id_tramite"));
        try {
            control.eliminarTramite(id);
            List<Tramite> listaTramites = control.traterTramites();
            HttpSession miSesion = request.getSession();
            miSesion.setAttribute("listaTramites", listaTramites);
            
            response.sendRedirect("registroTramite.jsp");
            
            
        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al eliminar el trámite.");
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
