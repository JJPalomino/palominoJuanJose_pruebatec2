
package com.hackaboss.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CategoriasSv", urlPatterns = {"/CategoriasSv"})
public class CategoriasSv extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String categoria = request.getParameter("categoria");
        switch(categoria){
            case "Crear Cita":
                response.sendRedirect("registroCita.jsp");
                break;
            case "Gestionar Ciudadanos":
                response.sendRedirect("registroCiudadanos.jsp");
                break;
            case "Gestionar Tramites":
                response.sendRedirect("registroTramite.jsp");
                break;   
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
