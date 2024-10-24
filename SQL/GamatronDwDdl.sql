CREATE TABLE DimAerolinea
(
	AerolineaKey INT IDENTITY(1,1) PRIMARY KEY,
	CodigoAerolinea VARCHAR(50) NOT NULL,
	NombreAerolinea VARCHAR(255) NOT NULL,
	FechaDeActualizacion DATE DEFAULT GETDATE(),
	Activo BIT DEFAULT 1
);
GO

CREATE TABLE DimAeropuerto
(
	AeropuertoKey INT IDENTITY(1,1) PRIMARY KEY,
	AeropuertoId INT NOT NULL,
	NombreCiudad VARCHAR(100) NOT NULL,
	AbreviaturaEstado VARCHAR(10),
	FipsEstado INT,
	NombreEstado VARCHAR(50),
	CodigoAreaMundial INT
);
GO

CREATE TABLE DimTiempo
(
	TiempoKey INT PRIMARY KEY,
	Fecha DATETIME NOT NULL,
	Dia TINYINT NOT NULL,
	Mes TINYINT NOT NULL,
	Anio SMALLINT NOT NULL,
	Trimestre TINYINT NOT NULL,
	DiaDeLaSemana TINYINT NOT NULL
);
GO

CREATE TABLE FactVuelos
(
    AerolineaKey INT FOREIGN KEY REFERENCES DimAerolinea(AerolineaKey) NOT NULL,
    AeropuertoOrigenKey INT FOREIGN KEY REFERENCES DimAeropuerto(AeropuertoKey) NOT NULL,
    AeropuertoDestinoKey INT FOREIGN KEY REFERENCES DimAeropuerto(AeropuertoKey) NOT NULL,
    FechaVueloKey INT FOREIGN KEY REFERENCES DimTiempo(TiempoKey) NOT NULL,
    NumeroCola VARCHAR(20) NOT NULL,
    NumeroVuelo INT NOT NULL,
    Distancia FLOAT NOT NULL, -- Distancia en millas
    IntervaloDistancia INT NOT NULL,           
    TiempoDeVuelo FLOAT NOT NULL, -- Tiempo en minutos
    TiempoEnAire FLOAT NOT NULL, -- Tiempo en minutos                       
    TiempoTranscurridoReal FLOAT NOT NULL,
    Cancelado VARCHAR(10) NOT NULL, -- Metrica descriptiva: Verdadero, Falso
    Desviado VARCHAR(10) NOT NULL, -- Metrica descriptiva: Verdadero, Falso
    AterrizajesDesviados INT NOT NULL,     
    OperadorCodigoCompartido VARCHAR(20) NOT NULL,     
    DiferenciaTiempoSalida FLOAT NOT NULL, -- Salida Prevista - Salida Real (minutos)
	RetrasoSalida15Min VARCHAR(12) NOT NULL, -- Metrica descriptiva: Retraso, Sin Retraso
    IntervaloRetrasoSalida FLOAT NOT NULL,                
    DiferenciaTiempoLlegada FLOAT NOT NULL, -- Llegada Prevista - Llegada Real (minutos)
	RetrasoLlegada15Min VARCHAR(12) NOT NULL, -- Metrica descriptiva: Retraso, Sin Retraso
    IntervaloRetrasoLlegada FLOAT NOT NULL,                
    TiempoEnRutaALaPuerta FLOAT NOT NULL, -- Taxi a tiempo en minutos
    TiempoEnRutaALaPista FLOAT NOT NULL, -- Taxi fuera de tiempo en minutos
    IntervaloHoraSalida VARCHAR(11),  -- Deber ser Tiempo hh:mm-hh:mm         
    IntervaloHoraLlegada VARCHAR(11), -- Deber ser Tiempo hh:mm-hh:mm            
    HoraProgramadaSalida VARCHAR(5), -- Debe ser Tiempo hh:mm,               
    HoraProgramadaLlegada VARCHAR(5) -- Debe ser Tiempo hh:mm,             
);
GO


CREATE TABLE Date_Dimension
(
	date_key int not null,
	full_date smalldatetime,
	day_of_week tinyint,
	day_num_in_month tinyint,
	day_num_overall int,
	day_name varchar(15),
	day_abbrev char(3),
	weekday_flag char(1),
	week_num_in_year int,
	week_num_overall int,
	week_begin_date smalldatetime,
	week_begin_date_key int,
	month tinyint,
	month_num_overall int,
	month_name varchar(15),
	month_abbrev varchar(15),
	quarter tinyint,
	year int,
	yearmo int,
	fiscal_month tinyint,
	fiscal_quarter tinyint,
	fiscal_year int,
	last_day_in_month_flag varchar(15),
	same_day_year_ago_date smalldatetime,
	primary key (date_key)
);
GO

CREATE TABLE ParametrosGlobales (
	ParametroId INT IDENTITY(1,1) PRIMARY KEY,
	NombreParametro VARCHAR(255) NOT NULL,
	ValorParametro VARCHAR(255) NOT NULL
);
GO

-- Crear parametro de Fecha (SE USA LA FECHA 2017-12-31 YA QUE LOS DATOS INICIALES PARTEN DEL 2018)
INSERT INTO ParametrosGlobales (NombreParametro, ValorParametro) VALUES ('FechaUltimaInsercion', CONVERT(DATETIME, '2017-12-31'));

-- Comando para Actualizar Parametro de Fecha
UPDATE ParametrosGlobales SET ValorParametro = CONVERT(DATETIME, '2017-12-31') WHERE NombreParametro = 'FechaUltimaInsercion';