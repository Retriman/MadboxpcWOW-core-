UPDATE `gameobject_template` SET `ScriptName`='npc_mana_bomb' WHERE `entry`=184725;
DELETE FROM `script_texts` WHERE `entry` IN (-1000472,-1000473,-1000474,-1000475,-1000476) AND `npc_entry`=20767; 
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(20767,-1000472,'1...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'mana bomb SAY_COUNT_1'),
(20767,-1000473,'2...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'mana bomb SAY_COUNT_2'),
(20767,-1000474,'3...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'mana bomb SAY_COUNT_3'),
(20767,-1000475,'4...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'mana bomb SAY_COUNT_4'),
(20767,-1000476,'5...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'mana bomb SAY_COUNT_5');
