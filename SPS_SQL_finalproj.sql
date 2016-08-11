# Author: Richard Pantoliano Jr.
# Assignment: SPS Summer Bridge 2016 SQL Final Project

# Drop & create schema used by final project
DROP SCHEMA IF EXISTS finalproj;
CREATE SCHEMA finalproj;
USE finalproj;

# Create appropriate tables for energy categories and types
CREATE TABLE EnergyCategories (
	eid INT PRIMARY KEY AUTO_INCREMENT,
    ecat VARCHAR(100) UNIQUE
);

CREATE TABLE EnergyTypes (
	tid INT PRIMARY KEY AUTO_INCREMENT,
    etype VARCHAR(100) UNIQUE,
    eid int,
    CONSTRAINT FOREIGN KEY (eid) REFERENCES EnergyCategories(eid)
);

INSERT EnergyCategories (ecat)
	VALUES ("Fossil"), ("Renewable");
    
INSERT EnergyTypes (etype, eid)
	VALUES 	("Electricity", 1), ("Fuel Oil", 1),
			("Gas", 1), ("Solar", 2),
            ("Steam", 1), ("Wind", 2);

#  Show all energy types and the categories into which they fall
SELECT EnergyCategories.ecat as 'Energy Category', EnergyTypes.etype as ' Energy Type'
	FROM EnergyTypes
    JOIN EnergyCategories ON EnergyCategories.eid = EnergyTypes.eid;

# Create buildings table and model many-to-many relationship
CREATE TABLE BuildingID(
	bname VARCHAR(255) UNIQUE,
    bid INT PRIMARY KEY AUTO_INCREMENT
);

INSERT BuildingID (bname)
	VALUES 	("Borough of Manhattan Community College"),
			("Chrysler Building"),
            ("Empire State Building");

CREATE TABLE Buildings(
	bid INT, 
    tid INT,
    CONSTRAINT 	FOREIGN KEY(bid) REFERENCES buildingid(bid),
				FOREIGN KEY(tid) REFERENCES EnergyTypes(tid)
);

INSERT Buildings (bid, tid)
	VALUES	(1, 4), (1, 1), (1, 5),
			(2, 5), (2, 1),
            (3, 1), (3, 5), (3,3);

# Show all buildings and associated electricity types for each building
SELECT BuildingID.bname AS 'Building Name', EnergyTypes.etype as 'Electricity Type'
	FROM Buildings
    JOIN EnergyTypes ON Buildings.tid = Energytypes.tid
    JOIN BuildingID ON Buildings.bid = BuildingID.bid;

# Add the Geothermal Type and appropriate buildings that use it
INSERT EnergyTypes (etype, eid) VALUE ("Geothermal", 2);
INSERT BuildingID (bname) VALUES ("Bronx Lions House"), ("Brooklyn Children's Museum");
INSERT Buildings (bid, tid)
	VALUES 	(4, 7),
			(5, 1), (5,7);

# List all of the buildings using Renewable energy sources
SELECT BuildingID.bname AS 'Building Name', EnergyTypes.etype as 'Electricity Type', EnergyCategories.ecat 'Electricity Category'
	FROM Buildings
    JOIN EnergyTypes ON Buildings.tid = Energytypes.tid
    JOIN BuildingID ON Buildings.bid = BuildingID.bid
    JOIN EnergyCategories ON Energytypes.eid = EnergyCategories.eid
    WHERE EnergyCategories.eid = 2;

# List the electricity categories and the count of each that shows up among the buildings
SELECT EnergyTypes.etype AS ECategory, COUNT(EnergyTypes.eid) as ECount
	From Buildings
    JOIN EnergyTypes ON Buildings.tid = EnergyTypes.tid
    GROUP BY ECategory
    ORDER BY ECount DESC, ECategory DESC; 