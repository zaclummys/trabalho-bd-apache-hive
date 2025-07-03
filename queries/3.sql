SELECT 
    SUM(soma_total_theft_cellphone) AS total_roubo_celular,
    SUM(soma_total_theft_auto) AS total_roubo_carro,
    name
FROM (
    SELECT 
        SUM(crime.total_theft_cellphone) AS soma_total_theft_cellphone,
        SUM(crime.total_theft_auto) AS soma_total_theft_auto,
        n_final.name AS name
    FROM crime
    JOIN segment ON segment.segment_id = crime.segment_id
    JOIN vertice AS vertice_final ON vertice_final.vertice_id = segment.final_vertice_id
    JOIN neighborhood n_final ON vertice_final.neighborhood_id = n_final.neighborhood_id
    JOIN `time` ON `time`.time_id = crime.time_id
    WHERE LOWER(n_final.name) LIKE 'santa efig_nia' AND `time`.year = '2015'
    GROUP BY n_final.name

    UNION ALL

    SELECT 
        SUM(crime.total_theft_cellphone) AS soma_total_theft_cellphone,
        SUM(crime.total_theft_auto) AS soma_total_theft_auto,
        n_start.name AS name
    FROM crime
    JOIN segment ON segment.segment_id = crime.segment_id
    JOIN vertice AS vertice_inicial ON vertice_inicial.vertice_id = segment.start_vertice_id
    JOIN neighborhood n_start ON vertice_inicial.neighborhood_id = n_start.neighborhood_id
    JOIN `time` ON `time`.time_id = crime.time_id
    WHERE LOWER(n_start.name) LIKE 'santa efig_nia' AND `time`.year = '2015'
    GROUP BY n_start.name
) AS union_tables
GROUP BY name;