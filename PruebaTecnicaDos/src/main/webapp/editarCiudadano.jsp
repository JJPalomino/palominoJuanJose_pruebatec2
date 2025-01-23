<%@page import="com.hackaboss.logica.Ciudadano"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edición de Ciudadano</title>
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

            .container {  /*Aumenta o reduce el contenido del recuadro donde va la cita*/
                max-width: 1500px;
                margin: 20px auto;
                background-color: #a6a6a6;
                padding: 22px;
                border-radius: 10px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }

            .header {  /*Tamaño del recuadro que contiene el mensaje de Gobiernod e Palomino*/
                background-color: #800000;
                color: #ffffff;
                padding: 41px 20px;
                width: 100%;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                margin-bottom: 20px; /* Espacio entre la franja roja y el recuadro gris */
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
                margin-bottom: 20px;
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
                gap: 10px;
            }

            button {   /*Estilo del boton*/
                background-color: #800000;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                width: 100%;
            }

            button:hover {   /*Estilo de boton*/
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
                position: absolute; /* Posición fija relativa a la barra */
                top: 10px; /* Ajusta según el espacio que desees */
                left: 10px; /* Ajusta según el espacio que desees */
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
        <div class="header">
            <div class="header-content">
                <a href="index.jsp" class="back-button">Inicio</a>
                <span class="header-text">Gobierno de Palomino</span>
            </div>
        </div>
        
        <div class="container">
            <div class="section active">
                <h2>Editar Ciudadano</h2>
                <br>
                <form action="CrearCiudadanoSv" method="POST">
                    <%Ciudadano ciudadano = (Ciudadano) request.getSession().getAttribute("editar_ciudadano"); %>
                        <div class="grid">
                        <div class="form-group">
                            <label for="nombre">Nombre:</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese Nombre" value="<%=ciudadano.getNombre()%>">
                        </div>
                        <div class="form-group">
                            <label for="apellido">Apellido:</label>
                            <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Apellido" value="<%=ciudadano.getApellido()%>">
                        </div>
                    </div>
                    <br>
                    <div class="grid">
                        <div class="form-group">
                            <label for="curp">CURP</label>
                            <input type="text" class="form-control" id="curp" name="curp" placeholder="CURP" value="No se puede modificar">
                        </div>
                        <div class="form-group">
                            <label for="fecha">Fecha de nacimiento:</label>
                            <input type="date" class="form-control" id="fecha" name="fecha" value="<%=ciudadano.getFechaNocimiento()%>">
                        </div>
                    </div>
                    <br>    
                    <div class="grid">
                        <div class="form-group">
                            <label for="email">Correo Electrónico:</label>
                            <input type="text" class="form-control" id="email" name="email" placeholder="Correo electrónico" value="<%=ciudadano.getEmail()%>">
                        </div>
                        <div class="form-group">
                            <label for="telefono">Teléfono:</label>
                            <input type="text" class="form-control"  id="telefono" name="telefono" placeholder="Teléfono" value="<%=ciudadano.getTelefono()%>">
                        </div>
                    </div>
                    <br>    
                    <div class="grid">
                        <div class="form-group">
                            <label for="direccion">Dirección</label>
                            <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Dirección" value="<%=ciudadano.getDireccion()%>">
                        </div>
                    </div>
                    <button type="submit">Guardar</button>    
                </form>  
        </div>
              
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    </body>
</html>
