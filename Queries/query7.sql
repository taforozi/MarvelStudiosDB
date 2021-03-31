# Suppose a Marvel fan wants to see the names of the movies, whose cast includes
# both Robert Downey Jr. and Chris Evans

SELECT movieName AS Movies 
FROM actors JOIN movies_have_characters ON actors.charName = movies_have_characters.charName
WHERE actors.name IN ('Robert Downey Jr', 'Chris Evans')
GROUP BY movieName
HAVING COUNT(DISTINCT actors.name) = 2;
