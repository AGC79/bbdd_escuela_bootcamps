# The Bridge School Database

Este repositorio contiene la estructura y carga de datos de la base de datos diseñada para gestionar la información académica de los bootcamps de The Bridge.  
La base de datos está implementada en PostgreSQL e incluye entidades como alumnos, profesores, proyectos y las calificaciones obtenidas.

---

## Estructura de la Base de Datos

La base de datos está compuesta por las siguientes tablas principales:

### 1. **Bootcamp**
Contiene los tipos de bootcamp impartidos:
- Data Science (DS)
- Full Stack (FS)

### 2. **Campus**
Lista de campus disponibles:
- Madrid
- Valencia
- Bilbao
- Vitoria
- Sevilla

### 3. **Promocion**
Meses de inicio de las promociones:
- Febrero  
- Marzo  
- Abril  
- Junio  
- Septiembre  
- Octubre  

### 4. **Alumno**
Contiene la información de cada alumno e incluye las siguientes claves foráneas:
- `id_bootcamp`
- `id_promocion`
- `id_campus`

Los datos fueron insertados automáticamente a partir de varios DataFrames.

### 5. **Profesor**
Incluye todos los profesores del programa con:
- Rol (LI o TA)
- Modalidad (Presencial u Online)
- Bootcamp asignado
- Campus y promoción asignados

### 6. **Proyectos**
Dependiendo del bootcamp, cada alumno tiene asociados distintos proyectos:

**Data Science**
- Proyecto_HLF  
- Proyecto_EDA  
- Proyecto_BBDD  
- Proyecto_ML  
- Proyecto_Deployment  

**Full Stack**
- Proyecto_WebDev  
- Proyecto_FrontEnd  
- Proyecto_Backend  
- Proyecto_React  
- Proyecto_FullStack  

### 7. **Proyectos_realizados**
Registra qué proyecto hizo cada alumno y su calificación.
Cada alumno recibe tantos proyectos como correspondan a su bootcamp, y cada registro contiene su calificación (“Apto” o “No Apto”).

## Objetivo

La base de datos permite:

- Relacionar alumnos con campus, bootcamp y promoción.
- Consultar quién imparte cada bootcamp y modalidad.
- Ver los proyectos realizados por cada alumno.
- Analizar calificaciones globales por promoción, campus o bootcamp.

## Estado del Proyecto

- El esquema relacional está completo y funcional.
- Los datos fueron limpiados, transformados e insertados correctamente en PostgreSQL.
- El sistema está listo para usarse en análisis, dashboards o APIs asociadas.

## Tecnologías Utilizadas

- PostgreSQL  
- Python  
- pandas  
- SQLAlchemy  
- Render (hosting de la base de datos)
