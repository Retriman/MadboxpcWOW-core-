DROP TABLE IF EXISTS `battlefield`;
CREATE TABLE `battlefield`(
   `id` INT NOT NULL AUTO_INCREMENT,
   `Timer` INT DEFAULT '60000',
   `Wartime` BOOLEAN DEFAULT '0',
   `DefenderTeam` INT DEFAULT '0',
   PRIMARY KEY (`id`)
);