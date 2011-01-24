-- Incluido Evento Añadido en parche 3.3 Comienza en Dalaran.
-- Kalu'ak Fishing Derby "The Kalu'ak Fishing Derby is a fishing event held every Saturday between 14:00 and 15:00 by the Kalu'ak."
-- Referencias Web Informacion Relacionada con Evento con el que fue desarrollado este.
-- http://www.wowhead.com/item=50289
-- http://www.wowarmory.com/item-info.xml?i=50289
-- http://www.wowwiki.com/Kalu'ak_Fishing_Derby
-- http://www.elsanglin.com/kaluak_derby_strategy.html#pool_strategy

-- ------------------------
-- KALUAK FISHING EVENTO
-- ------------------------
SET @EventID   := 52; 
SET @ElderGUID := 250000;
SET @ElderID   := 38294;
-- Creando Evento y eliminando actual.
DELETE FROM `game_event` WHERE `entry`=52;
INSERT INTO `game_event` (`entry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`, `world_event`) VALUES 
(@EventID, '2010-09-18 14:00:00', '2020-12-30 08:00:00', 10080, 180,424, 'Kalu''ak Fishing Derby', 0);-- The Kalu'ak Fishing Derby is a fishing event held every Saturday between 14:00 and 15:00 by the Kalu'ak. Segun Wowiki.
-- Spawn Quest Giver Correspondiente (Elder Clearwater, 38294)
DELETE FROM `creature` WHERE `id` = @ElderID;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES 
(@ElderGUID, @ElderID,571,1,1,0,0,5698.52,615.774,646.676,1.26755,300,0,0,5342,0,0,0);
-- Añadiendo Equipo Correspondiente a Elder (Fishing Pole).
UPDATE `creature_template` SET `equipment_id`='38294' WHERE `entry`=@ElderID;
DELETE FROM `creature_equip_template` WHERE entry = @ElderID;
INSERT INTO `creature_equip_template` (`entry` ,`equipentry1` ,`equipentry2` ,`equipentry3`) VALUES (@ElderID,44050,0,0); -- Equip Kalu'ak Fishing Pole (44050)
-- Setenado Que la creatura solo sea visible cuando este activado el evento.
DELETE FROM `game_event_creature` WHERE `event`=@EventID;
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (@ElderGUID, @EventID);
-- loot Correspondiente
SET @Chance := 5;
SET @ChanceGlassfin := 5;
SET @ChanceOpenWater := 5;
SET @BlacktipShark := 50289;
DELETE FROM `gameobject_loot_template` WHERE `item` = @BlacktipShark;
INSERT INTO `gameobject_loot_template` (entry, item, ChanceOrQuestChance, lootmode, groupid, mincountOrRef, maxcount) VALUES
(25669, @BlacktipShark, @Chance, 1, 1, 1, 1),
(25664, @BlacktipShark, @Chance, 1, 1, 1, 1),
(25662, @BlacktipShark, @Chance, 1, 1, 1, 1),
(25668, @BlacktipShark, @Chance, 1, 1, 1, 1),
(25665, @BlacktipShark, @Chance, 1, 1, 1, 1),
(25671, @BlacktipShark, @Chance, 1, 1, 1, 1),
(25663, @BlacktipShark, @Chance, 1, 1, 1, 1),
(25674, @BlacktipShark, @Chance, 1, 1, 1, 1),
(25673, @BlacktipShark, @Chance, 1, 1, 1, 1),
(25670, @BlacktipShark, @ChanceGlassfin, 1, 1, 1, 1);
-- Loot water spots
DELETE FROM `reference_loot_template` WHERE `item` = @BlacktipShark;
INSERT INTO `reference_loot_template` (entry, item, ChanceOrQuestChance, lootmode, groupid, mincountOrRef, maxcount) VALUES
(11018, @BlacktipShark, @ChanceOpenWater, 1, 1, 1, 1), -- howling fjord / tundra
(11019, @BlacktipShark, @ChanceOpenWater, 1, 1, 1, 1), -- grizzly hills
(11020, @BlacktipShark, @ChanceOpenWater, 1, 1, 1, 1), -- dragonblight
(11021, @BlacktipShark, @ChanceOpenWater, 1, 1, 1, 1), -- crystalsong forest
(11022, @BlacktipShark, @ChanceOpenWater, 1, 1, 1, 1); -- sholazar basin
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`='4' AND `SourceGroup` = @BlacktipShark;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `Comment`) VALUES
-- Pools
(4,25669,@BlacktipShark,0,12,@EventID,0,0,0, 'Kalu\'ak Fishing Derby, Blacktip Shark in Borean Man O\' War School'),
(4,25664,@BlacktipShark,0,12,@EventID,0,0,0, 'Kalu\'ak Fishing Derby, Blacktip Shark in Dragonfin Angelfish School'),
(4,25662,@BlacktipShark,0,12,@EventID,0,0,0, 'Kalu\'ak Fishing Derby, Blacktip Shark in Glacial Salmon School'),
(4,25668,@BlacktipShark,0,12,@EventID,0,0,0, 'Kalu\'ak Fishing Derby, Blacktip Shark in Imperial Manta Ray School'),
(4,25665,@BlacktipShark,0,12,@EventID,0,0,0, 'Kalu\'ak Fishing Derby, Blacktip Shark in Musselback Sculpin School'),
(4,25671,@BlacktipShark,0,12,@EventID,0,0,0, 'Kalu\'ak Fishing Derby, Blacktip Shark in Deep Sea Monsterbelly School'),
(4,25663,@BlacktipShark,0,12,@EventID,0,0,0, 'Kalu\'ak Fishing Derby, Blacktip Shark in Fangtooth Herring School'),
(4,25674,@BlacktipShark,0,12,@EventID,0,0,0, 'Kalu\'ak Fishing Derby, Blacktip Shark in Glassfin Minnow School'),
(4,25673,@BlacktipShark,0,12,@EventID,0,0,0, 'Kalu\'ak Fishing Derby, Blacktip Shark in Moonglow Cuttlefish School'),
(4,25670,@BlacktipShark,0,12,@EventID,0,0,0, 'Kalu\'ak Fishing Derby, Blacktip Shark in Nettlefish School'),
-- Water Spots
(10,11018,@BlacktipShark,0,12,@EventID,0,0,0, 'Kalu\'ak Fishing Derby, Blacktip Shark in Howling Fjord / Borean Tundra'),
(10,11019,@BlacktipShark,0,12,@EventID,0,0,0, 'Kalu\'ak Fishing Derby, Blacktip Shark in Grizzly Hills'),
(10,11020,@BlacktipShark,0,12,@EventID,0,0,0, 'Kalu\'ak Fishing Derby, Blacktip Shark in Dragonblight'),
(10,11021,@BlacktipShark,0,12,@EventID,0,0,0, 'Kalu\'ak Fishing Derby, Blacktip Shark in Crystalsong Forest'),
(10,11022,@BlacktipShark,0,12,@EventID,0,0,0, 'Kalu\'ak Fishing Derby, Blacktip Shark in Sholazar Basin');
-- Update Textos Quest.
UPDATE `quest_template` SET `OfferRewardText`='Don\'t just stand there! Give me the shark and I\'ll declare you the winner!', `RequestItemsText`='The Kalu\'ak have a long tradition of honing our fishing skills by putting them to the test every week.\n\nThe first person to catch and bring a blacktip shark to me will be rewarded handsomely, and be known as the greatest fisherman of the north... for a couple of days at least.\n\nThe blacktip shark\'s favorite food is the pygmy suckerfish. Try fishing for the blacktip wherever you would normally catch the suckerfish.' WHERE  `entry`=24803;
UPDATE `quest_template` SET `OfferRewardText`='Well, it\'s nice that you tried $r. I don\'t want you to think your efforts were wasted, so I\'ve got something for you.', `RequestItemsText`='I\'m afraid we\'ve already had a winner for today, young $n. However, if you bring a shark, I\'ll see that it\'s released back into the waters, and I might just have a little something for you...' WHERE `entry`=24806;
-- UPDATE `creature_template` SET `ScriptName`='npc_kaluak_fishing' WHERE `entry`=38294;
