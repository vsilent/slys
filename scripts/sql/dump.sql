-- phpMyAdmin SQL Dump
-- version 3.3.2deb1ubuntu1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 27, 2012 at 03:03 PM
-- Server version: 5.1.62
-- PHP Version: 5.3.2-1ubuntu4.14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `slys`
--

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE IF NOT EXISTS `banner` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'text',
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `src` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sysmap_id` varchar(35) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `flash_width` int(11) DEFAULT NULL,
  `flash_height` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `banner`
--


-- --------------------------------------------------------

--
-- Table structure for table `email_template`
--

CREATE TABLE IF NOT EXISTS `email_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sysname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_from` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reply_to` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sysname` (`sysname`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `email_template`
--

INSERT INTO `email_template` (`id`, `sysname`, `subject`, `email_from`, `reply_to`, `message`) VALUES
(1, 'contact_email', 'Contact form from contact page @subject@ ', '@login@', '@to@', 'You have a message from contact form\r\n\r\n@message@'),
(2, 'password_recovery_email', 'Password recovery information', '@login@', '@to@', 'Hello, @user_full_name@.\r\n\r\nPlease click \r\n<a href="@recovery_link@">Change password</a> link if you want to change the password, if not just ignore this message.\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `navigation_items`
--

CREATE TABLE IF NOT EXISTS `navigation_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `external_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sysmap_identifier` varchar(35) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `read_only` tinyint(1) DEFAULT '0',
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `level` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=56 ;

--
-- Dumping data for table `navigation_items`
--

INSERT INTO `navigation_items` (`id`, `type`, `title`, `external_link`, `sysmap_identifier`, `route`, `read_only`, `lft`, `rgt`, `level`) VALUES
(1, 'menu', 'App navigation', NULL, NULL, NULL, 1, 1, 64, 0),
(2, 'menu', 'Admin navigation', NULL, NULL, NULL, 1, 12, 39, 1),
(3, 'programmatic', 'Sign out', NULL, '3-1cc22a2ae3468d33cf6a09274d491b4a', 'default', 0, 25, 26, 2),
(4, 'programmatic', 'Users', NULL, '3-d5ce379013095fd018384793812ae266', 'admin', 0, 17, 20, 2),
(14, 'programmatic', 'Navigation', NULL, '3-bdc947d7cfae70f3e3c9182fd861b2c5', 'admin', 0, 13, 16, 2),
(15, 'programmatic', 'Add item', NULL, '3-3fbfc3832a2bb875d54b42bffefdf1c8', 'admin', 0, 14, 15, 3),
(18, 'menu', 'Site navigation', NULL, NULL, NULL, 1, 2, 11, 1),
(19, 'menu', 'Side navigation', NULL, NULL, NULL, 1, 5, 8, 2),
(20, 'programmatic', 'Catalog', NULL, '3-353cb0bfe865758f6a819444230a1624', NULL, 0, 6, 7, 3),
(24, 'menu', 'Top navigation', NULL, NULL, NULL, 1, 3, 4, 2),
(26, 'programmatic', 'Pages', NULL, '3-ea622f59a605575b2b3d34091517db20', 'admin', 0, 21, 24, 2),
(27, 'programmatic', 'New page', NULL, '3-4d44b5472b1f79c571c37652a2c9b822', 'admin', 0, 22, 23, 3),
(31, 'external', 'Advanced admin', '/', NULL, NULL, 0, 40, 63, 1),
(32, 'programmatic', 'System map', NULL, '3-01fffb3ecd840e0de77fa90b11740b08', 'admin', 0, 41, 46, 2),
(33, 'programmatic', 'Add extend', NULL, '3-4c7d5c8b3ab7ea48e9e73d7ce80a210f', 'admin', 0, 42, 43, 3),
(34, 'programmatic', 'Add pattern extend', NULL, '3-4a404a1f6b1da6edab1b0b0751ff383c', 'admin', 0, 44, 45, 3),
(35, 'programmatic', 'Templater', NULL, '3-46aeab2a0dff4f86431a32b5c8870f88', 'admin', 0, 47, 58, 2),
(36, 'programmatic', 'Add theme', NULL, '3-70a03feb03653464c4ddc008821c0925', 'admin', 0, 48, 49, 3),
(37, 'programmatic', 'Layouts', NULL, '3-7f4582eaeba1639797df547b8595d397', 'admin', 0, 50, 53, 3),
(38, 'programmatic', 'Widgets', NULL, '3-4ebb665441f395db86625982e7ce69ac', 'admin', 0, 54, 57, 3),
(39, 'programmatic', 'Add widget', NULL, '3-f7514a9db40ea35ab79acb19c0260921', 'admin', 0, 55, 56, 4),
(40, 'programmatic', 'Create user', NULL, '3-edd5d37c76c4858b735a071ad5b2582f', 'admin', 0, 18, 19, 3),
(41, 'programmatic', 'Roles', NULL, '3-c6053e0770008c1eb20b60cea00a272e', 'admin', 0, 59, 62, 2),
(42, 'programmatic', 'Add role', NULL, '3-be3bc0f1518ab58720f23f30008c6f8e', 'admin', 0, 60, 61, 3),
(43, 'programmatic', 'Product', NULL, '3-353cb0bfe865758f6a819444230a1624', 'admin', 0, 27, 34, 2),
(44, 'programmatic', 'Category', NULL, '3-85709fa930c317d3cb579d6dba5c7f34', 'admin', 0, 28, 31, 3),
(45, 'programmatic', 'New category', NULL, '3-996bdf489e6c45d193f5e692fec3d669', 'admin', 0, 29, 30, 4),
(46, 'programmatic', 'Product list', NULL, '3-0d3b99439b2a2e8f763a481da4061981', 'admin', 0, 32, 33, 3),
(52, 'programmatic', 'News', NULL, '3-e0cd8bd517a24fc30eeb287a5e669873', 'admin', 0, 35, 38, 2),
(53, 'programmatic', 'Add news', NULL, '3-26ecb12d338529a2fe70a2ecfcf0ec28', 'admin', 0, 36, 37, 3),
(54, 'programmatic', 'Bottom navigation', NULL, '3-74078250f9d9a091d1f8399df232238c', 'default', 0, 9, 10, 2),
(55, 'programmatic', 'Add layout', NULL, '3-aa1a488e98319fb008d7eae5b378c3a1', 'admin', 0, 51, 52, 4);

-- --------------------------------------------------------

--
-- Table structure for table `news_news`
--

CREATE TABLE IF NOT EXISTS `news_news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sysname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(65) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `built_in` tinyint(1) DEFAULT '0',
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `publish_date` date DEFAULT NULL,
  PRIMARY KEY (`id`,`user_id`),
  UNIQUE KEY `sysname` (`sysname`),
  KEY `news_news_user_id_user_users_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `news_news`
--

INSERT INTO `news_news` (`id`, `sysname`, `title`, `content`, `meta_keywords`, `meta_description`, `built_in`, `user_id`, `publish_date`) VALUES
(1, 'news', 'Hello world', 'Hello world', 'Hello world', 'Hello world', 0, 2, '2012-04-27');

-- --------------------------------------------------------

--
-- Table structure for table `page_pages`
--

CREATE TABLE IF NOT EXISTS `page_pages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `sysname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(65) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `built_in` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sysname` (`sysname`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `page_pages`
--

INSERT INTO `page_pages` (`id`, `user_id`, `sysname`, `title`, `content`, `meta_keywords`, `meta_description`, `built_in`) VALUES
(1, 0, 'home_page', 'Hello world', 'Hello world!', 'hello world', 'hello world', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sysmap_items`
--

CREATE TABLE IF NOT EXISTS `sysmap_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mca` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hash` varchar(35) COLLATE utf8_unicode_ci DEFAULT NULL,
  `form_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `index_date` datetime DEFAULT NULL,
  `path` text COLLATE utf8_unicode_ci,
  `params` longtext COLLATE utf8_unicode_ci,
  `is_pattern` tinyint(1) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `level` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mca` (`mca`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=260 ;

--
-- Dumping data for table `sysmap_items`
--

INSERT INTO `sysmap_items` (`id`, `mca`, `hash`, `form_name`, `title`, `description`, `index_date`, `path`, `params`, `is_pattern`, `lft`, `rgt`, `level`) VALUES
(1, '*.*.*', '0-816563134a61e1b2c7cd7899b126bde4', NULL, 'All', NULL, '2012-04-27 14:58:23', NULL, NULL, NULL, 1, 226, 0),
(2, 'default.*.*', '1-f271393c3ea9ff5e20c72687922e3e5e', NULL, 'default.*.*', NULL, NULL, '/controllers', NULL, NULL, 2, 19, 1),
(3, 'default.admin.*', '2-536fca5b41c263d3c75be3a6b172e3c6', NULL, 'admin', '', NULL, '/controllers/AdminController.php', NULL, NULL, 3, 6, 2),
(4, 'default.admin.index', '3-13e4eee66bbfa85479505625b22db026', '', 'default.admin.index', '', NULL, '/controllers/AdminController.php', NULL, NULL, 4, 5, 3),
(5, 'default.error.*', '2-70f9e1606f2ac9a92eb13d68b39695fd', NULL, 'error', '', NULL, '/controllers/ErrorController.php', NULL, NULL, 7, 12, 2),
(6, 'default.error.error', '3-00120ea57d828266b32864d2babeece1', '', 'default.error.error', '', NULL, '/controllers/ErrorController.php', NULL, NULL, 8, 9, 3),
(7, 'default.index.*', '2-783cd78083aa731e4afbf14353d512a8', NULL, 'index', '', NULL, '/controllers/IndexController.php', NULL, NULL, 13, 18, 2),
(8, 'default.index.index', '3-83a4643bbd583eb167f1b5490c05e7a6', '', 'default.index.index', '', NULL, '/controllers/IndexController.php', NULL, NULL, 14, 15, 3),
(17, 'navigation.*.*', '1-4d24f38495c5978a0369e102588e7ffe', NULL, 'navigation.*.*', NULL, NULL, '/modules/navigation/controllers', NULL, NULL, 20, 45, 1),
(18, 'navigation.admin.*', '2-5c9a7d59bbb71bb2313f086de217d3f4', NULL, 'Navigation administrative controller', '', NULL, '/modules/navigation/controllers/AdminController.php', NULL, NULL, 21, 32, 2),
(19, 'navigation.admin.index', '3-ed97ef94b5ad6d4d52b8309bdad308ec', '', 'navigation.admin.index', '', NULL, '/modules/navigation/controllers/AdminController.php', NULL, NULL, 22, 23, 3),
(20, 'navigation.admin.list-menu', '3-bdc947d7cfae70f3e3c9182fd861b2c5', '', 'List structured menu', '', NULL, '/modules/navigation/controllers/AdminController.php', NULL, NULL, 24, 25, 3),
(21, 'navigation.admin.move', '3-a1f9dfe7f5aeab1dddd62fee219e08d5', '', 'Move menu item', '', NULL, '/modules/navigation/controllers/AdminController.php', NULL, NULL, 26, 27, 3),
(22, 'navigation.admin.edit-menu-item', '3-3fbfc3832a2bb875d54b42bffefdf1c8', '', 'Editing menu item (leaf node)', '', NULL, '/modules/navigation/controllers/AdminController.php', NULL, NULL, 28, 29, 3),
(23, 'navigation.admin.delete-menu-item', '3-6597fc510b6e383fdc1ba48fc41216d7', '', 'Deleting menu node', '', NULL, '/modules/navigation/controllers/AdminController.php', NULL, NULL, 30, 31, 3),
(24, 'navigation.index.*', '2-6663c8061d1f9e5dfc143f53c337bb56', NULL, 'Contains methods for displaying parts of the navigation', '', NULL, '/modules/navigation/controllers/IndexController.php', NULL, NULL, 33, 44, 2),
(25, 'navigation.index.display-menu', '3-74078250f9d9a091d1f8399df232238c', 'Navigation_Form_DisplayMenuParams', 'Display user defined navigation', '', NULL, '/modules/navigation/controllers/IndexController.php', NULL, NULL, 34, 43, 3),
(26, 'page.*.*', '1-b3264dc6555dce543f14d461a89306a8', NULL, 'page.*.*', NULL, NULL, '/modules/page/controllers', NULL, NULL, 46, 65, 1),
(27, 'page.admin.*', '2-a94edb4758bb4b9153660eed35f7ae69', NULL, 'admin', '', NULL, '/modules/page/controllers/AdminController.php', NULL, NULL, 47, 56, 2),
(28, 'page.admin.index', '3-ea622f59a605575b2b3d34091517db20', '', 'page.admin.index', '', NULL, '/modules/page/controllers/AdminController.php', NULL, NULL, 48, 49, 3),
(29, 'page.admin.add', '3-66a28bcff7a2c581dddae26c50ae51bf', '', 'page.admin.add', '', NULL, '/modules/page/controllers/AdminController.php', NULL, NULL, 50, 51, 3),
(30, 'page.admin.edit', '3-4d44b5472b1f79c571c37652a2c9b822', '', 'page.admin.edit', '', NULL, '/modules/page/controllers/AdminController.php', NULL, NULL, 52, 53, 3),
(31, 'page.admin.delete', '3-f71353c76efa1371b3dd8b6333299fe9', '', 'page.admin.delete', '', NULL, '/modules/page/controllers/AdminController.php', NULL, NULL, 54, 55, 3),
(32, 'page.index.*', '2-eabf82685732dc0052f9caf2dd93f821', NULL, 'index', '', NULL, '/modules/page/controllers/IndexController.php', NULL, NULL, 57, 64, 2),
(33, 'page.index.index', '3-074f999f46b5e9bb1871072f1b67c03d', '', 'page.index.index', '', NULL, '/modules/page/controllers/IndexController.php', NULL, NULL, 58, 59, 3),
(34, 'page.index.view', '3-92d2c15fbc64a5b6a6529a1ebf4d95b8', 'Page_Form_ListParams', 'page.index.view', '', NULL, '/modules/page/controllers/IndexController.php', NULL, NULL, 60, 63, 3),
(35, 'sysmap.*.*', '1-70943d718c85b43b8e02611f7d4cedd7', NULL, 'sysmap.*.*', NULL, NULL, '/modules/sysmap/controllers', NULL, NULL, 66, 79, 1),
(36, 'sysmap.admin.*', '2-376b3b65ea372d9e5cbad0d147d33218', NULL, 'Sysmap admin controller', '', NULL, '/modules/sysmap/controllers/AdminController.php', NULL, NULL, 67, 78, 2),
(37, 'sysmap.admin.index', '3-1b165c5fbb6a2c4fd7d2c56ce64533d8', '', 'sysmap.admin.index', '', NULL, '/modules/sysmap/controllers/AdminController.php', NULL, NULL, 68, 69, 3),
(38, 'sysmap.admin.list', '3-01fffb3ecd840e0de77fa90b11740b08', '', 'List the map', 'Shows the list of the map\r\nin hierarchy', NULL, '/modules/sysmap/controllers/AdminController.php', NULL, NULL, 70, 71, 3),
(39, 'sysmap.admin.edit-extend', '3-4c7d5c8b3ab7ea48e9e73d7ce80a210f', '', 'sysmap.admin.edit-extend', '', NULL, '/modules/sysmap/controllers/AdminController.php', NULL, NULL, 72, 73, 3),
(40, 'sysmap.admin.delete-extend', '3-2b9712fa8db157bd87a3a7ea6d89674c', '', 'sysmap.admin.delete-extend', '', NULL, '/modules/sysmap/controllers/AdminController.php', NULL, NULL, 74, 75, 3),
(41, 'sysmap.admin.edit-extend-pattern', '3-4a404a1f6b1da6edab1b0b0751ff383c', '', 'sysmap.admin.edit-extend-pattern', '', NULL, '/modules/sysmap/controllers/AdminController.php', NULL, NULL, 76, 77, 3),
(42, 'templater.*.*', '1-a7f29d0f18ba726fb5cd5f55cf1861d0', NULL, 'templater.*.*', NULL, NULL, '/modules/templater/controllers', NULL, NULL, 80, 107, 1),
(43, 'templater.admin.*', '2-c2935b0c7994fd961849eb60d35e8d9a', NULL, 'Themes administrator panel', '', NULL, '/modules/templater/controllers/AdminController.php', NULL, NULL, 81, 102, 2),
(44, 'templater.admin.index', '3-184b38b59367422bd61a819b7242c654', '', 'Display templater admin dashboard', '', NULL, '/modules/templater/controllers/AdminController.php', NULL, NULL, 82, 83, 3),
(45, 'templater.admin.themes', '3-46aeab2a0dff4f86431a32b5c8870f88', '', 'Themes list action', '', NULL, '/modules/templater/controllers/AdminController.php', NULL, NULL, 84, 85, 3),
(46, 'templater.admin.edit-theme', '3-70a03feb03653464c4ddc008821c0925', '', 'Edit Theme action', '', NULL, '/modules/templater/controllers/AdminController.php', NULL, NULL, 86, 87, 3),
(47, 'templater.admin.delete-theme', '3-716b83ff367670545623487a05b9091d', '', 'Delete Theme action', '', NULL, '/modules/templater/controllers/AdminController.php', NULL, NULL, 88, 89, 3),
(48, 'templater.admin.layouts', '3-7f4582eaeba1639797df547b8595d397', '', 'Layouts list action', '', NULL, '/modules/templater/controllers/AdminController.php', NULL, NULL, 90, 91, 3),
(49, 'templater.admin.edit-layout', '3-aa1a488e98319fb008d7eae5b378c3a1', '', 'Edit Theme action', '', NULL, '/modules/templater/controllers/AdminController.php', NULL, NULL, 92, 93, 3),
(50, 'templater.admin.delete-layout', '3-4348bb60295ae5123ac0e2b73875f250', '', 'Delete widget action', '', NULL, '/modules/templater/controllers/AdminController.php', NULL, NULL, 94, 95, 3),
(51, 'templater.admin.widgets', '3-4ebb665441f395db86625982e7ce69ac', '', 'Widgets list action', '', NULL, '/modules/templater/controllers/AdminController.php', NULL, NULL, 96, 97, 3),
(52, 'templater.admin.edit-widget', '3-f7514a9db40ea35ab79acb19c0260921', '', 'Edit widget action', '', NULL, '/modules/templater/controllers/AdminController.php', NULL, NULL, 98, 99, 3),
(53, 'templater.admin.delete-widget', '3-d084458852e64f29882e61b3baf1eee4', '', 'Delete widget action', '', NULL, '/modules/templater/controllers/AdminController.php', NULL, NULL, 100, 101, 3),
(54, 'templater.tools.*', '2-fcad0a9e5cdd92392ed64293468e91c7', NULL, '	SlyS', '', NULL, '/modules/templater/controllers/ToolsController.php', NULL, NULL, 103, 106, 2),
(55, 'templater.tools.display-flash-messages', '3-80dc6b3841ef4ff214f33344d91b66d4', '', 'Display flash system messages', '', NULL, '/modules/templater/controllers/ToolsController.php', NULL, NULL, 104, 105, 3),
(56, 'user.*.*', '1-e674602537a9ec1d0ffdfdf497aa977b', NULL, 'user.*.*', NULL, NULL, '/modules/user/controllers', NULL, NULL, 108, 157, 1),
(57, 'user.admin.*', '2-afaf43926eecf8541044c75fb6afd8fa', NULL, 'User administrator panel', '', NULL, '/modules/user/controllers/AdminController.php', NULL, NULL, 109, 128, 2),
(58, 'user.admin.index', '3-83a8e046db64efe6cc0cd80a142d5e59', '', 'User module admin dashboard', '', NULL, '/modules/user/controllers/AdminController.php', NULL, NULL, 110, 111, 3),
(59, 'user.admin.login', '3-b66ea47d80b055d62d1ea4cd133c575d', '', 'Administrator login action', '', NULL, '/modules/user/controllers/AdminController.php', NULL, NULL, 112, 113, 3),
(60, 'user.admin.users', '3-d5ce379013095fd018384793812ae266', 'User_Form_Widget_UserFilter', 'Users list', '', NULL, '/modules/user/controllers/AdminController.php', NULL, NULL, 114, 115, 3),
(61, 'user.admin.edit-user', '3-edd5d37c76c4858b735a071ad5b2582f', '', 'Edit user action', '', NULL, '/modules/user/controllers/AdminController.php', NULL, NULL, 116, 117, 3),
(62, 'user.admin.delete-user', '3-89b64393fcab7e0777f1d5f22d7429eb', '', 'Delete user action', '', NULL, '/modules/user/controllers/AdminController.php', NULL, NULL, 118, 119, 3),
(63, 'user.admin.roles', '3-c6053e0770008c1eb20b60cea00a272e', '', 'user.admin.roles', '', NULL, '/modules/user/controllers/AdminController.php', NULL, NULL, 120, 121, 3),
(64, 'user.admin.edit-role', '3-be3bc0f1518ab58720f23f30008c6f8e', '', 'Edit user action', '', NULL, '/modules/user/controllers/AdminController.php', NULL, NULL, 122, 123, 3),
(65, 'user.admin.delete-role', '3-5c734d932d443f40025b339eae5af7a7', '', 'Delete role action', '', NULL, '/modules/user/controllers/AdminController.php', NULL, NULL, 124, 125, 3),
(66, 'user.admin.settings', '3-daf7dc399f8421cef0541941be47f3c3', '', 'Setting display action', '', NULL, '/modules/user/controllers/AdminController.php', NULL, NULL, 126, 127, 3),
(67, 'user.auth.*', '2-f600167a6d2067dba4eaea617ed05c45', NULL, 'User authorization pages', '', NULL, '/modules/user/controllers/AuthController.php', NULL, NULL, 129, 142, 2),
(68, 'user.auth.login', '3-c8d76e3e03cdaa72e24f02586ce9b1d1', '', 'Login action', '', NULL, '/modules/user/controllers/AuthController.php', NULL, NULL, 130, 131, 3),
(69, 'user.auth.logout', '3-1cc22a2ae3468d33cf6a09274d491b4a', '', 'Logout action', '', NULL, '/modules/user/controllers/AuthController.php', NULL, NULL, 132, 133, 3),
(70, 'user.auth.login-box', '3-00af1dbd06b75a42535f5abea0e38fb5', '', 'User login box', '', NULL, '/modules/user/controllers/AuthController.php', NULL, NULL, 134, 135, 3),
(71, 'user.auth.forgot', '3-64aba5a0e28bbfdf7d4aad8ab81d201e', '', 'Forgot password action', '', NULL, '/modules/user/controllers/AuthController.php', NULL, NULL, 136, 137, 3),
(72, 'user.auth.check-email', '3-df88dec9f41427fe87c780c275c7dd91', '', 'user.auth.check-email', '', NULL, '/modules/user/controllers/AuthController.php', NULL, NULL, 138, 139, 3),
(73, 'user.auth.recovery', '3-214c8e6eed72d13788ff0769dd2cf880', '', 'Forgot password action', '', NULL, '/modules/user/controllers/AuthController.php', NULL, NULL, 140, 141, 3),
(74, 'user.profile.*', '2-e1fe67446af8334782e9b9dad1190244', NULL, 'User profile pages', '', NULL, '/modules/user/controllers/ProfileController.php', NULL, NULL, 143, 150, 2),
(75, 'user.profile.index', '3-107ced5a0fe84ae245a76dcd4e282716', '', 'Display&Edit user profile form', '', NULL, '/modules/user/controllers/ProfileController.php', NULL, NULL, 144, 145, 3),
(76, 'user.profile.change-password', '3-2946e9d2c9613340239e7f14f4929644', '', 'Change user password page', '', NULL, '/modules/user/controllers/ProfileController.php', NULL, NULL, 146, 147, 3),
(77, 'user.profile.user-box', '3-2070f4d37882d965b025370ce2ed37b5', 'User_Form_Widget_UserBox', 'Display user box', '', NULL, '/modules/user/controllers/ProfileController.php', NULL, NULL, 148, 149, 3),
(78, 'user.registration.*', '2-bd83908a614726a5d0c3a0e62e5cc5bf', NULL, 'User registration pages', '', NULL, '/modules/user/controllers/RegistrationController.php', NULL, NULL, 151, 156, 2),
(79, 'user.registration.index', '3-abd015e82a7dcb9e73494b5de189aacb', '', 'Display registration page', '', NULL, '/modules/user/controllers/RegistrationController.php', NULL, NULL, 152, 153, 3),
(80, 'user.registration.check-email', '3-92b891cb44a287a47dfa520566362e6b', '', 'Pag with check email message', '', NULL, '/modules/user/controllers/RegistrationController.php', NULL, NULL, 154, 155, 3),
(81, NULL, '4-c18c2beee55086b1a90c519eb5c1acb3', NULL, 'Admin navigation provider', NULL, NULL, NULL, 'a:3:{s:7:"item_id";s:1:"2";s:3:"css";s:0:"";s:7:"partial";s:10:"admin-menu";}', NULL, 35, 36, 4),
(82, NULL, '4-f65db18a7e73f2a7b69bca713ada41c9', NULL, 'Advanced admin provider', NULL, NULL, NULL, 'a:3:{s:7:"item_id";s:2:"31";s:3:"css";s:0:"";s:7:"partial";s:10:"admin-menu";}', NULL, 37, 38, 4),
(83, '*.admin.*', '1-9fe21b10c624fe854dc4aa3387a0e1ec', NULL, 'All admin controllers', NULL, NULL, NULL, NULL, 1, 158, 159, 1),
(145, NULL, '4-8705429919e293ceb57f2109cdcf80e3', NULL, 'Home page', NULL, NULL, NULL, 'a:1:{s:8:"pagename";s:9:"home_page";}', NULL, 61, 62, 4),
(146, NULL, '4-c60e60a98fcf65ab3a66f72fae337707', NULL, 'Top navigation', NULL, NULL, NULL, 'a:3:{s:7:"item_id";s:2:"24";s:3:"css";s:0:"";s:7:"partial";s:14:"top-navigation";}', NULL, 39, 40, 4),
(157, NULL, '4-17c4290d170a763ebf60af96ed1cd204', NULL, 'Bottom navigation', NULL, NULL, NULL, 'a:3:{s:7:"item_id";s:2:"54";s:3:"css";s:0:"";s:7:"partial";s:17:"bottom-navigation";}', NULL, 41, 42, 4),
(158, 'default.index.gen-migration', '3-9447d6bbcef635fa4d54968cfb6e084e', '', 'default.index.gen-migration', '', NULL, '/controllers/IndexController.php', NULL, NULL, 16, 17, 3),
(162, 'email.*.*', '1-2fbfc19d214157fa1c929936af227908', NULL, 'email.*.*', NULL, NULL, '/modules/email/controllers', NULL, NULL, 160, 169, 1),
(163, 'email.admin.*', '2-958bd3f86ad8c09129165d0b399eb182', NULL, 'Email_AdminController', '', NULL, '/modules/email/controllers/AdminController.php', NULL, NULL, 161, 168, 2),
(164, 'email.admin.index', '3-ad0d4bfa11b402a20729556c4fcd78e3', '', 'indexAction', '', NULL, '/modules/email/controllers/AdminController.php', NULL, NULL, 162, 163, 3),
(165, 'email.admin.template-list', '3-edca1ecefb79383efb9f266e6491a09d', '', 'templateListAction', '', NULL, '/modules/email/controllers/AdminController.php', NULL, NULL, 164, 165, 3),
(166, 'email.admin.template-edit', '3-54fc5a7e5ce50ef4ba0e24a044f84aea', '', 'email.admin.template-edit', '', NULL, '/modules/email/controllers/AdminController.php', NULL, NULL, 166, 167, 3),
(167, 'region.*.*', '1-e84545e8475f427d08a682ebbe3fb1b7', NULL, 'region.*.*', NULL, NULL, '/modules/region/controllers', NULL, NULL, 170, 191, 1),
(168, 'region.ajax.*', '2-4399ef324b3d841e23d1ab139e2a8b9d', NULL, 'Regions ajax controller', '', NULL, '/modules/region/controllers/AjaxController.php', NULL, NULL, 171, 176, 2),
(169, 'region.ajax.get-cities', '3-f8a8eba09b43c32afaa6fa9357282a9f', '', 'Return cities list by region (Ajax)', '', NULL, '/modules/region/controllers/AjaxController.php', NULL, NULL, 172, 173, 3),
(170, 'region.ajax.selection-city', '3-205e02b6924a2661223b93eabe7ae362', '', 'region.ajax.selection-city', '', NULL, '/modules/region/controllers/AjaxController.php', NULL, NULL, 174, 175, 3),
(171, 'region.admin.*', '2-6e2cad8a385460c8ea0bd4dbc3590bc8', NULL, 'Description', '', NULL, '/modules/region/controllers/AdminController.php', NULL, NULL, 177, 190, 2),
(172, 'region.admin.index', '3-0ca53cacc2772b21af4dc999d5797eb3', '', 'region.admin.index', '', NULL, '/modules/region/controllers/AdminController.php', NULL, NULL, 178, 179, 3),
(173, 'region.admin.cities', '3-f44ae955badaa452ccf7d92f4668488c', '', 'region.admin.cities', '', NULL, '/modules/region/controllers/AdminController.php', NULL, NULL, 180, 181, 3),
(174, 'region.admin.edit-region', '3-1b4b73f793355ba5d423092d4c1f976c', '', 'region.admin.edit-region', '', NULL, '/modules/region/controllers/AdminController.php', NULL, NULL, 182, 183, 3),
(175, 'region.admin.edit-city', '3-5b59a446bc302c72ee078516b1d896a5', '', 'region.admin.edit-city', '', NULL, '/modules/region/controllers/AdminController.php', NULL, NULL, 184, 185, 3),
(176, 'region.admin.delete-region', '3-7151ac50a772403c36746782d3b730a2', '', 'region.admin.delete-region', '', NULL, '/modules/region/controllers/AdminController.php', NULL, NULL, 186, 187, 3),
(177, 'region.admin.delete-city', '3-f40855ec86e666533d6e0656cef44ca8', '', 'region.admin.delete-city', '', NULL, '/modules/region/controllers/AdminController.php', NULL, NULL, 188, 189, 3),
(198, 'default.error.error404', '3-b1fdac9bf9073baa7fc64ca287fe7933', '', 'error404Action', '', NULL, '/controllers/ErrorController.php', NULL, NULL, 10, 11, 3),
(199, 'news.*.*', '1-0a4c4bbb707dc8f6823bddc0f148492e', NULL, 'news.*.*', NULL, NULL, '/modules/news/controllers', NULL, NULL, 192, 209, 1),
(200, 'news.admin.*', '2-98a27100a0b3a6892d0b1111a035af2a', NULL, 'News backend controller', '', NULL, '/modules/news/controllers/AdminController.php', NULL, NULL, 193, 200, 2),
(201, 'news.admin.index', '3-e0cd8bd517a24fc30eeb287a5e669873', '', 'News list', '', NULL, '/modules/news/controllers/AdminController.php', NULL, NULL, 194, 195, 3),
(202, 'news.admin.edit', '3-26ecb12d338529a2fe70a2ecfcf0ec28', '', 'News edit form', '', NULL, '/modules/news/controllers/AdminController.php', NULL, NULL, 196, 197, 3),
(203, 'news.admin.delete', '3-87b6eb79081b4f8102a992d3f8c864a6', '', 'News delete action', '', NULL, '/modules/news/controllers/AdminController.php', NULL, NULL, 198, 199, 3),
(204, 'news.index.*', '2-f1264b812a0861adcf99fbe352162273', NULL, 'index', '', NULL, '/modules/news/controllers/IndexController.php', NULL, NULL, 201, 208, 2),
(205, 'news.index.index', '3-2abd60cb23d278c7afa992ce49fff04f', '', 'news.index.index', '', NULL, '/modules/news/controllers/IndexController.php', NULL, NULL, 202, 203, 3),
(206, 'news.index.hot-news', '3-931dd508dbddf9ba8b11853c3a997ee9', '', 'news.index.hot-news', '', NULL, '/modules/news/controllers/IndexController.php', NULL, NULL, 204, 205, 3),
(207, 'news.index.view', '3-7352d19587ce57ea8b51d2be73236314', 'News_Form_ListParams', 'View news', '', NULL, '/modules/news/controllers/IndexController.php', NULL, NULL, 206, 207, 3),
(252, 'banner.*.*', '1-98ab98ad890bffccdf02828e65271783', NULL, 'banner.*.*', NULL, NULL, '/modules/banner/controllers', NULL, NULL, 210, 225, 1),
(253, 'banner.admin.*', '2-8521f65542c48ac854cba39b2d0cb3e3', NULL, 'admin', '', NULL, '/modules/banner/controllers/AdminController.php', NULL, NULL, 211, 220, 2),
(254, 'banner.admin.index', '3-782daf2245e59088489ac2ec964539a8', '', 'Main page configure list of banners', '', NULL, '/modules/banner/controllers/AdminController.php', NULL, NULL, 212, 213, 3),
(255, 'banner.admin.add', '3-bda154cbf1ee07c9fe94c80e6f6095dd', '', 'banner.admin.add', '', NULL, '/modules/banner/controllers/AdminController.php', NULL, NULL, 214, 215, 3),
(256, 'banner.admin.edit', '3-764b6cd8b2ed86a262fd5676ac74ade5', '', 'banner.admin.edit', '', NULL, '/modules/banner/controllers/AdminController.php', NULL, NULL, 216, 217, 3),
(257, 'banner.admin.delete', '3-679459be37bb06f94610ef6626986108', '', 'banner.admin.delete', '', NULL, '/modules/banner/controllers/AdminController.php', NULL, NULL, 218, 219, 3),
(258, 'banner.index.*', '2-c164b3688510c29b22aa97149c8c7e65', NULL, 'index', '', NULL, '/modules/banner/controllers/IndexController.php', NULL, NULL, 221, 224, 2),
(259, 'banner.index.index', '3-db2ebe723f4385bd67de61fb41db0135', '', 'banner.index.index', '', NULL, '/modules/banner/controllers/IndexController.php', NULL, NULL, 222, 223, 3);

-- --------------------------------------------------------

--
-- Table structure for table `templater_layouts`
--

CREATE TABLE IF NOT EXISTS `templater_layouts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `theme_id` bigint(20) DEFAULT NULL,
  `params` longtext COLLATE utf8_unicode_ci,
  `published` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `theme_id` (`theme_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `templater_layouts`
--

INSERT INTO `templater_layouts` (`id`, `title`, `name`, `theme_id`, `params`, `published`) VALUES
(1, 'Index template', 'index', 1, NULL, 1),
(2, 'Admin template', 'admin', 1, NULL, 1),
(3, 'Login template', 'login', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `templater_layout_points`
--

CREATE TABLE IF NOT EXISTS `templater_layout_points` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `map_id` varchar(35) COLLATE utf8_unicode_ci DEFAULT NULL,
  `layout_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `layout_id` (`layout_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `templater_layout_points`
--

INSERT INTO `templater_layout_points` (`id`, `map_id`, `layout_id`) VALUES
(10, '2-f600167a6d2067dba4eaea617ed05c45', 3),
(11, '3-c8d76e3e03cdaa72e24f02586ce9b1d1', 3);

-- --------------------------------------------------------

--
-- Table structure for table `templater_themes`
--

CREATE TABLE IF NOT EXISTS `templater_themes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current` tinyint(1) DEFAULT '0',
  `ordering` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `templater_themes`
--

INSERT INTO `templater_themes` (`id`, `title`, `name`, `current`, `ordering`) VALUES
(1, 'Default Theme', 'default', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `templater_widgets`
--

CREATE TABLE IF NOT EXISTS `templater_widgets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `map_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `layout_id` bigint(20) DEFAULT NULL,
  `ordering` bigint(20) DEFAULT NULL,
  `placeholder` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `layout_id` (`layout_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `templater_widgets`
--

INSERT INTO `templater_widgets` (`id`, `name`, `map_id`, `published`, `layout_id`, `ordering`, `placeholder`) VALUES
(1, 'Side admin navigation', '4-c18c2beee55086b1a90c519eb5c1acb3', 1, 2, 1, 'left'),
(2, 'Adv. admin navigation', '4-f65db18a7e73f2a7b69bca713ada41c9', 1, 2, 2, 'left'),
(3, 'Home page widget', '4-8705429919e293ceb57f2109cdcf80e3', 1, 1, 0, 'content_above'),
(4, 'flash-message', '3-80dc6b3841ef4ff214f33344d91b66d4', 1, 2, 1, 'top');

-- --------------------------------------------------------

--
-- Table structure for table `templater_widget_points`
--

CREATE TABLE IF NOT EXISTS `templater_widget_points` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `map_id` varchar(35) COLLATE utf8_unicode_ci DEFAULT NULL,
  `widget_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `widget_id` (`widget_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `templater_widget_points`
--

INSERT INTO `templater_widget_points` (`id`, `map_id`, `widget_id`) VALUES
(8, '1-9fe21b10c624fe854dc4aa3387a0e1ec', 2),
(9, '1-9fe21b10c624fe854dc4aa3387a0e1ec', 1),
(10, '3-83a4643bbd583eb167f1b5490c05e7a6', 3),
(12, '0-816563134a61e1b2c7cd7899b126bde4', 4);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE IF NOT EXISTS `user_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `register` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `name`, `parent_id`, `is_default`, `register`) VALUES
(1, 'guest', 0, 1, NULL),
(2, 'user', 1, NULL, NULL),
(3, 'admin', 0, NULL, NULL),
(4, 'participant', 1, NULL, NULL),
(5, 'participant_manager', 0, NULL, NULL),
(6, 'superadmin', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_rules`
--

CREATE TABLE IF NOT EXISTS `user_rules` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL,
  `resource_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rule` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=72 ;

--
-- Dumping data for table `user_rules`
--

INSERT INTO `user_rules` (`id`, `role_id`, `resource_id`, `rule`) VALUES
(1, 1, '2-70f9e1606f2ac9a92eb13d68b39695fd', 'allow'),
(2, 1, '2-783cd78083aa731e4afbf14353d512a8', 'allow'),
(3, 1, '2-6663c8061d1f9e5dfc143f53c337bb56', 'allow'),
(4, 3, '2-536fca5b41c263d3c75be3a6b172e3c6', 'allow'),
(5, 3, '2-afaf43926eecf8541044c75fb6afd8fa', 'allow'),
(6, 3, '2-c2935b0c7994fd961849eb60d35e8d9a', 'allow'),
(7, 3, '2-5c9a7d59bbb71bb2313f086de217d3f4', 'allow'),
(8, 3, '2-a94edb4758bb4b9153660eed35f7ae69', 'allow'),
(9, 3, '2-376b3b65ea372d9e5cbad0d147d33218', 'allow'),
(11, 1, '2-eabf82685732dc0052f9caf2dd93f821', 'allow'),
(13, 3, '0-816563134a61e1b2c7cd7899b126bde4', 'allow'),
(24, 1, '2-f1264b812a0861adcf99fbe352162273', 'allow'),
(28, 4, '1-97a8c27cfcbb2bdb6d3d11e3c943f01e', 'allow'),
(29, 5, '1-323b89e65d1d2dc7ab709a622d633afd', 'allow'),
(33, 6, '3-c8d76e3e03cdaa72e24f02586ce9b1d1', 'allow'),
(34, 6, '3-1cc22a2ae3468d33cf6a09274d491b4a', 'allow'),
(35, 6, '3-00af1dbd06b75a42535f5abea0e38fb5', 'allow'),
(36, 1, '3-c8d76e3e03cdaa72e24f02586ce9b1d1', 'allow'),
(37, 1, '3-64aba5a0e28bbfdf7d4aad8ab81d201e', 'allow'),
(38, 1, '3-214c8e6eed72d13788ff0769dd2cf880', 'allow'),
(39, 4, '3-c8d76e3e03cdaa72e24f02586ce9b1d1', 'allow'),
(41, 4, '3-00af1dbd06b75a42535f5abea0e38fb5', 'allow'),
(42, 4, '3-64aba5a0e28bbfdf7d4aad8ab81d201e', 'allow'),
(43, 4, '3-df88dec9f41427fe87c780c275c7dd91', 'allow'),
(44, 4, '3-214c8e6eed72d13788ff0769dd2cf880', 'allow'),
(45, 6, '2-5a3e0910a18bd2e30a080b3e7476e1df', 'allow'),
(46, 6, '2-f600167a6d2067dba4eaea617ed05c45', 'allow'),
(47, 6, '3-64aba5a0e28bbfdf7d4aad8ab81d201e', 'allow'),
(48, 6, '3-df88dec9f41427fe87c780c275c7dd91', 'allow'),
(49, 6, '3-214c8e6eed72d13788ff0769dd2cf880', 'allow'),
(50, 6, '2-e1fe67446af8334782e9b9dad1190244', 'allow'),
(51, 6, '3-107ced5a0fe84ae245a76dcd4e282716', 'allow'),
(52, 6, '3-2946e9d2c9613340239e7f14f4929644', 'allow'),
(53, 6, '3-2070f4d37882d965b025370ce2ed37b5', 'allow'),
(54, 6, '2-bd83908a614726a5d0c3a0e62e5cc5bf', 'allow'),
(55, 6, '3-abd015e82a7dcb9e73494b5de189aacb', 'allow'),
(56, 6, '3-92b891cb44a287a47dfa520566362e6b', 'allow'),
(57, 4, '2-f600167a6d2067dba4eaea617ed05c45', 'allow'),
(58, 4, '2-e1fe67446af8334782e9b9dad1190244', 'allow'),
(59, 4, '3-107ced5a0fe84ae245a76dcd4e282716', 'allow'),
(60, 4, '3-2946e9d2c9613340239e7f14f4929644', 'allow'),
(61, 4, '3-2070f4d37882d965b025370ce2ed37b5', 'allow'),
(62, 4, '2-bd83908a614726a5d0c3a0e62e5cc5bf', 'allow'),
(63, 4, '3-abd015e82a7dcb9e73494b5de189aacb', 'allow'),
(64, 4, '3-92b891cb44a287a47dfa520566362e6b', 'allow'),
(65, 5, '2-f600167a6d2067dba4eaea617ed05c45', 'allow'),
(66, 5, '2-e1fe67446af8334782e9b9dad1190244', 'allow'),
(67, 5, '2-bd83908a614726a5d0c3a0e62e5cc5bf', 'allow'),
(68, 1, '3-80dc6b3841ef4ff214f33344d91b66d4', 'allow'),
(69, 1, '3-00af1dbd06b75a42535f5abea0e38fb5', 'allow'),
(70, 1, '3-df88dec9f41427fe87c780c275c7dd91', 'allow'),
(71, 1, '2-bd83908a614726a5d0c3a0e62e5cc5bf', 'allow');

-- --------------------------------------------------------

--
-- Table structure for table `user_users`
--

CREATE TABLE IF NOT EXISTS `user_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `patronymic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birth` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `user_users`
--

INSERT INTO `user_users` (`id`, `login`, `password`, `role_id`, `active`, `firstname`, `lastname`, `patronymic`, `birth`, `email`, `phone`, `zip`, `address`, `token`, `token_date`) VALUES
(1, 'user', '5af9edaef916f056cad6c4c040f36c81', 2, 1, 'Demo', 'Demo', NULL, NULL, 'vs@webdirect.md', NULL, NULL, NULL, NULL, NULL),
(2, 'admin', '4297f44b13955235245b2497399d7a93', 3, 1, 'Administrator', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `news_news`
--
ALTER TABLE `news_news`
  ADD CONSTRAINT `news_news_user_id_user_users_id` FOREIGN KEY (`user_id`) REFERENCES `user_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templater_layouts`
--
ALTER TABLE `templater_layouts`
  ADD CONSTRAINT `templater_layouts_theme_id_templater_themes_id` FOREIGN KEY (`theme_id`) REFERENCES `templater_themes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templater_layout_points`
--
ALTER TABLE `templater_layout_points`
  ADD CONSTRAINT `templater_layout_points_layout_id_templater_layouts_id` FOREIGN KEY (`layout_id`) REFERENCES `templater_layouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templater_widgets`
--
ALTER TABLE `templater_widgets`
  ADD CONSTRAINT `templater_widgets_layout_id_templater_layouts_id` FOREIGN KEY (`layout_id`) REFERENCES `templater_layouts` (`id`);

--
-- Constraints for table `templater_widget_points`
--
ALTER TABLE `templater_widget_points`
  ADD CONSTRAINT `templater_widget_points_widget_id_templater_widgets_id` FOREIGN KEY (`widget_id`) REFERENCES `templater_widgets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_rules`
--
ALTER TABLE `user_rules`
  ADD CONSTRAINT `user_rules_role_id_user_roles_id` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`id`);

--
-- Constraints for table `user_users`
--
ALTER TABLE `user_users`
  ADD CONSTRAINT `user_users_role_id_user_roles_id` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`id`);
