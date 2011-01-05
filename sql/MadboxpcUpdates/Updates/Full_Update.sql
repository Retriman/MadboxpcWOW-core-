-- 10626_world_spell_proc_kill_machine.sql
-- Fix Exploit spell Killing Machine [DK]
UPDATE `spell_proc_event` SET  `ppmRate` =  '1' WHERE  `entry` =51123;
UPDATE `spell_proc_event` SET  `ppmRate` =  '2' WHERE  `entry` =51127;
UPDATE `spell_proc_event` SET  `ppmRate` =  '3' WHERE  `entry` =51128;
UPDATE `spell_proc_event` SET  `ppmRate` =  '4' WHERE  `entry` =51129;
UPDATE `spell_proc_event` SET  `ppmRate` =  '5' WHERE  `entry` =51130;

-- 10649_world_spell_script_drain_mana.sql
-- Fear - Poly - Seduction Break Spell Instantaneamente.
DELETE FROM `spell_script_names` WHERE `spell_id`=-5138 AND `ScriptName`='spell_warl_drainmana_drainlife';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(-5138,'spell_warl_drainmana_drainlife');

-- 10750_world_disable_spell_bgs_maps.sql
-- Bloqueado  Ritual of Summoning en Alterac Valley - Warsong Gulch - Arathi Basing - Eye of Storm - SOTA.
DELETE FROM `disables` WHERE `sourceType`=0 AND `entry`=698;
INSERT INTO `disables` (`sourceType`,`entry`,`flags`,`params_0`,`params_1`,`comment`) VALUES 
(0,698,17, '30,489,529,607,566', '', 'Bloqueado  Ritual of Summoning en Alterac Valley - Warsong Gulch - Arathi Basing - Eye of Storm - SOTA.');

-- 10752_world_spell_proc_sacred_shield.sql
-- Añadido cd 6 segundos Sacred Shield. [Paladin]
DELETE FROM `spell_proc_event` WHERE `entry` = '58597';
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) 
VALUES
(58597, 0, 10, 0x40000000, 0, 0, 0x00008000, 0, 0, 100,6);

-- 10772_world_achievement_criteria_data.sql
-- 10772 (906f2e6a8cec) Core/Achievements: Prevent ACHIEVEMENT_CRITERIA_TYPE_SPECIAL_PVP_KILL updates at
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (1820,1821,1822,1823,3826,3827,3828,3829,3882,5492,5493,5494,5495,5499,5500,5501,5502,5503,5507,5508,5509,5510,5511,12579,13260,13261) AND `type`!=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
(1820,20,529,0), -- 30 hks in arathi
(1821,20,30,0), -- 30 hks in av
(1822,20,566,0), -- 30 hks in eots
(1823,20,489,0), -- 30 hks in wsg
(3826,5,26157,0), -- 26157 (honorable kill under wondervolt disguise)
(3827,5,26272,0), -- 26272 (honorable kill under wondervolt disguise)
(3828,5,26273,0), -- 26273 (honorable kill under wondervolt disguise)
(3829,5,26274,0), -- 26274 (honorable kill under wondervolt disguise)
(3882,5,48890,0), -- 50 Honorable Kills with the G.N.E.R.D. buff
(5492,20,0,0), -- Eastern Kingdoms
(5493,20,1,0), -- Kalimdor
(5494,20,530,0), -- Outland
(5495,20,571,0), -- Northrend
(5499,20,529,0), -- Arathi Basin
(5500,20,30,0), -- Alterac Valley
(5501,20,489,0), -- Warsong Gulch
(5502,20,566,0), -- Eye of the Storm
(5503,20,607,0), -- Strand of the Ancients
(5507,20,30,0), -- Alterac Valley Honorable Kills
(5508,20,529,0), -- Arathi Basin Honorable Kills
(5509,20,489,0), -- Warsong Gulch Honorable Kills
(5510,20,566,0), -- Eye of the Storm Honorable Kills
(5511,20,607,0), -- Strand of the Ancients Honorable Kills
(12579,20,628,0), -- 30 hks in ioc
(13260,20,628,0), -- Isle of Conquest
(13261,20,628,0); -- Isle of Conquest Honorable Kills

DELETE FROM `disables` WHERE `entry` IN (12068,12183) AND `sourceType`=4;
INSERT INTO `disables` (`sourceType`,`entry`,`comment`) VALUES
(4,12068, 'IoC - Mowed Down'),
(4,12183, 'IoC - Mowed Down');

-- 10843_world_spell_proc_prayer_of_mending.sql
-- "Prayer of Mending should not proc when damage is absorbed"
UPDATE `spell_proc_event` SET `procEx` = 0x00040000 WHERE `entry` IN (33076, 48110, 48111);

-- 10875_Water_Elemental_mago.sql
-- Mage. Water Elemental
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~2 WHERE `entry`=510;

-- 11026_script_name_familiar_kirin_tor.sql
-- Fix Familiar del Kirin Tor http://code.google.com/p/madboxpcwow/issues/detail?id=293&q=owner:Retriman&sort=-id
DELETE FROM `npc_text` WHERE `ID` =40000;
INSERT INTO `npc_text` (ID,text0_0) VALUES 
(40000,'Amazing! There are passages in here that I have never seen before. This must have taken quite a while for you to track down. If you ever find anymore books like this, I would like to be notified immediately. $B$BPlease take one of my Kirin Tor Familiars with you just in case you stumble across anything.');
UPDATE `creature_template` SET `ScriptName` = 'npc_archmage_vargoth' WHERE `entry` = 19481;    

-- 11029_script_name_auctioner_ingeneria.sql
-- Steampowered_auctioneer 
UPDATE `creature_template` SET `ScriptName` = 'npc_steampowered_auctioneer' WHERE `entry` IN (35594,35607);

-- 11032_world_spell_proc_threath_of_thassarian.sql
-- Threat of Thassarian Doble Dmg/heal Fix.
DELETE FROM `spell_proc_event` WHERE `entry` IN (65661,66191,66192);
INSERT INTO `spell_proc_event` (`entry`,`SchoolMask`,`SpellFamilyName`,`SpellFamilyMask0`,`SpellFamilyMask1`,`SpellFamilyMask2`,`procFlags`,`procEx`,`ppmRate`,`CustomChance`,`Cooldown`) VALUES
(65661,0,15,0x00400011,0x20020004,0x00000000,16,0,0,100,0), -- Threat of Thassarian - Rank1
(66191,0,15,0x00400011,0x20020004,0x00000000,16,0,0,100,0), -- Threat of Thassarian - Rank2
(66192,0,15,0x00400011,0x20020004,0x00000000,16,0,0,100,0); -- Threat of Thassarian - Rank3


-- 11057_Evento_Fishing_Extravaganza.sql
-- Stranglethorn Fishing Extravaganza
-- Añadiendo Textos.
DELETE FROM `script_texts`  WHERE entry IN (-1000356,-1000357,-1000358);
INSERT INTO `script_texts` (entry,content_default,sound,type,language,emote,comment) VALUES
(-1000356, 'Let the Fishing Tournament BEGIN!', 0, 6, 0, 0, 'riggle SAY_START'),
(-1000357, 'We have a winner! $N is the Master Angler!', 0, 6, 0, 0, 'riggle SAY_WINNER'),
(-1000358, 'And the Tastyfish have gone for the week! I will remain for another hour to allow you to turn in your fish!', 0, 6, 0, 0, 'riggle SAY_END');
-- Script Asignado A NPC
UPDATE creature_template SET ScriptName='npc_riggle_bassbait' WHERE entry=15077;
-- Fix Tiempo de evento Fishing Extravaganza
UPDATE `game_event` SET `start_time`='2009-06-14 14:00:00', `occurence`=10080, `length`=120 where entry=15;
-- Spawn Creaturas y go's Involucrados.
DELETE FROM `creature` WHERE `id`IN (15078,15079,15077);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(54687, 15078, 0, 1, 1, 0, 1711, -14438, 473.661, 15.3137, 3.65362, 25, 0, 0, 3200, 0, 0, 0),
(54688, 15079, 0, 1, 1, 0, 0, -14440, 477.446, 15.25, 3.71802, 25, 0, 0, 2600, 0, 0, 0),
(3849539, 15077, 0, 1, 1, 0, 13, -14439.3, 475.42, 15.892, 3.68503, 25, 0, 0, 3700, 0, 0, 0);
DELETE FROM `gameobject` WHERE `id`=180403;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(100391, 180403, 0, 1, 1, -14439.3, 475.42, 15.2791, 3.68503, 0, 0, 0.963311, -0.268388, 25, 0, 1);
-- Clean Antiguos Objects y Creaturas.
DELETE FROM `game_event_creature` WHERE `guid` IN (54687,54688,3849539);
DELETE FROM `game_event_gameobject`WHERE `guid`=100391;
-- Creando Evento.
DELETE FROM `game_event` WHERE `entry`=35;
INSERT INTO `game_event` (`entry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`) VALUES 
(35, '2009-03-29 14:00:00', '2020-12-31 00:00:00', 10080, 180, 0, 'Fishing Extravaganza Questgivers');
-- Añadiendo Npc's/go's del evento involucrados.
DELETE FROM `game_event_creature` WHERE abs(`event`) = 35;
DELETE FROM `game_event_gameobject` WHERE abs(`event`) = 35;
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES 
(54687,35), 
(54688,35), 
(3849539,35);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (100391,35);
-- Clean Quest Actuales en DB
DELETE FROM `creature_questrelation` WHERE `quest` IN (8193,8194,8225,8224,8221);
-- Añadiendo Quest a Evento
-- Riggle Bassbait Quest: Master Angler
-- Jang Quest: Apprentice Angler
-- Fishbot 5000 Quest: Rare Fish - Brownell's Blue Striped Racer
-- Fishbot 5000 Quest: Rare Fish - Dezian Queenfish
-- Fishbot 5000 Quest: Rare Fish - Keefer's Angelfish
DELETE FROM `game_event_creature_quest` WHERE `event` IN (15,35);
INSERT INTO `game_event_creature_quest` (`id`,`quest`,`event`) VALUES 
(15077,8193,35), 
(15078,8194,35), 
(15079,8225,35), 
(15079,8224,35), 
(15079,8221,35);

