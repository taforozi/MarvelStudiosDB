# We assume that a Marvel fan wants to know the locations and planets
# where battle has taken place but not death
# Both battle and death are considered as events

DROP TEMPORARY TABLE IF EXISTS A;
DROP TEMPORARY TABLE IF EXISTS battle;
DROP TEMPORARY TABLE IF EXISTS death;

CREATE TEMPORARY TABLE A AS
SELECT type, description, events.locationID AS FK_locationID, planet, locations.locationID, locations.name
FROM events JOIN locations ON events.locationID = locations.locationID;

# SELECT * FROM A;

CREATE TEMPORARY TABLE battle AS
SELECT planet, name
FROM A
WHERE type = 'battle';

# SELECT * FROM battle;

CREATE TEMPORARY TABLE death AS
SELECT planet, name
FROM A
WHERE type = 'death';

# SELECT * FROM death;

SELECT battle.planet,battle.name FROM battle
WHERE (battle.planet, battle.name) NOT IN
(SELECT * FROM death);



