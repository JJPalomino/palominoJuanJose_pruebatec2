
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

@WebServlet(name = "EditarTramiteSv", urlPatterns = {"/EditarTramiteSv"})
public class EditarTramiteSv extends HttpServlet {
    
    ControladoraLogica control = new ControladoraLogica();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id_tramite"));
        Tramite tram = control.buscarTramite(id);
        
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("editar_tramite", tram);
        
        response.sendRedirect("editarTramite.jsp");
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombreTramite");
        String descripción = request.getParameter("descripcion");
        
        Tramite tram = (Tramite) request.getSession().getAttribute("editar_tramite");
        
        tram.setNombreTramite(nombre);
        tram.setDescripcion(descripción);
        
        control.editarTramite(tram);
        
        List<Tramite> listaTramites = control.traterTramites();
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("listaTramites", listaTramites);
        
        
        request.getRequestDispatcher("registroTramite.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
