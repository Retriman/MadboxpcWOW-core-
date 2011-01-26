-- Fix Exploit Isle Of conquest 
UPDATE creature_template SET `ScriptName`='bosses_isle_of_conquest' WHERE `entry` IN (34924,34922);