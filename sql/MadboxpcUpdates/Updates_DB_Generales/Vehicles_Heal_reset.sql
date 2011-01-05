-- Fix heal Vehiculos Mecanicos, No se pueden regenerar heal al bajarse de ellos nunca.
UPDATE `creature_template` SET `RegenHealth` = '0' WHERE `IconName` = 'vehichleCursor' AND VehicleId != 0;