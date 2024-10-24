SELECT
    Operating_Airline AS CodigoAerolinea,
    OriginAirportID AS AeropuertoOrigenId,
    DestAirportID AS AeropuertoDestinoId,
    FlightDate AS FechaVuelo,
    CASE
		WHEN Tail_Number != '' THEN Tail_Number
        WHEN Tail_Number = '' THEN 'Sin Numero'
    END AS NumeroCola,
    Flight_Number_Operating_Airline AS NumeroVuelo,
    Distance AS Distancia,
    DistanceGroup AS IntervaloDistancia,
    AirTime AS TiempoDeVuelo,
    ActualElapsedTime AS TiempoEnAire,
    CRSElapsedTime AS TiempoTranscurridoReal,
    CASE 
        WHEN Cancelled = 'true' THEN 'Verdadero'
        WHEN Cancelled = 'false' THEN 'Falso'
    END AS Cancelado,
    CASE 
        WHEN Diverted = 'true' THEN 'Verdadero'
        WHEN Diverted = 'false' THEN 'Falso'
    END AS Desviado,
    DivAirportLandings as AterrizajesDesviados,
    Operated_or_Branded_Code_Share_Partners as OperadorCodigoCompartido,
    DepDelayMinutes as DiferenciaTiempoSalida,
    CASE 
        WHEN DepDel15 = '1.0' THEN 'Retraso'
        WHEN DepDel15 = '0.0' THEN 'Sin Retraso'
    END AS RetrasoSalida15Min,
    DepartureDelayGroups as IntervaloRetrasoSalida,
    ArrDelayMinutes as DiferenciaTiempoLlegada,
    CASE 
        WHEN ArrDel15 = '1.0' THEN 'Retraso'
        WHEN ArrDel15 = '0.0' THEN 'Sin Retraso'
    END AS RetrasoLlegada15Min,
    ArrivalDelayGroups as IntervaloRetrasoLlegada,
    TaxiIn as TiempoEnRutaALaPuerta,
    TaxiOut as TiempoEnRutaALaPista,

    -- Conversión correcta de DepTimeBlk al formato hh:mm-hh:mm
    RIGHT('0' + LEFT(SUBSTRING(DepTimeBlk, 1, CHARINDEX('-', DepTimeBlk) - 1), 2), 2) + ':' + 
    RIGHT('0' + RIGHT(SUBSTRING(DepTimeBlk, 1, CHARINDEX('-', DepTimeBlk) - 1), 2), 2) + '-' +
    RIGHT('0' + LEFT(SUBSTRING(DepTimeBlk, CHARINDEX('-', DepTimeBlk) + 1, LEN(DepTimeBlk)), 2), 2) + ':' + 
    RIGHT('0' + RIGHT(SUBSTRING(DepTimeBlk, CHARINDEX('-', DepTimeBlk) + 1, LEN(DepTimeBlk)), 2), 2) 
    AS IntervaloHoraSalida,

    -- Similar para ArrTimeBlk
    RIGHT('0' + LEFT(SUBSTRING(ArrTimeBlk, 1, CHARINDEX('-', ArrTimeBlk) - 1), 2), 2) + ':' + 
    RIGHT('0' + RIGHT(SUBSTRING(ArrTimeBlk, 1, CHARINDEX('-', ArrTimeBlk) - 1), 2), 2) + '-' +
    RIGHT('0' + LEFT(SUBSTRING(ArrTimeBlk, CHARINDEX('-', ArrTimeBlk) + 1, LEN(ArrTimeBlk)), 2), 2) + ':' + 
    RIGHT('0' + RIGHT(SUBSTRING(ArrTimeBlk, CHARINDEX('-', ArrTimeBlk) + 1, LEN(ArrTimeBlk)), 2), 2)
    AS IntervaloHoraLlegada,

    -- Conversión correcta de CRSDepTime y CRSArrTime a hh:mm
    STUFF(RIGHT('0000' + CAST(CRSDepTime AS VARCHAR(4)), 4), 3, 0, ':') AS HoraProgramadaSalida,
    STUFF(RIGHT('0000' + CAST(CRSArrTime AS VARCHAR(4)), 4), 3, 0, ':') AS HoraProgramadaLlegada

FROM dbo.Flights;
