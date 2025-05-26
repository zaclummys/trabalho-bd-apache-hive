SELECT crime.segment_id, crime.crime_type, SUM(crime.count) AS total_crimes
FROM crime
INNER JOIN time ON crime.time_id = time.time_id
INNER JOIN segment ON crime.segment_id = segment.segment_id
INNER JOIN vertice ON segment.start_vertex = vertice.vertex_id
INNER JOIN district ON vertice.district_id = district.district_id
WHERE district.name = 'IGUATEMI' AND time.year = 2016
GROUP BY crime.segment_id, crime.crime_type;
