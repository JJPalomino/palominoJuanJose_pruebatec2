
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gobierno de Palomino</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ffffff;
        }

        header {  /*Tamaño del recuadro que contiene el mensaje de Gobiernod e Palomino*/
            background-color: #660000;
            color: #ffffff;
            padding: 41px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        header .logo {
            width: 100px;
            height: auto;
            background-color: #cccccc; /* Espacio para el logo */
        }

        header .title {
            font-size: 40px;
            font-weight: bold;
        }
        
        .container {  /*Tamaño del recuadro de contenido*/
            max-width: 1200px;
            margin: 0 auto;
            background-color: white;
            padding: 22px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .content {  /*Espacio entre el recuadro sombreado que contiene al mesnaje de Gestión de citas y el recuadro del gobierno*/
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            margin: 23px;
        }

        .hero {  /*Anchura del recuadro sombreado que contiene al mesnaje de Gestión de citas*/
            background-color: #f2f2f2;
            padding: 23px;
            width: 100%;
            text-align: center;
            border: 1px solid #cccccc;
        }

        .categories {  /*Espacio entre la parte del mesaje de gestion de citas y los botones*/
            margin-top: 23px;
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .category {    /*Tamaño de los botones*/
            background-color: #f2f2f2;
            border: 2px solid #cccccc;
            padding: 15px;
            border-radius: 5px;
            text-align: center;
            flex: 1;
            max-width: 200px;
        }
        
        .category-button {
            display: inline-block;
            margin: 15px;
            padding: 20px 30px;
            font-size: 20px;
            color: #ffffff;
            background-color: #660000;
            border: 1px solid #ccc;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
        }

        .category-button:hover {
            background-color: #450606;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <!-- Espacio para insertar el logo del Gobierno -->
        </div>
        <div class="title">Gobierno de Palomino</div>
    </header>

    
    
    <div class="content">
    <div class="hero">
        <h1>Gestión de citas</h1>
        <p>Seleccione el trámite que desea realizar:</p>
    </div>
    <div class="categories">
        <% 
            String[] categorias = {"Crear Cita", "Gestionar Ciudadanos", "Gestionar Tramites"};
            for (String categoria : categorias) {
        %>
        <form action="CategoriasSv" method="post">
            <input type="hidden" name="categoria" value="<%= categoria %>">
            <button class="category-button" type="submit"><%= categoria %></button>
        </form>
        <% } %>
    </div>
</div>

</body>
</html>
