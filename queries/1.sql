-- 1. Qual o total de crimes por tipo e por segmento das ruas do distrito de IGUATEMI durante o ano de 2016?
SELECT
  SUM(soma_total_feminicide)              AS soma_total_feminicide,
  SUM(soma_total_homicide)                AS soma_total_homicide,
  SUM(soma_total_felony_murder)           AS soma_total_felony_murder,
  SUM(soma_total_bodily_harm)             AS soma_total_bodily_harm,
  SUM(soma_total_theft_cellphone)         AS soma_total_theft_cellphone,
  SUM(soma_total_armed_robbery_cellphone) AS soma_total_armed_robbery_cellphone,
  SUM(soma_total_theft_auto)              AS soma_total_theft_auto,
  SUM(soma_total_armed_robbery_auto)      AS soma_total_armed_robbery_auto,
  segment_id
FROM (
  SELECT 
    SUM(crime.total_feminicide)              AS soma_total_feminicide,
    SUM(crime.total_homicide)                AS soma_total_homicide,
    SUM(crime.total_felony_murder)           AS soma_total_felony_murder,
    SUM(crime.total_bodily_harm)             AS soma_total_bodily_harm,
    SUM(crime.total_theft_cellphone)         AS soma_total_theft_cellphone,
    SUM(crime.total_armed_robbery_cellphone) AS soma_total_armed_robbery_cellphone,
    SUM(crime.total_theft_auto)              AS soma_total_theft_auto,
    SUM(crime.total_armed_robbery_auto)      AS soma_total_armed_robbery_auto,
    segment.segment_id                       AS segment_id
  FROM crime
  JOIN segment ON segment.segment_id = crime.segment_id
  JOIN `time` ON `time`.time_id = crime.time_id
  JOIN vertice start_vertice ON segment.start_vertice_id = start_vertice.vertice_id
  JOIN district ON start_vertice.district_id = district.district_id
  WHERE district.name = 'IGUATEMI' AND `time`.year = 2016
  GROUP BY segment.segment_id

  UNION ALL

  SELECT 
    SUM(crime.total_feminicide)              AS soma_total_feminicide,
    SUM(crime.total_homicide)                AS soma_total_homicide,
    SUM(crime.total_felony_murder)           AS soma_total_felony_murder,
    SUM(crime.total_bodily_harm)             AS soma_total_bodily_harm,
    SUM(crime.total_theft_cellphone)         AS soma_total_theft_cellphone,
    SUM(crime.total_armed_robbery_cellphone) AS soma_total_armed_robbery_cellphone,
    SUM(crime.total_theft_auto)              AS soma_total_theft_auto,
    SUM(crime.total_armed_robbery_auto)      AS soma_total_armed_robbery_auto,
    segment.segment_id                       AS segment_id
  FROM crime
  JOIN segment ON segment.segment_id = crime.segment_id
  JOIN `time` ON `time`.time_id = crime.time_id
  JOIN vertice end_vertice ON segment.final_vertice_id = end_vertice.vertice_id
  JOIN district ON end_vertice.district_id = district.district_id
  WHERE district.name = 'IGUATEMI' AND `time`.year = 2016
  GROUP BY segment.segment_id
) union_tables
GROUP BY segment_id;