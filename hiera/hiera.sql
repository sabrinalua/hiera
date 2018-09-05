use `hiera`;

DROP TABLE IF EXISTS `path`;
DROP TABLE IF EXISTS `object`;

CREATE TABLE `object`(
 `id` bigint(10) unsigned AUTO_INCREMENT,
 `name` varchar(10) NOT NULL,
 PRIMARY KEY `objid`(`id`)
 );

CREATE TABLE `path`(
 `ancestor` bigint(10) unsigned NOT NULL,
 `descendant` bigint(10) unsigned NOT NULL,
 `depth` bigint(10) unsigned NOT NULL,
 PRIMARY KEY `pathidentifier`(`ancestor`, `descendant`),
 FOREIGN KEY (`ancestor`) REFERENCES `object`(`id`),
 FOREIGN KEY (`descendant`) REFERENCES `object`(`id`)
 );

INSERT INTO `object` (`name`) values ("root"), ("dir1"), ("dir2"), ("dir3");
INSERT INTO `path` (`ancestor`, `descendant`, `depth`) values (1,1,0);