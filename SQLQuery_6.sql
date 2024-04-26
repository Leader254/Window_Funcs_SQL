-- Create a new database called 'PK_Test'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'PK_Test'
)
CREATE DATABASE PK_Test
GO

CREATE TABLE Musician (
MusicianId int NOT NULL,
FirstName varchar(60),
LastName varchar(60),
CONSTRAINT PK_Musician PRIMARY KEY (MusicianID)
);

CREATE TABLE Band (
BandId int NOT NULL,
BandName varchar(255),
CONSTRAINT PK_Band PRIMARY KEY (BandId)
);

CREATE TABLE BandMember (
MusicianId int NOT NULL,
BandId int NOT NULL,
CONSTRAINT PK_BandMember PRIMARY KEY (MusicianID, BandId),
CONSTRAINT FK_BandMember_Band FOREIGN KEY (BandId) REFERENCES Band(BandId),
CONSTRAINT FK_BandMember_Musician FOREIGN KEY (MusicianId) REFERENCES Musician(MusicianId)
);

SELECT 
  STRING_AGG(CONCAT(m.FirstName, ' ', m.LastName), ', ') AS 'Musicians',
  b.BandName AS 'Band'
FROM Musician m
JOIN BandMember bm
  ON m.MusicianId = bm.MusicianId
JOIN Band b 
  ON b.BandId = bm.BandId AND m.MusicianId = bm.MusicianId
  GROUP BY b.BandName;

  SELECT 
  b.BandName AS 'Band',
  STRING_AGG(CONCAT(m.FirstName, ' ', m.LastName), ', ') AS 'Musicians'
FROM Musician m
JOIN BandMember bm
  ON m.MusicianId = bm.MusicianId
JOIN Band b 
  ON b.BandId = bm.BandId AND m.MusicianId = bm.MusicianId
GROUP BY b.BandName;