
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

        header { 
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
            background-color: #cccccc;
        }

        header .title {
            font-size: 40px;
            font-weight: bold;
        }
        
        .container {  
            max-width: 1200px;
            margin: 0 auto;
            background-color: white;
            padding: 22px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .hero {  
            background-color: #f2f2f2;
            padding: 23px;
            width: 100%;
            text-align: center;
            border: 1px solid #cccccc;
        }

        .categories { 
            margin-top: 23px;
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .category {   
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
        
        .content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 23px;
        }

        .side-image {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .side-image img {
            max-width: 200%;
            max-height: 800px;
        }

        .main-content {
            flex: 2;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 0 20px;
        }
    </style>
</head>
<body>
    <header>
        <div class="title">Gobierno de Palomino</div>
    </header>
    <div class="content">
    <div class="side-image">
        <img src="Imagenes/flores.jpg" alt="Flor" onerror="console.log('Error loading image: /PruebaTecnicaDos/Web Pages/Imagenes/flor.jpg')">
    </div>

    <div class="main-content">
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
                <input type="hidden" name="categoria" value="<%= categoria%>">
                <button class="category-button" type="submit"><%= categoria%></button>
            </form>
            <% }%>
        </div>
    </div>
    <div class="side-image">
        <img src="Imagenes/flores.jpg" alt="Flor" onerror="console.log('Error loading image: /PruebaTecnicaDos/Web Pages/Imagenes/flor.jpg')">
    </div>
</div>
</body>
</html>
