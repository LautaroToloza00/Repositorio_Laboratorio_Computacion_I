CREATE DATABASE FARMACIA
GO
USE FARMACIA
GO


CREATE TABLE CIUDADES(
id_ciudad int identity(1,1),
ciudad varchar(50) NOT NULL
CONSTRAINT pk_ciudades PRIMARY KEY (id_ciudad)
)

CREATE TABLE BARRIOS(
id_barrio int identity(1,1),
barrio varchar(50) NOT NULL,
id_localidad int
CONSTRAINT pk_barrios PRIMARY KEY (id_barrio),
CONSTRAINT fk_barrios_ciudades FOREIGN KEY (id_localidad)
REFERENCES ciudades (id_ciudad)
)

CREATE TABLE LABORATORIOS(
cod_laborat int identity(1,1),
nombre_lab varchar(50) NOT NULL,
direccion varchar(100) NOT NULL,
id_barrio int,
telefono int,
email varchar(100)
CONSTRAINT pk_laboratorios PRIMARY KEY (cod_laborat),
CONSTRAINT fk_laboratorios_barrios FOREIGN KEY (id_barrio)
REFERENCES barrios (id_barrio)
)

CREATE TABLE PRESENTACIONES(
id_present int IDENTITY(1,1),
tipo_present varchar(50) NOT NULL
CONSTRAINT pk_presentaciones PRIMARY KEY (id_present)
)

CREATE TABLE MEDICAMENTOS(
cod_med int identity(1,1),
nombre_med varchar(50) NOT NULL,
cod_laborat int,
id_present int,
precio decimal(12,2) NOT NULL,
contenido varchar(50)
CONSTRAINT pk_medicamentos PRIMARY KEY (cod_med),
CONSTRAINT fk_medicamentos_laboratorios FOREIGN KEY (cod_laborat)
REFERENCES laboratorios (cod_laborat),
CONSTRAINT fk_medicamentos_presentaciones FOREIGN KEY (id_present)
REFERENCES presentaciones (id_present)
)