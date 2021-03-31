SELECT characters.charName AS Characters, name AS Actors
FROM characters JOIN actors ON characters.charName = actors.charName;