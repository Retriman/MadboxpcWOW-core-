-- Quest The Broken Front (13228, 13231)
-- Script Texts
DELETE FROM `script_texts` WHERE `entry` BETWEEN ('-1603530') AND ('-1603516');
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`)
VALUES
(31304,-1603516,'Uhnhh.... It is too late for me, $Gsister:brother;.','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',0,0,0,0,'DYING SOLDIER - SAY1'),
(31304,-1603517,'I am... finished...','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',0,0,0,0,'DYING SOLDIER - SAY2'),
(31304,-1603518,'Stay with me, friend. I must know what happened here.','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',0,0,0,0,'DYING SOLDIER - SAY3 (Player\'s say)'),
(31304,-1603519,'We attacked under cover of a blizzard....','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',0,0,0,0,'DYING SOLDIER - SAY4'),
(31304,-1603520,'The Scourge were caught off guard... our victory was certain....','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',0,0,0,0,'DYING SOLDIER - SAY5'),
(31304,-1603521,'Then... from behind us... the Horde came from nowhere.','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',0,0,0,0,'DYING SOLDIER - SAY6'),
(31304,-1603522,'They cost us... everything...','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',0,0,0,0,'DYING SOLDIER - SAY7'),
(31273,-1603523,'Uhnhh... Don\'t.... bother with me.','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',0,0,0,0,'DYING BERSERKER - SAY1'),
(31273,-1603524,'I am... finished...','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',0,0,0,0,'DYING BERSERKER - SAY2'),
(31273,-1603525,'Hold on friend. Tell me what happened here.','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',0,0,0,0,'DYING BERSERKER - SAY3'),
(31273,-1603526,'Gathering... information.... on the Scourge.','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',0,0,0,0,'DYING BERSERKER - SAY4 (Player\'s say)'),
(31273,-1603527,'Alliance forces appeared...','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',0,0,0,0,'DYING BERSERKER - SAY5'),
(31273,-1603528,'We took cover - waited until they attacked the gate, then we hit them from the rear.','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',0,0,0,0,'DYING BERSERKER - SAY6'),
(31273,-1603529,'Pinched between us... and the Scourge... it was too much for them...','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',0,0,0,0,'DYING BERSERKER - SAY7'),
(31273,-1603530,'Brother... it was... glorious.','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',0,0,0,0,'DYING BERSERKER - SAY8');
-- ScriptName
UPDATE `creature_template` SET `ScriptName`='npc_dying_berserker' WHERE `entry`=31273; -- Dying Berserker