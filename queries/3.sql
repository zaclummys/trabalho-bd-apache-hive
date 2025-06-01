SELECT crime.crime_type, SUM(crime.occurrences) AS total_ocorrencias
FROM crime
INNER JOIN time ON crime.time_id = time.time_id
INNER JOIN segment ON crime.segment_id = segment.segment_id
INNER JOIN vertex ON segment.start_vertex_id = vertex.vertex_id
INNER JOIN neighborhood ON vertex.neighborhood_id = neighborhood.neighborhood_id
WHERE neighborhood.name = 'SANTA EFIGÊNIA'
  AND time.year = 2015
  AND crime.crime_type IN ('Roubo de Celular', 'Roubo de Carro')
GROUP BY crime.crime_type;
