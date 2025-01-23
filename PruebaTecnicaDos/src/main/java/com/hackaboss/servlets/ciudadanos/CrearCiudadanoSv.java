package com.hackaboss.servlets.ciudadanos;

import com.hackaboss.logica.Ciudadano;
import com.hackaboss.logica.ControladoraLogica;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CrearCiudadanoSv", urlPatterns = {"/CrearCiudadanoSv"})
public class CrearCiudadanoSv extends HttpServlet {
    
    ControladoraLogica control = new ControladoraLogica();


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Ciudadano> ciudadanos = control.traerCiudadanos();
        
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("listaCiudadanos", ciudadanos);
        request.getRequestDispatcher("registroCiudadanos.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String curp = request.getParameter("curp");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        LocalDate fecha = LocalDate.parse(request.getParameter("fecha"));
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        String email = request.getParameter("email");

        control.crearCiudadano(nombre, apellido, curp, fecha, email, telefono, direccion);
        
        response.sendRedirect("index.jsp");
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
