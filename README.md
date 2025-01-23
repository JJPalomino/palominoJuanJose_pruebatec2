# Turnero: Aplicación de Gestión de Turnos/Citas

## Descripción del Proyecto

Esta aplicación web fue desarrollada para una entidad gubernamental con el objetivo de gestionar turnos y citas para trámites de ciudadanos. La aplicación permite a los usuarios registrar, visualizar y filtrar turnos según su estado ("En espera" o "Ya atendido") y realizar operaciones CRUD sobre los datos.

El proyecto utiliza tecnologías Java, JPA y JSP para el desarrollo del backend y frontend respectivamente, cumpliendo con las mejores prácticas de programación orientada a objetos y programación funcional.

---

## Funcionalidades

### Gestión de Turnos:
1. **Agregar un nuevo turno/cita:**
   - Registrar información de un turno, incluyendo:
     - Número.
     - Fecha.
     - Descripción del trámite.
     - Ciudadano asignado.
   - Cada turno es exclusivo de un ciudadano, aunque un ciudadano puede tener múltiples turnos para diferentes trámites.

2. **Listar turnos:**
   - Mostrar una lista de todos los turnos asignados junto con los ciudadanos relacionados.
   - Permite filtrar por fecha.

3. **Filtrar turnos:**
   - Visualizar únicamente turnos "En espera" o "Ya atendidos".

### Seguridad:
- **Login:**
  - Implementación de un sistema de autenticación.
  - Restringe el acceso a las páginas JSP a usuarios no autenticados.

---

## Requisitos Técnicos

### Backend:
- **Java + Servlets:** Desarrollo de la lógica del negocio.
- **JPA:** Manejo de la persistencia de datos y conexión con la base de datos.
- **Colecciones y programación funcional:**
  - Gestión de datos en memoria antes de interactuar con la base de datos.
  - Uso de funciones lambda y streams.

### Frontend:
- **JSP:** Tecnología para la interacción con el usuario.
- **HTML, CSS y JavaScript Vanilla:**
  - Plantillas con diseño responsivo (se sugiere Bootstrap).

---

## Entregables

1. **Repositorio GitHub:**
   - Código fuente con formato de nombre: `apellido+nombre_pruebatec2` (Ej: `dePaulaLuisina_pruebatec2`).

2. **Base de Datos:**
   - Nombre: `turnero`.
   - Formato: SQL.
   - Incluye datos de prueba.

3. **Documentación:**
   - **README:**
     - Instrucciones para ejecutar y probar la aplicación.
     - Usuarios y contraseñas (base de datos, servidor, etc.).
     - Supuestos realizados.
   - **Diagrama de Clases UML:** Relación entre clases existentes, adjunto como imagen.

---

## Instrucciones de Ejecución

1. **Requisitos Previos:**
   - JDK 17 instalado.
   - NetBeans IDE 17 (o cualquier IDE compatible con Java).
   - Servidor Apache Tomcat configurado.
   - Motor de base de datos compatible con SQL (MySQL recomendado).

2. **Configuración de la Base de Datos:**
   - Crear una base de datos llamada `turnero`.
   - Importar el archivo `turnero.sql` incluido en el repositorio.

3. **Configuración del Proyecto:**
   - Clonar el repositorio desde GitHub.
   - Abrir el proyecto en NetBeans.
   - Configurar la conexión a la base de datos en el archivo `persistence.xml`.

4. **Ejecución:**
   - Desplegar la aplicación en el servidor Apache Tomcat.
   - Acceder mediante el navegador a la URL configurada (Ej: `http://localhost:8080/turnero`).

---

## Usuarios de Prueba

### Base de Datos:
- **Usuario:** `root`
- **Contraseña:** `password`

### Sistema (Login):
- **Usuario:** `admin`
- **Contraseña:** `admin123`

---

## Supuestos

- Todos los turnos tienen un estado inicial de "En espera" al momento de ser creados.
- Los ciudadanos están previamente registrados en la base de datos y son seleccionados al asignar un turno.

---

## Diagrama de Clases
El diagrama de clases está incluido como archivo adjunto en el directorio `/docs` del repositorio.
