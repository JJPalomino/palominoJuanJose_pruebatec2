
<%@page import="com.hackaboss.logica.Cita"%>
<%@page import="com.hackaboss.logica.Tramite"%>
<%@page import="com.hackaboss.logica.Ciudadano"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edición de Citas</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: Arial, sans-serif;
            }

            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #ffffff;
            }

            .container { 
                max-width: 1200px;
                margin: 20px auto;
                background-color: #a6a6a6;
                padding: 22px;
                border-radius: 10px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }

            .header {  
                background-color: #800000;
                color: #ffffff;
                padding: 41px 20px;
                width: 100%;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                margin-bottom: 20px; 
            }

            .header-content {
                max-width: 1200px;
                margin: 0 auto;
                display: flex;
                justify-content: flex-end;
                align-items: center;
            }

            .header-text {
                font-size: 24px;
                font-weight: bold;
                color: #ffffff;
            }

            .tabs {
                display: flex;
                gap: 10px;
                margin-bottom: 20px;
            }

            .tab-button {
                padding: 10px 20px;
                border: none;
                background-color: #e0e0e0;
                cursor: pointer;
                border-radius: 4px;
            }

            .tab-button.active {
                background-color: #007bff;
                color: white;
            }

            .form-group {
                margin-bottom: 15px;
            }

            label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }

            input, select {
                width: 100%;
                padding: 8px;
                border: 1px solid #ddd;
                border-radius: 4px;
                margin-bottom: 10px;
            }

            .grid {
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                gap: 20px;
            }

            button {   
                background-color: #800000;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                width: 100%;
            }

            button:hover {   
                background-color: #600000;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th, td {
                padding: 12px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #f8f9fa;
            }

            .section {
                display: none;
                margin-top: 20px;
            }

            .section.active {
                display: block;
            }

            .back-button {
                position: absolute; 
                top: 10px; 
                left: 10px; 
                background-color: #ffffff;
                color: #800000;
                padding: 10px 15px;
                text-decoration: none;
                border: 2px solid #800000;
                border-radius: 5px;
                font-weight: bold;
                transition: background-color 0.3s, color 0.3s;
            }

            .back-button:hover {
                background-color: #800000;
                color: #ffffff;
            }

        </style>
    </head>
    <body>
        <body>
        <div class="header">
            <div class="header-content">
                <a href="index.jsp" class="back-button">Inicio</a>
                <span class="header-text">Gobierno de Palomino</span>
            </div>
        </div>

        <div class="container">
            <div class="section active">
                <h2>Editar Cita</h2>
                <br>
                <form action="CrearCitaSv" method="POST">
                    <%Cita cita = (Cita) request.getSession().getAttribute("editar_cita"); %>
                    <div class="grid">
                        <div class="form-group">
                            <label for="ciudadano">Ciudadano:</label>
                            <select id="ciudadano">
                                <%
                                    List<Ciudadano> listaCiudadanos = (List<Ciudadano>) request.getAttribute("listaCiudadanos");
                                    if (listaCiudadanos != null && !listaCiudadanos.isEmpty()) {
                                        for (Ciudadano ciudadano : listaCiudadanos) {
                                %>
                                <option value="<%= ciudadano.getCURP()%>"><%= ciudadano.getNombre()%></option>
                                <%
                                    }
                                } else {
                                %>
                                <option value="">No hay ciudadanos disponibles</option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="tramite">Trámite:</label>
                            <select id="tramite">
                                <%
                                    List<Tramite> listaTramites = (List<Tramite>) request.getAttribute("listaTramites");
                                    if (listaTramites != null && !listaTramites.isEmpty()) {
                                        for (Tramite tramite : listaTramites) {
                                %>
                                <option value="<%= tramite.getNombreTramite()%>"><%=tramite.getDescripcion() %></option>
                                <%
                                    }
                                } else {
                                %>
                                <option value="">No hay trámites disponibles</option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="grid">
                        <div class="form-group">
                            <label for="fecha">Fecha:</label>
                            <input type="date" id="fecha" name="fecha" value="<%=cita.getFecha()%> required>
                        </div>
                        <div class="form-group">
                            <label for="hora">Hora:</label>
                            <select id="hora" value="<%=cita.getHora()%>>
                                <option value=" ">Seleccione la hora</option>
                                <option value="09">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                            </select>
                        </div>
                        
                    </div>
                    <div class="grid">
                        <div class="form-group">
                            <label for="descripcion">Descripción:</label>
                            <input type="text" id="descripcion" name="descripcion" value="<%=cita.getDescripcion()%> required>
                        </div>
                        <div class="form-group">
                            <label for="estado">Estado:</label>
                            <select id="estado" name="estado" value="<%=cita.getEstado()%> required>
                                <option value="true">Activa</option>
                                <option value="false">Inactiva</option>
                            </select>
                        </div>
                    </div>
                   <button type="submit">Registrar Ciudadano</button> 
                </form>
            </div>
        </div>
    </body>
</html>
