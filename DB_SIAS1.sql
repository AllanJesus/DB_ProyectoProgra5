create database DB_SIAS 
Use DB_SIAS 

Go
create table Admision
(
	id_admision int identity(1,1) not null, 
	id_persona int,
	nota int,
	promedio int,
	estado varchar(50) 
);

Go
create table Detalle_Admision
(
	id_detalle int not null,
	id_admision int,
	id_accionafirmativa int,
	puntosaccion int,
	estado bit
);

Go
create table AccionAfirmativa
(
	id_accionafirmativa int identity(1,1) not null,
	puntos int,
	Poblaciones varchar,
	Documentos varchar,
	lugar varchar,
	descripcion varchar (50)not null
);

Go
create table Acciones_Detalles_Admision
(
	id_detalle int identity(1,1) not null,
	id_accionafirmativa int not null
);

Go
create table Persona
(
	id_persona int not null,
	nombre varchar(50),
	apellido1 varchar(50), 
	apellido2 varchar(50),
	fecha_nacimiento Date,
	edad int,
	correo varchar(50)
);

Go
create table Usuario
(	
	id_usuario int identity(1,1) not null,
	id_persona int,
	correo varchar(50)not null,
	contraseña varchar(50)not null,
	codigo varchar(50)not null,
	estado bit 
);

Go
create table Usuario_Perfil
(	
	id_usuario int not null,
	id_perfil int not null,
);

Go
create table Perfil
(
	id_perfil int not null,
	descripcion varchar not null,
	estado bit not null,
);

Go
create table Telefono
(
	id_telefono	int not null,
	id_Persona int,
	id_tipo_telefono int,
	descripcion	varchar(50)
);

Go
create table Tipo_Telefonos
(
	id_tipo_telefono int not null,
	descripcion varchar (50)
);

Go
create table Provincia
(
	id_prov	 int NOT NULL,
	descripcion	varchar(50)
);

Go
create table Canton
(
	id_prov int NOT NULL,
	id_can  int NOT NULL,
	descripcion	varchar(50)
);

Go
create table Distrito
(
	id_prov int NOT NULL,
	id_can  int NOT NULL,
	id_dis  int NOT NULL,
	descripcion	varchar(50)
);

Go
create table Barrio
(	
	id_prov int NOT NULL,
	id_can  int NOT NULL,
	id_dis  int NOT NULL,
	id_bar  int NOT NULL,
	descripcion	varchar(50)
);

Go
create table Otra_senas
(
	id_prov int NOT NULL,
	id_can  int NOT NULL,
	id_dis  int NOT NULL,
	id_bar  int NOT NULL,
	id_otras int NOT NULL,
	id_persona int,
	descripcion	varchar(50)
);

------------------------------Primary key-----------------------------------------------
Go
alter table admision add constraint Admision_PK primary key(id_admision)
Go
alter table Detalle_Admision add constraint Detalle_Admisionn_PK primary key(id_detalle)
Go
alter table AccionAfirmativa add constraint AccionAfirmativa_PK primary key(id_accionafirmativa)
Go
alter table Acciones_Detalles_Admision add constraint Acciones_Detalle_sAdmision_PK primary key(id_detalle,id_accionafirmativa)
Go
alter table Persona add constraint Persona_PK primary key(id_persona)
Go
alter table Usuario add constraint Usuario_PK primary key(id_usuario)
Go
alter table Usuario_Perfil add constraint Usuario_Perfil_PK primary key(id_usuario,id_perfil)
Go
alter table Perfil add constraint Perfil_PK primary key(id_perfil)
Go
alter table Telefono add constraint Telefonos_PK primary key(id_telefono)
Go
alter table Tipo_Telefonos add constraint Tipo_Telefonos_PK primary key(id_tipo_telefono)
Go
alter table Provincia add constraint Provincia_PK primary key(id_prov)
Go
alter table Canton add constraint Canton_PK primary key(id_prov,id_can)
Go
alter table Distrito add constraint Distrito_PK primary key(id_prov,id_can,id_dis)
Go
alter table Barrio add constraint Barrio_PK primary key (id_prov,id_can,id_dis,id_bar)
Go
alter table Otra_senas add constraint Otra_senas_PK primary key (id_prov,id_can,id_dis,id_bar,id_otras)

------------------------------Foreign key--------------------------------
Go
alter table Usuario add constraint Persona_Usuario_FK foreign key (id_persona) references Persona(id_persona)
Go
alter table Admision add constraint Persona_Admision_FK foreign key (id_persona) references Persona(id_persona)
Go
alter table Canton add constraint Canton_Provincia_FK foreign key (id_prov) references Provincia(id_prov)
Go
alter table Distrito add constraint Distrito_Canton_FK foreign key (id_prov,id_can) references Canton(id_prov,id_can)
Go
alter table Barrio add constraint Barrio_Distrito_FK foreign key (id_prov,id_can,id_dis) references Distrito(id_prov,id_can,id_dis)
Go
alter table Otra_senas add constraint Otra_senas_Barrio_FK foreign key (id_prov,id_can,id_dis,id_bar) references Barrio(id_prov,id_can,id_dis,id_bar)
Go
alter table Otra_senas add constraint Otra_senas_Persona_FK foreign key (id_persona) references Persona(id_persona)
Go
alter table Telefono add constraint Persona_Telefono_FK foreign key (id_persona) references Persona(id_persona)
Go
alter table Usuario_Perfil add constraint Usuario_Perfil_Perfil_FK foreign key (id_perfil) references  Perfil(id_perfil)
Go
alter table Usuario_Perfil add constraint Usuario_Perfil_Usuario_FK foreign key (id_usuario) references  Usuario(id_usuario)
Go
alter table Telefono add constraint Telefonos_Tipo_Telefonos_FK foreign key (id_tipo_telefono) references Tipo_Telefonos(id_tipo_telefono)
Go
alter table Detalle_Admision add constraint Detalle_Admision_Admision_FK foreign key (id_admision) references Admision(id_admision)
Go
alter table Acciones_Detalles_Admision add constraint Acciones_Detalles_Admision_Detalle_Admision_FK foreign key (id_detalle) references Detalle_Admision(id_detalle)
Go
alter table Acciones_Detalles_Admision add constraint Acciones_Detalles_Admision_AccionAfirmativa_FK foreign key (id_accionafirmativa) references AccionAfirmativa(id_accionafirmativa)
