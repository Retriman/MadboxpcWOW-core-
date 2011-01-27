-- Fix Quest: Veil Skith: Darkstone of Terokk (Q 10839)
SET @SET_EAI := 22288*100;
UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=22288;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=22288;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
(@SET_EAI+1,22288,8,0,100,0,38736,-1,0,0,15,10839,6,0,0,0,0,0,0,0,0,0, 'Quest 10839 Credit');