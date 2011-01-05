-- Trial of Crusader emblem loot
UPDATE `creature_loot_template` SET `item` = '45624' WHERE `entry` IN (34797,34780,34497,34496,34564,35348,35349,35351,35352,35615,35616,35268,35269,35448,35449) AND `item` = 40753;
UPDATE `gameobject_loot_template` SET `item` = '45624' WHERE `entry` IN (27498,27335,27503,27356) AND `item` = 40753;
/*
Respaldo Querys
SELECT entry,item, mincountOrRef FROM creature_loot_template WHERE entry IN (34797,34780,34497,34496,34564,35348,35349,35351,35352,35615,35616,35268,35269,35448,35449) AND item =40753;
SELECT `data1` FROM `gameobject_template` WHERE `entry` IN (195631,195632,195633,195635);
SELECT * FROM gameobject_loot_template WHERE entry IN (27498,27335,27503,27356) AND item=40753;
*/