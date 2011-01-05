-- bg_chance_no_blizlike.sql
-- Update Chance bgs Warsong - Arathi Basing - Sota - Eye of The Storm (Saldran mas que alterac valley).
UPDATE `battleground_template` SET `Weight` = '3' WHERE `id` = 2;-- Warsong Gulch
UPDATE `battleground_template` SET `Weight` = '3' WHERE `id` = 3;-- Arathi Basin
UPDATE `battleground_template` SET `Weight` = '3' WHERE `id` = 7;-- Eye of The Storm
UPDATE `battleground_template` SET `Weight` = '2' WHERE `id` = 9;-- Strand of the Ancients