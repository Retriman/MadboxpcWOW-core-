/*
Emblem of Valor = 40753
Emblem of Conquest = 45624
Emblem of Heroism = 40752
Emblem of Triumph = 47241
Emblem of Frost = 49426
*/
-- Actualizo Loot de emblemas 
-- Emblem of Heroism a Emblem of Valor
UPDATE `creature_loot_template` SET `item` = 40753 WHERE `item` = 47241;
UPDATE `gameobject_loot_template` SET `item` = 40753 WHERE `item` = 47241;
UPDATE `item_loot_template` SET `item` = 40753 WHERE `item` = 47241;
UPDATE `reference_loot_template` SET item = 40753 WHERE item=47241;
-- Emblem of Conquest  Naxxramas 25 men 
UPDATE `creature_loot_template` SET `item` = 40753 WHERE `item` = 47241 AND `entry` IN (29324, 29373, 29417, 29448, 30061, 29991, 29940, 29955, 29249, 29268, 29278, 29718, 29701, 29615);
UPDATE `gameobject_loot_template` SET `item` = 40753 WHERE `item` = 47241 AND `entry` IN (25193);
-- Emblem of Valor a Obsidian Sanctum 25 men
UPDATE `item_loot_template` SET `item` = 40753 WHERE `item` = 47241 AND `entry` IN (43347, 43346);
-- Update quest Raid Dalaran
UPDATE `quest_template` SET `RewItemId1` = 40753, `RewItemId2` = 45624 WHERE `RewItemId1`= 49426 AND `RewItemId2`= 47241 AND `type` = 62; -- quest Raid
/* 
LOOT SE IMPLENTARA EN EL SQL COMPLETO DE ULDUAR JUNTO CON LAS CHEST
-- Emblem of Conquest a Ulduar
-- UPDATE `creature_loot_template` SET `item` = 45624 WHERE `item` = 47241 AND `entry` IN (33113, 34003, 33118, 33190, 33186, 33724, 33293, 33885, 32867, 33693, 32927, 33692, 32857, 33694, 32930, 33515, 34175, 32906, 33360, 32845, 32846, 33350, 32865, 33147, 33271, 33449, 33288, 33955, 32871);
*/
-- Trial of Crusader emblem loot
UPDATE `creature_loot_template` SET `item` = '45624' WHERE `entry` IN (34797,34780,34497,34496,34564,35348,35349,35351,35352,35615,35616,35268,35269,35448,35449) AND `item` = 40753;
UPDATE `gameobject_loot_template` SET `item` = '45624' WHERE `entry` IN (27498,27335,27503,27356) AND `item` = 40753;
/*
Respaldo Querys info
SELECT entry,item, mincountOrRef FROM creature_loot_template WHERE entry IN (34797,34780,34497,34496,34564,35348,35349,35351,35352,35615,35616,35268,35269,35448,35449) AND item =40753;
SELECT `data1` FROM `gameobject_template` WHERE `entry` IN (195631,195632,195633,195635);
SELECT * FROM gameobject_loot_template WHERE entry IN (27498,27335,27503,27356) AND item=40753;
*/

