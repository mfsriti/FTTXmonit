DROP TABLE ReportStats;
DROP TABLE ResolvedFailures;
DROP TABLE CurrentFailures;
DROP TABLE Successors;
DROP TABLE Predecessors;
DROP TABLE GPSPoints;
DROP TABLE SLDPoints;
DROP TABLE Components;
DROP TABLE ComponentTypes;
DROP TABLE Users;
DROP TABLE ACL;
DROP TABLE Groups;
DROP TABLE Actions;

CREATE TABLE Actions
(
ActionID INTEGER AUTO_INCREMENT,
ActionName VARCHAR(100),-- ActionName is a specific action: Create User, Show Key Map, ...
ActionType VARCHAR(50), -- ActionType is a common name for a group of action: Home, Users, Reports, KeyMap,...
PRIMARY KEY (ActionID)
);

CREATE TABLE Groups
(
GroupID INTEGER AUTO_INCREMENT,
GroupName VARCHAR(30),
PRIMARY KEY (GroupID)
);

CREATE TABLE ACL
(
GroupID INTEGER,
ActionID INTEGER,
PRIMARY KEY (GroupID, ActionID),
FOREIGN KEY (GroupID) REFERENCES Groups(GroupID),
FOREIGN KEY (ActionID) REFERENCES Actions(ActionID)
);

CREATE TABLE Users
(
UserID INTEGER AUTO_INCREMENT,
Title VARCHAR(50),
Password VARCHAR(100) NOT NULL,
GroupID INTEGER,
FullName VARCHAR(50) NOT NULL,
Mobile VARCHAR(15) NOT NULL,
Office VARCHAR(15),
PRIMARY KEY (UserID),
FOREIGN KEY (GroupID) REFERENCES Groups (GroupID)
);

CREATE TABLE ComponentTypes
(
ComponentTypeID INTEGER AUTO_INCREMENT,
ComponentTypeName VARCHAR(30) NOT NULL,
Description VARCHAR(150),
PRIMARY KEY (ComponentTypeID)
);


CREATE TABLE Components
(
ComponentID VARCHAR(30),
ComponentTypeID INTEGER,
ComponentSignature INTEGER,
AreaID VARCHAR(20), -- An Area is merged with the FDT, so this attribute define the related FDT 
ParentID VARCHAR(30),
Address VARCHAR(50),
QuarterNames VARCHAR(30),
Latitude INTEGER,
Longitude INTEGER,
CoordX INTEGER,
CoordY INTEGER,
Size INTEGER,
DistanceFromOLT FLOAT,
PRIMARY KEY (ComponentID),
FOREIGN KEY (ComponentTypeID) REFERENCES ComponentTypes (ComponentTypeID),
FOREIGN KEY (ParentID) REFERENCES Components (ComponentID)
);

CREATE TABLE SLDPoints
(
ComponentID VARCHAR(30),
CoordX INTEGER,
CoordY INTEGER,
PointOrder INTEGER,
PRIMARY KEY (ComponentID, PointOrder),
FOREIGN KEY (ComponentID) REFERENCES Components (ComponentID) ON DELETE CASCADE
);

CREATE TABLE GPSPoints
(
ComponentID VARCHAR(30),
Latitude INTEGER,
Longitude INTEGER,
PointOrder INTEGER,
PRIMARY KEY (ComponentID, PointOrder),
FOREIGN KEY (ComponentID) REFERENCES Components (ComponentID) ON DELETE CASCADE
);

CREATE TABLE Predecessors
(
ComponentID VARCHAR(30),
PredecessorID VARCHAR(30),
FOREIGN KEY (ComponentID) REFERENCES Components (ComponentID) ON DELETE CASCADE,
FOREIGN KEY (PredecessorID) REFERENCES Components (ComponentID) ON DELETE CASCADE
);

CREATE TABLE Successors
(
ComponentID VARCHAR(30),
SuccessorID VARCHAR(30),
FOREIGN KEY (ComponentID) REFERENCES Components (ComponentID) ON DELETE CASCADE,
FOREIGN KEY (SuccessorID) REFERENCES Components (ComponentID) ON DELETE CASCADE
);

CREATE TABLE CurrentFailures
(
FailureID INTEGER AUTO_INCREMENT,
FailureDate DATE NOT NULL,
FailureType VARCHAR(20),
ComponentID VARCHAR(30),
PRIMARY KEY (FailureID),
FOREIGN KEY (ComponentID) REFERENCES Components (ComponentID)
);

CREATE TABLE ResolvedFailures
(
FailureID INTEGER AUTO_INCREMENT,
FailureDate DATE NOT NULL,
FailureType VARCHAR(20),
ComponentID VARCHAR(30),
ResolverID INTEGER,
AutoRepairDate DATE,
TechRepairDate DATE,
PRIMARY KEY (FailureID),
FOREIGN KEY (ComponentID) REFERENCES Components (ComponentID),
FOREIGN KEY (ResolverID) REFERENCES Users (UserID)
);

CREATE TABLE ReportStats
(
StatID INTEGER AUTO_INCREMENT,
StatMounth DATE NOT NULL, 
StatComponentTypeName VARCHAR(30),
StatNumber INTEGER,
PRIMARY KEY (StatID)
);