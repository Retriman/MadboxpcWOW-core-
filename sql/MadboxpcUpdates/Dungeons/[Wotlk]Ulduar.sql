-- ---------------------------------
-- ULDUAR
-- ---------------------------------

-- -----------------------
-- SPELLS
-- -----------------------
-- Biting Cold Spell Scripts
DELETE FROM `spell_script_names` WHERE `spell_id` IN (62038, 62039);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
('62038', 'spell_gen_biting_cold'),
('62039', 'spell_gen_biting_cold_dot');
-- Rapid Burst (63382) Spell Script
DELETE FROM `spell_script_names` WHERE `spell_id` = 63382;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES ('63382', 'spell_gen_rapid_burst');
-- Fire Bomb (66313) Spell Script
DELETE FROM `spell_script_names` WHERE `spell_id` = 66313;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES ('66313', 'spell_gen_fire_bomb');
-- Fire Bomb Trigger
UPDATE `creature_template` SET `flags_extra` = `flags_extra` | 128, `spell1` = 66318 WHERE `entry` = 34854;


-- -----------------------
-- MISC
-- -----------------------
-- Creatures/Gameobjects 25 man Spawn
UPDATE `creature` SET `spawnMask` = 3 WHERE `map` = 603;
UPDATE `gameobject` SET `spawnMask` = 3 WHERE `map` = 603;

-- -----------------------
-- BOSS Ignis
-- -----------------------
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 9, `vehicleId` = 342 WHERE `entry` = 33118;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 9 WHERE `entry` = 33190;
DELETE FROM creature WHERE id = 33121;
DELETE FROM conditions WHERE SourceEntry = 62343;
INSERT INTO `conditions` VALUES
('13','0','62343','0','18','1','33121','0','0','',NULL);

-- -----------------------
-- BOSS Razorscale
-- -----------------------
UPDATE `creature_template` SET `speed_run` = 0.00001 WHERE `entry` IN (34188, 34189);

-- -----------------------
-- BOSS XT-002
-- -----------------------
UPDATE `creature_template` SET `VehicleId` = 335 WHERE `entry` = 33293;

-- -----------------------
-- Assembly of Iron
-- -----------------------
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235 WHERE `entry` IN (32867, 32927, 33693, 33692);
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299803 WHERE `entry` IN (32857, 33694);
UPDATE `creature_template` SET `ScriptName` = 'npc_rune_of_power' WHERE `entry` = 33705;
UPDATE `creature_template` SET `difficulty_entry_1` = 33691, `ScriptName` = 'npc_rune_of_summoning' WHERE `entry` = 33051;
UPDATE `creature_template` SET `ScriptName` = 'npc_lightning_elemental' WHERE `entry` = 32958;
-- Runemaster Molgeim
UPDATE `creature_model_info` SET `bounding_radius` = 0.45, `combat_reach` = 4 WHERE `modelid` = 28381;
-- Steelbreaker
UPDATE `creature_model_info` SET `bounding_radius` = 0.45, `combat_reach` = 8 WHERE `modelid` = 28344;

-- -----------------------
-- Kologarn
-- -----------------------
UPDATE `creature_template` SET `baseattacktime` = 1800, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` IN (32930, 33909);
UPDATE `creature_model_info` SET `bounding_radius` = 1, `combat_reach` = 15 WHERE `modelid` = 28638;
UPDATE `creature_model_info` SET `bounding_radius` = 0.465, `combat_reach` = 15 WHERE `modelid` = 28821;
-- Left Arm
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `ScriptName` = 'npc_left_arm' WHERE `entry` = 32933;
UPDATE `creature_model_info` SET `bounding_radius` = 0.465, `combat_reach` = 15 WHERE `modelid` = 28821;
-- Right Arm
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `ScriptName` = 'npc_right_arm' WHERE `entry` = 32934;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235 WHERE `entry` IN (33910, 33911);
UPDATE `creature_model_info` SET `bounding_radius` = 0.465, `combat_reach` = 15 WHERE `modelid` = 28822;
-- Focused Eyebeam
UPDATE `creature_template` SET `ScriptName` = 'npc_focused_eyebeam' WHERE `entry` IN (33632, 33802);
DELETE FROM conditions WHERE SourceEntry IN (63676, 63702);
INSERT INTO `conditions` VALUES
('13','0','63676','0','18','1','32930','0','0','',"Focused Eyebeam (Kologarn)"),
('13','0','63702','0','18','1','32930','0','0','',"Focused Eyebeam (Kologarn)");
-- Cleanup
DELETE FROM `creature` WHERE `id` IN (33632, 33802, 34297, 32933, 32934, 33809, 33661, 33742);
DELETE FROM vehicle_accessory WHERE entry = 32930;


-- -----------------------
-- Auriaya
-- -----------------------
UPDATE `creature_template` SET `baseattacktime` = 1500, `equipment_id` = 2422, `mechanic_immune_mask` = 617299807, `flags_extra` = 1 WHERE `entry` = 33515;
UPDATE `creature_template` SET `baseattacktime` = 1500, `equipment_id` = 2422, `mechanic_immune_mask` = 617299807, `flags_extra` = 1 WHERE `entry` = 34175;
UPDATE `creature_model_info` SET `bounding_radius` = 0.775, `combat_reach` = 5 WHERE `modelid` = 28651;
-- Sanctum Sentry
UPDATE `creature_template` SET `speed_walk` = 1.66667, `mechanic_immune_mask` = 536870912, `flags_extra` = 1, `ScriptName` = 'npc_sanctum_sentry' WHERE `entry` = 34014;
UPDATE `creature_template` SET `baseattacktime` = 1500, `speed_walk` = 1.66667, `mechanic_immune_mask` = 536870912, `flags_extra` = 1 WHERE `entry` = 34166;
-- Feral Defender
UPDATE `creature_template` SET `speed_walk` = 2, `dmg_multiplier` = 3.5, `flags_extra` = 1, `ScriptName` = 'npc_feral_defender' WHERE `entry` = 34035;
UPDATE `creature_template` SET `speed_walk` = 2, `dmg_multiplier` = 5, `flags_extra` = 1, `baseattacktime` = 1500 WHERE `entry` = 34171;
UPDATE `creature_template` SET `unit_flags` = 33554432, `ScriptName` = 'npc_seeping_trigger' WHERE `entry` = 34098;
UPDATE `creature_template` SET `unit_flags` = 33554432 WHERE `entry` = 34174;
UPDATE `creature_template` SET `dmg_multiplier` = 1.5, `baseattacktime` = 1500 WHERE `entry` = 34169;
UPDATE `creature_template` SET `ScriptName` = 'npc_feral_defender_trigger' WHERE `entry` = 34096;
-- Mace equip
DELETE FROM `creature_equip_template` WHERE entry = 2422;
INSERT INTO `creature_equip_template` VALUES ('2422','45315','0','0');
-- Cleanup
DELETE FROM `creature` WHERE `id` = 34014;
-- Auriaya movement path
DELETE FROM `creature_addon` WHERE guid = 137496;
INSERT INTO `creature_addon` VALUES ('137496','1033515','0','0','0','0','0');
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 137496;
DELETE FROM `waypoint_data` WHERE id = 1033515;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_flag`, `action`, `action_chance`, `wpguid`) VALUES
('1033515','1','1968.46','51.75','417.72','0','0','0','100','0'),
('1033515','2','1956.75','49.22','411.35','0','0','0','100','0'),
('1033515','3','1938.90','42.09','411.35','3000','0','0','100','0'),
('1033515','4','1956.75','49.22','411.35','0','0','0','100','0'),
('1033515','5','1968.46','51.75','417.72','0','0','0','100','0'),
('1033515','6','2011.43','44.91','417.72','0','0','0','100','0'),
('1033515','7','2022.65','37.74','411.36','0','0','0','100','0'),
('1033515','8','2046.65','9.61','411.36','0','0','0','100','0'),
('1033515','9','2053.4','-8.65','421.68','0','0','0','100','0'),
('1033515','10','2053.14','-39.8','421.66','0','0','0','100','0'),
('1033515','11','2046.26','-57.96','411.35','0','0','0','100','0'),
('1033515','12','2022.42','-86.39','411.35','0','0','0','100','0'),
('1033515','13','2011.26','-92.95','417.71','0','0','0','100','0'),
('1033515','14','1969.43','-100.02','417.72','0','0','0','100','0'),
('1033515','15','1956.66','-97.4','411.35','0','0','0','100','0'),
('1033515','16','1939.18','-90.90','411.35','3000','0','0','100','0'),
('1033515','17','1956.66','-97.4','411.35','0','0','0','100','0'),
('1033515','18','1969.43','-100.02','417.72','0','0','0','100','0'),
('1033515','19','2011.26','-92.95','417.71','0','0','0','100','0'),
('1033515','20','2022.42','-86.39','411.35','0','0','0','100','0'),
('1033515','21','2046.26','-57.96','411.35','0','0','0','100','0'),
('1033515','22','2053.14','-39.8','421.66','0','0','0','100','0'),
('1033515','23','2053.4','-8.65','421.68','0','0','0','100','0'),
('1033515','24','2046.65','9.61','411.36','0','0','0','100','0'),
('1033515','25','2022.65','37.74','411.36','0','0','0','100','0'),
('1033515','26','2011.43','44.91','417.72','0','0','0','100','0');

-- -----------------------
-- Hodir
-- -----------------------
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854239, `flags_extra` = 1, `ScriptName` = 'boss_hodir' WHERE `entry` = 32845;
UPDATE `creature_template` SET `equipment_id` = 1843, `mechanic_immune_mask` = 650854239, `flags_extra` = 1 WHERE `entry` = 32846;
-- Hodir npcs
UPDATE `creature_template` SET `ScriptName` = 'npc_hodir_priest' WHERE `entry` IN (32897, 33326, 32948, 33330);
UPDATE `creature_template` SET `ScriptName` = 'npc_hodir_shaman' WHERE `entry` IN (33328, 32901, 33332, 32950);
UPDATE `creature_template` SET `ScriptName` = 'npc_hodir_druid' WHERE `entry` IN (33325, 32900, 32941, 33333);
UPDATE `creature_template` SET `ScriptName` = 'npc_hodir_mage' WHERE `entry` IN (32893, 33327, 33331, 32946);
UPDATE `creature_template` SET `ScriptName` = 'npc_toasty_fire' WHERE `entry` = 33342;
UPDATE `creature_template` SET `ScriptName` = 'npc_icicle' WHERE `entry` = 33169;
UPDATE `creature_template` SET `ScriptName` = 'npc_icicle_snowdrift' WHERE `entry` = 33173;
UPDATE `creature_template` SET `ScriptName` = 'npc_snowpacked_icicle' WHERE `entry` = 33174;
UPDATE `creature_template` SET `difficulty_entry_1` = 33352, `mechanic_immune_mask` = 612597599, `ScriptName` = 'npc_flash_freeze' WHERE `entry` = 32926;
UPDATE `creature_template` SET `difficulty_entry_1` = 33353, `mechanic_immune_mask` = 612597599, `ScriptName` = 'npc_flash_freeze' WHERE `entry` = 32938;
UPDATE `creature_template` SET `mechanic_immune_mask` = 612597599 WHERE `entry` IN (33352, 33353);
UPDATE `gameobject_template` SET `flags` = 4 WHERE `entry` = 194173;
-- Cleanup
DELETE FROM `creature` WHERE `id` IN (32950, 32941, 32948, 32946, 32938);

-- -----------------------
-- Mimiron
-- -----------------------
-- Mimiron Tram
UPDATE `gameobject_template` SET `flags` = 32, `data2` = 3000, `ScriptName` = 'go_call_tram' WHERE `entry` IN (194914, 194912, 194437);
DELETE FROM gameobject WHERE id = '194437';
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('194437','603','1','1','2306.87','274.237','424.288','1.52255','0','0','0.689847','0.723956','300','0','1');
DELETE FROM gameobject_template WHERE entry = '194438';
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES
('194438','1','8504','Activate Tram','','','','0','32','1','0','0','0','0','0','0','0','0','3000','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','go_call_tram','11159');
DELETE FROM gameobject WHERE id = '194438';
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(194438, 603, 1,1,2306.99, 2589.35, 424.382, 4.71676, 0, 0, 0.705559, -0.708651, 300, 0, 1);
-- Mimiron
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `ScriptName` = 'boss_mimiron' WHERE `entry` = 33350;
-- Leviathan MKII
UPDATE `creature_template` SET `vehicleid` = 370, `mechanic_immune_mask` = 650854235, `ScriptName` = 'boss_leviathan_mk' WHERE `entry` = 33432;
UPDATE `creature_template` SET `minlevel` = 83, `maxlevel` = 83, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 34106;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `ScriptName` = 'boss_leviathan_mk_turret' WHERE `entry` = 34071;
DELETE FROM vehicle_accessory WHERE entry = 33432;
INSERT INTO vehicle_accessory VALUE (33432, 34071, 3, 1, 'Leviathan Mk II turret');
UPDATE creature_template SET ScriptName = 'npc_proximity_mine' WHERE entry = 34362;
DELETE FROM `creature_model_info` WHERE `modelid`=28831;
INSERT INTO `creature_model_info` (`modelid`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`) VALUES
(28831, 0.5, 7, 2, 0);
-- VX-001
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1, `vehicleid` = 371, `ScriptName` = 'boss_vx_001' WHERE `entry` = 33651;
UPDATE `creature_template` SET `minlevel` = 83, `maxlevel` = 83, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 34108;
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35 WHERE `entry` = 34050;
UPDATE `creature_template` SET `unit_flags` = 33686020, `flags_extra` = 2 WHERE `entry` = 34211;
UPDATE `creature_template` SET `ScriptName` = 'npc_rocket_strike' WHERE `entry` = 34047;
-- Aerial Command Unit
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1, `ScriptName` = 'boss_aerial_unit' WHERE `entry` = 33670;
UPDATE `creature_template` SET `minlevel` = 83, `maxlevel` = 83, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 34109;
UPDATE `creature_template` SET `ScriptName` = 'npc_magnetic_core' WHERE `entry` = 34068;
UPDATE `creature_template` SET `ScriptName` = 'npc_assault_bot' WHERE `entry` = 34057;
UPDATE `creature_template` SET `difficulty_entry_1` = 34148, `ScriptName` = 'npc_emergency_bot' WHERE `entry` = 34147;
-- HardMode
UPDATE `gameobject_template` SET `flags` = 32, `ScriptName` = 'go_not_push_button' WHERE `entry` = 194739;
UPDATE `creature_template` SET `difficulty_entry_1` = 34361, `ScriptName` = 'npc_frost_bomb' WHERE `entry` = 34149;
UPDATE `creature_template` SET `speed_walk` = 0.15, `speed_run` = 0.15, `ScriptName` = 'npc_mimiron_flame_trigger' WHERE `entry` = 34363;
UPDATE `creature_template` SET `ScriptName` = 'npc_mimiron_flame_spread' WHERE `entry` = 34121;
-- CleanUp
DELETE FROM creature WHERE id IN (34071, 33856);
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 34143;


-- -----------------------
-- Freya
-- -----------------------
UPDATE `creature_template` SET `baseattacktime` = 1500, `mechanic_immune_mask` = 650854235, `ScriptName` = 'boss_freya' WHERE `entry` = 32906;
UPDATE `creature_template` SET `speed_walk` = 1.6, `baseattacktime` = 1500, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 33360;
-- Elders
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1, `ScriptName` = 'npc_elder_brightleaf' WHERE `entry` = 32915;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1, `ScriptName` = 'npc_elder_ironbranch' WHERE `entry` = 32913;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1, `ScriptName` = 'npc_elder_stonebark' WHERE `entry` = 32914;
UPDATE `creature_template` SET `speed_walk` = 1.66666, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` IN (33393, 33392, 33391);
-- Iron roots
UPDATE `creature_template` SET `difficulty_entry_1` = 33397, `mechanic_immune_mask` = 650854239, `ScriptName` = 'npc_iron_roots' WHERE `entry` = 33168;
UPDATE `creature_template` SET `difficulty_entry_1` = 33396, `mechanic_immune_mask` = 650854239, `ScriptName` = 'npc_iron_roots' WHERE `entry` = 33088;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854239 WHERE `entry` IN (33396, 33397);
-- Eonar Gift
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1, `ScriptName` = 'npc_eonars_gift' WHERE `entry` = 33228;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 33385;
-- Unstable Sun Beam
UPDATE `creature_template` SET `ScriptName` = 'npc_unstable_sun_beam' WHERE `entry` = 33050;
-- Sun Beam
UPDATE `creature_template` SET `ScriptName` = 'npc_sun_beam' WHERE `entry` = 33170;
-- Nature Bomb
UPDATE `creature_template` SET `ScriptName` = 'npc_nature_bomb' WHERE `entry` = 34129;
UPDATE `gameobject_template` SET `flags` = 4 WHERE `entry` = 194902;
-- Detonating Lasher
UPDATE `creature_template` SET `flags_extra` = 256, `ScriptName` = 'npc_detonating_lasher' WHERE `entry` = 32918;
UPDATE `creature_template` SET `flags_extra` = 256 WHERE `entry` = 33399;
-- Ancient Conservator
UPDATE `creature_template` SET `mechanic_immune_mask` = 650853979, `ScriptName` = 'npc_ancient_conservator' WHERE `entry` = 33203;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650853979 WHERE `entry` = 33376;
-- Healthy Spore
UPDATE `creature_template` SET `ScriptName` = 'npc_healthy_spore' WHERE `entry` = 33215;
-- Storm Lasher
UPDATE `creature_template` SET `ScriptName` = 'npc_storm_lasher' WHERE `entry` = 32919;
-- Snaplasher
UPDATE `creature_template` SET `ScriptName` = 'npc_snaplasher' WHERE `entry` = 32916;
-- Ancient Water Spirit
UPDATE `creature_template` SET `ScriptName` = 'npc_ancient_water_spirit' WHERE `entry` = 33202;
-- Cleanup
DELETE FROM `creature` WHERE `guid` = 136607 OR id = 33575;



-- Thorim
UPDATE `creature_template` SET `speed_walk` = 1.66667, `mechanic_immune_mask` = 650854239, `flags_extra` = 1, `ScriptName` = 'boss_thorim' WHERE `entry` = 32865;
UPDATE `creature_template` SET `speed_walk` = 1.66667, `baseattacktime` = 1500, `equipment_id` = 1844, `mechanic_immune_mask` = 650854239 WHERE `entry` = 33147;
DELETE FROM `creature` WHERE `id`=32865;
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(32865, 603, 3, 1, 28977, 0, 2134.967, -298.962, 438.331, 1.57, 604800, 0, 0, 4183500, 425800, 0, 1);
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=62042;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
('62042','62470','1','Thorim: Deafening Thunder');
-- Charge Orb
DELETE FROM conditions WHERE SourceEntry = 62016;
INSERT INTO `conditions` VALUES
('13','0','62016','0','18','1','33378','0','0','',NULL);
UPDATE `creature_template` SET `unit_flags` = 33685508 WHERE `entry` = 33378;
-- Gate
DELETE FROM `gameobject_scripts` WHERE `id`=55194;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES 
(55194, 0, 11, 34155, 15, '0', 0, 0, 0, 0);
DELETE FROM `gameobject_template` WHERE `entry`=194265;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES
('194265','1','295','Lever','','','','0','16','3','0','0','0','0','0','0','0','0','6000','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0');
UPDATE `gameobject` SET `id` = 194265, `rotation2` = 1, `rotation3` = 0, `spawntimesecs` = 7200, `animprogress` = 100 WHERE `guid` = 55194;
-- Cleanup
DELETE FROM `creature` WHERE `id` IN (32885, 32883, 32908, 32907, 32882, 33110, 32886, 32879, 32892, 33140, 33141, 33378, 32874, 32875)
OR guid IN (136694, 136695, 136666, 136706, 136754, 136653, 136756, 136757, 136725, 136718);
-- Pre adds
UPDATE `creature_template` SET `equipment_id` = 1849, `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32885;
UPDATE `creature_template` SET `equipment_id` = 1849 WHERE `entry` = 33153;
UPDATE `creature_template` SET `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32883;
UPDATE `creature_template` SET `equipment_id` = 1847 WHERE `entry` = 33152;
UPDATE `creature_template` SET `equipment_id` = 1850, `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32908;
UPDATE `creature_template` SET `equipment_id` = 1850 WHERE `entry` = 33151;
UPDATE `creature_template` SET `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32907;
UPDATE `creature_template` SET `equipment_id` = 1852 WHERE `entry` = 33150;
UPDATE `creature_template` SET `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32882;
UPDATE `creature_template` SET `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32886;
UPDATE `creature_template` SET `modelid1` = 16925, `modelid2` = 0 WHERE `entry`IN (33378, 32892);
-- Thorim Mini bosses
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854239, `flags_extra` = 1, `ScriptName` = 'npc_runic_colossus' WHERE `entry` = 32872;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854239, `flags_extra` = 1, `ScriptName` = 'npc_ancient_rune_giant' WHERE `entry` = 32873;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854239, `flags_extra` = 1, `ScriptName` = 'npc_sif' WHERE `entry` = 33196;
UPDATE `creature_template` SET `ScriptName` = 'npc_thorim_arena_phase' WHERE `entry` IN (32876, 32904, 32878, 32877, 32874, 32875, 33110);
DELETE FROM `creature_addon` WHERE `guid`IN (136059, 136816);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
('136059','0','0','0','1','0','40775 0'),
('136816','0','0','0','1','0','40775 0');


-- General Vezax
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299803, `flags_extra` = 257, `ScriptName` = 'boss_general_vezax' WHERE `entry` = 33271;
UPDATE `creature_template` SET `baseattacktime` = 1500, `mechanic_immune_mask` = 617299803, `flags_extra` = 257 WHERE `entry` = 33449;
UPDATE `creature_model_info` SET `bounding_radius` = 0.62, `combat_reach` = 12 WHERE `modelid` = 28548;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `ScriptName` = 'npc_saronite_vapors' WHERE `entry` = 33488;
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `mechanic_immune_mask` = 650854235, `ScriptName` = 'npc_saronite_animus' WHERE `entry` = 33524;
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `mechanic_immune_mask` = 650854235 WHERE `entry` IN (33789, 34152);
UPDATE `creature_model_info` SET `bounding_radius` = 0.62, `combat_reach` = 10 WHERE `modelid` = 28992;
-- CleanUp
DELETE FROM creature WHERE id = 33500;

-- Runeforged Sentry
UPDATE `creature_template` SET `spell1` = 64852, `spell2` = 64870, `spell3` = 64847, `AIName` = 'SmartAI' WHERE `entry` = 34234;
UPDATE `creature_template` SET `spell1` = 64852, `spell2` = 64870, `spell3` = 64847 WHERE `entry` = 34235;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34234);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=34234);
INSERT INTO `smart_scripts` VALUES 
(34234, 0, 0, 0, 0, 0, 100, 0, 2000, 2000, 10000, 10000, 11, 64852, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Runeforged Sentry - Cast Flaming Rune'),
(34234, 0, 1, 0, 0, 0, 100, 0, 3000, 5000, 5000, 7000, 11, 64870, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Runeforged Sentry - Cast Lava Burst'),
(34234, 0, 2, 0, 0, 0, 100, 0, 2500, 3000, 12000, 12000, 11, 64847, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Runeforged Sentry - Cast Runed Flame Jets');

-- Steelforged Defender
UPDATE `creature_template` SET `spell1` = 62845, `spell2` = 57780, `spell3` = 50370, `AIName` = 'SmartAI' WHERE `entry` = 33236;
UPDATE `creature_template` SET `spell1` = 62845, `spell2` = 57780, `spell3` = 50370 WHERE `entry` = 34113;
UPDATE `creature` SET `spawntimesecs` = 604800 WHERE `id` IN (33236, 33838);
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33236);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=33236);
INSERT INTO `smart_scripts` VALUES 
(33236, 0, 0, 0, 0, 0, 100, 0, 4000, 6000, 15000, 20000, 11, 62845, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Steelforged Defender - Cast Hamstring'),
(33236, 0, 1, 0, 0, 0, 100, 0, 2000, 4000, 6000, 8000, 11, 57780, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Steelforged Defender - Cast Lightning Bolt'),
(33236, 0, 2, 0, 0, 0, 100, 0, 5000, 6000, 4000, 6000, 11, 50370, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Steelforged Defender - Cast Sunder Armor');

-- Mechagnome Battletank
UPDATE `creature_template` SET `spell1` = 64693, `spell2` = 64953, `AIName` = 'SmartAI' WHERE `entry` = 34164;
UPDATE `creature_template` SET `spell1` = 64693, `spell2` = 64953 WHERE `entry` = 34165;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34164);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=34164);
INSERT INTO `smart_scripts` VALUES 
(34164, 0, 0, 0, 0, 0, 100, 0, 3000, 4000, 6000, 8000, 11, 64693, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Mechagnome Battletank - Cast Flame Cannon'),
(34164, 0, 1, 0, 0, 0, 100, 0, 10000, 10000, 15000, 20000, 11, 64953, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0,'Mechagnome Battletank - Cast Jump Attack');

-- Ulduar Colossus
UPDATE `creature_template` SET `spell1` = 62625, `AIName` = 'SmartAI' WHERE `entry` = 33237;
UPDATE `creature_template` SET `spell1` = 62625 WHERE `entry` = 34105;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33237);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=33237);
INSERT INTO `smart_scripts` VALUES 
(33237, 0, 0, 0, 0, 0, 100, 0, 8000, 10000, 15000, 20000, 11, 62625, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Ulduar Colossus - Cast Ground Slam');

-- invisible triggers
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` IN (33377, 33742, 34286, 33500, 33406, 33575);

-- Molten Colossus
UPDATE `creature_template` SET `spell1` = 64697, `spell2` = 64698, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 34069;
UPDATE `creature_template` SET `spell1` = 64697, `spell2` = 64698, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 34185;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34069);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=34069);
INSERT INTO `smart_scripts` VALUES 
(34069, 0, 0, 0, 0, 0, 100, 0, 6000, 10000, 10000, 12000, 11, 64697, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Molten Colossus - Cast Earthquake'),
(34069, 0, 1, 0, 0, 0, 100, 0, 10000, 10000, 15000, 20000, 11, 64698, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Molten Colossus - Cast Pyroblast');

-- Magma Rager
UPDATE `creature_template` SET `spell1` = 64773, `spell2` = 64746, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 34086;
UPDATE `creature_template` SET `spell1` = 64773, `spell2` = 64746, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 34201;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34086);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=34086);
INSERT INTO `smart_scripts` VALUES 
(34086, 0, 0, 0, 0, 0, 100, 0, 2000, 4000, 6000, 8000, 11, 64773, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Magma Rager - Cast Fire Blast'),
(34086, 0, 1, 0, 0, 0, 100, 0, 8000, 16000, 15000, 25000, 11, 64746, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Magma Rager - Cast Superheated winds');
UPDATE `creature_template` SET `unit_flags` = 33718790, modelid1 = 11686, modelid2 = 0, `spell1` = 64724, `AIName` = 'SmartAI' WHERE `entry` = 34194;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34194);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=34194);
INSERT INTO `smart_scripts` VALUES 
(34194, 0, 0, 0, 0, 0, 100, 0, 1000, 2000, 10000, 10000, 11, 64724, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Superheated Winds');

-- Forge Construct
UPDATE `creature_template` SET `spell1` = 64719, `spell2` = 64720, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 34085;
UPDATE `creature_template` SET `spell1` = 64719, `spell2` = 64721, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 34186;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34085);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=34085);
INSERT INTO `smart_scripts` VALUES 
(34085, 0, 0, 0, 0, 0, 100, 0, 8000, 12000, 10000, 16000, 11, 64719, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0,'Forge Construct - Cast Charge'),
(34085, 0, 1, 0, 0, 0, 100, 2, 2000, 6000, 6000, 8000, 11, 64720, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Forge Construct - Cast Flame Emission 10'),
(34085, 0, 2, 0, 0, 0, 100, 4, 2000, 6000, 6000, 8000, 11, 64721, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Forge Construct - Cast Flame Emission 25');

-- XB-488 Disposalbot
UPDATE `creature_template` SET `spell1` = 65080, `spell2` = 65084, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 34273;
UPDATE `creature_template` SET `spell1` = 65104, `spell2` = 65084, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 34274;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34273);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=34273);
INSERT INTO `smart_scripts` VALUES 
(34273, 0, 0, 0, 2, 0, 100, 0, 30, 20, 0, 0, 11, 65084, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'XB-488 Disposalbot - Cast Self Destruct'),
(34273, 0, 1, 0, 0, 0, 100, 2, 2000, 6000, 10000, 15000, 11, 65080, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'XB-488 Disposalbot - Cast Cut Scrap Metal 10'),
(34273, 0, 2, 0, 0, 0, 100, 4, 2000, 6000, 10000, 15000, 11, 65104, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'XB-488 Disposalbot - Cast Cut Scrap Metal 25');

-- Parts Recovery Technician
UPDATE `creature_template` SET `spell1` = 65071, `spell2` = 65070, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554432, `AIName` = 'SmartAI' WHERE `entry` = 34267;
UPDATE `creature_template` SET `spell1` = 65071, `spell2` = 65070, `mingold` = 14200, `maxgold` = 15600, `mechanic_immune_mask` = 33554432 WHERE `entry` = 34268;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34267);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=34267);
INSERT INTO `smart_scripts` VALUES 
(34267, 0, 0, 0, 0, 0, 100, 0, 8000, 12000, 10000, 15000, 11, 65071, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0,'Parts Recovery Technician - Cast Mechano Kick'),
(34267, 0, 1, 0, 0, 0, 100, 0, 6000, 8000, 20000, 25000, 11, 65070, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Parts Recovery Technician - Cast Defense Matrix');

-- XD-175 Compactobot
UPDATE `creature_template` SET `spell1` = 65073, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 34271;
UPDATE `creature_template` SET `spell1` = 65106, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 34272;
UPDATE `creature_template` SET `mingold` = 7100, `maxgold` = 7600 WHERE `entry` = 34269;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34271);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=34271);
INSERT INTO `smart_scripts` VALUES 
(34271, 0, 0, 0, 0, 0, 100, 2, 8000, 12000, 15000, 20000, 11, 65073, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0,'XD-175 Compactobot - Cast Trash Compactor 10'),
(34271, 0, 1, 0, 0, 0, 100, 4, 8000, 12000, 15000, 20000, 11, 65106, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0,'XD-175 Compactobot - Cast Trash Compactor 25');

-- Lightning Charged Iron Dwarf
UPDATE `creature_template` SET `spell1` = 64889, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 34199;
UPDATE `creature_template` SET `spell1` = 64975, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 34237;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34199);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=34199);
INSERT INTO `smart_scripts` VALUES 
(34199, 0, 0, 0, 0, 0, 100, 2, 1000, 2000, 10000, 15000, 11, 64889, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Lightning Charged Iron Dwarf - Cast Lightning Charged 10'),
(34199, 0, 1, 0, 0, 0, 100, 4, 1000, 2000, 10000, 15000, 11, 64975, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Lightning Charged Iron Dwarf - Cast Lightning Charged 25');

-- Hardened Iron Golem
UPDATE `creature_template` SET `spell1` = 64877, `spell2` = 64874, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'SmartAI' WHERE `entry` = 34190;
UPDATE `creature_template` SET `spell1` = 64877, `spell2` = 64967, `mingold` = 14200, `maxgold` = 15600, `mechanic_immune_mask` = 33554496 WHERE `entry` = 34229;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34190);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=34190);
INSERT INTO `smart_scripts` VALUES 
(34190, 0, 0, 0, 0, 0, 100, 0, 4000, 8000, 25000, 30000, 11, 64877, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Hardened Iron Golem - Cast Harden Fists'),
(34190, 0, 1, 0, 0, 0, 100, 2, 5000, 7000, 20000, 30000, 11, 64874, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Hardened Iron Golem - Cast Rune Punch 10'),
(34190, 0, 2, 0, 0, 0, 100, 4, 5000, 7000, 20000, 30000, 11, 64967, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Hardened Iron Golem - Cast Rune Punch 25');

-- Iron Mender
UPDATE `creature_template` SET `spell1` = 64918, `spell2` = 64903, `spell3` = 64897, `mechanic_immune_mask` = 33554496, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 34198;
UPDATE `creature_template` SET `spell1` = 64971, `spell2` = 64970, `spell3` = 64968, `mechanic_immune_mask` = 33554496, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 34236;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34198);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=34198);
INSERT INTO `smart_scripts` VALUES 
(34198, 0, 0, 0, 0, 0, 100, 2, 2000, 4000, 4000, 6000, 11, 64918, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Iron Mender - Cast Electro Shock 10'),
(34198, 0, 1, 0, 0, 0, 100, 4, 2000, 4000, 4000, 6000, 11, 64971, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Iron Mender - Cast Electro Shock 25'),
(34198, 0, 2, 0, 0, 0, 100, 2, 3000, 6000, 10000, 15000, 11, 64903, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Iron Mender - Cast Fuse Lightning 10'),
(34198, 0, 3, 0, 0, 0, 100, 4, 3000, 6000, 10000, 15000, 11, 64970, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Iron Mender - Cast Fuse Lightning 25'),
(34198, 0, 4, 0, 0, 0, 100, 2, 10000, 25000, 30000, 45000, 11, 64897, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Iron Mender - Cast Fuse Metal 10'),
(34198, 0, 5, 0, 0, 0, 100, 4, 10000, 25000, 30000, 45000, 11, 64968, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Iron Mender - Cast Fuse Metal 25');

-- Rune Etched Sentry
UPDATE `creature_template` SET `spell1` = 64852, `spell2` = 64870, `spell3` = 64847, `mechanic_immune_mask` = 33554496, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 34196;
UPDATE `creature_template` SET `spell1` = 64852, `spell2` = 64870, `spell3` = 64847, `mechanic_immune_mask` = 33554496, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 34245;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34196);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=34196);
INSERT INTO `smart_scripts` VALUES 
(34196, 0, 0, 0, 0, 0, 100, 0, 2000, 2000, 10000, 10000, 11, 64852, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Rune Etched Sentry - Cast Flaming Rune'),
(34196, 0, 1, 0, 0, 0, 100, 0, 3000, 5000, 5000, 7000, 11, 64870, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Rune Etched Sentry - Cast Lava Burst'),
(34196, 0, 2, 0, 0, 0, 100, 0, 2500, 3000, 12000, 15000, 11, 64847, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Rune Etched Sentry - Cast Runed Flame Jets');

-- Chamber Overseer
UPDATE `creature_template` SET `spell1` = 64820, `spell2` = 64825, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'SmartAI' WHERE `entry` = 34197;
UPDATE `creature_template` SET `spell1` = 64943, `spell2` = 64944, `mingold` = 14200, `maxgold` = 15600, `mechanic_immune_mask` = 33554496 WHERE `entry` = 34226;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34197);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=34197);
INSERT INTO `smart_scripts` VALUES 
(34197, 0, 0, 0, 0, 0, 100, 2, 4000, 8000, 6000, 8000, 11, 64820, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Chamber Overseer - Cast Devastating Leap 10'),
(34197, 0, 1, 0, 0, 0, 100, 4, 4000, 8000, 6000, 8000, 11, 64943, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Chamber Overseer - Cast Devastating Leap 25'),
(34197, 0, 2, 0, 0, 0, 100, 2, 10000, 12000, 8000, 12000, 11, 64825, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Chamber Overseer - Cast Staggering Roar 10'),
(34197, 0, 3, 0, 0, 0, 100, 4, 10000, 12000, 8000, 12000, 11, 64944, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Chamber Overseer - Cast Staggering Roar 25');

-- Storm Tempered Keeper
UPDATE `creature_template` SET `spell1` = 63541, `spell2` = 63630, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'SmartAI' WHERE `entry` IN (33722, 33699);
UPDATE `creature_template` SET `spell1` = 63541, `spell2` = 63630, `mingold` = 14200, `maxgold` = 15600, `mechanic_immune_mask` = 33554496 WHERE `entry` IN (33723, 33700);
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (33722, 33699);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (33722, 33699);
INSERT INTO `smart_scripts` VALUES 
(33722, 0, 0, 0, 6, 0, 100, 0, 0, 0, 0, 0, 75, 63630, 33699, 0, 0, 0, 0, 11, 33699, 50, 0, 0, 0, 0, 0,'Storm Tempered Keeper - Cast Vengeful Surge on death'),
(33722, 0, 1, 0, 0, 0, 100, 0, 3000, 6000, 10000, 15000, 11, 63541, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Storm Tempered Keeper - Cast Forked Lightning'),
(33722, 0, 2, 0, 0, 0, 100, 0, 3000, 3000, 3000, 3000, 11, 63539, 0, 0, 0, 0, 0, 9, 33699, 15, 50, 0, 0, 0, 0,'Storm Tempered Keeper - Cast Separation Anxiety if separated'),
(33699, 0, 0, 0, 6, 0, 100, 0, 0, 0, 0, 0, 75, 63630, 33722, 0, 0, 0, 0, 11, 33722, 50, 0, 0, 0, 0, 0,'Storm Tempered Keeper - Cast Vengeful Surge on death'),
(33699, 0, 1, 0, 0, 0, 100, 0, 3000, 6000, 10000, 15000, 11, 63541, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Storm Tempered Keeper - Cast Forked Lightning'),
(33699, 0, 2, 0, 0, 0, 100, 0, 3000, 3000, 3000, 3000, 11, 63539, 0, 0, 0, 0, 0, 9, 33722, 15, 50, 0, 0, 0, 0,'Storm Tempered Keeper - Cast Separation Anxiety if separated');

-- Champion of Hodir
UPDATE `creature_template` SET `spell1` = 64639, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 34133;
UPDATE `creature_template` SET `spell1` = 64652, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 34139;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34133);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=34133);
INSERT INTO `smart_scripts` VALUES 
(34133, 0, 0, 0, 0, 0, 100, 2, 3000, 6000, 12000, 16000, 11, 64639, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Champion of Hodir - Cast Stomp 10'),
(34133, 0, 1, 0, 0, 0, 100, 4, 3000, 6000, 12000, 16000, 11, 64652, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Champion of Hodir - Cast Stomp 25');

-- Winter Jormungar
UPDATE `creature_template` SET `spell1` = 64638, `AIName` = 'SmartAI' WHERE `entry` = 34137;
UPDATE `creature_template` SET `spell1` = 64638 WHERE `entry` = 34140;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34137);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=34137);
INSERT INTO `smart_scripts` VALUES 
(34137, 0, 0, 0, 0, 0, 100, 0, 3000, 6000, 6000, 9000, 11, 64638, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Winter Jormungar - Cast Acidic Bite');

-- Winter Revenant
UPDATE `creature_template` SET `spell1` = 64642, `spell2` = 64643, `spell3` = 64644, `mechanic_immune_mask` = 33554496, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 34134;
UPDATE `creature_template` SET `spell1` = 64653, `spell2` = 64643, `spell3` = 64644, `mechanic_immune_mask` = 33554496, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 34141;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34134);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=34134);
INSERT INTO `smart_scripts` VALUES 
(34134, 0, 0, 0, 0, 0, 100, 2, 8000, 12000, 15000, 20000, 11, 64642, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Winter Revenant - Cast Blizzard 10'),
(34134, 0, 1, 0, 0, 0, 100, 4, 8000, 12000, 15000, 20000, 11, 64653, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Winter Revenant - Cast Blizzard 25'),
(34134, 0, 2, 0, 0, 0, 100, 0, 3000, 5000, 10000, 12000, 11, 64643, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Winter Revenant - Cast Whirling Strike'),
(34134, 0, 3, 0, 0, 0, 100, 0, 15000, 20000, 60000, 75000, 11, 64644, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Winter Revenant - Cast Shield of the Winter Revenant');

-- Winter Rumbler
UPDATE `creature_template` SET `spell1` = 64645, `spell2` = 64647, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'SmartAI' WHERE `entry` = 34135;
UPDATE `creature_template` SET `spell1` = 64645, `spell2` = 64654, `mingold` = 14200, `maxgold` = 15600, `mechanic_immune_mask` = 33554496 WHERE `entry` = 34142;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34135);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=34135);
INSERT INTO `smart_scripts` VALUES 
(34135, 0, 0, 0, 0, 0, 100, 0, 6000, 12000, 10000, 16000, 11, 64645, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Winter Rumbler - Cast Cone of Cold'),
(34135, 0, 1, 0, 0, 0, 100, 2, 3000, 6000, 8000, 12000, 11, 64647, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Winter Rumbler - Cast Snow Blindness 10'),
(34135, 0, 2, 0, 0, 0, 100, 4, 3000, 6000, 8000, 12000, 11, 64654, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Winter Rumbler - Cast Snow Blindness 25');

-- Guardian Lasher
UPDATE `creature_template` SET `spell1` = 63007, `spell2` = 63047, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'SmartAI' WHERE `entry` = 33430;
UPDATE `creature_template` SET `spell1` = 63007, `spell2` = 63550, `mingold` = 14200, `maxgold` = 15600, `mechanic_immune_mask` = 33554496 WHERE `entry` = 33732;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33430);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=33430);
INSERT INTO `smart_scripts` VALUES 
(33430, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 75, 63007, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Guardian Lasher - Cast Guardian Pheromones on aggro'),
(33430, 0, 1, 0, 0, 0, 100, 2, 3000, 6000, 8000, 12000, 11, 63047, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Guardian Lasher - Cast Guardian''s Lash 10'),
(33430, 0, 2, 0, 0, 0, 100, 4, 3000, 6000, 8000, 12000, 11, 63550, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Guardian Lasher - Cast Guardian''s Lash 25');

-- Forest Swarmer
UPDATE `creature_template` SET `spell1` = 63059, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 33431;
UPDATE `creature_template` SET `spell1` = 63059, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33731;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33431);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=33431);
INSERT INTO `smart_scripts` VALUES 
(33431, 0, 0, 0, 0, 0, 100, 0, 3000, 9000, 10000, 20000, 11, 63059, 0, 0, 0, 0, 0, 11, 33430, 40, 0, 0, 0, 0, 0,'Forest Swarmer - Cast Pollinate');
DELETE FROM conditions WHERE SourceEntry = 63059;

-- Guardian of Life
UPDATE `creature_template` SET `spell1` = 63226, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 33528;
UPDATE `creature_template` SET `spell1` = 63551, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33733;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33528);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=33528);
INSERT INTO `smart_scripts` VALUES 
(33528, 0, 0, 0, 0, 0, 100, 2, 3000, 9000, 15000, 20000, 11, 63226, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Guardian of Life - Cast Poison Breath 10'),
(33528, 0, 1, 0, 0, 0, 100, 4, 3000, 9000, 15000, 20000, 11, 63551, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Guardian of Life - Cast Poison Breath 25');

-- Nature's Blade
UPDATE `creature_template` SET `spell1` = 63247, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 33527;
UPDATE `creature_template` SET `spell1` = 63568, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33741;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33527);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=33527);
INSERT INTO `smart_scripts` VALUES 
(33527, 0, 0, 0, 0, 0, 100, 2, 3000, 9000, 18000, 24000, 11, 63247, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Nature Blade - Cast Living Tsunami 10'),
(33527, 0, 1, 0, 0, 0, 100, 4, 3000, 9000, 18000, 24000, 11, 63568, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Nature Blade - Cast Living Tsunami 25');

-- Ironroot Lasher
UPDATE `creature_template` SET `spell1` = 63240, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 33526;
UPDATE `creature_template` SET `spell1` = 63553, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33734;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33526);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=33526);
INSERT INTO `smart_scripts` VALUES 
(33526, 0, 0, 0, 0, 0, 100, 2, 3000, 8000, 12000, 16000, 11, 63240, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Ironroot Lasher - Cast Ironroot Thorns 10'),
(33526, 0, 1, 0, 0, 0, 100, 4, 3000, 8000, 12000, 16000, 11, 63553, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Ironroot Lasher - Cast Ironroot Thorns 25');

-- Mangrove Ent
UPDATE `creature_template` SET `spell1` = 63272, `spell2` = 63242, `spell3` = 63241, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 33525;
UPDATE `creature_template` SET `spell1` = 63272, `spell2` = 63556, `spell3` = 63554, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33735;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33525);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=33525);
INSERT INTO `smart_scripts` VALUES 
(33525, 0, 0, 0, 0, 0, 100, 0, 8000, 12000, 16000, 20000, 11, 63272, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Mangrove Ent - Cast Hurricane'),
(33525, 0, 1, 0, 0, 0, 100, 2, 4000, 6000, 12000, 16000, 11, 63242, 0, 0, 0, 0, 0, 11, 0, 30, 0, 0, 0, 0, 0,'Mangrove Ent - Cast Nourish 10'),
(33525, 0, 2, 0, 0, 0, 100, 4, 4000, 6000, 12000, 16000, 11, 63556, 0, 0, 0, 0, 0, 11, 0, 30, 0, 0, 0, 0, 0,'Mangrove Ent - Cast Nourish 25'),
(33525, 0, 3, 0, 0, 0, 100, 2, 20000, 25000, 20000, 25000, 11, 63241, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Mangrove Ent - Cast Tranquility 10'),
(33525, 0, 4, 0, 0, 0, 100, 4, 20000, 25000, 20000, 25000, 11, 63554, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Mangrove Ent - Cast Tranquility 25');

-- Misguided Nymph
UPDATE `creature_template` SET `spell1` = 63082, `spell2` = 63111, `spell3` = 63136, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 33355;
UPDATE `creature_template` SET `spell1` = 63559, `spell2` = 63562, `spell3` = 63564, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33737;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33355);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=33355);
INSERT INTO `smart_scripts` VALUES 
(33355, 0, 0, 0, 0, 0, 100, 2, 8000, 12000, 16000, 20000, 11, 63082, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Misguided Nymph - Cast Bind Life 10'),
(33355, 0, 1, 0, 0, 0, 100, 4, 8000, 12000, 16000, 20000, 11, 63559, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Misguided Nymph - Cast Bind Life 25'),
(33355, 0, 2, 0, 0, 0, 100, 2, 4000, 6000, 12000, 16000, 11, 63111, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Misguided Nymph - Cast Frost Spear 10'),
(33355, 0, 3, 0, 0, 0, 100, 4, 4000, 6000, 12000, 16000, 11, 63562, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Misguided Nymph - Cast Frost Spear 25'),
(33355, 0, 4, 0, 0, 0, 100, 2, 15000, 20000, 15000, 20000, 11, 63136, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Misguided Nymph - Cast Winter''s Embrace 10'),
(33355, 0, 5, 0, 0, 0, 100, 4, 15000, 20000, 15000, 20000, 11, 63564, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Misguided Nymph - Cast Winter''s Embrace 25');

-- Corrupted Servitor
UPDATE `creature_template` SET `spell1` = 63169, `spell2` = 63149, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'SmartAI' WHERE `entry` = 33354;
UPDATE `creature_template` SET `spell1` = 63549, `spell2` = 63149, `mingold` = 14200, `maxgold` = 15600, `mechanic_immune_mask` = 33554496 WHERE `entry` = 33729;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33354);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=33354);
INSERT INTO `smart_scripts` VALUES 
(33354, 0, 0, 0, 0, 0, 100, 2, 2000, 4000, 16000, 20000, 11, 63169, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Corrupted Servitor - Cast Petrify Joints 10'),
(33354, 0, 1, 0, 0, 0, 100, 4, 2000, 4000, 16000, 20000, 11, 63549, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Corrupted Servitor - Cast Petrify Joints 25'),
(33354, 0, 2, 0, 0, 0, 100, 0, 6000, 8000, 12000, 16000, 11, 63149, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Corrupted Servitor - Cast Violent Earth');

-- Arachnopod Destroyer
UPDATE `creature_template` SET `spell1` = 64717, `spell2` = 64776, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'SmartAI' WHERE `entry` = 34183;
UPDATE `creature_template` SET `spell1` = 64717, `spell2` = 64776, `mingold` = 14200, `maxgold` = 15600, `mechanic_immune_mask` = 33554496 WHERE `entry` = 34214;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34183);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=34183);
INSERT INTO `smart_scripts` VALUES 
(34183, 0, 0, 0, 0, 0, 100, 0, 2000, 4000, 12000, 16000, 11, 64717, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Arachnopod Destroyer - Cast Flame Spray'),
(34183, 0, 1, 0, 0, 0, 100, 0, 8000, 10000, 12000, 16000, 11, 64776, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Arachnopod Destroyer - Cast Machine Gun');

-- Boomer XP-500
UPDATE `creature_template` SET `spell1` = 55714, `AIName` = 'SmartAI' WHERE `entry` = 34192;
UPDATE `creature_template` SET `spell1` = 55714 WHERE `entry` = 34216;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34192);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=34192);
INSERT INTO `smart_scripts` VALUES 
(34192, 0, 0, 0, 9, 0, 100, 0, 0, 2, 1000, 1000, 11, 55714, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Boomer XP-500 - Explode');

-- Clockwork Sapper
UPDATE `creature_template` SET `spell1` = 64740, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'SmartAI' WHERE `entry` = 34193;
UPDATE `creature_template` SET `spell1` = 64740, `mingold` = 14200, `maxgold` = 15600, `mechanic_immune_mask` = 33554496 WHERE `entry` = 34220;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34193);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=34193);
INSERT INTO `smart_scripts` VALUES 
(34193, 0, 0, 0, 0, 0, 100, 0, 2000, 6000, 12000, 16000, 11, 64740, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Clockwork Sapper - Cast Energy Sap');

-- Twilight Adherent
UPDATE `creature_template` SET `spell1` = 64663, `spell2` = 63760, `spell3` = 13704, `equipment_id` = 1848, `mechanic_immune_mask` = 33554513, `unit_class` = 2, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 33818;
UPDATE `creature_template` SET `spell1` = 64663, `spell2` = 63760, `spell3` = 13704, `equipment_id` = 1848, `mechanic_immune_mask` = 33554513, `unit_class` = 2, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33827;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33818);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=33818);
INSERT INTO `smart_scripts` VALUES 
(33818, 0, 0, 0, 0, 0, 100, 0, 10000, 16000, 16000, 20000, 11, 64663, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Twilight Adherent - Cast Arcane Burst'),
(33818, 0, 1, 0, 0, 0, 100, 0, 8000, 10000, 16000, 20000, 11, 63760, 0, 0, 0, 0, 0, 11, 0, 30, 0, 0, 0, 0, 0,'Twilight Adherent - Cast Greater Heal'),
(33818, 0, 2, 0, 0, 0, 100, 0, 2000, 4000, 15000, 18000, 11, 13704, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Twilight Adherent - Cast Psychic Scream');

-- Twilight Guardian
UPDATE `creature_template` SET `spell1` = 52719, `spell2` = 62317, `spell3` = 63757, `mechanic_immune_mask` = 33554513, `equipment_id` = 1852, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 33822;
UPDATE `creature_template` SET `spell1` = 52719, `spell2` = 62317, `spell3` = 63757, `mechanic_immune_mask` = 33554513, `equipment_id` = 1852, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33828;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33822);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=33822);
INSERT INTO `smart_scripts` VALUES 
(33822, 0, 0, 0, 0, 0, 100, 0, 6000, 10000, 8000, 10000, 11, 52719, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Twilight Guardian - Cast Concussion Blow'),
(33822, 0, 1, 0, 0, 0, 100, 0, 2000, 3000, 3000, 6000, 11, 62317, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Twilight Guardian - Cast Devastate'),
(33822, 0, 2, 0, 0, 0, 100, 0, 8000, 10000, 14000, 16000, 11, 63757, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Twilight Guardian - Cast Thunderclap');

-- Twilight Shadowblade
UPDATE `creature_template` SET `spell1` = 63753, `mechanic_immune_mask` = 33554513,  `equipment_id` = 1862, `baseattacktime` = 1000, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 33824;
UPDATE `creature_template` SET `spell1` = 63753, `mechanic_immune_mask` = 33554513,  `equipment_id` = 1862, `baseattacktime` = 1000, `mingold` = 7100, `maxgold` = 7600 WHERE `entry` = 33831;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33824);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=33824);
INSERT INTO `smart_scripts` VALUES 
(33824, 0, 0, 0, 0, 0, 100, 0, 6000, 8000, 12000, 16000, 11, 63753, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Twilight Shadowblade - Cast Fan of Knives');

-- Twilight Slayer
UPDATE `creature_template` SET `spell1` = 63784, `spell2` = 35054, `mechanic_immune_mask` = 33554513, `equipment_id` = 1847, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 33823;
UPDATE `creature_template` SET `spell1` = 63784, `spell2` = 35054, `mechanic_immune_mask` = 33554513, `equipment_id` = 1847, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33832;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33823);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=33823);
INSERT INTO `smart_scripts` VALUES 
(33823, 0, 0, 0, 0, 0, 100, 0, 3000, 6000, 12000, 16000, 11, 35054, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,'Twilight Slayer - Cast Mortal Strike'),
(33823, 0, 1, 0, 0, 0, 100, 0, 8000, 12000, 20000, 25000, 11, 63784, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Twilight Slayer - Cast Bladestorm');

UPDATE `creature_template` SET `equipment_id` = 1849 WHERE `entry` = 32885;
UPDATE `creature_template` SET `equipment_id` = 1850 WHERE `entry` = 32908;

-- Faceless Horror
UPDATE `creature_template` SET `spell1` = 64429, `spell2` = 63722, `spell3` = 63710, `spell4` = 63703, `mechanic_immune_mask` = 33554513, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 33772;
UPDATE `creature_template` SET `spell1` = 64429, `spell2` = 63722, `spell3` = 63710, `spell4` = 63703, `mechanic_immune_mask` = 33554513, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33773;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33772);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=33772);
INSERT INTO `smart_scripts` VALUES 
(33772, 0, 0, 0, 0, 0, 100, 0, 18000, 20000, 16000, 20000, 11, 64429, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0,'Faceless Horror - Cast Death Grip'),
(33772, 0, 1, 0, 0, 0, 100, 0, 2000, 4000, 10000, 12000, 11, 63722, 0, 0, 0, 0, 0, 17, 10, 40, 0, 0, 0, 0, 0,'Faceless Horror - Cast Shadow Crash'),
(33772, 0, 2, 0, 4, 0, 100, 0, 0, 0, 0, 0, 75, 63703, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Faceless Horror - add aura Void Wave on aggro');

-- Twilight Frost Mage
UPDATE `creature_template` SET `spell1` = 64663, `spell2` = 63758, `spell3` = 63912, `spell4` = 63913, `equipment_id` = 1849, `mechanic_immune_mask` = 33554513, `unit_class` = 2, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 33819;
UPDATE `creature_template` SET `spell1` = 64663, `spell2` = 63758, `spell3` = 63912, `spell4` = 63913, `equipment_id` = 1849, `mechanic_immune_mask` = 33554513, `unit_class` = 2, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33829;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33819);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=33819);
INSERT INTO `smart_scripts` VALUES 
(33819, 0, 0, 0, 0, 0, 100, 0, 10000, 16000, 16000, 20000, 11, 64663, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Twilight Frost Mage - Cast Arcane Burst'),
(33819, 0, 1, 0, 0, 0, 100, 0, 1000, 2000, 6000, 8000, 11, 63913, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Twilight Frost Mage - Cast Frostbolt'),
(33819, 0, 2, 0, 0, 0, 100, 0, 2000, 4000, 10000, 16000, 11, 63758, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Twilight Frost Mage - Cast Frost Bolt Volley'),
(33819, 0, 3, 0, 0, 0, 100, 0, 8000, 10000, 12000, 16000, 11, 63912, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Twilight Frost Mage - Cast Frost Nova');

-- Twilight Pyromancer
UPDATE `creature_template` SET `spell1` = 64663, `spell2` = 63789, `spell3` = 63775, `equipment_id` = 1848, `mechanic_immune_mask` = 33554513, `unit_class` = 2, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'SmartAI' WHERE `entry` = 33820;
UPDATE `creature_template` SET `spell1` = 64663, `spell2` = 63789, `spell3` = 63775, `equipment_id` = 1848, `mechanic_immune_mask` = 33554513, `unit_class` = 2, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33830;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33820);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=33820);
INSERT INTO `smart_scripts` VALUES 
(33820, 0, 0, 0, 0, 0, 100, 0, 10000, 16000, 16000, 20000, 11, 64663, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Twilight Pyromancer - Cast Arcane Burst'),
(33820, 0, 1, 0, 0, 0, 100, 0, 1000, 2000, 6000, 8000, 11, 63789, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Twilight Pyromancer - Cast Fireball'),
(33820, 0, 2, 0, 0, 0, 100, 0, 2000, 4000, 10000, 16000, 11, 63775, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0,'Twilight Pyromancer - Cast Flamestrike');

-- Enslaved Fire Elemental
UPDATE `creature_template` SET `spell1` = 38064, `spell2` = 63778, `mechanic_immune_mask` = 33554513, `AIName` = 'SmartAI' WHERE `entry` = 33838;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33838);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=33838);
INSERT INTO `smart_scripts` VALUES 
(33838, 0, 0, 0, 0, 0, 100, 0, 4000, 8000, 10000, 14000, 11, 38064, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Enslaved Fire Elemental - Cast Blast Wave'),
(33838, 0, 1, 0, 4, 0, 100, 0, 0, 0, 0, 0, 75, 63778, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Enslaved Fire Elemental - Cast Fire Shield on aggro');

-- Boom Bot
UPDATE `creature_template` SET `spell1` = 63801, `AIName` = 'SmartAI' WHERE `entry` = 33836;
UPDATE `creature_template` SET `spell1` = 63801 WHERE `entry` = 34218;
DELETE FROM `smart_scripts` WHERE (`entryorguid`=33836);
INSERT INTO `smart_scripts` VALUES 
(33836, 0, 0, 0, 9, 0, 100, 0, 0, 2, 1000, 1000, 11, 63801, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Boom Bot - Explode');

-- Rubble
UPDATE `creature_template` SET `spell1` = 38064, `AIName` = 'SmartAI' WHERE `entry` = 33768;
UPDATE `creature_template` SET `spell1` = 63978 WHERE `entry` = 33908;
DELETE FROM `smart_scripts` WHERE (`entryorguid`=33768);
INSERT INTO `smart_scripts` VALUES 
(33768, 0, 0, 0, 0, 0, 100, 2, 4000, 8000, 10000, 12000, 11, 38064, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Rubble - Cast Stone Nova 10'),
(33768, 0, 1, 0, 0, 0, 100, 4, 4000, 8000, 10000, 12000, 11, 63978, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Rubble - Cast Stone Nova 25');


