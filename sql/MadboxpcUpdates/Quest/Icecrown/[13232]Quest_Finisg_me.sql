-- Quest Finish me! (13232)
-- Script Texts
DELETE FROM `script_texts` WHERE `entry` BETWEEN (-1603515) AND (-1603511);
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`)
VALUES
(30658,-1603511,'Please $R... Release me...','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',0,0,0,0,'Dying NPC - SAY1'),
(30658,-1603512,'Don\'t think $C...Just..do it...','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',0,0,0,0,'Dying NPC - SAY2'),
(30658,-1603513,'Send me on my way...I beg you...','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',0,0,0,0,'Dying NPC - SAY3'),
(30658,-1603514,'Do it $C...then...avenge me!','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',0,0,0,0,'Dying NPC - SAY4'),
(30658,-1603515,'Tell my family...my last thoughts were of them...','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',0,0,0,0,'Dying NPC - SAY5');
-- ScriptName
UPDATE `creature_template` SET `ScriptName`='npc_dying_soldier' WHERE `entry`=31304; -- Dying Soldier