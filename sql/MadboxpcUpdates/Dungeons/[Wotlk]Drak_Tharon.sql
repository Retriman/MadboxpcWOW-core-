-- Drakkari Guardian ignoran aggro.
UPDATE `creature_template` SET `unit_flags` = unit_flags | 2 WHERE entry IN (26620,31339);