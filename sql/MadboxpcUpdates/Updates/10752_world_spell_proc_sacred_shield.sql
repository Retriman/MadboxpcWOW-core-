-- Añadido cd 6 segundos Sacred Shield. [Paladin]
DELETE FROM `spell_proc_event` WHERE `entry` = '58597';
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) 
VALUES
(58597, 0, 10, 0x40000000, 0, 0, 0x00008000, 0, 0, 100,6);