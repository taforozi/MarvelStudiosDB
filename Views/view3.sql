# This view contains all the actors in the system and the characters that they have embodied

SELECT characters.charName AS Characters, name AS Actors
FROM characters JOIN actors ON characters.charName = actors.charName;
