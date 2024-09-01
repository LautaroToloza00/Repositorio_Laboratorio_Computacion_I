CREATE DATABASE PAGOS_CUOTAS
GO
USE PAGOS_CUOTAS
GO

CREATE TABLE DOCENTES(
id_docente int identity(1,1),
nombre varchar(50) NOT NULL,
apellido varchar(50) NOT NULL
CONSTRAINT pk_docentes PRIMARY KEY (id_docente)
)

CREATE TABLE CURSOS(
cod_curso int identity(1,1),
descripcion varchar(50) NOT NULL,
nivel varchar(10) NOT NULL,
id_docente int,
horario varchar(10)
CONSTRAINT pk_cursos PRIMARY KEY (cod_curso),
CONSTRAINT fk_cursos_docentes FOREIGN KEY (id_docente)
REFERENCES docentes (id_docente)
)

CREATE TABLE PROVINCIAS(
id_provincia int identity(1,1),
nom_provincia varchar(50) NOT NULL
CONSTRAINT pk_provincias PRIMARY KEY (id_provincia)
)

CREATE TABLE LOCALIDADES(
id_localidad int identity(1,1),
nom_localidad varchar(50) NOT NULL,
id_provincia int
CONSTRAINT pk_localidades PRIMARY KEY (id_localidad),
CONSTRAINT fk_localidades_provincias FOREIGN KEY (id_provincia)
REFERENCES provincias (id_provincia)
)

CREATE TABLE BARRIOS(
id_barrio int identity(1,1),
nom_barrio varchar(50) NOT NULL,
id_localidad int
CONSTRAINT pk_barrios PRIMARY KEY (id_barrio),
CONSTRAINT fk_barrios_localidades FOREIGN KEY (id_localidad)
REFERENCES localidades (id_localidad)
)

CREATE TABLE ALUMNOS(
legajo int identity(1,1),
nombre varchar(50) NOT NULL,
apellido varchar(50) NOT NULL,
id_barrio int,
calle varchar(50),
nro_calle int,
telefono int,
email varchar(100)
CONSTRAINT pk_alumnos PRIMARY KEY (legajo),
CONSTRAINT fk_alumnos_barrios FOREIGN KEY (id_barrio)
REFERENCES barrios (id_barrio)
)

CREATE TABLE PAGOS(
legajo int,
cod_curso int,
mes_año varchar(20),
fecha date,
monto decimal(12,2)
CONSTRAINT pk_pagos PRIMARY KEY (legajo,cod_curso,mes_año),
CONSTRAINT fk_pagos_alumnos FOREIGN KEY (legajo)
REFERENCES alumnos (legajo),
CONSTRAINT fk_pagos_cursos FOREIGN KEY (cod_curso)
REFERENCES cursos (cod_curso)
)