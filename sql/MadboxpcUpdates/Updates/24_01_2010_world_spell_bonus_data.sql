-- Fix Talent - Naturalist - Druida spell=17069
DELETE FROM `spell_bonus_data` WHERE `entry` IN (779,780,769,9754,9908,26997,48561,48562);
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`,`ap_bonus`, `ap_dot_bonus`, `comments`) VALUES 
(779,0,0,0.063,0,'Druid - Swipe (Bear) Rank 1'),
(780,0,0,0.063,0,'Druid - Swipe (Bear) Rank 2'),
(769,0,0,0.063,0,'Druid - Swipe (Bear) Rank 3'),
(9754,0,0,0.063,0,'Druid - Swipe (Bear) Rank 4'),
(9908,0,0,0.063,0,'Druid - Swipe (Bear) Rank 5'),
(26997,0,0,0.063,0,'Druid - Swipe (Bear) Rank 6'),
(48561,0,0,0.063,0,'Druid - Swipe (Bear) Rank 7'),
(48562,0,0,0.063,0,'Druid - Swipe (Bear) Rank 8');
