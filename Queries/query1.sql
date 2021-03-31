# Suppose a Marvel fan wants to see the name of the characters, who have been embodied 
# by different actors, as well as the name of these actors

DROP TEMPORARY TABLE IF EXISTS C;
CREATE TEMPORARY TABLE C AS SELECT actors.name AS actor1 , actors.charName AS Characters ,  actors.actorID
FROM actors ;

SELECT DISTINCT C.Characters , C.actor1  , actors.name AS actor2
FROM C JOIN actors ON C.Characters= actors.charName 
WHERE actor1 <> actors.name AND C.Characters= actors.charName
GROUP BY charName;



