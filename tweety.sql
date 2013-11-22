SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `tweety` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `tweety` ;

-- -----------------------------------------------------
-- Table `tweety`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tweety`.`user` ;

CREATE  TABLE IF NOT EXISTS `tweety`.`user` (
  `user_id` BIGINT NOT NULL AUTO_INCREMENT ,
  `user_name` CHAR(30) NULL ,
  `first_name` CHAR(30) NULL ,
  `last_name` CHAR(30) NULL ,
  `email` VARCHAR(255) NOT NULL ,
  `is_male` TINYINT(1) NULL ,
  `date_birth` DATE NULL ,
  `alias` CHAR(30) NULL ,
  `isprivate` TINYINT(1) NULL ,
  `subtext` VARCHAR(125) NULL ,
  `password` CHAR(255) NULL ,
  PRIMARY KEY (`user_id`) ,
  UNIQUE INDEX `user_name_UNIQUE` (`user_name` ASC) ,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tweety`.`tweet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tweety`.`tweet` ;

CREATE  TABLE IF NOT EXISTS `tweety`.`tweet` (
  `tweet_id` BIGINT NOT NULL AUTO_INCREMENT ,
  `owner` BIGINT NOT NULL ,
  `text` VARCHAR(141) NULL ,
  `origin_id` BIGINT NULL DEFAULT NULL ,
  `reply_to` BIGINT NULL DEFAULT NULL ,
  PRIMARY KEY (`tweet_id`) ,
  INDEX `owneruser_idx` (`owner` ASC) ,
  INDEX `replytweet_idx` (`reply_to` ASC) ,
  INDEX `orgintweet_idx` (`origin_id` ASC) ,
  CONSTRAINT `owneruser`
    FOREIGN KEY (`owner` )
    REFERENCES `tweety`.`user` (`user_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `replytweet`
    FOREIGN KEY (`reply_to` )
    REFERENCES `tweety`.`tweet` (`tweet_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `orgintweet`
    FOREIGN KEY (`origin_id` )
    REFERENCES `tweety`.`tweet` (`tweet_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tweety`.`following`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tweety`.`following` ;

CREATE  TABLE IF NOT EXISTS `tweety`.`following` (
  `follower_id` BIGINT NOT NULL ,
  `following_id` BIGINT NOT NULL ,
  PRIMARY KEY (`follower_id`, `following_id`) ,
  INDEX `followinguser_idx` (`following_id` ASC) ,
  INDEX `followeruser_idx` (`follower_id` ASC) ,
  CONSTRAINT `followinguser`
    FOREIGN KEY (`following_id` )
    REFERENCES `tweety`.`user` (`user_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `followeruser`
    FOREIGN KEY (`follower_id` )
    REFERENCES `tweety`.`user` (`user_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `tweety` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `tweety`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `tweety`;
INSERT INTO `tweety`.`user` (`user_id`, `user_name`, `first_name`, `last_name`, `email`, `is_male`, `date_birth`, `alias`, `isprivate`, `subtext`, `password`) VALUES (1, 'talhakkas', 'talha', 'akkas', 'talhakkas@gmail.com', 1, '30/03/1991', NULL, NULL, 'günler geçiyor', '1123');
INSERT INTO `tweety`.`user` (`user_id`, `user_name`, `first_name`, `last_name`, `email`, `is_male`, `date_birth`, `alias`, `isprivate`, `subtext`, `password`) VALUES (2, 'sy', 'sel', 'yu', 'seyu@24.com', 1, '10/1/1980', NULL, NULL, 'İsa Hanginiz? (Roman - Turkuvaz Kitap) Kafa Dengi - 24 Tv (C.tesi - 20:20 Canlı) Kaçış Planı - AHaber (Cuma - 23.15 Canlı)', '2123');
INSERT INTO `tweety`.`user` (`user_id`, `user_name`, `first_name`, `last_name`, `email`, `is_male`, `date_birth`, `alias`, `isprivate`, `subtext`, `password`) VALUES (3, 'tahta', 'kor', 'ta', 'korta@gmail.com', 1, '8/3/1991', 'element uydurmayın', NULL, NULL, '3123');
INSERT INTO `tweety`.`user` (`user_id`, `user_name`, `first_name`, `last_name`, `email`, `is_male`, `date_birth`, `alias`, `isprivate`, `subtext`, `password`) VALUES (4, 'female', 'female', 'character', 'femchar@gmail.com', 2, '15/10/1985', 'fem', 1, 'som fem stuff', '4123');

COMMIT;

-- -----------------------------------------------------
-- Data for table `tweety`.`tweet`
-- -----------------------------------------------------
START TRANSACTION;
USE `tweety`;
INSERT INTO `tweety`.`tweet` (`tweet_id`, `owner`, `text`, `origin_id`, `reply_to`) VALUES (1, 2, 'Yobazlık herkese eşit mesafededir, herkesle teker teker ilgilenir, hatrını sorar, dünya görüşü ayırt etmeden kendini herkese cömertce sunar.', NULL, NULL);
INSERT INTO `tweety`.`tweet` (`tweet_id`, `owner`, `text`, `origin_id`, `reply_to`) VALUES (2, 1, NULL, 1, NULL);
INSERT INTO `tweety`.`tweet` (`tweet_id`, `owner`, `text`, `origin_id`, `reply_to`) VALUES (3, 1, 'Django Django Django... Tarantino filmi fazla söze ne gerek http://youtu.be/_bdOTUocn5w  @youtube aracılığıyla', NULL, NULL);
INSERT INTO `tweety`.`tweet` (`tweet_id`, `owner`, `text`, `origin_id`, `reply_to`) VALUES (4, 2, 'That\'s me in the corner...', NULL, NULL);
INSERT INTO `tweety`.`tweet` (`tweet_id`, `owner`, `text`, `origin_id`, `reply_to`) VALUES (5, 3, 'günler kötü geçiyor', NULL, NULL);
INSERT INTO `tweety`.`tweet` (`tweet_id`, `owner`, `text`, `origin_id`, `reply_to`) VALUES (6, 2, 'hayırdır', NULL, 5);
INSERT INTO `tweety`.`tweet` (`tweet_id`, `owner`, `text`, `origin_id`, `reply_to`) VALUES (7, 4, 'female stuff private to followers', NULL, NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `tweety`.`following`
-- -----------------------------------------------------
START TRANSACTION;
USE `tweety`;
INSERT INTO `tweety`.`following` (`follower_id`, `following_id`) VALUES (1, 2);
INSERT INTO `tweety`.`following` (`follower_id`, `following_id`) VALUES (3, 1);
INSERT INTO `tweety`.`following` (`follower_id`, `following_id`) VALUES (1, 3);
INSERT INTO `tweety`.`following` (`follower_id`, `following_id`) VALUES (4, 1);
INSERT INTO `tweety`.`following` (`follower_id`, `following_id`) VALUES (4, 2);
INSERT INTO `tweety`.`following` (`follower_id`, `following_id`) VALUES (4, 3);
INSERT INTO `tweety`.`following` (`follower_id`, `following_id`) VALUES (1, 4);

COMMIT;
