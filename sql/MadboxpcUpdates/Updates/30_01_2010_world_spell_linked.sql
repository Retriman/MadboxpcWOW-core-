--  http://www.wowhead.com/spell=11129 Combustion Stack Limit.
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`='-11129' AND `spell_effect` ='-28682';
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(-11129, -28682, 0, 'Combustion remove stack limit');