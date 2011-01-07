--  Quest Soporte http://www.wowhead.com/quest=9923 "HELP!"
DELETE FROM `script_texts` WHERE `npc_entry`=18445;
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
('18445','-1850070','Thanks,$R Im sure my dad will reward you greatly,bye',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','');
UPDATE `gameobject_template` SET `Scriptname`='go_help_cage' WHERE `entry`=182349;