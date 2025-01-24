package com.hackaboss.servlets.ciudadanos;

import com.hackaboss.logica.Ciudadano;
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

@WebServlet(name = "EliminarCiudadanoSv", urlPatterns = {"/EliminarCiudadanoSv"})
public class EliminarCiudadanoSv extends HttpServlet {
    
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
        
        try{
            Long id = Long.parseLong(request.getParameter("id_ciudadano"));
            control.eliminarCiudadano(id);
            List<Ciudadano> listaCiudadanos = control.traerCiudadanos();
            HttpSession miSesion = request.getSession();
            miSesion.setAttribute("listaCiudadanos", listaCiudadanos);
            
            response.sendRedirect("registroCiudadanos.jsp");
        } catch(Exception ex){
            ex.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al eliminar el ciudadano.");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
