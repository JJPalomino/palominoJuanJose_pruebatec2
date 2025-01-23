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
---

## Requisitos Técnicos

### Requisitos de software:
- Java 17 o superior
- MySQL o cualquier base de datos compatible con JPA
- Un IDE para desarrollar el código (se recomienda IntelliJ IDEA o Eclipse)

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

## Instalación
1. Clona este repositorio: https://github.com/JJPalomino/palominoJuanJose_pruebatec2.git
2. Navega al directorio del proyecto: palominoJuanJose_pruebatec1
3. Importa el proyecto en tu IDE preferido (IntelliJ IDEA, Eclipse, etc.).
4. Configura la conexión a la base de datos. Asegúrate de que el archivo `persistence.xml` tenga la configuración correcta para la base de datos `turnero`.
5. Crea la base de datos `turnero` usando el archivo SQL proporcionado (ver más abajo).
6. Ejecuta el proyecto y prueba las funcionalidades a través del menú interactivo en consola.

## Configurar la Base de Datos
- Instala y configura MySQL.
- La base de datos está configurada para conectarse por el `puerto 3309`.
- Crea la base de datos empleados utilizando el archivo proporcionado `empleados.sql`.

##Configura la aplicación

- Asegúrate de tener instalado JDK 17 y un IDE como NetBeans o IntelliJ.
- Modifica el archivo `persistence.xml` en la carpeta `META-INF` con tus credenciales de base de datos:
```
<property name="javax.persistence.jdbc.url" value="jdbc:mysql://localhost:3306/empleados" />
<property name="javax.persistence.jdbc.user" value="tuUsuario" />
<property name="javax.persistence.jdbc.password" value="tuContraseña" />
```
 
##Ejecución
- Recuerde agregar las dependencias necesarias para el correcto funcionamiento del servidor.
- Deberá cambiar la versión de maven war a 3.3.2 o superior:
```
<plugin>                                
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-war-plugin</artifactId>
    <version>3.3.2</version>
    <configuration>
        <failOnMissingWebXml>false</failOnMissingWebXml>
    </configuration>
</plugin>
```
- Desplegar la aplicación en el servidor Apache Tomcat.
- - Acceder mediante el navegador a la URL configurada (Ej: `http://localhost:8080/turnero`).

---

## Usuarios de Prueba

### Base de Datos:
- **Usuario:** `root`
- **Contraseña:** `No tiene`

### Sistema (Login):
- **Usuario:** `palomino`
- **Contraseña:** `asdfg`

---

## Supuestos
- Todos los turnos tienen un estado inicial de "En espera" al momento de ser creados.
- Los ciudadanos pueden registrarse si no están registrados en la base de datos.
- Al igual que los ciudadanos, los tramites también pueden ser creados por el usuario.
- Tanto tramite, como ciudadanos son filtrados en base a su estado, si se encuentran activos (true) aparecerán en las listas, si se encuentran inactivas (false) no se mostrarán en las listas.
- El submenú de las citas será capaz de mostrar todas las citas creadas sin importar el estado en el que se encuentren.
- Se implemento borrado lógico para Ciudadanos, Tramites, Usuarios y Citas.
- Es importante aclarar que se considera que, cuando se borre un turno o un ciudadano ya no aparecerán en la lista y no será posible regresarlas a su estado anterior, se considera que, al eliminar un ciudadano se hace referencia a un cambio de domicilio fuera de la jurisdicción de la gobernatura o por fallecimiento, por lo tanto no será posible regresarlas a su estado anterior. Por el contrario, si se elimina un trámite, tampoco podrá regresar a su estado anterior ya que se considera obsoleto o inservible para el contexto actual.

---

## Diagrama de Clases
![Image](https://github.com/user-attachments/assets/5b06464e-6c00-4623-95e1-0fafe0623f69)

---

## Entregables

1. **Repositorio GitHub:**
   - Código fuente con formato de nombre: `palominoJuanJose_pruebatec2`.

2. **Base de Datos:**
   - Nombre: `turnero`.
   - Formato: SQL.
   - Incluye datos de prueba.

3. **Documentación:**
   - **README:**
     - Instrucciones para ejecutar y probar la aplicación.
     - Usuarios y contraseñas (base de datos, servidor, etc.).
     - Supuestos realizados.

## Licencia
Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.
