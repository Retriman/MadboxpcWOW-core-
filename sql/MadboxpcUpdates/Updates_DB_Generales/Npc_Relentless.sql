-- Añadido Vendedores Faltantes  armas Relentless 3v3 - 5v5 (lvl 258) reportado en http://code.google.com/p/madboxpcwow/issues/detail?id=158
DELETE FROM `creature` WHERE `guid` IN (718654,718672);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(718654, 34090, 571, 1, 1, 0, 2100, 5751.81, 586.383, 614.969, 0.930669, 300, 0, 0, 6986, 0, 0, 0),
(718672, 34091, 571, 1, 1, 0, 0, 5751.55, 584.302, 614.969, 5.49776, 300, 0, 0, 6986, 0, 0, 0);
-- Clean
DELETE FROM `creature_addon` WHERE `guid` NOT IN (SELECT `guid` FROM `creature`);