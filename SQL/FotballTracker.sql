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

