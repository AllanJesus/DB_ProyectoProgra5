create database DB_SIAS 
Use DB_SIAS 
set dateformat dmy

Go
create table Admision
(
	id_admision int not null, 
	id_persona int,
	nota float,
	promedio float,
	estado varchar(50) 
);

Go
create table Detalle_Admision
(
	id_detalle int identity(1,1) not null,
	id_admision int,
	id_accionafirmativa int,
	puntosaccion int
);

Go
create table AccionAfirmativa
(
	id_accionafirmativa numeric(2,0) not null,
	puntos int,
	Poblaciones varchar(255),
	Documentos varchar(255),
	lugar varchar(255)
);

Go
create table Acciones_Detalles_Admision
(
	id_detalle int  not null,
	id_accionafirmativa numeric(2,0) not null
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
	id_usuario int not null,
	id_persona int,
	correo varchar(50)not null,
	contrasena varchar(50)not null,
	estado bit 
);

select * from Persona

select * from Usuario

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
	descripcion varchar(25) not null,
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

create table [dbo].[OTRAS_SENAS]
(
	[COD_PROVINCIA] [numeric](1, 0) NOT NULL,
	[COD_CANTON] [numeric](2, 0) NOT NULL,
	[COD_DISTRITO] [numeric](3, 0) NOT NULL,
	[COD_BARRIO] [numeric](4, 0) NOT NULL,
	[COD_OTRAS_SENAS] [numeric]identity(1,1) NOT NULL,
	[COD_ID_PERSONA] [int] NOT NULL,
	[DSC_OTRAS_SENAS] [nvarchar](255) NULL,
	[LOG_ACTIVO] [numeric](1, 0) NULL,
 CONSTRAINT [PK_OTRAS_SENAS] PRIMARY KEY CLUSTERED 
(
	[COD_PROVINCIA] ASC,
	[COD_CANTON] ASC,
	[COD_DISTRITO] ASC,
	[COD_BARRIO] ASC,
	[COD_OTRAS_SENAS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[OTRAS_SENAS] WITH CHECK ADD  CONSTRAINT [FK_OTRAS_SENAS] FOREIGN KEY([COD_PROVINCIA], [COD_CANTON], [COD_DISTRITO],[COD_BARRIO])
REFERENCES [dbo].[BARRIO] ([COD_PROVINCIA], [COD_CANTON], [COD_DISTRITO],[COD_BARRIO])
GO

ALTER TABLE [dbo].[OTRAS_SENAS] CHECK CONSTRAINT [FK_OTRAS_SENAS]
GO


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

------------------------------Foreign key--------------------------------
Go
alter table Usuario add constraint Persona_Usuario_FK foreign key (id_persona) references Persona(id_persona)
Go
alter table Admision add constraint Persona_Admision_FK foreign key (id_persona) references Persona(id_persona)
Go
alter table [dbo].[OTRAS_SENAS] add constraint Otra_senas_Persona_FK foreign key ([COD_ID_PERSONA]) references Persona(id_persona)
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


--------------------------------------------INSERTS NECESARIOS----------------------------------------------------
go
insert into perfil values(1,'Registro',1)
go
insert into perfil values(2,'Aspirante',1)
--------------------------------------------STORED PROCEDURES----------------------------------------------------
GO
CREATE PROCEDURE SP_SeleccionarUsuarioPorID
(@ID int)
AS 
 	Select id_usuario ,id_persona, correo ,contrasena,estado  from Usuario
	Where (id_usuario =  @ID);

	exec SP_SeleccionarUsuarioPorID 12345678

------------------------------------------------------------------------------------------------
GO
CREATE PROCEDURE SP_SeleccionarUsuario_PerfilPorID
(@ID int)
AS 
 	Select id_usuario ,id_perfil  from Usuario_Perfil
	Where (id_usuario =  @ID);

	exec SP_SeleccionarUsuario_PerfilPorID 12345678

	select * from Perfil
------------------------------------------------------------------------------------------------

GO
CREATE PROCEDURE SP_ActualizarUsuario
 (@id_usuario int,@correo varchar(50),@contrasena varchar(50),@estado bit)
AS  
 	Update  Usuario
	Set	correo =  @correo,
	contrasena =  @contrasena,
	estado =  @estado  
	Where (id_usuario =  @id_usuario);
Go

exec SP_ActualizarPersona 11111110,Kevin,Paniagua,Herrera,'03/10/98',1,'kevin@gmail.com'
------------------------------------------------------------------------------------------------
	GO
CREATE PROCEDURE SP_ActualizarPersona
 (@id_persona int,@nombre varchar(50),@apellido1 varchar(50),@apellido2 varchar(50),
 @fecha_nacimiento Date,@edad int,@correo varchar(50))
AS  
 	Update  Persona
	Set	nombre =  @nombre,
	apellido1 =  @apellido1,
	apellido2 =  @apellido2,
	fecha_nacimiento =  @fecha_nacimiento,
	edad =  @edad,
	correo =  @correo
	Where (id_persona =  @id_persona);
Go
------------------------------------------------------------------------------------------------
Go
CREATE PROCEDURE SP_SeleccionarPersonaPorID
(@ID int)
AS 
 	Select id_persona ,nombre, apellido1 ,apellido2,fecha_nacimiento,edad,correo from Persona
	Where (id_persona =  @ID);
------------------------------------------------------------------------------------------------

