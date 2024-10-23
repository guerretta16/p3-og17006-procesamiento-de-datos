CREATE PROCEDURE ActualizarAeropuerto(
	@AeropuertoKey int,
	@NombreCiudad VARCHAR(100),
	@AbreviaturaEstado VARCHAR(10),
    @FipsEstado INT,
    @NombreEstado VARCHAR(50),
    @CodigoAreaMundial INT
)
AS
BEGIN
	UPDATE dbo.DimAeropuerto SET 
		NombreCiudad=@NombreCiudad,
		AbreviaturaEstado=@AbreviaturaEstado,
		FipsEstado=@FipsEstado,
		NombreEstado=@NombreEstado,
		CodigoAreaMundial=@CodigoAreaMundial
	WHERE AeropuertoKey=@AeropuertoKey
END;
GO

DROP PROCEDURE ActualizarAeropuerto;

EXEC ActualizarAeropuerto ?,?,?,?,?,?;