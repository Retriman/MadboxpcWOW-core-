-- Quest Soporte 11942
-- Fix Quest Words of Power (11942).-
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry`IN(26073,26076);