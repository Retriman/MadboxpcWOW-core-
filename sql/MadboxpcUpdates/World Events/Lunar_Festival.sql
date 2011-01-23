-- Lunar Festival
UPDATE `creature_template` SET `ScriptName`='boss_omen' WHERE `entry`=15467;
UPDATE `item_template` SET `ScriptName`='item_green_rocket_cluster' WHERE `entry`=21574;
-- Spawn Rocket Cluster
DELETE FROM `gameobject` WHERE `id`=180859;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
('12439752','180859','1','1','1','7627.31','-2902.84','464.438','4.6476','0','0','0.729636','-0.683835','300','0','1'),
('12440308','180859','1','1','1','7621.55','-2936.24','461.938','1.3505','0','0','0.625092','0.780551','300','0','1'),
('12440309','180859','1','1','1','7657.52','-2938.87','464.645','2.69824','0','0','0.97553','0.219865','300','0','1'),
('12440310','180859','1','1','1','7586.59','-2890.75','463.798','5.46598','0','0','0.397326','-0.917677','300','0','1');
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
('12439752','7'),
('12440308','7'),
('12440309','7'),
('12440310','7');
-- Spawn Elder Chogan'gada
INSERT INTO `creature` VALUES ('11738274','30538','571','1','1','0','0','1248.72','-4834.37','217.463','0.349193','300','0','0','12096','8814','0','0','0','0','0');
INSERT INTO `game_event_creature` VALUES ('11738274','7');

-- Update Quest_conditions for Quest: The Lunar Festival
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceEntry`IN(8870,8871,8872,8873,8874,8875);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES 
-- Alliance
(19,0,8871,0,4,1519,0,0,0,0,'The Lunar Festival: Stormwind'),
(19,0,8872,0,4,1657,0,0,0,0,'The Lunar Festival: Darnassus'),
(19,0,8870,0,4,1537,0,0,0,0,'The Lunar Festival: Ironforge'),
-- Horde
(19,0,8873,0,4,1637,0,0,0,0,'The Lunar Festival: Orgrimmar'),
(19,0,8874,0,4,1497,0,0,0,0,'The Lunar Festival: Undercity'),
(19,0,8875,0,4,1638,0,0,0,0,'The Lunar Festival: Thunder Bluff');
-- Quest: Lunar Fireworks 
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (15872,15873,15874,15879,15880,15882);
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (15872,15873,15874,15879,15880,15882); -- Cleanup
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (15872,15873,15874,15879,15880,15882);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
-- small fireworks
-- blue firework
(15879,0,0,0,1,0,100,1,0,0,0,0,33,15893,0,0,0,0,0,18,20,0,0,0,0,0,0, 'give credit'),
(15879,0,1,0,1,0,100,1,0,0,0,0,11,26344,2,0,0,0,0,1,0,0,0,0,0,0,0, 'cast fireworks'),
-- green firework
(15880,0,0,0,1,0,100,1,0,0,0,0,33,15893,0,0,0,0,0,18,20,0,0,0,0,0,0, 'give credit'),
(15880,0,1,0,1,0,100,1,0,0,0,0,11,26345,2,0,0,0,0,1,0,0,0,0,0,0,0, 'cast fireworks'),
-- red firework
(15882,0,0,0,1,0,100,1,0,0,0,0,33,15893,0,0,0,0,0,18,20,0,0,0,0,0,0, 'give credit'),
(15882,0,1,0,1,0,100,1,0,0,0,0,11,26347,2,0,0,0,0,1,0,0,0,0,0,0,0, 'cast fireworks'),
-- big fireworks
-- blue firework
(15872,0,0,0,1,0,100,1,0,0,0,0,33,15894,0,0,0,0,0,18,20,0,0,0,0,0,0, 'give credit'),
(15872,0,1,0,1,0,100,1,0,0,0,0,11,26344,2,0,0,0,0,1,0,0,0,0,0,0,0, 'cast fireworks'),
-- red firework
(15873,0,0,0,1,0,100,1,0,0,0,0,33,15894,0,0,0,0,0,18,20,0,0,0,0,0,0, 'give credit'),
(15873,0,1,0,1,0,100,1,0,0,0,0,11,26347,2,0,0,0,0,1,0,0,0,0,0,0,0, 'cast fireworks'),
-- green firework
(15874,0,0,0,1,0,100,1,0,0,0,0,33,15894,0,0,0,0,0,18,20,0,0,0,0,0,0, 'give credit'),
(15874,0,1,0,1,0,100,1,0,0,0,0,11,26345,2,0,0,0,0,1,0,0,0,0,0,0,0, 'cast fireworks');
-- Remove useless quests: (as of patch 3.0 they where removed)
DELETE FROM `creature_questrelation` WHERE `quest` IN (8876,8877,8878,8879,8880,8881,8882,8862,8863,8864,8865);


