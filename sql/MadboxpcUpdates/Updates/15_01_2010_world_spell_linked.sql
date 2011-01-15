-- Fix  [Talentos HUNTER] the beast within y bestial wrath https://github.com/Retriman/MadboxpcWOW-core-/issues#issue/33
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=19574;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(19574, -68766, 2, 'Bestial Wrath immune at Desecration'),
(19574, -58617, 2, 'Bestial Wrath immune at Glyph of Heart Strike'),
(19574, -51514, 2, 'Bestial Wrath immune at Hex'),
(19574, -45524, 2, 'Bestial Wrath immune at Chains of Ice'),
(19574, -118, 2, 'Bestial Wrath immune at Polymorph'),
(19574, -49012, 2, 'Bestial Wrath immune at Wyvern Sting'),
(19574, -1499, 2, 'Bestial Wrath immune at Freezing Trap'),
(19574, -6358, 2, 'Bestial Wrath immune at Seduction'),
(19574, -51209, 2, 'Bestial Wrath immune at Hungering Cold'),
(19574, -13810, 2, 'Bestial Wrath immune at Frost Trap'),
(19574, -33786, 2, 'Bestial Wrath immune at Cyclone'),
(19574, -64058, 2, 'Bestial Wrath immune at Psychic Horror'),
(19574, -51724, 2, 'Bestial Wrath immune at Sap'),
(19574, -2094, 2, 'Bestial Wrath immune at Blind'),
(19574, -19503, 2, 'Bestial Wrath immune at Scatter Shot'),
(19574, -66940, 2, 'Bestial Wrath immune at Hammer of Justice'),
(19574, -32416, 2, 'Bestial Wrath immune at Hammer of Justice'),
(19574, -20066, 2, 'Bestial Wrath immune at Repentance');