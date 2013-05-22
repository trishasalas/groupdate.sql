START TRANSACTION;

-- second

DROP FUNCTION IF EXISTS gd_second;
DELIMITER $$
CREATE FUNCTION gd_second(ts TIMESTAMP, time_zone VARCHAR(255))
  RETURNS TIMESTAMP
BEGIN
  RETURN DATE_FORMAT(CONVERT_TZ(ts, @@session.time_zone, time_zone), '%Y-%m-%d %H:%i:%S');
END;
$$
DELIMITER ;


-- minute

DROP FUNCTION IF EXISTS gd_minute;
DELIMITER $$
CREATE FUNCTION gd_minute(ts TIMESTAMP, time_zone VARCHAR(255))
  RETURNS TIMESTAMP
BEGIN
  RETURN DATE_FORMAT(CONVERT_TZ(ts, @@session.time_zone, time_zone), '%Y-%m-%d %H:%i:00');
END;
$$
DELIMITER ;


-- hour

DROP FUNCTION IF EXISTS gd_hour;
DELIMITER $$
CREATE FUNCTION gd_hour(ts TIMESTAMP, time_zone VARCHAR(255))
  RETURNS TIMESTAMP
BEGIN
  RETURN DATE_FORMAT(CONVERT_TZ(ts, @@session.time_zone, time_zone), '%Y-%m-%d %H:00:00');
END;
$$
DELIMITER ;


-- day

DROP FUNCTION IF EXISTS gd_day;
DELIMITER $$
CREATE FUNCTION gd_day(ts TIMESTAMP, time_zone VARCHAR(255))
  RETURNS TIMESTAMP
BEGIN
  RETURN DATE_FORMAT(CONVERT_TZ(ts, @@session.time_zone, time_zone), '%Y-%m-%d 00:00:00');
END;
$$
DELIMITER ;


-- week

DROP FUNCTION IF EXISTS gd_week;
DELIMITER $$
CREATE FUNCTION gd_week(ts TIMESTAMP, time_zone VARCHAR(255))
  RETURNS TIMESTAMP
BEGIN
  RETURN DATE_FORMAT(CONVERT_TZ(DATE_SUB(ts, INTERVAL (DAYOFWEEK(CONVERT_TZ(ts, @@session.time_zone, time_zone)) - 1) DAY), @@session.time_zone, time_zone), '%Y-%m-%d 00:00:00');
END;
$$
DELIMITER ;


-- month

DROP FUNCTION IF EXISTS gd_month;
DELIMITER $$
CREATE FUNCTION gd_month(ts TIMESTAMP, time_zone VARCHAR(255))
  RETURNS TIMESTAMP
BEGIN
  RETURN DATE_FORMAT(CONVERT_TZ(ts, @@session.time_zone, time_zone), '%Y-%m-01 00:00:00');
END;
$$
DELIMITER ;


-- year

DROP FUNCTION IF EXISTS gd_year;
DELIMITER $$
CREATE FUNCTION gd_year(ts TIMESTAMP, time_zone VARCHAR(255))
  RETURNS TIMESTAMP
BEGIN
  RETURN DATE_FORMAT(CONVERT_TZ(ts, @@session.time_zone, time_zone), '%Y-01-01 00:00:00');
END;
$$
DELIMITER ;


-- hour of day

DROP FUNCTION IF EXISTS gd_hour_of_day;
DELIMITER $$
CREATE FUNCTION gd_hour_of_day(ts TIMESTAMP, time_zone VARCHAR(255))
  RETURNS INT
BEGIN
  RETURN EXTRACT(HOUR FROM CONVERT_TZ(ts, @@session.time_zone, time_zone));
END;
$$
DELIMITER ;


-- day of week

DROP FUNCTION IF EXISTS gd_day_of_week;
DELIMITER $$
CREATE FUNCTION gd_day_of_week(ts TIMESTAMP, time_zone VARCHAR(255))
  RETURNS INT
BEGIN
  RETURN DAYOFWEEK(CONVERT_TZ(ts, @@session.time_zone, time_zone)) - 1;
END;
$$
DELIMITER ;


COMMIT;
