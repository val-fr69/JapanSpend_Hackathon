-- Adminer 4.8.1 MySQL 8.0.32 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP DATABASE IF EXISTS `japan`;
CREATE DATABASE `japan` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `japan`;

DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `location` varchar(255) NOT NULL,
  `url` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `activity` (`id`, `name`, `description`, `price`, `location`, `url`) VALUES
(1,	'Senso-ji temple',	'Senso-ji temple is the oldest and most famous Buddhist temple in Tokyo',	60,	'2 Chome-3-1 Asakusa, Taito City, Tokyo 111-0032, Japan',	'https://i.pinimg.com/originals/40/2c/90/402c90774ca93eea0dfdcf6f2e140391.jpg'),
(2,	'Yoyogi Park',	'Yoyogi Park is one of the largest parks in Tokyo',	70,	'2 Chome-1 Yoyogikamizonocho, Shibuya City, Tokyo 151-0052, Japan',	'https://th.bing.com/th/id/OIP.-vDFZkO3WG0OyVrVys58kAHaE8?pid=ImgDet&rs=1'),
(3,	'quartier de Shibuya',	'Visit the famous Shibuya intersection, one of the busiest intersections in the world',	100,	'2 Chome-2-1 Dogenzaka, Shibuya City, Tokyo 150-0043, Japan',	'https://d3ba08y2c5j5cf.cloudfront.net/wp-content/uploads/sites/2/2020/02/13002129/Photo-by-Jezael-Melgoza-on-Unsplash-1-scaled.jpg'),
(4,	'Tokyo Skytree',	'The Tokyo Skytree is the tallest telecommunication tower in Japan and offers a breathtaking panoramic view of the city',	2100,	'1 Chome-1-2 Oshiage, Sumida City, Tokyo 131-0045, Japan',	'https://www.travelcaffeine.com/wp-content/uploads/2016/03/tokyo-skytree-water-area-japan-bricker.jpg'),
(5,	'Toyosu Fish Market',	'the largest fish market in the world',	65,	'6 Chome-6-1 Toyosu, Koto City, Tokyo 135-0061, Japan',	'https://www.myluxurytravel.fr/wp-content/uploads/2019/01/japan-523804_1920.jpg'),
(6,	'Imperial Palace of Tokyo',	'The Tokyo Imperial Palace is the main residence of the Emperor of Japan',	90,	'1 Chiyoda, Chiyoda City, Tokyo 100-8111, Japan',	'https://i.pinimg.com/originals/df/db/1a/dfdb1a7adb1cd00e8d47adab5c96729f.jpg'),
(7,	'Odaiba',	'Odaiba is an artificial island located in Tokyo Bay, offering many tourist attractions',	200,	'1 Chome-7-1 Daiba, Minato City, Tokyo 135-0091, Japan',	'https://i.pinimg.com/originals/c8/cc/45/c8cc459780ea58dd69193066e9c0dd33.jpg'),
(8,	'Mori Museum',	'museum of contemporary art that presents temporary exhibitions of international and Japanese artists.',	1800,	'6 Chome-10-1 Roppongi, Minato City, Tokyo 106-0032, Japan',	'https://th.bing.com/th/id/R.a8bf2ec168b31d730daa74b9734d9fb2?rik=Bzb5EdqpTgaRoA&riu=http%3a%2f%2fwww.abitare.it%2fwp-content%2fuploads%2f2016%2f01%2f07-Takashi-Murakami-Mori-Museum1.jpg&ehk=XvU1I6Qpwn8pKPBXPi8rJRZ0YBTC%2f4PCiH6HJ4zBMuk%3d&risl=&pid=ImgRaw&r=0');

DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `city` (`id`, `name`) VALUES
(1,	'Tokyo'),
(2,	'Kyoto'),
(3,	'Kanagawa'),
(4,	'Osaka'),
(5,	'Chiba'),
(6,	'Aichi'),
(7,	'Nara'),
(8,	'Hiroshima'),
(9,	'Okinawa'),
(10,	'Hyogo');

DROP TABLE IF EXISTS `restaurant`;
CREATE TABLE `restaurant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `location` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `url` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `restaurant_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `restaurant` (`id`, `city_id`, `name`, `location`, `description`, `price`, `url`) VALUES
(1,	1,	'Sushi Dai (寿司大)',	'6 Chome-5-1 Toyosu, Koto City, Tokyo 135-0061, Japan',	'A famous sushi restaurant located near the Toyosu fish market',	7000,	'https://lh3.googleusercontent.com/8NaPSjtWVo7t-A7s7WoKBjGDrxaZHY98wbio8628tTvqbZ4awZALaZ6qzzRYRZraPvkKC87KpmveV2iHVNiaxN6BdvcFpffsYkwJT2dVrBKOns4e1DJO4ypzOOJws9P1bRrXczg8EIF-ZPVni7xwAOo-vi6iMx_RdHA3vNrno02qTVFY5YqYkBNorrpmZJJv7rzw9WsuN0TcE2hOlp2gKhJeTwrPdvQZk52LBxrEdA3emxIiO6OWKVq6KmXJZpgcInM7Cy8jCog94eHfl3Bh1b8rxNxzKJ1-rdDQtq5YQxh2q_jnC8dmvDuqxyEXMUojU7mNDTbKcXV7u5XOrTJlb8tWZdz28B2PmS87uPgcHc48vU5r6KrTxV6EBwiRzMjq7Mol36uUBa10gGzscJFM7aT3kwzQHgr86okhDBXVzNUn56Of2X6rcDJQSAW4Z4ZPk1YsCDiC2VoNGtlp9eOknDS1KC4mt4gjriMHgt6bDdvczuePz1UAGDBMi4p0cRY18swXFM0nHqfTydbusWal1YsDmNCRJ6EgX-V-CwG0QFq6-pkaL6SWsVAE84Yzt7eOlPxwnwmNY5jp7qa5MOIel_lDZUHBKLnxFCLtd7zPxcU9HHQOkNhvm_4dK1cLwFTkKENFJ4g0yaRA0Do1mM7NSinivyzj1OKqiOPc0KQ4qPgJH60DgnDQC4j5LcgsTRS2-mSx0kYp8p_-WPCcU5ac_2qebYAGTLD_Ai-Lvpn-A7hpTgh9=w2400-h1600-no'),
(4,	1,	'Ichiran (一蘭)',	'Japan, 〒150-0041 Tokyo, Shibuya City, Jinnan, 1 Chome−22−7, Iwamoto Building B1F',	' A chain of restaurants specializing in tonkotsu ramen',	1000,	'https://ifoodcourt.com.hk/wp-content/uploads/2016/12/ICHIRAN.jpg'),
(5,	1,	'Tonkatsu Maisen (とんかつ まい泉)',	'4 Chome-8-5 Jingumae, Shibuya City, Tokyo 150-0001, Japan',	'A restaurant specializing in tonkatsu (breaded pork) with several branches in Tokyo',	2200,	'https://mai-sen.com/restaurant/51387194a63e2b340ede0ed7d5a4efca.jpg'),
(6,	1,	'Kikanbo (鬼金棒) ',	'2 Chome-10-10 Kajicho, Chiyoda City, Tokyo 101-0044, Japan',	'A spicy ramen restaurant located in the Kanda district.',	1500,	'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjvlugnnhtyO4_PJVXk0pGpseW18cozwBuFMcIrDkvSs-aP0WYIImkRQoKEk3vqAweY0enzL9q4-3d3JuZbDkvJ6zDduBK3gMC-uWV72SiK0OGtx-X7ghy3MUsK2H5F43l1acFBd3jQWHNuZMtW_lnF1lof2Dqe5-zBuJQltkugbpkSdPdNpY7jeyxa_g/s3648/DSC04530.JPG'),
(7,	1,	'Sukiyabashi Jiro (すきやばし 次郎) ',	'4 Chome-2-15 Ginza, Chuo City, Tokyo 104-0061, Japan',	'A high-end sushi restaurant with three Michelin stars, led by the famous chef Jiro Ono',	30000,	'https://www.roppongihills.com/assets/images/gourmet_shops/shop/rh0138_03.jpg'),
(8,	1,	'Afuri (阿夫利)',	'Japan, 〒150-0001 Tokyo, Shibuya City, Jingumae, 3 Chome−63−1',	'A chain of ramen restaurants known for its yuzu ramen (lemon ramen)',	1300,	'https://hungryghost.sg/wp-content/uploads/2021/04/AFURI-Ramen-Restaurant-Front-scaled.jpg'),
(9,	1,	'Katsu Midori (かつみどり)',	'Japan, 〒150-0042 Tokyo, Shibuya City, Udagawacho, 24−8, 7F Seibu Shibuya A Building',	'A chain of sushi kaiten (conveyor belt sushi) restaurants offering affordable sushi',	2500,	'https://www.hawaii-arukikata.com/wp-img/2020/09/katsumidori.jpg'),
(10,	1,	'Tsuta (蔦)',	'Japan, 〒170-0002 Tokyo, Toshima City, Sugamo, 1 Chome−14−1',	'A Michelin-starred ramen restaurant, famous for its shoyu soba',	1500,	'https://2.bp.blogspot.com/-QakpaHneBEk/WB84ShriJUI/AAAAAAAAK8A/-IBe8AqMVnIvuq33kNho0r1ajySt7QgBACLcB/s1600/TsutaInterior1.jpg');

DROP TABLE IF EXISTS `transport`;
CREATE TABLE `transport` (
  `id` int NOT NULL AUTO_INCREMENT,
  `moyenne` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `url` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `transport` (`id`, `moyenne`, `price`, `url`) VALUES
(1,	'transport en commun',	1080,	'https://th.bing.com/th/id/R.174de7320cb582e3ea62cdce81543151?rik=IIOxtUDOE2lkIA&pid=ImgRaw&r=0'),
(2,	'velo',	1000,	'https://www.journaldujapon.com/wp-content/uploads/2017/01/japanican-UNE-1024x680.jpg'),
(3,	'voiture',	8000,	'https://www.downshift.fr/wp-content/uploads/2019/07/Louer-voiture-japon-pour-dormir.jpg');

-- 2023-05-11 22:03:32
