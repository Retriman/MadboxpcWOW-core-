-- Trial_of_Crusader_loot_emblemas.sql
-- Trial of Crusader emblem loot
UPDATE `creature_loot_template` SET `item` = '45624' WHERE `entry` IN (34797,34780,34497,34496,34564,35348,35349,35351,35352,35615,35616,35268,35269,35448,35449) AND `item` = 40753;
UPDATE `gameobject_loot_template` SET `item` = '45624' WHERE `entry` IN (27498,27335,27503,27356) AND `item` = 40753;
/*
Respaldo Querys
SELECT entry,item, mincountOrRef FROM creature_loot_template WHERE entry IN (34797,34780,34497,34496,34564,35348,35349,35351,35352,35615,35616,35268,35269,35448,35449) AND item =40753;
SELECT `data1` FROM `gameobject_template` WHERE `entry` IN (195631,195632,195633,195635);
SELECT * FROM gameobject_loot_template WHERE entry IN (27498,27335,27503,27356) AND item=40753;
*/

-- Npcs_Vendedores_Season07.sql
-- Npc's Item con Honor Originales Allianza.
-- 34075 - 34084 - 34078
DELETE FROM `creature` WHERE `id` IN (34075,34084,34078);-- Si7 - SW
DELETE FROM `creature` WHERE `id` IN (33936,33937,33938,34095);-- Vendedores Dalaran 
-- Spawn Nuevos Vendedores Acorde a Season y progecion realm.
DELETE FROM `creature` WHERE `id` in (34074,34083,34077,33926,33927,33925,34092);
INSERT INTO `creature`  (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES 
(34074,0,1,1,0,0,-8781.46,419.808,105.233,0.0219915,300,0,0,11828,0,0,0),-- Si7 - SW
(34083,0,1,1,0,0,-8775.9,423.779,105.233,5.33993,300,0,0,21270,0,0,0),-- Si7 - SW
(34077,0,1,1,0,0,-8773.7,425.886,105.233,5.33993,300,0,0,21270,0,0,0),-- Si7 - SW
(33926,0,1,1,0,0,-8769.2,402.377,109.664,2.26901,300,0,0,8025,0,0,0),-- Si7 - SW
(33927,571,1,1,0,0,5752.47,585.195,614.969,0.184662,300,0,0,8025,0,0,0),-- Dalaran Vendedor
(33925,571,1,1,0,0,5750.69,583.395,614.969,5.78455,300,0,0,8025,0,0,0),-- Dalaran Vendedor
(34092,571,1,1,0,657,5761.12,578.625,614.97,2.61547,300,0,0,6986,0,0,0);-- Dalaran Vendedor
-- Tanaris
-- remove Season 08 vendores 34093 - 33939 - 33935 - 33934
DELETE from `creature` WHERE `id` IN (34093,33939,33935,33934);
-- Spawn Nuevos Vendedores Acorde a Season y progecion realm.
DELETE from `creature` WHERE `id` IN (34090,33924,33929,33917);
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) values
(34090,1,1,1,29077,0,-7126.8,-3761.97,9.49471,0.820305,180,0,0,1,0,0,0), -- S7 - Gadgetzan
(33924,1,1,1,27953,0,-7123.33,-3766.68,9.40339,0,180,0,0,1,0,0,0), -- S7 - Gadgetzan
(33929,1,1,1,22399,0,-7120.75,-3774.16,9.0363,0.767945,180,0,0,1,0,0,0), -- S7 - Gadgetzan
(33917,1,1,1,22399,0,-7122.35,-3770.29,9.38813,0.872665,300,0,0,6986,0,0,0); -- S7 - Gadgetzan
-- Area 52 
-- remove Season 08 vendors 33940 - 33941 - 33933 - 34094
DELETE from `creature` WHERE `id` IN (33940,33941,33933,34094);
-- Spawn Nuevos Vendedores Acorde a Season y progecion realm.
DELETE from `creature` WHERE `id` IN (33916,33919);
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) values
(33916,530,1,1,0,0,3073.99,3633.34,143.779,2.09012,120,0,0,42,0,0,0), -- S7 - Area52 netherstorm
(33919,530,1,1,22393,0,3070.16,3635.11,143.864,0.750492,180,0,0,42,0,0,0); -- revisar no vende nada pero pertenece al season 07 xD
-- Orgrimmar
-- remove Season 08 vendors 34060 - 34063 - 34038
DELETE from `creature` WHERE `id` IN (34060,34063,34038);
-- Spawn Nuevos Vendedores Acorde a Season y progecion realm.
DELETE from `creature` WHERE `id` IN (34062,34059,34037); 
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) values
(34062,1,1,1,0,0,1670.17,-4199.26,56.3827,3.98664,25,0,0,11828,0,0,0), -- S7 - Orgri
(34059,1,1,1,0,0,1673.07,-4201.89,56.3826,3.62927,25,0,0,55888,0,0,0), -- S7 - Orgri
(34037,1,1,1,0,0,1669.09,-4196.78,56.3827,4.10416,25,0,0,11828,0,0,0), -- S7 - Orgri
(33926,1,1,1,0,0,1669.45,-4226.48,56.3825,2.2462,300,0,0,8025,0,0,0);
-- Clean
DELETE FROM `creature_addon` WHERE `guid` NOT IN (SELECT `guid` FROM `creature`);


-- Npc_Sin_Exp.sql
-- Npcs Sin Exp.
UPDATE `creature_template` SET `flags_extra` = 64 WHERE `entry` IN
(691,
2462,
2523,
2630,
3527,
3573,
3579,
3902,
3903,
3904,
3906,
3907,
3908,
3909,
3911,
3912,
3913,
4196,
5873,
5874,
5879,
5913,
5919,
5920,
5921,
5922,
5923,
5924,
5925,
5926,
5927,
5929,
5950,
6012,
6110,
6111,
6112,
7366,
7367,
7368,
7398,
7399,
7400,
7402,
7403,
7412,
7413,
7414,
7415,
7416,
7423,
7424,
7425,
7464,
7465,
7466,
7467,
7468,
7469,
7844,
7845,
8897,
8901,
10467,
10557,
12922,
14748,
15304,
15447,
15463,
15464,
15470,
15474,
15479,
15480,
15482,
15483,
15484,
15487,
15489,
15803,
16488,
16580,
16585,
16599,
16903,
17283,
17539,
18179,
18207,
18212,
18503,
19222,
19224,
19225,
19259,
19397,
19398,
19399,
19400,
19427,
19692,
19731,
19833,
19921,
20806,
21109,
21264,
21267,
21346,
21428,
21435,
21706,
21707,
21708,
22134,
22282,
22369,
22483,
15485,
15486,
15488,
15490,
16286,
16427,
17706,
17967,
18095,
21625,
21612,
21583,
21566,
21557,
21550,
20665,
20663,
21866,
22418,
22486,
22487,
19900,
19898,
19897,
23206,
23259,
23417,
23448,
23502,
24338,
24413,
25031,
25028,
25027,
25030,
24745,
25598,
30653,
32543,
32546,
31186,
31122,
23826,
23965,
23970,
24045,
24177,
24796,
25284,
25377,
25422,
25444,
25534,
25834,
26678,
26705,
26736,
26761,
26871,
27290,
27556,
27598,
27600,
27603,
27604,
27709,
27712,
27753,
27868,
27874,
27909,
28413,
28417,
28599,
28630,
28735,
28834,
28850,
28878,
28938,
29097,
29117,
29119,
29153,
29209,
29213,
29349,
29444,
29637,
29692,
29882,
30047,
30110,
30202,
30273,
30338,
30391,
30435,
30518,
30521,
30541,
30544,
30560,
30647,
30652,
30654,
30940,
30943,
30960,
30965,
30985,
31039,
31043,
31120,
31121,
31129,
31132,
31133,
31144,
31158,
31162,
31164,
31165,
31166,
31167,
31169,
31170,
31171,
31172,
31173,
31174,
31175,
31176,
31181,
31182,
31185,
31189,
31190,
31251,
31257,
31273,
31292,
31294,
31304,
31308,
31309,
31341,
31388,
31447,
31461,
31462,
31578,
31614,
31647,
31750,
31812,
31813,
32593,
32665,
32667,
32775,
32776,
32778,
33090,
33189,
33218,
25469, 
25333, 
25332,
12261,
31007,
31008,
31009,
30663,
30918,
30961,
30661,
30963,
30664,
31010,
30962,
30662);


-- Npc_Relentless.sql
-- Añadido Vendedores Faltantes  armas Relentless 3v3 - 5v5 (lvl 258) reportado en http://code.google.com/p/madboxpcwow/issues/detail?id=158
DELETE FROM `creature` WHERE `guid` IN (718654,718672);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(718654, 34090, 571, 1, 1, 0, 2100, 5751.81, 586.383, 614.969, 0.930669, 300, 0, 0, 6986, 0, 0, 0),
(718672, 34091, 571, 1, 1, 0, 0, 5751.55, 584.302, 614.969, 5.49776, 300, 0, 0, 6986, 0, 0, 0);
-- Clean
DELETE FROM `creature_addon` WHERE `guid` NOT IN (SELECT `guid` FROM `creature`);

-- Emblemas_335a.sql
/*
Emblem of Valor = 40753
Emblem of Conquest = 45624
Emblem of Heroism = 40752
Emblem of Triumph = 47241
Emblem of Frost = 49426
*/
-- Actualizo Loot de emblemas 
-- Emblem of Heroism a Emblem of Valor
UPDATE `creature_loot_template` SET `item` = 40753 WHERE `item` = 47241;
UPDATE `gameobject_loot_template` SET `item` = 40753 WHERE `item` = 47241;
UPDATE `item_loot_template` SET `item` = 40753 WHERE `item` = 47241;
UPDATE `reference_loot_template` SET item = 40753 WHERE item=47241;
-- Emblem of Conquest  Naxxramas 25 men 
UPDATE `creature_loot_template` SET `item` = 40753 WHERE `item` = 47241 AND `entry` IN (29324, 29373, 29417, 29448, 30061, 29991, 29940, 29955, 29249, 29268, 29278, 29718, 29701, 29615);
UPDATE `gameobject_loot_template` SET `item` = 40753 WHERE `item` = 47241 AND `entry` IN (25193);
-- Emblem of Valor a Obsidian Sanctum 25 men
UPDATE `item_loot_template` SET `item` = 40753 WHERE `item` = 47241 AND `entry` IN (43347, 43346);
-- Update quest Raid Dalaran
UPDATE `quest_template` SET `RewItemId1` = 40753, `RewItemId2` = 45624 WHERE `RewItemId1`= 49426 AND `RewItemId2`= 47241 AND `type` = 62; -- quest Raid
/* 
LOOT SE IMPLENTARA EN EL SQL COMPLETO DE ULDUAR JUNTO CON LAS CHEST
-- Emblem of Conquest a Ulduar
-- UPDATE `creature_loot_template` SET `item` = 45624 WHERE `item` = 47241 AND `entry` IN (33113, 34003, 33118, 33190, 33186, 33724, 33293, 33885, 32867, 33693, 32927, 33692, 32857, 33694, 32930, 33515, 34175, 32906, 33360, 32845, 32846, 33350, 32865, 33147, 33271, 33449, 33288, 33955, 32871);
*/
-- Trial of Crusader emblem loot
UPDATE `creature_loot_template` SET `item` = '45624' WHERE `entry` IN (34797,34780,34497,34496,34564,35348,35349,35351,35352,35615,35616,35268,35269,35448,35449) AND `item` = 40753;
UPDATE `gameobject_loot_template` SET `item` = '45624' WHERE `entry` IN (27498,27335,27503,27356) AND `item` = 40753;
/*
Respaldo Querys info
SELECT entry,item, mincountOrRef FROM creature_loot_template WHERE entry IN (34797,34780,34497,34496,34564,35348,35349,35351,35352,35615,35616,35268,35269,35448,35449) AND item =40753;
SELECT `data1` FROM `gameobject_template` WHERE `entry` IN (195631,195632,195633,195635);
SELECT * FROM gameobject_loot_template WHERE entry IN (27498,27335,27503,27356) AND item=40753;
*/


-- [711]Rewards_Dungeon_Finder.sql
-- Dungeon Finder Rewards. (Dungeons 80).
-- Quest http://www.wowhead.com/?quest=24790
-- Daily Normal Random (1st)
UPDATE `quest_template` SET  `RewItemId1` =  '40753' WHERE `entry` =24790;
-- Daily Heroic Random (1st)
UPDATE `quest_template` SET  `RewItemId1` =  '45624' WHERE `entry` =24788;
UPDATE `quest_template` SET  `RewItemId1` =  '0' WHERE `entry` =24789;


-- Mining_plantas.sql
-- Solucionando Problema Mining Northerend Reportado en http://code.google.com/p/madboxpcwow/issues/detail?id=19&q=owner:Retriman#makechanges
-- SELECT * FROM `pool_template` WHERE `entry` IN (5181,899,5000,5121,898,897,896);
-- Fix Test Pool Entry
UPDATE `pool_template` t SET `max_limit`=(SELECT COUNT(pool_entry) FROM pool_gameobject WHERE pool_entry=t.entry)/2 WHERE max_limit > 5; 
UPDATE `pool_template` SET `max_limit` =21 WHERE `entry` =5181;-- Grizzly Hills Mineral MASTER
UPDATE `pool_template` SET `max_limit` =63 WHERE `entry` =899;-- MASTER Minerals Sholazar Basin zone 3711
UPDATE `pool_template` SET `max_limit` =32 WHERE `entry` =5000;-- Borean Tundra Mineral MASTER
UPDATE `pool_template` SET `max_limit` =30 WHERE `entry` =5121;-- Howling Fjord Mineral MASTER
UPDATE `pool_template` SET `max_limit` =48 WHERE `entry` =898;-- MASTER Minerals Storm Peaks zone 67
UPDATE `pool_template` SET `max_limit` =69 WHERE `entry` =897;-- MASTER Minerals Icecrown zone 210
UPDATE `pool_template` SET `max_limit` =32 WHERE `entry` =896;-- MASTER Minerals Wintergrasp zone 4197

-- Vehicles_Heal_reset.sql
-- Fix heal Vehiculos Mecanicos, No se pueden regenerar heal al bajarse de ellos nunca.
UPDATE `creature_template` SET `RegenHealth` = '0' WHERE `IconName` = 'vehichleCursor' AND VehicleId != 0;

-- Disables.sql
-- Disables.
DELETE FROM `disables` WHERE `entry` IN (10,11,30,603,631,249,658,668,649,650,724,632,624,616,11129,53260,53256,53259);
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `comment`) VALUES
(3, 10, 0, 'Dalaran Sewers'),
(3, 11, 0, 'The Ring of Valor'),
(3, 30, 0, 'Isle of Conquest'),
(2, 603, 3, 'Ulduar'),
(2, 631, 3, 'Icecrown Citadel Raid'),
(2, 658, 3, 'Pit Of Saron'),
(2, 668, 3, 'Halls of Reflection'),
(2, 649, 3, 'Argent Tournament Raid'),
(2, 650, 3, 'Argent Tournament Dungeon'),
(2, 724, 3, 'The Ruby Sanctum'),
(2, 632, 3, 'Forge of Souls'),
(2, 624, 3, 'Vault of Archavon'),
(2, 616, 2, 'The Eye of Eternity Heroic'),
(0, 11129, 1, 'Combustion Disable hasta fixear Cargas.'),
(0, 53260, 1, 'Cobra Strikes Rank 3 - Fixear Mele hit sobre owner.'),
(0, 53256, 1, 'Cobra Strikes Rank 1 - Fixear Mele hit sobre owner.'),
(0, 53259, 1, 'Cobra Strikes Rank 2 - Fixear Mele hit sobre owner.');

-- Graveyards.sql
-- Graveyards
DELETE FROM `game_graveyard_zone` WHERE `ghost_zone` IN (3714,2677,1584,2717,1583,1537,3923);
INSERT INTO `game_graveyard_zone` (`id`,`ghost_zone`,`faction`) VALUES
(920,3714,67), -- H The Shattered Halls -> Thrallmar
(919,3714,469), -- A The Shattered Halls -> Honor Hold
(1469,2677,0), -- Blackwing Lair -> Burning Steppes, Blackrock Mountain
(1469,1584,0), -- Blackrock Depths -> Burning Steppes, Blackrock Mountain
(1469,2717,0), -- Molten Core -> Burning Steppes, Blackrock Mountain
(1469,1583,0), -- Blackrock Spire -> Burning Steppes, Blackrock Mountain
(101,1537,67), -- H Ironforge -> Dun Morogh, Kharanos
(1241,3923,0); -- Gruul's Lair (Instance) -> Blade's Edge, Evergrove GY

-- bg_chance_no_blizlike.sql
-- Update Chance bgs Warsong - Arathi Basing - Sota - Eye of The Storm (Saldran mas que alterac valley).
UPDATE `battleground_template` SET `Weight` = '3' WHERE `id` = 2;-- Warsong Gulch
UPDATE `battleground_template` SET `Weight` = '3' WHERE `id` = 3;-- Arathi Basin
UPDATE `battleground_template` SET `Weight` = '3' WHERE `id` = 7;-- Eye of The Storm
UPDATE `battleground_template` SET `Weight` = '2' WHERE `id` = 9;-- Strand of the Ancients