CREATE DATABASE CLUB_CAROLINOS
GO
USE CLUB_CAROLINOS
GO

CREATE TABLE PERIODOS(
codigo_mes int identity(1,1),
nombre_mes varchar(15) NOT NULL,
CONSTRAINT pk_periodos PRIMARY KEY (codigo_mes)
)

CREATE TABLE TIPOS_ACT(
id_tipo_act int identity(1,1),
descripcion varchar(50) NOT NULL,
CONSTRAINT pk_tipos_act PRIMARY KEY (id_tipo_act)
)

CREATE TABLE ACTIVIDADES(
codigo_act int identity(1,1),
nombre_act varchar(50),
descripcion varchar(50),
id_tipo_act int,
precio decimal(12,2)
CONSTRAINT pk_actividades PRIMARY KEY (codigo_act),
CONSTRAINT fk_actividades_tipos_act FOREIGN KEY (id_tipo_act)
REFERENCES tipos_act (id_tipo_act)
)

CREATE TABLE TIPOS_DOC(
id_tipo_doc int identity(1,1),
descripcion varchar(50),
CONSTRAINT pk_tipos_doc PRIMARY KEY (id_tipo_doc)
)

CREATE TABLE SOCIOS(
numero_socio int identity(1,1),
nombre varchar(50) NOT NULL,
apellido varchar(50) NOT NULL,
telefono int,
email varchar(50),
direccion varchar(50),
id_tipo_doc int,
numero_doc int,
fecha_nac date
CONSTRAINT pk_socios PRIMARY KEY (numero_socio),
CONSTRAINT fk_socios_tipo_doc FOREIGN KEY (id_tipo_doc)
REFERENCES tipos_doc (id_tipo_doc)
)

CREATE TABLE RECIBOS(
numero_recibo int identity(1,1),
fecha_recibo date,
numero_socio int,
CONSTRAINT pk_recibos PRIMARY KEY (numero_recibo),
CONSTRAINT fk_recibos_socios FOREIGN KEY (numero_socio)
REFERENCES socios (numero_socio)
)

CREATE TABLE DET_RECIBOS(
numero_detalle int identity(1,1),
numero_recibo int,
codigo_act int,
codigo_mes int,
monto decimal(12,2)
CONSTRAINT pk_der_recibos PRIMARY KEY (numero_detalle),
CONSTRAINT fk_det_recibos_recibos FOREIGN KEY (numero_recibo)
REFERENCES recibos (numero_recibo),
CONSTRAINT fk_det_recibos_actividades FOREIGN KEY (codigo_act)
REFERENCES actividades (codigo_act),
CONSTRAINT fk_det_recibos_periodos FOREIGN KEY (codigo_mes)
REFERENCES periodos (codigo_mes)
)