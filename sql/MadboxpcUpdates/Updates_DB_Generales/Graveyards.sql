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