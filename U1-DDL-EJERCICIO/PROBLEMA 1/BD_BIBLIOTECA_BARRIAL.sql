CREATE DATABASE BIBLIOTECA_BARRIAL
GO
USE BIBLIOTECA_BARRIAL
GO

CREATE TABLE ESCRITORES(
cod_escritor int IDENTITY(1,1),
nombre varchar(75) NOT NULL,
apellido varchar(75) NOT NULL,
nacionalidad varchar(75) NOT NULL,
fecha_nac date NOT NULL,
fecha_def date NULL
CONSTRAINT pk_escritores PRIMARY KEY (cod_escritor)
)

CREATE TABLE LIBROS(
legajo int IDENTITY(1,1),
titulo varchar(100) NOT NULL,
genero varchar(75) NOT NULL,
editorial varchar(75) NULL,
edicion varchar(75) NULL,
cod_escritor int NOT NULL
CONSTRAINT pk_libros PRIMARY KEY (legajo),
CONSTRAINT fk_libros_escritores FOREIGN KEY (cod_escritor)
REFERENCES escritores (cod_escritor)
)