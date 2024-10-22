CREATE PROCEDURE ActualizarAerolinea(
    @AerolineaKey INT,
    @CodigoAerolinea VARCHAR(10),
    @NombreAerolinea VARCHAR(100)
)
AS
BEGIN

    -- DIMENSION DE TIPO SCD 2

    IF NOT EXISTS (
    SELECT *
    FROM dbo.DimAerolinea
    WHERE AerolineaKey=@AerolineaKey
        AND CodigoAerolinea=@CodigoAerolinea AND NombreAerolinea=@NombreAerolinea AND Activo=1
 )
 BEGIN

        -- DESHABILITAR REGISTRO ANTERIOR
        UPDATE dbo.DimAerolinea set FechaDeActualizacion=GETDATE(), ACTIVO=0 WHERE AerolineaKey=@AerolineaKey

        -- CREAR NUEVO REGISTRO
        INSERT INTO dbo.DimAerolinea
            (CodigoAerolinea, NombreAerolinea)
        values
            (@CodigoAerolinea, @NombreAerolinea)
    END
END;
GO

DROP PROCEDURE ActualizarAerolinea;

EXEC ActualizarAerolinea ?,?,?;