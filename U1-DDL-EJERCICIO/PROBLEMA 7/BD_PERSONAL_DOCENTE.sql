
/* Problema 7:
Se tiene una lista de especificaciones a realizar para la creación de una nueva
base de datos llamada “PERSONAL_DOCENTE” */

/*1. Crear la base de datos “PERSONAL_DOCENTE” y abrirla para su uso. */
CREATE DATABASE PERSONAL_DOCENTE
GO
USE PERSONAL_DOCENTE
GO

/*2. Crear la tabla docentes sin claves (legajo_docente de tipo int, nombre,
apellido, e_mail)*/

CREATE TABLE DOCENTES(
legajo_docente int,
nombre varchar(50),
apellido varchar(50),
e_mail varchar(100)
)

/*3. Cambie el campo legajo_docente para que no acepte nulos*/

ALTER TABLE docentes
ALTER COLUMN legajo_docente int NOT NULL

/*4. Agregar la clave primaria a la tabla docentes*/

ALTER TABLE docentes
ADD CONSTRAINT pk_docentes PRIMARY KEY (legajo_docente)

/*5. Crear la tabla Titulos con los siguientes campos: id_titulo, descripcion. 
Cree la tabla sin PK*/

CREATE TABLE TITULOS(
id_titulo int,
descripcion varchar(50)
)

/*6. Cambie el campo id_titulo para que no acepte nulos*/

ALTER TABLE titulos
ALTER COLUMN id_titulo int NOT NULL

/*7. Agregar la clave primaria sobre el campo id_titulo*/

ALTER TABLE titulos
ADD CONSTRAINT pk_titulos PRIMARY KEY (id_titulo)

/*8. Agregar el campo id_titulo a la tabla docentes*/

ALTER TABLE docentes
ADD id_titulo int

/*9. Modifique el campo id_titulo de la tabla docente para que sea int*/

ALTER TABLE docentes
ALTER COLUMN id_titulo int

/*10. Agregar la clave foránea sobre id_titulo en la tabla docentes. ¿Se podría haber
creado la clave foránea antes de crear la tabla títulos? ¿Por qué?*/

ALTER TABLE docentes
ADD CONSTRAINT fk_docentes_titulos FOREIGN KEY (id_titulo)
REFERENCES titulos (id_titulo)

/*11. Cree en SQL Server el diagrama de la base de datos para observar su
estructura*/



/*12. Elimine la clave foránea sobre id_titulo de la tabla docentes. */

ALTER TABLE docentes
DROP CONSTRAINT fk_docentes_titulos

/*13. Elimine la clave primaria de la tabla título. ¿Podría haber eliminado esta clave
primaria antes de realizar el punto 14? ¿Por qué?*/

ALTER TABLE titulos
DROP CONSTRAINT pk_titulos

/*14. Eliminar una tabla creada por Ud. ¿Puede eliminar la tabla Escritores antes de
Libros? ¿Por qué?*/

USE BIBLIOTECA_BARRIAL
GO

DROP TABLE ESCRITORES --No se puede eliminar debido a la restricción de FOREIGN KEY existente.







