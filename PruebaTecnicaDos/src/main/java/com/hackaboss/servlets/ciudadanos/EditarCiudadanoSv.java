
package com.hackaboss.servlets.ciudadanos;

import com.hackaboss.logica.Ciudadano;
import com.hackaboss.logica.ControladoraLogica;
import static java.awt.SystemColor.control;
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

@WebServlet(name = "EditarCiudadanoSv", urlPatterns = {"/EditarCiudadanoSv"})
public class EditarCiudadanoSv extends HttpServlet {
    
    ControladoraLogica control = new ControladoraLogica();

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id_ciudadano"));
        Ciudadano ciudadano = control.buscarCiudadano(id);
        
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("editar_ciudadano", ciudadano);
        
        response.sendRedirect("editarCiudadano.jsp");
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
        
        Ciudadano ciudadano = (Ciudadano) request.getSession().getAttribute("editar_ciudadano");
        
        ciudadano.setNombre(nombre);
        ciudadano.setCURP(curp);
        ciudadano.setApellido(apellido);
        ciudadano.setFechaNocimiento(fecha);
        ciudadano.setDireccion(direccion);
        ciudadano.setTelefono(telefono);
        ciudadano.setEmail(email);
        
        control.editarCiudadano(ciudadano);
        
        List<Ciudadano> listaCiudadanos = control.traerCiudadanos();
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("listaCiudadanos", listaCiudadanos);
        
        request.getRequestDispatcher("registroCiudadanos.jsp");
                
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
