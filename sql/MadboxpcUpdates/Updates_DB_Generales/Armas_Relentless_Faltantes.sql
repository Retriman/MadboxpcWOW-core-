-- Solucionando Problema de Armas Faltantes 3vs3.
SET @NPC = 34090;
DELETE FROM `npc_vendor` WHERE `entry`=@NPC AND `item` IN (48511,48438,48440,48509,48519,48435,48513,48521,48444,48507,48517,48523,48515,48442,49191);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@NPC, 0, 48511, 0, 0, 1758),-- http://www.wowhead.com/item=48511 - Relentless Gladiator's Truncheon
(@NPC, 0, 48438, 0, 0, 1758),-- http://www.wowhead.com/item=48438 - Relentless Gladiator's Swiftblade
(@NPC, 0, 48440, 0, 0, 1758),-- http://www.wowhead.com/item=48440 - Relentless Gladiator's Splitter
(@NPC, 0, 48509, 0, 0, 1758),-- http://www.wowhead.com/item=48509 - Relentless Gladiator's Spike
(@NPC, 0, 48519, 0, 0, 1758),-- http://www.wowhead.com/item=48519 - Relentless Gladiator's Salvation 
(@NPC, 0, 48435, 0, 0, 1758),-- http://www.wowhead.com/item=48435 - Relentless Gladiator's Punisher
(@NPC, 0, 48513, 0, 0, 1758),-- http://www.wowhead.com/item=48513 - Relentless Gladiator's Longblade
(@NPC, 0, 48521, 0, 0, 1758),-- http://www.wowhead.com/item=48521 - Relentless Gladiator's Light Staff 
(@NPC, 0, 48444, 0, 0, 1758),-- http://www.wowhead.com/item=48444 - Relentless Gladiator's Left Claw
(@NPC, 0, 48507, 0, 0, 1758),-- http://www.wowhead.com/item=48507 - Relentless Gladiator's Handaxe
(@NPC, 0, 48517, 0, 0, 1758),-- http://www.wowhead.com/item=48517 - Relentless Gladiator's Halberd
(@NPC, 0, 48523, 0, 0, 1758),-- http://www.wowhead.com/item=48523 - Relentless Gladiator's Greatstaf
(@NPC, 0, 48515, 0, 0, 1758),-- http://www.wowhead.com/item=48515 - Relentless Gladiator's Grasp
(@NPC, 0, 48442, 0, 0, 1758),-- http://www.wowhead.com/item=48442 - Relentless Gladiator's Eviscerator
(@NPC, 0, 49191, 0, 0, 1758);-- http://www.wowhead.com/item=49191 - Relentless Gladiator's Blade of Celerity
