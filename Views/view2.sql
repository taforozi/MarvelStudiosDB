SELECT characters.charName AS Characters, events.type AS Type, events.description AS Description
FROM characters JOIN characters_participatein_events ON characters.charName = characters_charName
    JOIN events ON events_eventID = events.eventID;

