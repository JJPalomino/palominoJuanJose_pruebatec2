<%@page import="com.hackaboss.logica.Tramite"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Creación de Tramites</title>
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
                max-width: 1100px;
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
                max-width: 1100px;
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
                border-radius: 3px;
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
                grid-template-columns: repeat(3, 1fr);
                gap: 10px;
            }

            button {  
                background-color: #800000;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                width: 100%;
                margin: 0 auto;
                display: block;
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
                padding: 10px;
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
        <div class="header">
            <div class="header-content">
                <a href="index.jsp" class="back-button">Inicio</a>
                <span class="header-text">Gobierno de Palomino</span>
            </div>
        </div>
        
        <div class="container">
            <div class="section active">
                <h2>Registro de Trámite</h2>
                <br>
                <form action="CrearTramiteSv" method="POST">
                    <div class="form-group">
                        <label for="nombreTramite">Nombre del trámite:</label>
                        <input type="text" class="form-control" id="nombreTramite" name="nombreTramite" placeholder="Nombre del trámite">
                    </div>
                    <div class="form-group">
                        <label for="descripcion">Descripción:</label>
                        <input type="text" class="form-control" id="descripcion" name="descripcion" placeholder="Descripción del trámite">
                    </div>
                    <button type="submit">Registrar Trámite</button>
                </form>  
            </div>           
        </div>
        
        <div class="container">
            <div class="section active">
                <h2>Lista de Tramites</h2>
                <br>
                <form action="CrearTramiteSv" method="GET">
                    <button type="submit" class="btn btn-primary">Mostrar</button>
                    <div class="results-table mt-4">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Nombre del tramite</th>
                                    <th>Descripción</th>
                                    <th>Acción</th>
                                </tr>    
                            </thead>
                            <tbody>
                                <%
                                List<Tramite> listaTramites = (List) request.getSession().getAttribute("listaTramites");
                                if (listaTramites != null) {

                                for (Tramite tra:listaTramites) {%>
                                    <tr>
                                        <td><%=tra.getNombreTramite()%> </td>
                                        <td><%=tra.getDescripcion()%> </td>
                                        <td  style="display: flex; width: 230px;"> 
                                            
                                            <form name="eliminar" action="EliminarTramiteSv" method="POST"> 
                                                <button type="submit" class="btn btn-primary btn-user btn-block" style="background-color:red; margin-right: 5px; "> 
                                                    <i class="fas fa-trash-alt"></i>Eliminar</button>
                                                <input type="hidden" name="id_tramite" value="<%=tra.getId()%>"> 
                                            </form>

                                            <form name="editar" action="EditarTramiteSv" method="GET"> 
                                                <button type="submit" class="btn btn-primary btn-user btn-block"; style="margin-left: 5px;"> 
                                                    <i class="fas fa-pencil-alt"></i>Editar
                                                </button>
                                                <input type="hidden" name="id_tramite" value="<%=tra.getId()%>">
                                            </form> 

                                        </td>
                                    </tr>      
                                    <%
                                        }%>
                                </tbody>  
                                <%}%>
                        </table>
                    </div>  
                </form>
                     
            </div>
        </div>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </body>
</html>
