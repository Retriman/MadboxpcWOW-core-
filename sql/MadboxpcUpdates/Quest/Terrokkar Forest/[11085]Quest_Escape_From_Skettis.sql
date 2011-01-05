-- Fix Quest Soporte Escape from Skettis http://www.wowhead.com/quest=11085
UPDATE `creature_template` SET `ScriptName`='npc_skyguard_prisoner' WHERE `entry`=23383;
DELETE FROM `script_texts` WHERE `entry` IN (-1000716,-1000717,-1000718) AND `npc_entry`=23383; 
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(23383,-1000716,'Thanks for your help. Let\'s get out of here!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'SAY_START'),
(23383,-1000717,'Let\'s keep moving. I don\'t like this place.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'SAY_DONT_LIKE'),
(23383,-1000718,'Thanks again. Sergeant Doryn will be glad to hear he has one less scout to replace this week.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'SAY_COMPLETE');
