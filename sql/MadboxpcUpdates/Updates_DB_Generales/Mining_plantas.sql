-- Solucionando Problema Mining Northerend Reportado en http://code.google.com/p/madboxpcwow/issues/detail?id=19&q=owner:Retriman#makechanges
-- SELECT * FROM `pool_template` WHERE `entry` IN (5181,899,5000,5121,898,897,896);
-- Fix Test Pool Entry
UPDATE `pool_template` t SET `max_limit`=(SELECT COUNT(pool_entry) FROM pool_gameobject WHERE pool_entry=t.entry)/2 WHERE max_limit > 5; 
UPDATE `pool_template` SET `max_limit` =21 WHERE `entry` =5181;-- Grizzly Hills Mineral MASTER
UPDATE `pool_template` SET `max_limit` =63 WHERE `entry` =899;-- MASTER Minerals Sholazar Basin zone 3711
UPDATE `pool_template` SET `max_limit` =32 WHERE `entry` =5000;-- Borean Tundra Mineral MASTER
UPDATE `pool_template` SET `max_limit` =30 WHERE `entry` =5121;-- Howling Fjord Mineral MASTER
UPDATE `pool_template` SET `max_limit` =48 WHERE `entry` =898;-- MASTER Minerals Storm Peaks zone 67
UPDATE `pool_template` SET `max_limit` =69 WHERE `entry` =897;-- MASTER Minerals Icecrown zone 210
UPDATE `pool_template` SET `max_limit` =32 WHERE `entry` =896;-- MASTER Minerals Wintergrasp zone 4197
