-- ---------------------------------
-- Winter Veil
-- ---------------------------------

-- Quest/Achievement: Metzen the Reindeer / Save
-- By "dx2 - ZxBiohazardZx" Muchas Gracias (Team TDB).
SET @Guid = 513081; -- SELECT `guid` FROM  `gameobject` ORDER BY guid DESC LIMIT 1; Sacar Ultimo Guid del server del Spawn de Object.
SET @Gossip = 21252; -- SELECT `menu_id` FROM  `gossip_menu_option` ORDER BY menu_id DESC LIMIT 1; Obtener ultimo Gossip Scripts.
SET @Metzen = 15664; -- Metzen the Reindeer
SET @Dustspell =25952; -- Reindeer Dust Effect
UPDATE `creature_template` SET `gossip_menu_id`=@Gossip+0,`AIName`='SmartAI' WHERE `entry`=@Metzen;
-- Gossips
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@Gossip+0 AND `id`=0;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@Gossip+0,0,0, 'Sprinkle some of the reindeer dust onto Metzen.' ,1,1,@Gossip+1,0,0,0,0,NULL);
DELETE FROM `gossip_menu` WHERE `text_id` IN (8076,8077);
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(@Gossip+0,8076),
(@Gossip+1,8077);
-- SAI scripts: On gossip option select: cast a spell, do an emote and give killcredit
DELETE FROM `smart_scripts` WHERE `entryorguid`=@Metzen AND `source_type`=0 AND `id` IN (0,1);
DELETE FROM `smart_scripts` WHERE `entryorguid`=@Metzen*100 AND `source_type`=9 AND `id` IN (0,1,2,3);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@Metzen,0,0,0,62,0,100,0,@Gossip+0,0,0,0,80,@Metzen*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Metzen the Reindeer: Call action list on gossip select'),
(@Metzen,0,1,0,62,0,100,0,@Gossip+0,0,0,0,33,@Metzen,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Metzen the Reindeer: Give kill credit on gossip select'),
(@Metzen*100,9,0,0,0,0,100,0,0,0,0,0,11,@Dustspell,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Metzen the Reindeer: Cast Reindeer Dust Effect'),
(@Metzen*100,9,1,0,0,0,100,0,7500,7500,0,0,5,53,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Metzen the Reindeer: Do battle roar emote after 7.5 seconds');
-- (@Metzen*100,9,2,0,0,0,100,0,8000,8000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Metzen the Reindeer: Despawn self after 8 seconds');
-- Spawn stable and fences
DELETE FROM `gameobject` WHERE `id` IN (180719,180742);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@Guid+0,180719,1,1,1,-8089.22,-5275.14,1.23688,1.75167,0,0,0.768079,0.640355,300,0,1), -- Metzen's Stable
(@Guid+1,180742,0,1,1,-6606.33,-1860.82,244.459,6.27864,0,0,0.00227228,-0.999997,300,0,1), -- Metzen's Fencing
(@Guid+2,180742,0,1,1,-6606.36,-1857.85,244.382,6.2433,0,0,0.0199423,-0.999801,300,0,1),
(@Guid+3,180742,0,1,1,-6609.29,-1854.76,244.234,1.58196,0,0,0.711042,0.703149,300,0,1),
(@Guid+4,180742,0,1,1,-6606.33,-1854.91,244.308,1.55211,0,0,0.700471,0.713681,300,0,1),
(@Guid+5,180742,0,1,1,-6612.22,-1854.84,244.179,3.15825,0,0,0.999965,-0.00832624,300,0,1),
(@Guid+6,180742,0,1,1,-6612.16,-1857.78,244.212,3.15432,0,0,0.99998,-0.00636482,300,0,1),
(@Guid+7,180742,0,1,1,-6612.09,-1860.72,244.247,4.69763,0,0,0.712307,-0.701868,300,0,1),
(@Guid+8,180742,0,1,1,-6609.11,-1860.79,244.347,4.73297,0,0,0.699791,-0.714347,300,0,1);
-- Assign GOs to Winter Veil event
DELETE FROM `game_event_gameobject` WHERE `guid` BETWEEN @Guid+0 AND @Guid+8 AND `event`=2;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@Guid+0,2),(@Guid+1,2),(@Guid+2,2),
(@Guid+3,2),(@Guid+4,2),(@Guid+5,2),
(@Guid+6,2),(@Guid+7,2),(@Guid+8,2);
-- Spell script for creature despawn
DELETE FROM `spell_scripts` WHERE `id`=@Dustspell;
INSERT INTO `spell_scripts` (`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES (@Dustspell,0,0,18,0,0,0,0,0,0,0); -- Reindeer Dust Effect: Despawn
-- Gossip menu option conditions: requires item Pouch of Reindeer Dust
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@Gossip+0 AND `SourceEntry`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`Comment`) VALUES
(15,@Gossip+0,0,2,21211,1, 'Metzen the Reindeer: Gossip option - player should have item Pouch of Reindeer Dust in inventory');
-- Uneeded anymore since we added gossip_menu
DELETE FROM `npc_gossip` WHERE `npc_guid` IN (89432,89440);
-- Add The Hero of the Day quest to Holly Preserver
DELETE FROM `gameobject_involvedrelation` WHERE `id`=180715;
INSERT INTO `gameobject_involvedrelation` (`id`,`quest`) VALUES 
(180715,8763), -- Ally Version
(180715,8799); -- Horde Version
-- Require 300 Cooking to accept The Hero of the Day
UPDATE `quest_template` SET `SkillOrClassMask`=185,`RequiredSkillValue`=300 WHERE `entry` IN (8763,8799);
-- The Abdominable Greench: Change respawn time and add an yell on spawn
SET @Greench = 13602; -- The Abdominable Greench
UPDATE `creature` SET `spawntimesecs`=5 WHERE `id`=@Greench; -- 5 seconds respawn time
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@Greench; -- uses SAI
DELETE FROM `creature_text` WHERE `entry`=@Greench  AND `groupid`=0;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`comment`) VALUES
(@Greench ,0,0, 'RARRRRRR!' ,1, 'The Abominable Greench' );
DELETE FROM `smart_scripts` WHERE `entryorguid`=@Greench  AND `source_type`=0 AND `id`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`event_type`,`action_type`,`target_type`,`comment`) VALUES
(@Greench ,0,0,11,1,1, 'The Abominable Greench: Yell on spawn');
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@Greench;
-- DELETE FROM `creature_ai_texts` WHERE `id`=-366;
SET @MAIL:=108; -- Set in DBC
UPDATE `quest_template` SET `RewMailTemplateId`=@MAIL, `RewMailDelaySecs`=86400 WHERE `entry` IN (6963,7042); -- Set mail delivery
DELETE FROM `mail_loot_template` WHERE `entry`=@MAIL;
INSERT INTO `mail_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES 
(@MAIL,17712,100,1,0,1,1); -- Attach item to mail

/*
SET @Event = XX; -- Set by TDB Team (game_event.entry - need 1)
SET @GUID = 524081; -- Set by TDB Team (gameobject.guid - need 10)
-- Event starts 25 December at 5AM, lasts 55020 minutes (25Dec->2Jan) and occurs every 525600 minutes (one year)
DELETE FROM `game_event` WHERE `entry`=@Event;
INSERT INTO `game_event` (`entry`,`start_time`,`end_time`,`occurence`,`length`,`holiday`, `description`, `world_event`) VALUES
(@Event, '2010-12-25 05:00:00' , '2020-12-31 05:00:00' ,525600,55020,0, 'Winter Veil: Gifts' ,0);
-- Missing quest
DELETE FROM `gameobject_involvedrelation` WHERE `quest`=8788;
INSERT INTO `gameobject_involvedrelation` (`id`,`quest`) VALUES (180746,8788); -- A Gently Shaken Gift
DELETE FROM `gameobject_questrelation` WHERE `quest`=8788;
INSERT INTO `gameobject_questrelation` (`id`,`quest`) VALUES (180746,8788); -- A Gently Shaken Gift
-- Spawns
DELETE FROM `gameobject` WHERE `id` IN (180747,180748,180793,180743,180746);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GUID+0,180747,0,1,1,-4919.58,-980.674,501.46,2.15958,0,0,0,0,300,0,1), -- Gaily Wrapped Present
(@GUID+1,180747,1,1,1,1626.71,-4414.16,15.8292,2.2784,0,0,0,0,300,0,1),
(@GUID+2,180748,1,1,1,1625.77,-4413.86,16.0883,4.80049,0,0,0,0,300,0,1), -- Ticking Present
(@GUID+3,180748,0,1,1,-4921.04,-981.624,501.464,1.81635,0,0,0,0,300,0,1),
(@GUID+4,180793,0,1,1,-4916.73,-982.109,501.884,1.72839,0,0,0,0,300,0,1), -- A Festive Gift
(@GUID+5,180793,1,1,1,1625.46,-4415.83,15.4469,2.11818,0,0,0,0,300,0,1),
(@GUID+6,180743,0,1,1,-4915.83,-981.304,501.759,1.99149,0,0,0,0,300,0,1), -- A Carefully Wrapped Present
(@GUID+7,180743,1,1,1,1623.6,-4415.36,15.1169,0.75159,0,0,0,0,300,0,1),
(@GUID+8,180746,0,1,1,-4915.18,-978.104,501.451,5.56505,0,0,0,0,300,0,1), -- A Gently Shaken Gift
(@GUID+9,180746,1,1,1,1624.53,-4414.58,15.9044,1.30844,0,0,0,0,300,0,1);
-- Game event relation (only spawns during the event)
DELETE FROM `game_event_gameobject` WHERE `event`=@Event AND `guid` BETWEEN @GUID+0 AND @GUID+9;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GUID+0,@Event),(@GUID+1,@Event),
(@GUID+2,@Event),(@GUID+3,@Event),
(@GUID+4,@Event),(@GUID+5,@Event),
(@GUID+6,@Event),(@GUID+7,@Event),
(@GUID+8,@Event),(@GUID+9,@Event);*/