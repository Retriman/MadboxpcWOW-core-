-- Fix Quest Creatures of the Eco-Domes 10427
UPDATE `creature_template` SET `ScriptName`='mob_Talbuk' WHERE entry IN (20610,20777);