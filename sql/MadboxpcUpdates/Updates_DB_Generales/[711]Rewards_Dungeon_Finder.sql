-- Dungeon Finder Rewards. (Dungeons 80).
-- Quest http://www.wowhead.com/?quest=24790
-- Daily Normal Random (1st)
UPDATE `quest_template` SET  `RewItemId1` =  '40753' WHERE `entry` =24790;
-- Daily Heroic Random (1st)
UPDATE `quest_template` SET  `RewItemId1` =  '45624' WHERE `entry` =24788;
UPDATE `quest_template` SET  `RewItemId1` =  '0' WHERE `entry` =24789;