CREATE DATABASE SUPERMERCADO
GO
USE SUPERMERCADO
GO


CREATE TABLE BARRIOS(
id_barrio int identity(1,1),
nombre_barrio varchar(50) NOT NULL
CONSTRAINT pk_barrios PRIMARY KEY (id_barrio)
)

CREATE TABLE PROVEEDORES(
cod_prov int identity(1,1),
nombre varchar(50) NOT NULL,
direccion varchar(50),
id_barrio int,
tel int,
email varchar(100),
CONSTRAINT pk_proveedores PRIMARY KEY (cod_prov),
CONSTRAINT fk_proveedores_barrios FOREIGN KEY (id_barrio)
REFERENCES barrios (id_barrio)
)

CREATE TABLE MARCAS(
id_marca int identity(1,1),
nombre_marca varchar(50) NOT NULL
CONSTRAINT pk_marcas PRIMARY KEY (id_marca)
)

CREATE TABLE RUBROS(
id_rubro int identity(1,1),
nombre_rubro varchar(50) NOT NULL
CONSTRAINT pk_rubros PRIMARY KEY (id_rubro)
)

CREATE TABLE PRODUCTOS(
cod_producto int identity(1,1),
descripcion varchar(50) NOT NULL,
id_marca int,
id_rubro int,
precio decimal(12,2)
CONSTRAINT pk_productos PRIMARY KEY (cod_producto),
CONSTRAINT fk_productos_marcas FOREIGN KEY (id_marca)
REFERENCES marcas (id_marca),
CONSTRAINT fk_productos_rubros FOREIGN KEY (id_rubro)
REFERENCES rubros (id_rubro)
)

CREATE TABLE PRODUCTOS_PROVEEDORES(
cod_producto int,
cod_prov int,
CONSTRAINT pk_producto_proveedores PRIMARY KEY (cod_producto,cod_prov),
CONSTRAINT fk_productos_proveedores_productos FOREIGN KEY (cod_producto)
REFERENCES productos (cod_producto),
CONSTRAINT fk_producto_proveedores_proveedores FOREIGN KEY(cod_prov)
REFERENCES proveedores (cod_prov)
)