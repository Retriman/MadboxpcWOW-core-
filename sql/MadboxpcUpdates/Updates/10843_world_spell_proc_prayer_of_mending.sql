-- "Prayer of Mending should not proc when damage is absorbed"
UPDATE `spell_proc_event` SET `procEx` = 0x00040000 WHERE `entry` IN (33076, 48110, 48111);