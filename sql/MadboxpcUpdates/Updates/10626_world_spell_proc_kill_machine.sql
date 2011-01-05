-- Fix Exploit spell Killing Machine [DK]
UPDATE `spell_proc_event` SET  `ppmRate` =  '1' WHERE  `entry` =51123;
UPDATE `spell_proc_event` SET  `ppmRate` =  '2' WHERE  `entry` =51127;
UPDATE `spell_proc_event` SET  `ppmRate` =  '3' WHERE  `entry` =51128;
UPDATE `spell_proc_event` SET  `ppmRate` =  '4' WHERE  `entry` =51129;
UPDATE `spell_proc_event` SET  `ppmRate` =  '5' WHERE  `entry` =51130;
