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
-- Clean-
DELETE FROM `creature_addon` WHERE `guid` NOT IN (SELECT `guid` FROM `creature`);