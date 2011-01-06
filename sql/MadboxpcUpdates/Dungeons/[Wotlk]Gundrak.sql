-- Emotes Boss Drakkari Colossus - Boss Sladran. (commit 1296 61b4d8ec976c)
DELETE FROM `script_texts` WHERE `entry` IN (-1604008,-1604009,-1604010,-1604007,-1604014,-1604029);
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) 
VALUES
(29307,-1604008,'%s surges forward!',0,2,0,0,'Colossus EMOTE_SURGE'),
(29307,-1604009,'%s seep into the ground.',0,2,0,0,'Colossus EMOTE_SEEP'),
(29307,-1604010,'%s begins to glow faintly.',0,2,0,0,'Colossus EMOTE_GLOW'),
(29304,-1604007,'%s begins to cast Poison Nova!',0,3,0,0,'Sladran EMOTE_NOVA'),
(29305,-1604014,'I crush you, cockroaches!',14725,1,0,0,'Moorabi SAY_SLAY_1'),
(29305,-1604029,'%s transforms into a Mammoth!',14724,2,0,0,'Moorabi EMOTE_TRANSFORMED');

-- ScriptNames
UPDATE `creature_template` SET `ScriptName` = 'mob_snake_wrap' WHERE `entry` = '29742'; -- Serpientes para Archievent - Boss Sladran
-- Scriptname Galdarah Summon
UPDATE `creature_template` SET `ScriptName` = 'mob_rhino_spirit' WHERE `entry` = '29791';

-- Misc Updates
UPDATE `creature_template` SET `faction_A` = '16', `faction_H` = '16' WHERE `entry` IN ('29742','32218');-- Correcta Faction Snake - Boss Sladran
UPDATE `creature_template` SET `faction_A` = '16', `faction_H` = '16' WHERE `entry` IN ('29573','31367','29680','29713','30940','30943'); -- Faction Npc Drakkari Elemental - Slad'ran Viper - Slad'ran Constrictor
UPDATE `creature_template` SET `faction_A` = '7', `faction_H` = '7' WHERE `entry` = '29932'; -- Faction Npc Eck the Ferocious
DELETE FROM `creature_onkill_reputation` WHERE `creature_id` in ('29307','31365'); -- No reputacion boss Drakkari Colossus
UPDATE `creature_template` SET `lootid` = '0', `skinloot` = '80103' WHERE `entry` in ('29307','31365'); -- No loot Drakkari Colossus y Añadido Skinlot Heroic Mode
UPDATE `creature_template` SET `minlevel` = '78', `maxlevel` = '82' WHERE `entry` = '29791'; -- Rhino Spirit npclevel
-- Inmunidades Todos.
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (29304,31370,29307,31365,29573,31367,29306,31368,29932,29305,30530); 
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask` &~ 256 &~ 2048 &~ 33554432 WHERE `entry` IN (29305,30530); 
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask` &~ 2097152 WHERE `entry` IN (29304,31370,29307,31365,29573,31367,29306,31368,29932,29305,30530);
-- Livin Mojos Update Spawnmask 
-- http://www.wowhead.com/npc=29830 "Living Mojo"
UPDATE `creature` SET `spawnMask` = '0' WHERE `guid` IN ('127071','127072','127073','127074','127075');
DELETE FROM  `creature_linked_respawn` WHERE `guid` IN ('127071','127072','127073','127074','127075');
-- Vehicle ID (Experimental)
UPDATE `creature_template` SET `VehicleId` = '169' where `entry` IN ('29306','31368');
-- Update Damage =)
UPDATE `creature_template` SET `dmg_multiplier` = 17 WHERE `entry` IN (30936,30925,31370,31367,30942,30941,30932,30927,30930,30938,30929,30926,30933,30939);
UPDATE `creature_template` SET `dmg_multiplier` = 22 WHERE `entry` IN (29932,31368);
UPDATE `creature_template` SET `dmg_multiplier` = 30 WHERE `entry` = 31365;
UPDATE `creature_template` SET `baseattacktime` = 1000 WHERE `entry` IN (29305,30530);
UPDATE `creature_template` SET `baseattacktime` = 3500 WHERE `entry` IN (29307,31365);

-- Eai Update
-- Cobra Events
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = '29774';
DELETE FROM `creature_ai_scripts` WHERE `id` IN ('2982607','2982608');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) values
('2977401','29774','4','0','100','2','0','0','0','0','11','55700','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Normal) - Cast Venom Spit on Aggro'),
('2977402','29774','4','0','100','4','0','0','0','0','11','59019','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Heroic) - Cast Venom Spit on Aggro'),
('2977403','29774','9','0','100','3','5','30','2300','5000','11','55700','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Normal) - Cast Venom Spit'),
('2977404','29774','9','0','100','5','5','30','2300','5000','11','59019','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Heroic) - Cast Venom Spit'),
('2977405','29774','9','0','100','3','0','5','5000','9000','11','55703','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Normal) - Cast Cobra Strike'),
('2977406','29774','9','0','100','5','0','5','5000','9000','11','59020','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Heroic) - Cast Cobra Strike'),
-- Drakkari Medice 
('2982607','29826','2','0','100','3','75','0','10000','16000','11','55597','0','0','0','0','0','0','0','0','0','0','Drakkari Medecine Man (Normal) - Cast Healing Wave on Self'),
('2982608','29826','2','0','100','5','75','0','10000','16000','11','58980','0','0','0','0','0','0','0','0','0','0','Drakkari Medecine Man (Heroic) - Cast Healing Wave on Self');


