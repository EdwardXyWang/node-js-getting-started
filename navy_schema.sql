CREATE SCHEMA public;
CREATE TABLE fleet (
  fleetId SERIAL NOT NULL PRIMARY KEY,
  fleetName VARCHAR(100) NOT NULL
);
INSERT INTO fleet (fleetName) VALUES ('fleetGroupOne');

CREATE TABLE ship (
  shipId SERIAL NOT NULL PRIMARY KEY,
  shipName VARCHAR(100) NOT NULL,
  shipBuiltDate VARCHAR(10) NOT NULL,
  fleetId INT NOT NULL REFERENCES fleet(fleetId)
);
INSERT INTO ship (shipName, shipBuiltDate, fleetId) VALUES ('daninghao', '1990', 1);

CREATE TABLE sailor (
  sailorId SERIAL NOT NULL PRIMARY KEY,
  sailorName VARCHAR(100) NOT NULL,
  sailorDoB VARCHAR(10) NOT NULL
);
INSERT INTO sailor (sailorName, sailorDoB) VALUES ('sailorOne', '1995');

CREATE TABLE rank(
  rankId SERIAL NOT NULL PRIMARY KEY,
  rankName VARCHAR(100) NOT NULL
);
INSERT INTO rank (rankName) VALUES ('solder');

CREATE TABLE duty (
  dutyId SERIAL NOT NULL PRIMARY KEY,
  sailorId INT REFERENCES sailor(sailorId),
  shipId INT REFERENCES ship(shipId),
  dutyStart VARCHAR(100) NOT NULL,
  dutyEnd VARCHAR(100) NOT NULL,
  rankId INT NOT NULL REFERENCES rank(rankId)
);
INSERT INTO duty (sailorId, shipId, dutyStart, dutyEnd, rankId)
VALUES (1, 1, '10am', '12am', 1);
