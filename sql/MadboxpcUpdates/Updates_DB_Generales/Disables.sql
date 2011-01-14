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

UPDATE `disables` SET `flags` = '14' WHERE `disables`.`sourceType` =2 AND `disables`.`entry` =649 LIMIT 1 ;