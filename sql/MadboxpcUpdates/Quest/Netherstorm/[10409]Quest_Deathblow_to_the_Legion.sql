-- Fix Quest Deathblow to the Legion http://www.wowhead.com/quest=10409
UPDATE `quest_template` SET `SpecialFlags` = 0, `ReqCreatureOrGOCount1` = 1, `ReqCreatureOrGOId1` = 20132 WHERE `entry` = 10409;