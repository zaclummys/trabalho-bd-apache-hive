-- 4. Qual o total de crimes por tipo em vias de mão única da cidade durante o ano de 2012?
SELECT 
  SUM(crime.total_feminicide)              AS soma_total_feminicide,
  SUM(crime.total_homicide)                AS soma_total_homicide,
  SUM(crime.total_felony_murder)           AS soma_total_felony_murder,
  SUM(crime.total_bodily_harm)             AS soma_total_bodily_harm,
  SUM(crime.total_theft_cellphone)         AS soma_total_theft_cellphone,
  SUM(crime.total_armed_robbery_cellphone) AS soma_total_armed_robbery_cellphone,
  SUM(crime.total_theft_auto)              AS soma_total_theft_auto,
  SUM(crime.total_armed_robbery_auto)      AS soma_total_armed_robbery_auto
FROM crime
JOIN segment ON segment.segment_id = crime.segment_id
JOIN `time` ON crime.time_id = `time`.time_id
WHERE segment.oneway = 'yes'
  AND `time`.year = 2012;