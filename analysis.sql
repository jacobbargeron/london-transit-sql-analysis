-- Total journeys
SELECT SUM(daily_journeys) AS total_journeys
FROM tfl.rods;


-- Journeys by entry zone
SELECT entry_zone, SUM(daily_journeys) AS journeys
FROM tfl.rods
GROUP BY entry_zone
ORDER BY entry_zone;


-- Journeys by time period
SELECT time_period, SUM(daily_journeys) AS journeys
FROM tfl.rods
GROUP BY time_period
ORDER BY journeys DESC;


-- Journeys by origin purpose
SELECT origin_purpose, SUM(daily_journeys) AS journeys
FROM tfl.rods
GROUP BY origin_purpose
ORDER BY journeys DESC;


-- Origin + destination
SELECT origin_purpose, destination_purpose,
       SUM(daily_journeys) AS journeys
FROM tfl.rods
GROUP BY origin_purpose, destination_purpose
ORDER BY journeys DESC;


-- Origin + time
SELECT origin_purpose, time_period,
       SUM(daily_journeys) AS journeys
FROM tfl.rods
GROUP BY origin_purpose, time_period
ORDER BY origin_purpose, journeys DESC;


-- Entry zone + origin
SELECT entry_zone, origin_purpose,
       SUM(daily_journeys) AS journeys
FROM tfl.rods
GROUP BY entry_zone, origin_purpose
ORDER BY entry_zone, journeys DESC;


-- Tourist analysis
SELECT origin_purpose, destination_purpose, time_period,
       SUM(daily_journeys) AS journeys
FROM tfl.rods
WHERE origin_purpose = 'Tourist'
   OR destination_purpose = 'Tourist'
GROUP BY origin_purpose, destination_purpose, time_period
ORDER BY journeys DESC;