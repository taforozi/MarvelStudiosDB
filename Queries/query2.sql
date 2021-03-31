# Suppose a Marvel fan wants to see the name and the date of the movies, 
# whose cast involves Chris Evans

DROP TEMPORARY TABLE IF EXISTS C;
CREATE TEMPORARY TABLE C AS SELECT movies_have_characters.movieName
FROM actors JOIN movies_have_characters ON  actors.charName = movies_have_characters.charName
WHERE actors.name = "Chris Evans";

SELECT movies.movieName AS Movie, movies.releaseDate
FROM C JOIN movies ON C.movieName= movies.movieName;
