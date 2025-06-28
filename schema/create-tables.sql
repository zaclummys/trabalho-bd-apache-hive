CREATE TABLE IF NOT EXISTS crime (
  id INT,
  total_feminicide INT,
  total_homicide INT,
  total_felony_murder INT,
  total_bodily_harm INT, 
  total_theft_cellphone INT,
  total_armed_robbery_cellphone INT, 
  total_theft_auto INT, 
  total_armed_robbery_auto INT, 
  segment_id INT,
  time_id INT
)
CLUSTERED BY (segment_id) INTO 4 BUCKETS
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ';'
STORED AS TEXTFILE;

CREATE TABLE IF NOT EXISTS segment (
  segment_id INT,
  geometry STRING,
  oneway STRING,
  length FLOAT,
  final_vertice_id INT,
  start_vertice_id INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ';'
STORED AS TEXTFILE;

CREATE TABLE IF NOT EXISTS vertice (
  vertice_id INT,
  label STRING,
  district_id INT,
  neighborhood_id INT,
  zone_id INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ';'
STORED AS TEXTFILE;

CREATE TABLE IF NOT EXISTS district (
  district_id INT,
  name STRING,
  geometry STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ';'
STORED AS TEXTFILE;

CREATE TABLE IF NOT EXISTS neighborhood (
  neighborhood_id INT,
  name STRING,
  geometry STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ';'
STORED AS TEXTFILE;

CREATE TABLE IF NOT EXISTS `time` ( 
  `time_id` STRING, 
  `period` STRING, 
  `day` STRING, 
  `month` STRING,
  `year` STRING, 
  `weekday` STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ';'
STORED AS TEXTFILE;

