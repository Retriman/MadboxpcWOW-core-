-- Fix Exploit Explosive Shot (aumentava con el Sp cosa que no debe ser).
UPDATE `spell_bonus_data` SET  `direct_bonus` =  '0',`dot_bonus` =  '0',`ap_dot_bonus` =  '0' WHERE `entry` =53352;