
package com.hackaboss.servlets.tramite;

import com.hackaboss.logica.ControladoraLogica;
import com.hackaboss.logica.Tramite;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jdk.random.L128X1024MixRandom;

@WebServlet(name = "CrearTramiteSv", urlPatterns = {"/CrearTramiteSv"})
public class CrearTramiteSv extends HttpServlet {
    
    ControladoraLogica control = new ControladoraLogica();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Tramite> tramites = control.traterTramites();
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("listaTramites", tramites);
        request.getRequestDispatcher("registroTramite.jsp").forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombreTramite");
        String descripcion = request.getParameter("descripcion");
        
        
        control.crearTramite(nombre,descripcion);
        
        response.sendRedirect("index.jsp");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
