create database DB_SIAS 
use DB_SIAS

create table Admision
(
	id_admision numeric (8) not null, 
	id_detalle numeric(8)not null,
	id_persona numeric(8)not null,
	nota numeric(8),
	accionesAfi numeric(8),
	promedio numeric(8),
	estado varchar (50) 
)

create table Detalle_Admision
(
	id_detalle numeric (8) identity not null,
	id_persona numeric(8)not null,
	id_accionafirmativa numeric(8)not null,
	puntosaccion numeric (8),
	estado bit
)


create table AccionAfirmativa
(
	id_accionafirmativa numeric (8) not null, 
	descripcion varchar (50)not null
)



create table Tipo_Identificacion
(
	id_tipo_identificacion numeric (8) not null, 
	descripcion varchar (50)not null
)


create table Persona
(
	id_persona numeric(8)not null,
	id_tipo_identificacion  numeric (8) not null, 
	nombre varchar(50)not null,
	apellido1 varchar(50)not null, 
	apellido2 varchar(50)not null,
	fecha_nacimiento Date,
	id_telefono	numeric(8)not null,
	edad numeric(8),
	id_dirección numeric(8)not null,
	correo varchar(50)not null
)


create table Perfil
(
	id_perfil numeric (8)not null,
	descripcion varchar(50)not null,
	estado bit not null,
)


create table Usuario
(	
	id_persona numeric(8) identity(1,1) not null,
	correo varchar(50)not null,
	contraseña varchar(50)not null,
	codigo varchar(50)not null,
	estado bit 
)



create table Usuario_Perfil
(	
	id_usuario_perfil numeric(8)not null,
	id_persona numeric(8)not null,
	id_perfil numeric (8)not null,
	estado bit not null,
)



create table Telefonos
(
	id_telefono	numeric(8)not null,
	descripcion	varchar(50),
	id_tipo_telefono numeric(8)not null
)


create table Tipo_Telefonos
(
	id_tipo_telefono numeric (8)not null,
	descripcion varchar (50)
)


create table Direccion
(
	id_Persona numeric (8) not null,
	id_direccion numeric  (8)not null
)

create table Provincia
(
	id_direccion numeric  (8)not null,
	id_prov	numeric(8)not null,
	descripcion	varchar(50)not null
)


create table Canton
(
	id_can	numeric(8)not null,
	id_prov numeric (8)not null,
	descripcion	varchar(50)not null
)


create table Distrito
(
	id_dis numeric(8)not null,
	id_can numeric(8)not null,
	id_prov numeric (8)not null, 
	descripcion	varchar(50)not null
)


create table Barrio
(	
	id_bar numeric(8)not null,
	id_dis numeric(8)not null,
	id_can numeric(8)not null,
	id_prov numeric (8)not null, 
	descripcion	varchar(50)not null
)



create table Otra_senas
(
	id_otras numeric(8)not null,
	descripcion	varchar(50)not null
)


------------------------------Primary key-----------------------------------------------
alter table admision add constraint Admision_PK primary key(id_admision, id_detalle,id_persona)

alter table Detalle_Admision add constraint Detalle_Admisionn_PK primary key(id_detalle, id_persona, id_accionafirmativa)

alter table AccionAfirmativa add constraint AccionAfirmativa_PK primary key(id_accionafirmativa)

alter table Tipo_Identificacion add constraint Tipo_Identificacion_PK primary key(id_tipo_identificacion)

alter table Persona add constraint Persona_PK primary key(id_persona,id_tipo_identificacion,id_telefono,id_dirección)

alter table Perfil add constraint Perfil_PK primary key(id_perfil)

alter table Usuario add constraint Usuario_PK primary key(id_persona)

alter table Usuario_Perfil add constraint Usuario_Perfil_PK primary key(id_usuario_perfil,id_persona,id_perfil)

alter table Telefonos add constraint Telefonos_PK primary key(id_telefono,id_tipo_telefono)

alter table Tipo_Telefonos add constraint Tipo_Telefonos_PK primary key(id_tipo_telefono)

alter table Direccion add constraint Direccion_PK primary key(id_direccion,id_Persona)

alter table Provincia add constraint Provincia_nPK primary key(id_prov,id_direccion)

alter table Canton add constraint Canton_PK primary key(id_can,id_prov)

alter table Distrito add constraint Distrito_PK primary key(id_dis,id_can,id_prov)

alter table Barrio add constraint Barrio_PK primary key (id_bar, id_dis,id_can,id_prov)

alter table Otra_senas add constraint Otra_senas_PK primary key (id_bar,id_dis,id_can,id_prov,id_otras);

------------------------------Foreign key-----------------------------------------------

alter table Persona add constraint Persona_Tipo_Identificacion_FK foreign key (id_tipo_identificacion) references Tipo_Identificacion(id_tipo_identificacion)

alter table Persona add constraint Persona_Usuario_FK foreign key (id_persona) references Usuario(id_persona)

--alter table Persona add constraint Persona_Admision_FK foreign key (id_persona) references Admision(id_persona)

alter table Persona add constraint Persona_Direccion_FK foreign key (id_dirección) references Direccion(id_dirección)

