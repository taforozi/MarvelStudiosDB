# Suppose that a Marvel fan is interested in learning about the type and description of events
# that took place in the first 20, chronologically *, Marvel movies

# *The term chronologically refers to the time of the Marvel world and not to real time

SELECT events.type AS 'Type of event' , events.description AS 'Description of event'
FROM movies JOIN events ON movies.movieName = events.movieName
WHERE movies.sequenceOfEvents <= 20;
