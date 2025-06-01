SELECT crime.crime_type, crime.segment_id, SUM(crime.occurrences) AS total_crimes
FROM crime
INNER JOIN time ON crime.time_id = time.time_id
INNER JOIN segment ON crime.segment_id = segment.segment_id
INNER JOIN vertex ON segment.start_vertex_id = vertex.vertex_id
INNER JOIN district ON vertex.district_id = district.district_id
WHERE district.name = 'IGUATEMI'
  AND time.year BETWEEN 2006 AND 2016
GROUP BY crime.crime_type, crime.segment_id;
