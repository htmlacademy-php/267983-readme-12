CREATE DATABASE IF NOT EXISTS `267983-readme-12`
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE `267983-readme-12`;

CREATE TABLE IF NOT EXISTS `users` (

`id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
`login` CHAR NOT NULL UNIQUE,
`password` CHAR NOT NULL,
`email` CHAR NOT NULL UNIQUE,
`avatar` CHAR,
`registration_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);


 CREATE TABLE IF NOT EXISTS `posts` (

 `id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
 `post_header` CHAR,
 `post_content` VARCHAR(1000),  -- так работает 
--  `post_content` TEXT,
 `post_author_id` INT UNSIGNED NOT NULL,
 `post_content_type_id` INT UNSIGNED NOT NULL,
 `image` TEXT,
 `video` TEXT,
 `website_link` TEXT,
 `views_quantity` INT UNSIGNED DEFAULT 0,
 `post_hashtag_id` INT UNSIGNED, --  не NOT NULL так как может быть без хештега
 `creation_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

 CONSTRAINT `post_author`
 FOREIGN KEY (`post_author_id`) REFERENCES `users` (`id`)
             ON UPDATE CASCADE
             ON DELETE RESTRICT,

 CONSTRAINT `post_content_type`
 FOREIGN KEY (`post_content_type_id`) REFERENCES `content_types` (`id`)
             ON UPDATE CASCADE
             ON DELETE RESTRICT,

 CONSTRAINT `post_hashtag`
 FOREIGN KEY (`post_hashtag_id`) REFERENCES `hashtags` (`id`)
             ON UPDATE CASCADE
             ON DELETE RESTRICT

);

CREATE INDEX `post_header_index` ON `posts` (`post_header`);
CREATE INDEX `post_content_index` ON `posts` (`post_content`);


 CREATE TABLE IF NOT EXISTS `comments` (
 `id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
 `comment_content` TEXT,
 `comment_author_id` INT UNSIGNED NOT NULL,
 `comment_post_id` INT UNSIGNED NOT NULL,
 `creation_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

 CONSTRAINT `comment_author`
 FOREIGN KEY (`comment_author_id`) REFERENCES `users` (`id`)
            ON UPDATE CASCADE
            ON DELETE RESTRICT,

 CONSTRAINT `comment_post`
 FOREIGN KEY (`comment_post_id`) REFERENCES `posts` (`id`)
            ON UPDATE CASCADE
            ON DELETE RESTRICT

 );

 CREATE TABLE IF NOT EXISTS `likes` (
  `like_author_id` INT UNSIGNED NOT NULL,
  `like_post_id` INT UNSIGNED NOT NULL,

 CONSTRAINT `like_author`
 FOREIGN KEY (`like_author_id`) REFERENCES `users` (`id`)
            ON UPDATE CASCADE
            ON DELETE RESTRICT,

 CONSTRAINT `like_post`
 FOREIGN KEY (`like_post_id`) REFERENCES `posts` (`id`)
            ON UPDATE CASCADE
            ON DELETE RESTRICT
 );


 CREATE TABLE IF NOT EXISTS `subscriptions` (

 `subscription_from_id` INT UNSIGNED NOT NULL,
 `subscription_to_id` INT UNSIGNED NOT NULL,

  CONSTRAINT `subscription_from`
  FOREIGN KEY (`subscription_from_id`) REFERENCES `users` (`id`)
            ON UPDATE CASCADE
            ON DELETE RESTRICT,

  CONSTRAINT `subscription_to`
  FOREIGN KEY (`subscription_to_id`) REFERENCES `users` (`id`)
            ON UPDATE CASCADE
            ON DELETE RESTRICT


 );


 CREATE TABLE IF NOT EXISTS `messages` (
 `id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
 `message_content` TEXT,
 `sender_id` INT UNSIGNED NOT NULL,
 `recipient_id` INT UNSIGNED NOT NULL,
 `creation_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

 CONSTRAINT `sender`
 FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`)
            ON UPDATE CASCADE
            ON DELETE RESTRICT,

 CONSTRAINT `recipient`
 FOREIGN KEY (`recipient_id`) REFERENCES `users` (`id`)
            ON UPDATE CASCADE
            ON DELETE RESTRICT

 );

CREATE TABLE IF NOT EXISTS `hashtags` (
 `id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
 `hashtag_name` CHAR
);

CREATE INDEX `hashtag_index` ON `hashtags` (`hashtag_name`);


CREATE TABLE IF NOT EXISTS `content_types` (
 `id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
 `content_type_name` ENUM('Текст', 'Цитата', 'Картинка', 'Видео', 'Ссылка'),
 `icon_class_name` ENUM('photo', 'video', 'text', 'quote', 'link')
);

