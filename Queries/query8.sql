DROP TEMPORARY TABLE IF EXISTS C;
CREATE TEMPORARY TABLE C AS
SELECT DISTINCT producerID
  FROM producers AS P1
  WHERE NOT EXISTS
       (SELECT *
          FROM movies_have_producers
         WHERE NOT EXISTS
               (SELECT *
                  FROM movies_have_producers AS P2
                 WHERE (P1.producerID = P2.producerID)
                   AND (P2.movieName = movies_have_producers.movieName)));

#Producer ID
SELECT *
FROM C;

#Producer Name
SELECT name AS 'Producer Name'
FROM producers JOIN C ON producers.producerID = C.producerID;