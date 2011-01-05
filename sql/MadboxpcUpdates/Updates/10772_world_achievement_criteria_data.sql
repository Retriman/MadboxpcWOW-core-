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