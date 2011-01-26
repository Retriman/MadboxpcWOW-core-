-- Quest Support 10852 Missing Friends
UPDATE gameobject_template SET ScriptName='go_veil_skith_cage' WHERE entry IN (185202,185203,185204,185205);
UPDATE creature_template SET ScriptName='npc_captive_child' WHERE entry = 22314;
DELETE FROM script_texts  WHERE entry IN (-1000590,-1000591,-1000592,-1000593);
INSERT INTO script_texts (entry,content_default,sound,type,language,emote,comment) VALUES
(-1000590,'Woot!',0,0,0,0,'Captive Child SAY_THANKS_1'),
(-1000591,'I think those weird bird guys were going to eat us. Gross!',0,0,0,0,'Captive Child SAY_THANKS_2'),
(-1000592,'Yay! We\'re free!',0,0,0,0,'Captive Child SAY_THANKS_3'),
(-1000593,'Gross!',0,0,0,0,'Captive Child SAY_THANKS_4');
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
('22314','530','1','1','0','0','-2525.84','5384.44','28.0049','0.36826','300','0','0','42','0','0','0'),
('22314','530','1','1','0','0','-2526.27','5384.86','28.0058','1.57777','300','0','0','42','0','0','0'),
('22314','530','1','1','0','0','-2526.49','5383.68','28.0063','4.69188','300','0','0','42','0','0','0'),
('22314','530','1','1','0','0','-2526.23','5384.19','28.0069','3.74548','300','0','0','42','0','0','0'),
('22314','530','1','1','0','0','-2579.42','5429.75','27.9568','1.72525','300','0','0','42','0','0','0'),
('22314','530','1','1','0','0','-2579.78','5430.98','27.9605','2.22005','300','0','0','42','0','0','0'),
('22314','530','1','1','0','0','-2544.63','5484.34','8.25821','3.11192','300','0','0','42','0','0','0');