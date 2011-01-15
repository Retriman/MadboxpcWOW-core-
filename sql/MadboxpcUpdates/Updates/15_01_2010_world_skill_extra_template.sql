ALTER TABLE `skill_extra_item_template` ADD (`newItemId` mediumint(8) unsigned NOT NULL DEFAULT 0);
DELETE FROM `skill_extra_item_template` WHERE `requiredSpecialization`=55534;
INSERT INTO `skill_extra_item_template` (`spellId`,`requiredSpecialization`,`additionalCreateChance`,`additionalMaxNum`,`newItemId`) VALUES
-- Red
(53831,55534,20,1,41432),-- Bold Bloodstone
(53852,55534,20,1,41444),-- Brilliant Bloodstone
(53832,55534,20,1,41434),-- Delicate Bloodstone
(53844,55534,20,1,41435),-- Flashing Bloodstone
(54017,55534,20,1,41437),-- Precise Bloodstone
-- Yellow
(53857,55534,20,1,41445),-- Mystic Sun Crystal
(53856,55534,20,1,41446),-- Quick Sun Crystal
(53845,55534,20,1,41436),-- Smooth Sun Crystal
(53843,55534,20,1,41449),-- Subtle Sun Crystal
-- Purple
(53892,55534,20,1,41482),-- Accurate Shadow Crystal
(53869,55534,20,1,41451),-- Defenders Shadow Crystal
(53873,55534,20,1,41488),-- Etched Shadow Crystal
(53861,55534,20,1,41462),-- Glinting Shadow Crystal
(53871,55534,20,1,41453),-- Guardians Shadow Crystal
(53865,55534,20,1,41455),-- Mysterious Shadow Crystal
(53921,55534,20,1,41457),-- Purified Shadow Crystal
(53860,55534,20,1,41460),-- Shifting Shadow Crystal
(53859,55534,20,1,41461),-- Sovereign Shadow Crystal
(53894,55534,20,1,41479),-- Timeless Shadow Crystal
(53883,55534,20,1,41502),-- Veiled Shadow Crystal
-- Orange
(53877,55534,20,1,41429),-- Deadly Huge Citrine
(53880,55534,20,1,41501),-- Deft Huge Citrine
(53876,55534,20,1,41489),-- Fierce Huge Citrine
(53874,55534,20,1,41483),-- Champions Huge Citrine
(53872,55534,20,1,41492),-- Inscribed Huge Citrine
(53879,55534,20,1,41493),-- Lucent Huge Citrine
(53882,55534,20,1,41495),-- Potent Huge Citrine
(53885,55534,20,1,41497),-- Reckless Huge Citrine
(53893,55534,20,1,41498),-- Resolute Huge Citrine
(53875,55534,20,1,41499),-- Resplendent Huge Citrine
(53891,55534,20,1,41490),-- Stalwart Huge Citrine
(53884,55534,20,1,41486),-- Willful Huge Citrine
-- Green
(53925,55534,20,1,41467),-- Energized Dark Jade
(53920,55534,20,1,41466),-- Forceful Dark Jade
(53870,55534,20,1,41468),-- Jagged Dark Jade
(53923,55534,20,1,41469),-- Lightning Dark Jade
(53922,55534,20,1,41470),-- Misty Dark Jade
(53917,55534,20,1,41481),-- Nimble Dark Jade
(53932,55534,20,1,41478),-- Radiant Dark Jade
(53918,55534,20,1,41458),-- Regal Dark Jade
(53933,55534,20,1,41474),-- Shattered Dark Jade
(53919,55534,20,1,41467),-- Steady Dark Jade
(53924,55534,20,1,41471),-- Turbid Dark Jade
-- Blue
(53854,55534,20,1,41447),-- Rigid Chalcedony
(53934,55534,20,1,41441),-- Solid Chalcedony
(53941,55534,20,1,41442),-- Sparkling Chalcedony
(53943,55534,20,1,41443); -- Stormy Chalcedony