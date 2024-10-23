CREATE TABLE Airlines
(
    Code VARCHAR(10) PRIMARY KEY,
    Description VARCHAR(100)
);
GO

CREATE TABLE Airports
(
    AirportID INT PRIMARY KEY,
    CityName VARCHAR(100),
    State VARCHAR(10),
    StateFips INT,
    StateName VARCHAR(50),
    Wac INT
);
GO

CREATE TABLE Flights
(
    FlightDate DATE,
    Airline VARCHAR(100),
    Origin VARCHAR(5),
    Dest VARCHAR(5),
    Cancelled VARCHAR(5),
    Diverted VARCHAR(5),
    CRSDepTime INT,
    DepTime FLOAT,
    DepDelayMinutes FLOAT,
    DepDelay FLOAT,
    ArrTime FLOAT,
    ArrDelayMinutes FLOAT,
    AirTime FLOAT,
    CRSElapsedTime FLOAT,
    ActualElapsedTime FLOAT,
    Distance FLOAT,
    Year INT,
    Quarter INT,
    Month INT,
    DayofMonth INT,
    DayOfWeek INT,
    Marketing_Airline_Network VARCHAR(10),
    Operated_or_Branded_Code_Share_Partners VARCHAR(20),
    DOT_ID_Marketing_Airline INT,
    IATA_Code_Marketing_Airline VARCHAR(10),
    Flight_Number_Marketing_Airline INT,
    Operating_Airline VARCHAR(10) FOREIGN KEY REFERENCES Airlines(Code),
    DOT_ID_Operating_Airline INT,
    IATA_Code_Operating_Airline VARCHAR(10),
    Tail_Number VARCHAR(20),
    Flight_Number_Operating_Airline INT,
    OriginAirportID INT FOREIGN KEY REFERENCES Airports(AirportID),
    OriginAirportSeqID INT,
    OriginCityMarketID INT,
    DestAirportID INT FOREIGN KEY REFERENCES Airports(AirportID),
    DestAirportSeqID INT,
    DestCityMarketID INT,
    DepDel15 FLOAT,
    DepartureDelayGroups FLOAT,
    DepTimeBlk VARCHAR(20),
    TaxiOut FLOAT,
    WheelsOff FLOAT,
    WheelsOn FLOAT,
    TaxiIn FLOAT,
    CRSArrTime INT,
    ArrDelay FLOAT,
    ArrDel15 FLOAT,
    ArrivalDelayGroups FLOAT,
    ArrTimeBlk VARCHAR(20),
    DistanceGroup INT,
    DivAirportLandings FLOAT
);
GO
