-- Fix Familiar del Kirin Tor http://code.google.com/p/madboxpcwow/issues/detail?id=293&q=owner:Retriman&sort=-id
DELETE FROM `npc_text` WHERE `ID` =40000;
INSERT INTO `npc_text` (ID,text0_0) VALUES 
(40000,'Amazing! There are passages in here that I have never seen before. This must have taken quite a while for you to track down. If you ever find anymore books like this, I would like to be notified immediately. $B$BPlease take one of my Kirin Tor Familiars with you just in case you stumble across anything.');
UPDATE `creature_template` SET `ScriptName` = 'npc_archmage_vargoth' WHERE `entry` = 19481;    
