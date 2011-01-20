-- Quest Deep in the Bowels of the Underhalls (13042)
-- Script Texts
DELETE FROM `script_texts` WHERE `entry` IN (-1603500,-1603501);
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`)
VALUES
(30409,-1603500,'You\'ve come for the doctor\'s plans! You\'ll only find death!','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',0,0,0,0,'Apprentice Osterkilgr - SAY_QUEST1'),
(30409,-1603501,'The doctor entrusted me with the plans to Nergeld! I will not fail!','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',0,0,0,0,'Apprentice Osterkilgr - SAY_QUEST2');
-- ScriptName
UPDATE `creature_template` SET `ScriptName`='npc_apprentice_osterkilgr',`AIName`='' WHERE `entry`=30409; -- Apprentice Osterkilgr

