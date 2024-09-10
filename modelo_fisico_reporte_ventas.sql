
CREATE DATABASE reporte_ventas_marketing;
Go

USE  reporte_ventas_marketing;
GO

-- 1Tabla Clientes
CREATE TABLE [clientes] (
    [id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [persona_id] INT NOT NULL,
    [tipo_cliente] NVARCHAR(20) NOT NULL,
	 [celular] varchar (20) NOT NULL, 
	 [email] varchar (255) NOT NULL,
    [fecha_registro] DATETIME DEFAULT GETDATE()


);
GO

-- 2Tabla curso
CREATE TABLE [curso] (
    [id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [nombre] NVARCHAR(100) NOT NULL,
    [categoria] NVARCHAR(255) NOT NULL,
	[duracion_horas] numeric(4) NOT NULL,

);
GO

-- 3Tabla  Cuotas
CREATE TABLE [cuotas] (
    [id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [curso_id] INT NOT NULL,
    [numero_cuota] INT NOT NULL,
    [monto] MONEY NOT NULL,
    [fecha_vencimiento] DATE NOT NULL,
    [estado_cuota] NVARCHAR(20) NOT NULL,
    CONSTRAINT fk_cuota_curso FOREIGN KEY ([curso_id]) REFERENCES [curso]([id])
);
GO


-- 4 Tabla  trabajadores
CREATE TABLE [trabajadores] (
    [id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	 [supervisor_id] INT NULL,
	 [fecha_ingreso] DATE NOT NULL,
	FOREIGN KEY (supervisor_id) references trabajadores(id), 
  
);
GO

-- 5Tabla Pagos
CREATE TABLE [pagos] (
    [id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [cuota_id] INT NOT NULL,
	[medio_de_pago] NVARCHAR(100) NOT NULL,
	[codigo_operacion] VARCHAR(20) NOT NULL,
    [monto_pagado] MONEY NOT NULL,
	[estado_de_pago] VARCHAR(55) NOT NULL,
    [fecha_pago] DATETIME DEFAULT GETDATE(),
	 FOREIGN KEY ([cuota_id]) REFERENCES [cuotas]([id]),
    

	
	);
GO

	-- 6Tabla compra
CREATE TABLE [compra] (
    [id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[fecha_compra] DATETIME DEFAULT GETDATE(),
	[estado_de_compra] VARCHAR(55) NOT NULL,
	[monto_de_compra] MONEY NOT NULL,
    [cliente_id] INT NOT NULL,
	[asesor_id] INT NOT NULL,
	[curso_id] INT NOT NULL,
    CONSTRAINT fk  FOREIGN KEY ([cliente_id]) REFERENCES [clientes]([id]),
    CONSTRAINT fk FOREIGN KEY ([curso_id]) REFERENCES [curso]([id]),
	CONSTRAINT fk FOREIGN KEY ([asesor_id]) REFERENCES [trabajadores]([id]),
	
);
GO



-- 7Tabla compra Pagos
CREATE TABLE [compra pagos] (
    [id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [compra_id] INT NOT NULL,
    [curso_id] INT NOT NULL,
    [monto_pago] MONEY NOT NULL,
    [cantidad_curso]numeric(20) NOT NULL,
    [pago_id] INT NOT NULL,
   
    CONSTRAINT fk__ FOREIGN KEY ([pago_id]) REFERENCES [pagos]([id]),
    CONSTRAINT fk_ FOREIGN KEY (compra_id) REFERENCES [compra]([id]),
	);
GO

