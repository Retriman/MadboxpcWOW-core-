-- Fix [Hunter] Talento Ferocious inspiration
DELETE FROM `spell_pet_auras` WHERE `spell` IN ('34455','34459','34460');
INSERT INTO `spell_pet_auras` (`spell`, `effectId`, `pet`, `aura`) VALUES
('34455','0','0','75593'), -- Ferocious Inspiration (Rank 1)
('34459','0','0','75446'), -- Ferocious Inspiration (Rank 2)
('34460','0','0','75447'); -- Ferocious Inspiration (Rank 3)
