
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Gestión de Turnos</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
        body {
            background-color: #f5f5f5;
            padding: 20px;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .header {
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid #eee;
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
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        button:hover {
            background-color: #0056b3;
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
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Sistema de Gestión de Turnos</h1>
        </div>

        <div class="tabs">
            <button class="tab-button active" onclick="showSection('citas')">Gestión de Citas</button>
            <button class="tab-button" onclick="showSection('ciudadanos')">Ciudadanos</button>
            <button class="tab-button" onclick="showSection('tramites')">Trámites</button>
        </div>

        <!-- Sección de Citas -->
        <div id="citas" class="section active">
            <h2>Nueva Cita</h2>
            <form>
                <div class="grid">
                    <div class="form-group">
                        <label for="ciudadano">Ciudadano:</label>
                        <input type="text" id="ciudadano" placeholder="Nombre del ciudadano">
                    </div>
                    <div class="form-group">
                        <label for="tramite">Trámite:</label>
                        <select id="tramite">
                            <option value="">Seleccione un trámite</option>
                            <option value="1">Renovación DNI</option>
                            <option value="2">Pasaporte</option>
                            <option value="3">Certificado</option>
                        </select>
                    </div>
                </div>
                <div class="grid">
                    <div class="form-group">
                        <label for="fecha">Fecha:</label>
                        <input type="date" id="fecha">
                    </div>
                    <div class="form-group">
                        <label for="hora">Hora:</label>
                        <input type="time" id="hora">
                    </div>
                </div>
                <button type="submit">Crear Cita</button>
            </form>

            <h2 style="margin-top: 30px;">Citas Programadas</h2>
            <table>
                <thead>
                    <tr>
                        <th>Fecha</th>
                        <th>Hora</th>
                        <th>Ciudadano</th>
                        <th>Trámite</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>2025-01-21</td>
                        <td>10:00</td>
                        <td>Juan Pérez</td>
                        <td>Renovación DNI</td>
                        <td>En espera</td>
                        <td><button style="width: auto; padding: 5px 10px;">Editar</button></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Sección de Ciudadanos -->
        <div id="ciudadanos" class="section">
            <h2>Registro de Ciudadano</h2>
            <form>
                <div class="grid">
                    <div class="form-group">
                        <label for="dni">DNI:</label>
                        <input type="text" id="dni" placeholder="Ingrese DNI">
                    </div>
                    <div class="form-group">
                        <label for="nombre">Nombre completo:</label>
                        <input type="text" id="nombre" placeholder="Nombre y apellidos">
                    </div>
                </div>
                <div class="grid">
                    <div class="form-group">
                        <label for="telefono">Teléfono:</label>
                        <input type="tel" id="telefono" placeholder="Número de teléfono">
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" id="email" placeholder="Correo electrónico">
                    </div>
                </div>
                <button type="submit">Registrar Ciudadano</button>
            </form>
        </div>

        <!-- Sección de Trámites -->
        <div id="tramites" class="section">
            <h2>Registro de Trámite</h2>
            <form>
                <div class="form-group">
                    <label for="nombreTramite">Nombre del trámite:</label>
                    <input type="text" id="nombreTramite" placeholder="Nombre del trámite">
                </div>
                <div class="form-group">
                    <label for="descripcion">Descripción:</label>
                    <input type="text" id="descripcion" placeholder="Descripción del trámite">
                </div>
                <div class="form-group">
                    <label for="duracion">Duración estimada (minutos):</label>
                    <input type="number" id="duracion" placeholder="Duración">
                </div>
                <button type="submit">Registrar Trámite</button>
            </form>
        </div>
    </div>

    <script>
        function showSection(sectionId) {
            // Ocultar todas las secciones
            document.querySelectorAll('.section').forEach(section => {
                section.classList.remove('active');
            });
            // Mostrar la sección seleccionada
            document.getElementById(sectionId).classList.add('active');
            
            // Actualizar botones
            document.querySelectorAll('.tab-button').forEach(button => {
                button.classList.remove('active');
            });
            event.target.classList.add('active');
        }
    </script>
</body>
</html>
