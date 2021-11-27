/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : c10-6-astar-osm

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 18/11/2021 22:55:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for amal_usaha
-- ----------------------------
DROP TABLE IF EXISTS `amal_usaha`;
CREATE TABLE `amal_usaha`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `node_id` int(11) UNSIGNED NOT NULL,
  `jenis_usaha_id` int(11) UNSIGNED NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fasilitas` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kegiatan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jam_operasional` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `alamat` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `keterangan` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `coordinate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gambar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `amal_usaha_jenis_usaha_id_foreign`(`jenis_usaha_id`) USING BTREE,
  INDEX `amal_usaha_node_id_foreign`(`node_id`) USING BTREE,
  CONSTRAINT `amal_usaha_jenis_usaha_id_foreign` FOREIGN KEY (`jenis_usaha_id`) REFERENCES `jenis_usaha` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `amal_usaha_node_id_foreign` FOREIGN KEY (`node_id`) REFERENCES `node` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of amal_usaha
-- ----------------------------
INSERT INTO `amal_usaha` VALUES (7, 19, 7, 'Smk muhammadiyah Jl.Abdul Hakim No.2 Tanjung Sari Medan.', '', '', '', 'Tiang Layar, 20353, Pancur Batu, Deli Serdang, North Sumatra, Indonesia', '', '3.5585348685884917, 98.63592701053047', '1637077895_5ae9e2adab8dba3f17b5.jpg', '2021-11-16 22:51:35', '2021-11-16 22:51:59');
INSERT INTO `amal_usaha` VALUES (8, 20, 4, 'Panti asuhan putera muhammadiyaj Jl. Amaliun, gg. Umanat No.5, Kecamatan Medan area.', '', '', '', 'Suka Rende, 20353, Kutalimbaru, Deli Serdang, North Sumatra, Indonesia', '', '3.5755597723650756, 98.69904030259588', '1637077973_a1a2af67582e07a83cfc.jpg', '2021-11-16 22:52:53', '2021-11-16 22:53:07');
INSERT INTO `amal_usaha` VALUES (9, 21, 7, 'SMA muhammadiyah 1 Medan', '', '', '', 'Gg.baru', '', '3.574371872671065, 98.69688258354687', '1637078026_eae2ffc6ba35040a3f82.jpg', '2021-11-16 22:53:46', '2021-11-16 22:54:05');

-- ----------------------------
-- Table structure for graph
-- ----------------------------
DROP TABLE IF EXISTS `graph`;
CREATE TABLE `graph`  (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `start` int(10) UNSIGNED NOT NULL,
  `end` int(10) UNSIGNED NOT NULL,
  `distance` decimal(10, 2) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  INDEX `graph_start_foreign`(`start`) USING BTREE,
  INDEX `graph_end_foreign`(`end`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  CONSTRAINT `graph_end_foreign` FOREIGN KEY (`end`) REFERENCES `node` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `graph_start_foreign` FOREIGN KEY (`start`) REFERENCES `node` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of graph
-- ----------------------------
INSERT INTO `graph` VALUES (14, 38, 39, 1.80, '2021-11-16 23:01:48', NULL);
INSERT INTO `graph` VALUES (15, 39, 37, 0.21, '2021-11-16 23:02:09', NULL);
INSERT INTO `graph` VALUES (16, 37, 36, 1.10, '2021-11-16 23:02:24', NULL);
INSERT INTO `graph` VALUES (17, 36, 35, 1.90, '2021-11-16 23:02:34', NULL);
INSERT INTO `graph` VALUES (18, 35, 22, 1.90, '2021-11-16 23:02:55', NULL);
INSERT INTO `graph` VALUES (19, 22, 58, 0.53, '2021-11-16 23:03:48', NULL);
INSERT INTO `graph` VALUES (20, 58, 19, 0.05, '2021-11-16 23:04:00', NULL);
INSERT INTO `graph` VALUES (21, 58, 23, 1.20, '2021-11-16 23:04:17', NULL);
INSERT INTO `graph` VALUES (22, 23, 24, 2.10, '2021-11-16 23:04:39', NULL);
INSERT INTO `graph` VALUES (23, 24, 26, 0.17, '2021-11-16 23:04:54', NULL);
INSERT INTO `graph` VALUES (24, 24, 23, 2.10, '2021-11-16 23:05:15', NULL);
INSERT INTO `graph` VALUES (25, 23, 58, 1.20, '2021-11-16 23:05:32', NULL);
INSERT INTO `graph` VALUES (26, 38, 59, 1.10, '2021-11-16 23:07:31', NULL);
INSERT INTO `graph` VALUES (27, 59, 60, 0.55, '2021-11-16 23:07:56', NULL);
INSERT INTO `graph` VALUES (28, 60, 35, 0.64, '2021-11-16 23:08:09', NULL);
INSERT INTO `graph` VALUES (29, 35, 61, 0.89, '2021-11-16 23:10:10', NULL);
INSERT INTO `graph` VALUES (30, 61, 62, 2.60, '2021-11-16 23:10:23', NULL);
INSERT INTO `graph` VALUES (31, 62, 63, 0.96, '2021-11-16 23:10:37', NULL);
INSERT INTO `graph` VALUES (32, 63, 64, 0.84, '2021-11-16 23:10:50', NULL);
INSERT INTO `graph` VALUES (33, 64, 22, 3.20, '2021-11-16 23:11:04', NULL);
INSERT INTO `graph` VALUES (34, 32, 31, 0.41, '2021-11-16 23:22:29', NULL);

-- ----------------------------
-- Table structure for jenis_usaha
-- ----------------------------
DROP TABLE IF EXISTS `jenis_usaha`;
CREATE TABLE `jenis_usaha`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `slug`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jenis_usaha
-- ----------------------------
INSERT INTO `jenis_usaha` VALUES (3, 'Klinik', '', 'green', 'Jenis usaha klinik.', '2021-11-15 18:35:33', '2021-11-15 18:41:51');
INSERT INTO `jenis_usaha` VALUES (4, 'Panti Asuhan', '', 'blue', 'Jenis usaha panti asuhan.', '2021-11-15 18:35:33', '2021-11-15 18:41:53');
INSERT INTO `jenis_usaha` VALUES (5, 'Mesjid', '', 'red', 'Jenis usaha mesjid.', '2021-11-15 18:35:33', '2021-11-15 18:41:54');
INSERT INTO `jenis_usaha` VALUES (6, 'Klinik', '', 'violet', 'Jenis usaha klinik.', '2021-11-15 18:35:33', '2021-11-15 18:41:56');
INSERT INTO `jenis_usaha` VALUES (7, 'Sekolah', 'sekolah', 'green', '', '2021-11-16 22:43:15', NULL);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `namespace` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (86, '2021-11-06-083104', 'App\\Database\\Migrations\\NodeMigration', 'default', 'App', 1636975213, 1);
INSERT INTO `migrations` VALUES (87, '2021-11-06-143442', 'App\\Database\\Migrations\\GraphMigration', 'default', 'App', 1636975213, 1);
INSERT INTO `migrations` VALUES (88, '2021-11-08-085853', 'App\\Database\\Migrations\\UserMigration', 'default', 'App', 1636975213, 1);
INSERT INTO `migrations` VALUES (89, '2021-11-11-064339', 'App\\Database\\Migrations\\JenisUsahaMigration', 'default', 'App', 1636975213, 1);
INSERT INTO `migrations` VALUES (90, '2021-11-11-080423', 'App\\Database\\Migrations\\AmalUsahaMigration', 'default', 'App', 1636975213, 1);

-- ----------------------------
-- Table structure for node
-- ----------------------------
DROP TABLE IF EXISTS `node`;
CREATE TABLE `node`  (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `coordinate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of node
-- ----------------------------
INSERT INTO `node` VALUES (19, 'Smk muhammadiyah Jl.Abdul Hakim No.2 Tanjung Sari Medan.', '3.5585348685884917, 98.63592701053047', '2021-11-16 22:51:35', '2021-11-16 22:51:56');
INSERT INTO `node` VALUES (20, 'Panti asuhan putera muhammadiyaj Jl. Amaliun, gg. Umanat No.5, Kecamatan Medan area.', '3.5755597723650756, 98.69904030259588', '2021-11-16 22:52:53', '2021-11-16 22:53:11');
INSERT INTO `node` VALUES (21, 'SMA muhammadiyah 1 Medan', '3.574371872671065, 98.69688258354687', '2021-11-16 22:53:46', '2021-11-16 22:54:01');
INSERT INTO `node` VALUES (22, 'Jl. Setia budi psr.2', '3.5549526272768275,98.63268380740678', '2021-11-16 22:55:10', '2021-11-16 22:55:10');
INSERT INTO `node` VALUES (23, 'JL.Setia Budi No.196', '3.56761818897729,98.64214627039867', '2021-11-16 22:55:19', '2021-11-16 22:55:19');
INSERT INTO `node` VALUES (24, 'Jln. Dr. Mansyur', '3.5673826119751557,98.66081527381414', '2021-11-16 22:55:27', '2021-11-16 22:55:27');
INSERT INTO `node` VALUES (25, 'Jl. Setia Budi', '3.5829648296989043,98.64328357665748', '2021-11-16 22:56:08', '2021-11-16 22:56:08');
INSERT INTO `node` VALUES (26, 'Jalan Let.Jend. Djamin Ginting 135', '3.5686504437910256,98.65990005898249', '2021-11-16 22:56:28', '2021-11-16 22:56:28');
INSERT INTO `node` VALUES (27, 'Universitas Sumatra Utara', '3.5707021005249384,98.66023267326337', '2021-11-16 22:56:39', '2021-11-16 22:56:39');
INSERT INTO `node` VALUES (28, 'Jl. Iskandar Muda', '3.5714131119307253,98.66073721560564', '2021-11-16 22:56:48', '2021-11-16 22:56:48');
INSERT INTO `node` VALUES (29, 'Terminal Keberangkatan Polonia Medan, Medan, North Sumatra 20153, Indonesia', '3.5717257854429487,98.66098191033971', '2021-11-16 22:56:55', '2021-11-16 22:56:55');
INSERT INTO `node` VALUES (30, 'Jl. Pattimura No. 360', '3.5728608323478195,98.66194282281643', '2021-11-16 22:57:09', '2021-11-16 22:57:09');
INSERT INTO `node` VALUES (31, 'Yuki Simp. Raya, Jl. Sm.Raja', '3.5724282299595123,98.68942044087831', '2021-11-16 22:57:18', '2021-11-16 22:57:18');
INSERT INTO `node` VALUES (32, 'Jl. Brigadir jendral katamso', '3.57243679621924,98.68568514350176', '2021-11-16 22:57:24', '2021-11-16 22:57:24');
INSERT INTO `node` VALUES (33, 'Jl. Sisingamangaraja No. 86-86A', '3.5743042673597447,98.68845972604313', '2021-11-16 22:57:44', '2021-11-16 22:57:44');
INSERT INTO `node` VALUES (34, 'Jl. Amaliun Gg. Johar', '3.574172559333366,98.69688155144073', '2021-11-16 22:57:59', '2021-11-16 22:57:59');
INSERT INTO `node` VALUES (35, 'Jl Setia budi', '3.5409033731631623,98.6224280202833', '2021-11-16 22:58:09', '2021-11-16 22:58:09');
INSERT INTO `node` VALUES (36, 'Jl. Flamboyan V No. 1/9', '3.5411603736306896,98.60547606724937', '2021-11-16 22:58:17', '2021-11-16 22:58:17');
INSERT INTO `node` VALUES (37, 'Jl Lizardi Putra', '3.5313943057611357,98.6051397481086', '2021-11-16 22:58:24', '2021-11-16 22:58:24');
INSERT INTO `node` VALUES (38, 'Jl Let Jend Jamin Ginting', '3.520343105081931,98.61921749579514', '2021-11-16 22:58:29', '2021-11-16 22:58:29');
INSERT INTO `node` VALUES (39, 'Jl Lizardi Putra', '3.5302806248243153,98.60664039512686', '2021-11-16 22:58:34', '2021-11-16 22:58:34');
INSERT INTO `node` VALUES (40, 'Jl. Sei Batang Serangan No. 39/54', '3.5846352551099376,98.6571927103407', '2021-11-16 22:58:40', '2021-11-16 22:58:40');
INSERT INTO `node` VALUES (41, 'Jl. S. Parman No. 1', '3.584078446978513,98.66701854208144', '2021-11-16 22:58:46', '2021-11-16 22:58:46');
INSERT INTO `node` VALUES (42, 'Jl Imam Bonjol 15-D', '3.583692964227427,98.67521735095069', '2021-11-16 22:58:52', '2021-11-16 22:58:52');
INSERT INTO `node` VALUES (43, 'Jl.stiabudi', '3.58429260399225,98.64122479849244', '2021-11-16 22:58:59', '2021-11-16 22:58:59');
INSERT INTO `node` VALUES (44, 'Komp. Tomang Elok Blok A No. 63', '3.590460304459798,98.64376015413143', '2021-11-16 22:59:05', '2021-11-16 22:59:05');
INSERT INTO `node` VALUES (45, 'Jl. Jend. Gatot Subroto', '3.5899034998772366,98.6580953047789', '2021-11-16 22:59:11', '2021-11-16 22:59:11');
INSERT INTO `node` VALUES (46, 'jl.perintis kemerdekaan no:27', '3.5987695017076775,98.68349983417967', '2021-11-16 22:59:27', '2021-11-16 22:59:27');
INSERT INTO `node` VALUES (47, 'Jln.Perintis Kemerdekaan No.48', '3.5986838402667223,98.68688656437388', '2021-11-16 22:59:34', '2021-11-16 22:59:34');
INSERT INTO `node` VALUES (48, 'Jl. Prof. H.M. Yamin', '3.596842117337989,98.68740320584833', '2021-11-16 22:59:41', '2021-11-16 22:59:41');
INSERT INTO `node` VALUES (49, 'Jl.Sutrisno no.170', '3.5810802435230387,98.69340951848912', '2021-11-16 22:59:47', '2021-11-16 22:59:47');
INSERT INTO `node` VALUES (50, 'Jl. Aksara', '3.597921452956548,98.70650653967718', '2021-11-16 22:59:53', '2021-11-16 22:59:53');
INSERT INTO `node` VALUES (51, 'Jl. AR. Hakim, Kompleks Asia Megamas', '3.587547784426067,98.70594609181359', '2021-11-16 23:00:01', '2021-11-16 23:00:01');
INSERT INTO `node` VALUES (52, 'Jl. A.R Hakim', '3.5819797055910128,98.70405785230889', '2021-11-16 23:00:06', '2021-11-16 23:00:06');
INSERT INTO `node` VALUES (53, 'Jl. Bakti', '3.571828582430332,98.70328480584388', '2021-11-16 23:00:12', '2021-11-16 23:00:12');
INSERT INTO `node` VALUES (54, 'Komp. Bisnis Centre No. 64 H-I', '3.5721798044713817,98.69722864044502', '2021-11-16 23:00:25', '2021-11-16 23:00:25');
INSERT INTO `node` VALUES (55, 'Komp. Bisnis Centre No. 64 H-I', '3.5732655940503815,98.69721543641718', '2021-11-16 23:00:31', '2021-11-16 23:00:31');
INSERT INTO `node` VALUES (56, 'Komp. Bisnis Centre No. 64 H-I', '3.5733052135366363,98.6970852233445', '2021-11-16 23:00:38', '2021-11-16 23:00:38');
INSERT INTO `node` VALUES (57, 'Komp. Bisnis Centre No. 64 H-I', '3.5741511433976316,98.69714433218536', '2021-11-16 23:00:45', '2021-11-16 23:00:45');
INSERT INTO `node` VALUES (58, 'Jln. Setia Budi No. 113', '3.5588204177365945,98.63559080645699', '2021-11-16 23:03:31', '2021-11-16 23:03:31');
INSERT INTO `node` VALUES (59, 'GBKP SIMPANG SELAYANG, Medan, North Sumatra 20135, Indonesia', '3.5305804621310077,98.62007712142642', '2021-11-16 23:07:01', '2021-11-16 23:07:01');
INSERT INTO `node` VALUES (60, 'Jl.Lizardi Putra', '3.535120843794974,98.62212700696305', '2021-11-16 23:07:05', '2021-11-16 23:07:05');
INSERT INTO `node` VALUES (61, 'Jalan Ringroad - Ngumban Surbakti No. 18', '3.540860539744976,98.63045335004391', '2021-11-16 23:08:37', '2021-11-16 23:08:37');
INSERT INTO `node` VALUES (62, 'Jalan LetJend. Djamin Ginting', '3.540517872328129,98.65423595335022', '2021-11-16 23:08:53', '2021-11-16 23:08:53');
INSERT INTO `node` VALUES (63, 'Carrefour Citra Garden', '3.547499695900967,98.65943266624255', '2021-11-16 23:09:05', '2021-11-16 23:09:05');
INSERT INTO `node` VALUES (64, 'Bakmie Korintus Pasar 1 Padang Bulan, Medan, North Sumatra 20156, Indonesia', '3.554909794509828,98.66127708153715', '2021-11-16 23:09:17', '2021-11-16 23:09:17');
INSERT INTO `node` VALUES (65, 'Jl.Monginsidi no 69', '3.5711432704887307,98.66345738827098', '2021-11-16 23:22:02', '2021-11-16 23:22:02');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` enum('PCM','PDM','ADMIN') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gambar` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '$2y$10$4066YMg1jzfRCA9/0zISLO1YioWflreabSP/Hq4W0chEQWIhC3/cS', 'ADMIN', 'default.png', '2021-11-15 18:35:33', NULL);
INSERT INTO `user` VALUES (2, 'adminpcm', '$2y$10$P3d4.RzoXewlU4gNi7eR6eBO3K1F0khzyqhtUfNgA1Xs4JIsa7pWG', 'PCM', 'default.png', '2021-11-15 18:35:33', NULL);
INSERT INTO `user` VALUES (3, 'adminpdm', '$2y$10$0ZJPRLLinpiPAu3IK4/FJOe2TdQCSJddLPLpX1GGEQXAYEFKLg2r.', 'PDM', 'default.png', '2021-11-15 18:35:33', NULL);

SET FOREIGN_KEY_CHECKS = 1;
