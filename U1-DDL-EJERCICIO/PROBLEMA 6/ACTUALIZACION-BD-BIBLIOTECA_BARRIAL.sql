USE BIBLIOTECA_BARRIAL
GO

/*a) Agregar a la tabla libros, la columna fecha de tipo datetime. */

ALTER TABLE libros
ADD fecha datetime

/*b) Agregar la columna id_país de origen a la tabla escritores de tipo int y que no
acepte nulos */

ALTER TABLE escritores --modificar nombre de tabla
ADD id_pais int NOT NULL

/*c) Agregue la columna año de nacimiento y otra para año de defunción (que
acepte nulos) ambas de tipo int. */

ALTER TABLE escritores
ADD año_nacimiento int NOT NULL,
	año_defucion int NULL

/*d) Cambie el tipo de la columna género por int */

ALTER TABLE libros
ALTER COLUMN genero int

/*e) Cambie el tipo de dato de la columna nombre de escritores por varchar(80) */

ALTER TABLE escritores
ALTER COLUMN nombre varchar(80)

/*f) Agregue la columna precio a la tabla libros del tipo decimal(12,2) */

ALTER TABLE libros
ADD precio decimal(12,2)

/*g) Modifique el tipo de la columna precio por decimal (10,2) */

ALTER TABLE libros
ALTER COLUMN precio decimal(10,2)

/*h) Agregue y elimine la columna cant_pag */

ALTER TABLE libros
ADD cant_pag int

--Elimino campo

ALTER TABLE libros
DROP COLUMN cant_pag

/*i)Agregue y elimine la columna seudónimo */

ALTER TABLE escritores
ADD seudonimo varchar(50)

--Elimino campo

ALTER TABLE escritores
DROP COLUMN seudonimo

/*2. Cree la tabla generos con estos dos campos: id_genero int y genero
varchar(50) (sin clave primaria) */

CREATE TABLE generos(
id_genero int,
genero varchar(50)
)

/*a) Cambie el campo id_genero para que no acepte nulos*/

ALTER TABLE generos
ALTER COLUMN id_genero int NOT NULL

/*b) Agregar la clave primaria */

ALTER TABLE generos
ADD CONSTRAINT pk_generos PRIMARY KEY (id_genero)

/*4. Agregar la clave foránea sobre género en la tabla libros y sobre id_país de la
tabla escritores */

ALTER TABLE libros
ADD CONSTRAINT fk_libros_generos FOREIGN KEY (genero)
REFERENCES generos (id_genero)

--Creo la tabla paises

CREATE TABLE PAISES(
id_pais int identity(1,1),
pais varchar(50)
)

--Agrego la clave primaria

ALTER TABLE paises
ADD CONSTRAINT pk_paises PRIMARY KEY (id_pais)

--Agrego la clave foránea sobre id_pais de la tabla escritores

ALTER TABLE escritores
ADD CONSTRAINT fk_escritores_paises FOREIGN KEY (id_pais)
REFERENCES paises (id_pais)