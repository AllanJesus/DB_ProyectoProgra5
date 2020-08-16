create database DB_SIAS 
use DB_SIAS

create table admision
(
	id_admision numeric (8) not null, 
	id_detalle numeric(8)not null,
	id_persona numeric(8)not null,
	nota numeric(8) not null,
	accionesAfi numeric (8) not null,
	promedio numeric(8) not null,
	estado varchar (50) not null
	primary key (id_admision, id_detalle,id_persona)
)create index IX_admision 
on admision(id_admision);

create table detalle_admision
(
	id_detalle numeric (8) identity not null,
	id_persona numeric(8)not null,
	id_accionafirmativa numeric(8)not null,
	puntosaccion numeric (8)not null,
	estado bit not null,
	primary key (id_detalle, id_persona, id_accionafirmativa)
)create index IX_detalle_admision
on detalle_admision(id_detalle);

create table accionafirmativa
(
	id_accionafirmativa numeric (8) not null, 
	descripcion varchar (50)not null,
	primary key (id_accionafirmativa)
)create index IX_accionafirmativa
on tipo_identificacion(id_tipo_identificacion);

create table tipo_identificacion
(
	id_tipo_identificacion numeric (8) not null, 
	descripcion varchar (50)not null,
	primary key (id_tipo_identificacion)
)create index IX_tipo_identificacion 
on tipo_identificacion(id_tipo_identificacion);

create table persona
(
	id_persona numeric(8)not null,
	id_tipo_identificacion  numeric (8) not null, 
	nombre varchar(50)not null,
	apellido1 varchar(50)not null, 
	apellido2 varchar(50)not null,
	fecha_nacimiento Date not null,
	id_telefono	numeric(8)not null,
	edad numeric(8)not null,
	dirección varchar(50)not null,
	correo varchar(50)not nulL
	primary key (id_persona,id_tipo_identificacion,id_telefono)
)create index IX_persona
on persona(id_persona);

create table perfil
(
	id_perfil numeric (8)not null,
	descripcion varchar(50)not null,
	estado bit not null,
	primary key (id_perfil)

)create index IX_perfil 
on perfil(id_perfil);

create table usuario
(	
	id_persona numeric(8) identity(1,1) not null,
	correo varchar(50)not null,
	contraseña varchar(50)not null,
	codigo varchar(50)not null,
	estado bit 
	primary key (id_persona)
)create index IX_usuario
on usuario(id_persona);

create table usuario_perfil
(	
	id_usuario_perfil numeric(8)not null,
	id_persona numeric(8)not null,
	id_perfil numeric (8)not null,
	estado bit not null,
	primary key (id_usuario_perfil,id_persona,id_perfil)

)create index IX_usuario_perfil
on usuario_perfil(id_usuario_perfil);

create table telefonos
(
	id_telefono	numeric(8)not null,
	descripcion	varchar(50)not null,
	id_tipo_telefono numeric(8)not null,
	primary key (id_telefono,id_tipo_telefono)
)create index IX_telefonos
on telefonos(id_telefono);

create table tipo_telefonos
(
	id_tipo_telefono numeric (8)not null,
	descripcion varchar (50)not null,
	primary key (id_tipo_telefono)
)create index IX_tipo_telefonos
on tipo_telefonos(id_tipo_telefono)



CREATE TABLE [dbo].[PROVINCIAS](
	[COD_PROVINCIA] [numeric](1, 0) NOT NULL,
	[DSC_CORTA_PROVINCIA] [nvarchar](255) NULL,
	[DSC_PROVINCIA] [nvarchar](255) NULL,
	[LOG_ACTIVO] [numeric](1, 0) NULL,
 CONSTRAINT [PK_PROVINCIAS] PRIMARY KEY CLUSTERED 
(
	[COD_PROVINCIA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[CANTONES](
	[COD_PROVINCIA] [numeric](1, 0) NOT NULL,
	[COD_CANTON] [numeric](2, 0) NOT NULL,
	[DSC_CANTON] [nvarchar](255) NULL,
	[LOG_ACTIVO] [numeric](1, 0) NULL,
 CONSTRAINT [PK_CANTONES] PRIMARY KEY CLUSTERED 
(
	[COD_PROVINCIA] ASC,
	[COD_CANTON] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[CANTONES]  WITH CHECK ADD  CONSTRAINT [FK_CANTONES_PROVINCIAS] FOREIGN KEY([COD_PROVINCIA])
REFERENCES [dbo].[PROVINCIAS] ([COD_PROVINCIA])
GO

ALTER TABLE [dbo].[CANTONES] CHECK CONSTRAINT [FK_CANTONES_PROVINCIAS]
GO



CREATE TABLE [dbo].[DISTRITOS](
	[COD_PROVINCIA] [numeric](1, 0) NOT NULL,
	[COD_CANTON] [numeric](2, 0) NOT NULL,
	[COD_DISTRITO] [numeric](3, 0) NOT NULL,
	[DSC_DISTRITO] [nvarchar](255) NULL,
	[LOG_ACTIVO] [numeric](1, 0) NULL,
 CONSTRAINT [PK_DISTRITOS] PRIMARY KEY CLUSTERED 
(
	[COD_PROVINCIA] ASC,
	[COD_CANTON] ASC,
	[COD_DISTRITO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[DISTRITOS]  WITH CHECK ADD  CONSTRAINT [FK_DISTRITOS_CANTONES] FOREIGN KEY([COD_PROVINCIA], [COD_CANTON])
REFERENCES [dbo].[CANTONES] ([COD_PROVINCIA], [COD_CANTON])
GO

ALTER TABLE [dbo].[DISTRITOS] CHECK CONSTRAINT [FK_DISTRITOS_CANTONES]
GO

CREATE TABLE [dbo].[BARRIO](
	[COD_PROVINCIA] [numeric](1, 0) NOT NULL,
	[COD_CANTON] [numeric](2, 0) NOT NULL,
	[COD_DISTRITO] [numeric](3, 0) NOT NULL,
	[COD_BARRIO] [numeric](4, 0) NOT NULL,
	[DSC_BARRIO] [nvarchar](255) NULL,
	[LOG_ACTIVO] [numeric](1, 0) NULL,
 CONSTRAINT [PK_BARRIO] PRIMARY KEY CLUSTERED 
(
	[COD_PROVINCIA] ASC,
	[COD_CANTON] ASC,
	[COD_DISTRITO] ASC,
	[COD_BARRIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[BARRIO]  WITH CHECK ADD  CONSTRAINT [FK_BARRIO_DISTRITOS] FOREIGN KEY([COD_PROVINCIA], [COD_CANTON], [COD_DISTRITO])
REFERENCES [dbo].[DISTRITOS] ([COD_PROVINCIA], [COD_CANTON], [COD_DISTRITO])
GO

ALTER TABLE [dbo].[BARRIO] CHECK CONSTRAINT [FK_BARRIO_DISTRITOS]
GO




alter table usuario_perfil add constraint usuario_perfil_FK01 foreign key (id_persona) references usuario(id_persona)
alter table usuario_perfil add constraint usuario_perfil_FK02 foreign key (id_perfil) references perfil(id_perfil)

alter table admision add constraint admision_FK01 foreign key (id_persona) references persona(id_persona)
alter table admision add constraint admision_FK02 foreign key (id_detalle) references detalle_admision(id_detalle)

alter table detalle_admision add constraint detalle_admision_FK01 foreign key (id_persona) references persona(id_persona)
alter table detalle_admision add constraint detalle_admision_FK02 foreign key (id_accionafirmativa) references accionafirmativa(id_accionafirmativa)

alter table persona add constraint persona_FK01 foreign key (id_tipo_identificacion) references tipo_identificacion(id_tipo_identificacion)
alter table persona add constraint persona_FK02 foreign key (id_telefono) references telefonos(id_telefono)

alter table telefonos add constraint telefonos_FK01 foreign key (id_tipo_telefono) references tipo_telefonos(id_tipo_telefono) 



alter table direccion add constraint direccion_FK01 foreign key (id_prov) references provincia(id_prov)
alter table direccion add constraint direccion_FK02 foreign key (id_can) references canton(id_can)
alter table direccion add constraint direccion_FK03 foreign key (id_dis) references distrito(id_dis)
alter table direccion add constraint direccion_FK04 foreign key (id_otras) references otra_señas(id_otras)
