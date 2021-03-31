# We assume that a Marvel fan is interested in finding out which movies 
# cost over $250,000,000, as well as their profits 

SELECT movieName AS Movie, budget AS Budget, boxOffice AS BoxOffice
FROM movies
WHERE budget > 250000000;
