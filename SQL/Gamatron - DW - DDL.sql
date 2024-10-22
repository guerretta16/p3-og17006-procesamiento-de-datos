CREATE TABLE DimAerolinea (
	AerolineaKey INT IDENTITY(1,1) PRIMARY KEY,
	CodigoAerolinea VARCHAR(50) NOT NULL,
	NombreAerolinea VARCHAR(255) NOT NULL,
	FechaDeActualizacion DATE DEFAULT GETDATE(),
	Activo BIT DEFAULT 1
);
GO

CREATE TABLE DimTiempo (
	TiempoKey INT PRIMARY KEY,
	Fecha DATETIME NOT NULL,
	Dia TINYINT NOT NULL,
	Mes TINYINT NOT NULL,
	Anio SMALLINT NOT NULL,
	Trimestre TINYINT NOT NULL,
	DiaDelMes TINYINT NOT NULL,
	DiaDeLaSemana TINYINT NOT NULL
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