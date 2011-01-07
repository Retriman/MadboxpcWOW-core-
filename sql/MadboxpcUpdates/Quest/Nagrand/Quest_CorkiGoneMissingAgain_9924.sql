--  Quest Soporte http://www.wowhead.com/quest=9924 "Corki's Gone Missing Again!"
DELETE FROM `script_texts` WHERE `npc_entry`=20812 AND `entry`=-1850071;
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
('20812','-1850071','This is the last time I get caughht! I promise! Bye!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','');
UPDATE `gameobject_template` SET `Scriptname`='go_corki_cage' WHERE `entry`=182350;-- Corki's Prison GUID: 22796 ID: 182350
