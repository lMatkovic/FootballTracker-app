CREATE TABLE Clubs (
    ClubID INT IDENTITY(1,1) PRIMARY KEY,
    ClubName NVARCHAR(100) NOT NULL,
    Country NVARCHAR(100) NOT NULL,
    City NVARCHAR(100),
    Stadium NVARCHAR(100),
    FoundedYear INT,
    Manager NVARCHAR(100),
    League NVARCHAR(100),
    Website NVARCHAR(200),
    CreatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE Players (
    PlayerID INT IDENTITY(1,1) PRIMARY KEY,
    ClubID INT NOT NULL,
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    Position NVARCHAR(50),
    JerseyNumber INT,
    Nationality NVARCHAR(100),
    DateOfBirth DATE,
    MarketValue DECIMAL(18,2),
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ClubID) REFERENCES Clubs(ClubID)
);

CREATE TABLE Coaches (
    CoachID INT IDENTITY(1,1) PRIMARY KEY,
    ClubID INT NOT NULL,
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    DateOfBirth DATE,
    Nationality NVARCHAR(100),
    ContractStartDate DATE,
    ContractEndDate DATE,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ClubID) REFERENCES Clubs(ClubID)
);

CREATE TABLE Matches (
    MatchID INT IDENTITY(1,1) PRIMARY KEY,
    HomeClubID INT NOT NULL,
    AwayClubID INT NOT NULL,
    MatchDate DATETIME NOT NULL,
    Stadium NVARCHAR(100),
    HomeScore INT,
    AwayScore INT,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (HomeClubID) REFERENCES Clubs(ClubID),
    FOREIGN KEY (AwayClubID) REFERENCES Clubs(ClubID)
);

CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(256) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    CreatedAt DATETIME DEFAULT GETDATE()
);



ALTER TABLE Players
ADD CONSTRAINT FK_Players_Clubs
FOREIGN KEY (ClubID) REFERENCES Clubs(ClubID);

-
ALTER TABLE Matches
ADD CONSTRAINT FK_Matches_HomeClub
FOREIGN KEY (HomeClubID) REFERENCES Clubs(ClubID);


ALTER TABLE Matches
ADD CONSTRAINT FK_Matches_AwayClub
FOREIGN KEY (AwayClubID) REFERENCES Clubs(ClubID);


ALTER TABLE Coaches
ADD CONSTRAINT FK_Coaches_Clubs
FOREIGN KEY (ClubID) REFERENCES Clubs(ClubID);



INSERT INTO Clubs (ClubName, Country, City, Stadium, FoundedYear, Manager, League, Website)
VALUES
('GNK Dinamo Zagreb', 'Croatia', 'Zagreb', 'Maksimir', 1911, 'Nenad Bjelica', 'SuperSport HNL', 'https://gnkdinamo.hr'),
('HNK Hajduk Split', 'Croatia', 'Split', 'Poljud', 1911, 'Gennaro Gattuso', 'SuperSport HNL', 'https://hajduk.hr'),
('NK Osijek', 'Croatia', 'Osijek', 'Opus Arena', 1947, 'Federico Coppitelli', 'SuperSport HNL', 'https://nk-osijek.hr'),
('HNK Rijeka', 'Croatia', 'Rijeka', 'Rujevica', 1946, 'Sergej Jakirovi?', 'SuperSport HNL', 'https://hnkrijeka.hr'),
('NK Lokomotiva Zagreb', 'Croatia', 'Zagreb', 'Kranj?evi?eva', 1914, 'Silvijo ?abraja', 'SuperSport HNL', 'https://nklokomotiva.hr'),
('NK Slaven Belupo', 'Croatia', 'Koprivnica', 'Gradski stadion Koprivnica', 1907, 'Zoran Zeki?', 'SuperSport HNL', 'https://nk-slaven-belupo.hr'),
('NK Istra 1961', 'Croatia', 'Pula', 'Aldo Drosina', 1961, 'Gonzalo Garcia', 'SuperSport HNL', 'https://nkistra.hr'),
('HNK Gorica', 'Croatia', 'Velika Gorica', 'ŠRC Velika Gorica', 2009, 'Željko Jopi?', 'SuperSport HNL', 'https://hnk-gorica.hr'),
('NK Varaždin', 'Croatia', 'Varaždin', 'Stadion Varteks', 1931, 'Mario Kova?evi?', 'SuperSport HNL', 'https://nk-varazdin.hr'),
('NK Rudeš', 'Croatia', 'Zagreb', 'Stadion Rudeš', 1957, 'Davor Mladina', 'SuperSport HNL', NULL);
