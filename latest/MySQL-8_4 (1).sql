-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Хост: MySQL-8.4
-- Время создания: Май 11 2026 г., 05:13
-- Версия сервера: 8.4.4
-- Версия PHP: 8.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `wp_eams_db`
--
CREATE DATABASE IF NOT EXISTS `wp_eams_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `wp_eams_db`;

-- --------------------------------------------------------

--
-- Структура таблицы `wp_assets`
--

CREATE TABLE `wp_assets` (
  `AssetID` int UNSIGNED NOT NULL,
  `AssetName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `AssetType` varchar(100) NOT NULL,
  `Model` varchar(100) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `AssetGroup` varchar(100) NOT NULL,
  `AssetStatus` varchar(50) NOT NULL,
  `CurrentOutput` decimal(10,2) NOT NULL,
  `RequiredOutput` decimal(10,2) NOT NULL,
  `DueQuota` date NOT NULL,
  `RequiredQuota` decimal(10,2) NOT NULL,
  `LastMaintenance` date NOT NULL,
  `NextMaintenance` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `wp_assets`
--

INSERT INTO `wp_assets` (`AssetID`, `AssetName`, `AssetType`, `Model`, `Address`, `AssetGroup`, `AssetStatus`, `CurrentOutput`, `RequiredOutput`, `DueQuota`, `RequiredQuota`, `LastMaintenance`, `NextMaintenance`) VALUES
(1, 'Турбина-01', 'Турбина', 'T01', 'ГЭС \"Ишим\"', 'Гидроэлектростанция', 'Работает', 5.00, 5.00, '2026-04-25', 3600.00, '2026-03-25', '2026-04-05'),
(2, 'Турбина-02', 'Турбина', 'Т02', 'ГЭС \"Ишим\"', 'Гидроэлектростанция', 'Работает', 2.50, 3.00, '2026-05-12', 3000.00, '2026-05-11', '2026-06-11'),
(3, 'Турбина-03', 'Турбина', 'Т03', 'ГЭС \"Ишим\"', 'Гидроэлектростанция', 'Выключен', 0.00, 0.00, '2026-05-11', 0.00, '2026-04-11', '2026-05-11'),
(4, 'Генератор', 'Генератор', 'Генератор', 'ГЭС \"Ишим\"', 'Гидроэлектростанция', 'Работает', 7.50, 8.00, '2026-06-11', 6600.00, '2026-05-11', '2026-06-11'),
(5, 'Ветряной генератор 1', 'Ветряной генератор', 'ВЭУ1', 'село Новоникольское', 'Комплекс ветряных генераторов', 'Работает', 12.00, 24.00, '2026-06-11', 2400.00, '2026-05-11', '2026-06-11'),
(6, 'Ветряной генератор 2', 'Ветряной генератор', 'ВЭУ2', 'село Новоникольское', 'Комплекс ветряных генераторов', 'На обслуживании', 0.00, 0.00, '2026-05-11', 0.00, '2026-04-11', '2026-05-11'),
(7, 'Ветряной генератор 3', 'Ветряной генератор', 'ВЭУ3', 'село Новоникольское', 'Комплекс ветряных генераторов', 'Работает', 12.00, 24.00, '2026-06-11', 2400.00, '2026-04-30', '2026-05-30');

-- --------------------------------------------------------

--
-- Структура таблицы `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint UNSIGNED NOT NULL,
  `comment_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint UNSIGNED NOT NULL,
  `comment_post_ID` bigint UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Комментатор WordPress', 'wapuu@wordpress.example', 'https://ru.wordpress.org/', '', '2026-03-24 20:03:40', '2026-03-24 17:03:40', 'Привет! Это комментарий.\nЧтобы начать модерировать, редактировать и удалять комментарии, перейдите на экран «Комментарии» в консоли.\nАватары авторов комментариев загружаются с сервиса <a href=\"https://ru.gravatar.com/\">Gravatar</a>.', 0, '1', '', 'comment', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint UNSIGNED NOT NULL,
  `link_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint UNSIGNED NOT NULL,
  `option_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'cron', 'a:12:{i:1778461429;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1778475847;a:1:{s:21:\"wp_update_user_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1778479417;a:1:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1778481217;a:1:{s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1778483017;a:1:{s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1778512726;a:1:{s:21:\"ai1wm_storage_cleanup\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1778519029;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1778519047;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1778519055;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1778605915;a:1:{s:30:\"wp_delete_temp_updater_backups\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1778691829;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}', 'on'),
(2, 'siteurl', 'https://eams.local', 'on'),
(3, 'home', 'https://eams.local', 'on'),
(4, 'blogname', 'Energy Asset Management System', 'on'),
(5, 'blogdescription', '', 'on'),
(6, 'users_can_register', '0', 'on'),
(7, 'admin_email', 'a@gmail.com', 'on'),
(8, 'start_of_week', '1', 'on'),
(9, 'use_balanceTags', '0', 'on'),
(10, 'use_smilies', '1', 'on'),
(11, 'require_name_email', '1', 'on'),
(12, 'comments_notify', '1', 'on'),
(13, 'posts_per_rss', '10', 'on'),
(14, 'rss_use_excerpt', '0', 'on'),
(15, 'mailserver_url', 'mail.example.com', 'on'),
(16, 'mailserver_login', 'login@example.com', 'on'),
(17, 'mailserver_pass', '', 'on'),
(18, 'mailserver_port', '110', 'on'),
(19, 'default_category', '1', 'on'),
(20, 'default_comment_status', 'open', 'on'),
(21, 'default_ping_status', 'open', 'on'),
(22, 'default_pingback_flag', '1', 'on'),
(23, 'posts_per_page', '10', 'on'),
(24, 'date_format', 'd.m.Y', 'on'),
(25, 'time_format', 'H:i', 'on'),
(26, 'links_updated_date_format', 'd.m.Y H:i', 'on'),
(27, 'comment_moderation', '0', 'on'),
(28, 'moderation_notify', '1', 'on'),
(29, 'permalink_structure', '', 'on'),
(30, 'rewrite_rules', '', 'on'),
(31, 'hack_file', '0', 'on'),
(32, 'blog_charset', 'UTF-8', 'on'),
(33, 'moderation_keys', '', 'off'),
(34, 'active_plugins', 'a:2:{i:0;s:51:\"all-in-one-wp-migration/all-in-one-wp-migration.php\";i:1;s:19:\"members/members.php\";}', 'on'),
(35, 'category_base', '', 'on'),
(36, 'ping_sites', 'https://rpc.pingomatic.com/', 'on'),
(37, 'comment_max_links', '2', 'on'),
(38, 'gmt_offset', '3', 'on'),
(39, 'default_email_category', '1', 'on'),
(40, 'recently_edited', '', 'off'),
(41, 'template', 'twentytwentyfive', 'on'),
(42, 'stylesheet', 'twentytwentyfive', 'on'),
(43, 'comment_registration', '0', 'on'),
(44, 'html_type', 'text/html', 'on'),
(45, 'use_trackback', '0', 'on'),
(46, 'default_role', 'subscriber', 'on'),
(47, 'db_version', '60717', 'on'),
(48, 'uploads_use_yearmonth_folders', '1', 'on'),
(49, 'upload_path', '', 'on'),
(50, 'blog_public', '1', 'on'),
(51, 'default_link_category', '2', 'on'),
(52, 'show_on_front', 'page', 'on'),
(53, 'tag_base', '', 'on'),
(54, 'show_avatars', '1', 'on'),
(55, 'avatar_rating', 'G', 'on'),
(56, 'upload_url_path', '', 'on'),
(57, 'thumbnail_size_w', '150', 'on'),
(58, 'thumbnail_size_h', '150', 'on'),
(59, 'thumbnail_crop', '1', 'on'),
(60, 'medium_size_w', '300', 'on'),
(61, 'medium_size_h', '300', 'on'),
(62, 'avatar_default', 'mystery', 'on'),
(63, 'large_size_w', '1024', 'on'),
(64, 'large_size_h', '1024', 'on'),
(65, 'image_default_link_type', 'none', 'on'),
(66, 'image_default_size', '', 'on'),
(67, 'image_default_align', '', 'on'),
(68, 'close_comments_for_old_posts', '0', 'on'),
(69, 'close_comments_days_old', '14', 'on'),
(70, 'thread_comments', '1', 'on'),
(71, 'thread_comments_depth', '5', 'on'),
(72, 'page_comments', '0', 'on'),
(73, 'comments_per_page', '50', 'on'),
(74, 'default_comments_page', 'newest', 'on'),
(75, 'comment_order', 'asc', 'on'),
(76, 'sticky_posts', 'a:0:{}', 'on'),
(77, 'widget_categories', 'a:0:{}', 'on'),
(78, 'widget_text', 'a:0:{}', 'on'),
(79, 'widget_rss', 'a:0:{}', 'on'),
(80, 'uninstall_plugins', 'a:0:{}', 'off'),
(81, 'timezone_string', '', 'on'),
(82, 'page_for_posts', '0', 'on'),
(83, 'page_on_front', '7', 'on'),
(84, 'default_post_format', '0', 'on'),
(85, 'link_manager_enabled', '0', 'on'),
(86, 'finished_splitting_shared_terms', '1', 'on'),
(87, 'site_icon', '0', 'on'),
(88, 'medium_large_size_w', '768', 'on'),
(89, 'medium_large_size_h', '0', 'on'),
(90, 'wp_page_for_privacy_policy', '3', 'on'),
(91, 'show_comments_cookies_opt_in', '1', 'on'),
(92, 'admin_email_lifespan', '1789923817', 'on'),
(93, 'disallowed_keys', '', 'off'),
(94, 'comment_previously_approved', '1', 'on'),
(95, 'auto_plugin_theme_update_emails', 'a:0:{}', 'off'),
(96, 'auto_update_core_dev', 'enabled', 'on'),
(97, 'auto_update_core_minor', 'enabled', 'on'),
(98, 'auto_update_core_major', 'enabled', 'on'),
(99, 'wp_force_deactivated_plugins', 'a:0:{}', 'on'),
(100, 'wp_attachment_pages_enabled', '0', 'on'),
(101, 'initial_db_version', '58975', 'on'),
(102, 'wp_user_roles', 'a:8:{s:13:\"administrator\";a:2:{s:4:\"name\";s:45:\"Системный администратор\";s:12:\"capabilities\";a:66:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:16:\"restrict_content\";b:1;s:10:\"list_roles\";b:1;s:12:\"create_roles\";b:1;s:12:\"delete_roles\";b:1;s:10:\"edit_roles\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:57:\"Неавторизованный пользователь\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:11:\"admin_asset\";a:2:{s:4:\"name\";s:39:\"Администратор актива\";s:12:\"capabilities\";a:1:{s:4:\"read\";b:1;}}s:7:\"manager\";a:2:{s:4:\"name\";s:16:\"Менеджер\";s:12:\"capabilities\";a:1:{s:4:\"read\";b:1;}}s:21:\"department_employee_a\";a:2:{s:4:\"name\";s:16:\"Электрик\";s:12:\"capabilities\";a:1:{s:4:\"read\";b:1;}}s:21:\"department_employee_b\";a:2:{s:4:\"name\";s:14:\"Механик\";s:12:\"capabilities\";a:1:{s:4:\"read\";b:1;}}s:21:\"department_employee_c\";a:2:{s:4:\"name\";s:14:\"Инженер\";s:12:\"capabilities\";a:1:{s:4:\"read\";b:1;}}s:21:\"department_employee_d\";a:2:{s:4:\"name\";s:2:\"IT\";s:12:\"capabilities\";a:1:{s:4:\"read\";b:1;}}}', 'on'),
(103, 'fresh_site', '0', 'off'),
(104, 'WPLANG', 'ru_RU', 'auto'),
(105, 'user_count', '11', 'off'),
(106, 'widget_block', 'a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:167:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Свежие записи</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:247:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Свежие комментарии</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:150:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Архивы</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:154:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Рубрики</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}', 'auto'),
(107, 'sidebars_widgets', 'a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}s:13:\"array_version\";i:3;}', 'auto'),
(108, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(109, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(110, 'widget_archives', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(111, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(112, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(113, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(114, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(115, 'widget_meta', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(116, 'widget_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(117, 'widget_recent-posts', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(118, 'widget_recent-comments', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(119, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(120, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(121, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(126, 'recovery_keys', 'a:0:{}', 'off'),
(127, 'nonce_key', 'Co.|e6`|w}5>a |:^*-S/+E_NBs/]1ZS%t)5<O>i*M@v_A<smk{_^+7sW(ElGIP.', 'off'),
(128, 'nonce_salt', 'cS*KNn`gXx+b].8`dQgp4WZk?/-]p3L97>VOCW|5);F&AVO|o@01]:k4q.I!RUXt', 'off'),
(131, 'secure_auth_key', 'fD[fKtn!%?F5O*t#C)E7DFwZfmcs[m4~%Kuz*D5PK#i:xPm;ISnN|YxIQChQS!:m', 'off'),
(132, 'secure_auth_salt', 'iO%OPQ)TmE60|D~cpMi8=eJmptKfe)eBZ*iKQC,znat;xF.b3uDnCL^?HlY@)BeG', 'off'),
(133, 'logged_in_key', 'uo!RiSj1gfyT/iB=;fi]:Xs#Zunqd!FMs]@&Xb!*|~&A7PA&;%Tt$o<(@rd6&BqM', 'off'),
(134, 'logged_in_salt', '/v7Izyz9>=+uD);Zz{t3]+./[D#XG{V&%|v_?qYsk%c|$9 }>*;t|4}qi[bk I(r', 'off'),
(160, 'finished_updating_comment_type', '1', 'auto'),
(167, 'wp_notes_notify', '1', 'on'),
(168, 'db_upgraded', '', 'on'),
(171, 'can_compress_scripts', '1', 'on'),
(177, 'recently_activated', 'a:0:{}', 'off'),
(188, 'members_activated', '1774373045', 'auto'),
(189, 'members_addons_migrated', '1', 'auto'),
(190, 'widget_members-widget-login', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(191, 'widget_members-widget-users', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(193, 'members_notifications', 'a:4:{s:6:\"update\";i:1778409467;s:4:\"feed\";a:0:{}s:6:\"events\";a:0:{}s:9:\"dismissed\";a:0:{}}', 'auto'),
(210, 'theme_mods_twentytwentyfive', 'a:1:{s:18:\"custom_css_post_id\";i:-1;}', 'auto'),
(218, 'auth_key', 'RWc}GWq>K5B7G;=!MJ*VHu%J15]pHz,n5j*`,l78G<a(-UL!NnIf M<b}wZNn%6#', 'off'),
(219, 'auth_salt', '^PuN^%k]% S.rFsSz<1_wa09pE#[;AIi)Davs#}kJXve.l0&D6y8wAx&-iguQVNC', 'off'),
(340, 'ai1wm_updater', 'a:0:{}', 'auto'),
(421, 'ai1wm_secret_key', 'jPEFPGUliEtw', 'auto'),
(422, 'ai1wm_backups_labels', 'a:0:{}', 'auto'),
(423, 'ai1wm_sites_links', 'a:0:{}', 'auto'),
(424, 'ai1wm_backups_path', 'C:\\OSPanel\\home\\EAMS.local\\public/wp-content\\ai1wm-backups', 'auto'),
(426, '_transient_wp_core_block_css_files', 'a:2:{s:7:\"version\";s:5:\"6.9.4\";s:5:\"files\";a:584:{i:0;s:31:\"accordion-heading/style-rtl.css\";i:1;s:35:\"accordion-heading/style-rtl.min.css\";i:2;s:27:\"accordion-heading/style.css\";i:3;s:31:\"accordion-heading/style.min.css\";i:4;s:28:\"accordion-item/style-rtl.css\";i:5;s:32:\"accordion-item/style-rtl.min.css\";i:6;s:24:\"accordion-item/style.css\";i:7;s:28:\"accordion-item/style.min.css\";i:8;s:29:\"accordion-panel/style-rtl.css\";i:9;s:33:\"accordion-panel/style-rtl.min.css\";i:10;s:25:\"accordion-panel/style.css\";i:11;s:29:\"accordion-panel/style.min.css\";i:12;s:23:\"accordion/style-rtl.css\";i:13;s:27:\"accordion/style-rtl.min.css\";i:14;s:19:\"accordion/style.css\";i:15;s:23:\"accordion/style.min.css\";i:16;s:23:\"archives/editor-rtl.css\";i:17;s:27:\"archives/editor-rtl.min.css\";i:18;s:19:\"archives/editor.css\";i:19;s:23:\"archives/editor.min.css\";i:20;s:22:\"archives/style-rtl.css\";i:21;s:26:\"archives/style-rtl.min.css\";i:22;s:18:\"archives/style.css\";i:23;s:22:\"archives/style.min.css\";i:24;s:20:\"audio/editor-rtl.css\";i:25;s:24:\"audio/editor-rtl.min.css\";i:26;s:16:\"audio/editor.css\";i:27;s:20:\"audio/editor.min.css\";i:28;s:19:\"audio/style-rtl.css\";i:29;s:23:\"audio/style-rtl.min.css\";i:30;s:15:\"audio/style.css\";i:31;s:19:\"audio/style.min.css\";i:32;s:19:\"audio/theme-rtl.css\";i:33;s:23:\"audio/theme-rtl.min.css\";i:34;s:15:\"audio/theme.css\";i:35;s:19:\"audio/theme.min.css\";i:36;s:21:\"avatar/editor-rtl.css\";i:37;s:25:\"avatar/editor-rtl.min.css\";i:38;s:17:\"avatar/editor.css\";i:39;s:21:\"avatar/editor.min.css\";i:40;s:20:\"avatar/style-rtl.css\";i:41;s:24:\"avatar/style-rtl.min.css\";i:42;s:16:\"avatar/style.css\";i:43;s:20:\"avatar/style.min.css\";i:44;s:21:\"button/editor-rtl.css\";i:45;s:25:\"button/editor-rtl.min.css\";i:46;s:17:\"button/editor.css\";i:47;s:21:\"button/editor.min.css\";i:48;s:20:\"button/style-rtl.css\";i:49;s:24:\"button/style-rtl.min.css\";i:50;s:16:\"button/style.css\";i:51;s:20:\"button/style.min.css\";i:52;s:22:\"buttons/editor-rtl.css\";i:53;s:26:\"buttons/editor-rtl.min.css\";i:54;s:18:\"buttons/editor.css\";i:55;s:22:\"buttons/editor.min.css\";i:56;s:21:\"buttons/style-rtl.css\";i:57;s:25:\"buttons/style-rtl.min.css\";i:58;s:17:\"buttons/style.css\";i:59;s:21:\"buttons/style.min.css\";i:60;s:22:\"calendar/style-rtl.css\";i:61;s:26:\"calendar/style-rtl.min.css\";i:62;s:18:\"calendar/style.css\";i:63;s:22:\"calendar/style.min.css\";i:64;s:25:\"categories/editor-rtl.css\";i:65;s:29:\"categories/editor-rtl.min.css\";i:66;s:21:\"categories/editor.css\";i:67;s:25:\"categories/editor.min.css\";i:68;s:24:\"categories/style-rtl.css\";i:69;s:28:\"categories/style-rtl.min.css\";i:70;s:20:\"categories/style.css\";i:71;s:24:\"categories/style.min.css\";i:72;s:19:\"code/editor-rtl.css\";i:73;s:23:\"code/editor-rtl.min.css\";i:74;s:15:\"code/editor.css\";i:75;s:19:\"code/editor.min.css\";i:76;s:18:\"code/style-rtl.css\";i:77;s:22:\"code/style-rtl.min.css\";i:78;s:14:\"code/style.css\";i:79;s:18:\"code/style.min.css\";i:80;s:18:\"code/theme-rtl.css\";i:81;s:22:\"code/theme-rtl.min.css\";i:82;s:14:\"code/theme.css\";i:83;s:18:\"code/theme.min.css\";i:84;s:22:\"columns/editor-rtl.css\";i:85;s:26:\"columns/editor-rtl.min.css\";i:86;s:18:\"columns/editor.css\";i:87;s:22:\"columns/editor.min.css\";i:88;s:21:\"columns/style-rtl.css\";i:89;s:25:\"columns/style-rtl.min.css\";i:90;s:17:\"columns/style.css\";i:91;s:21:\"columns/style.min.css\";i:92;s:33:\"comment-author-name/style-rtl.css\";i:93;s:37:\"comment-author-name/style-rtl.min.css\";i:94;s:29:\"comment-author-name/style.css\";i:95;s:33:\"comment-author-name/style.min.css\";i:96;s:29:\"comment-content/style-rtl.css\";i:97;s:33:\"comment-content/style-rtl.min.css\";i:98;s:25:\"comment-content/style.css\";i:99;s:29:\"comment-content/style.min.css\";i:100;s:26:\"comment-date/style-rtl.css\";i:101;s:30:\"comment-date/style-rtl.min.css\";i:102;s:22:\"comment-date/style.css\";i:103;s:26:\"comment-date/style.min.css\";i:104;s:31:\"comment-edit-link/style-rtl.css\";i:105;s:35:\"comment-edit-link/style-rtl.min.css\";i:106;s:27:\"comment-edit-link/style.css\";i:107;s:31:\"comment-edit-link/style.min.css\";i:108;s:32:\"comment-reply-link/style-rtl.css\";i:109;s:36:\"comment-reply-link/style-rtl.min.css\";i:110;s:28:\"comment-reply-link/style.css\";i:111;s:32:\"comment-reply-link/style.min.css\";i:112;s:30:\"comment-template/style-rtl.css\";i:113;s:34:\"comment-template/style-rtl.min.css\";i:114;s:26:\"comment-template/style.css\";i:115;s:30:\"comment-template/style.min.css\";i:116;s:42:\"comments-pagination-numbers/editor-rtl.css\";i:117;s:46:\"comments-pagination-numbers/editor-rtl.min.css\";i:118;s:38:\"comments-pagination-numbers/editor.css\";i:119;s:42:\"comments-pagination-numbers/editor.min.css\";i:120;s:34:\"comments-pagination/editor-rtl.css\";i:121;s:38:\"comments-pagination/editor-rtl.min.css\";i:122;s:30:\"comments-pagination/editor.css\";i:123;s:34:\"comments-pagination/editor.min.css\";i:124;s:33:\"comments-pagination/style-rtl.css\";i:125;s:37:\"comments-pagination/style-rtl.min.css\";i:126;s:29:\"comments-pagination/style.css\";i:127;s:33:\"comments-pagination/style.min.css\";i:128;s:29:\"comments-title/editor-rtl.css\";i:129;s:33:\"comments-title/editor-rtl.min.css\";i:130;s:25:\"comments-title/editor.css\";i:131;s:29:\"comments-title/editor.min.css\";i:132;s:23:\"comments/editor-rtl.css\";i:133;s:27:\"comments/editor-rtl.min.css\";i:134;s:19:\"comments/editor.css\";i:135;s:23:\"comments/editor.min.css\";i:136;s:22:\"comments/style-rtl.css\";i:137;s:26:\"comments/style-rtl.min.css\";i:138;s:18:\"comments/style.css\";i:139;s:22:\"comments/style.min.css\";i:140;s:20:\"cover/editor-rtl.css\";i:141;s:24:\"cover/editor-rtl.min.css\";i:142;s:16:\"cover/editor.css\";i:143;s:20:\"cover/editor.min.css\";i:144;s:19:\"cover/style-rtl.css\";i:145;s:23:\"cover/style-rtl.min.css\";i:146;s:15:\"cover/style.css\";i:147;s:19:\"cover/style.min.css\";i:148;s:22:\"details/editor-rtl.css\";i:149;s:26:\"details/editor-rtl.min.css\";i:150;s:18:\"details/editor.css\";i:151;s:22:\"details/editor.min.css\";i:152;s:21:\"details/style-rtl.css\";i:153;s:25:\"details/style-rtl.min.css\";i:154;s:17:\"details/style.css\";i:155;s:21:\"details/style.min.css\";i:156;s:20:\"embed/editor-rtl.css\";i:157;s:24:\"embed/editor-rtl.min.css\";i:158;s:16:\"embed/editor.css\";i:159;s:20:\"embed/editor.min.css\";i:160;s:19:\"embed/style-rtl.css\";i:161;s:23:\"embed/style-rtl.min.css\";i:162;s:15:\"embed/style.css\";i:163;s:19:\"embed/style.min.css\";i:164;s:19:\"embed/theme-rtl.css\";i:165;s:23:\"embed/theme-rtl.min.css\";i:166;s:15:\"embed/theme.css\";i:167;s:19:\"embed/theme.min.css\";i:168;s:19:\"file/editor-rtl.css\";i:169;s:23:\"file/editor-rtl.min.css\";i:170;s:15:\"file/editor.css\";i:171;s:19:\"file/editor.min.css\";i:172;s:18:\"file/style-rtl.css\";i:173;s:22:\"file/style-rtl.min.css\";i:174;s:14:\"file/style.css\";i:175;s:18:\"file/style.min.css\";i:176;s:23:\"footnotes/style-rtl.css\";i:177;s:27:\"footnotes/style-rtl.min.css\";i:178;s:19:\"footnotes/style.css\";i:179;s:23:\"footnotes/style.min.css\";i:180;s:23:\"freeform/editor-rtl.css\";i:181;s:27:\"freeform/editor-rtl.min.css\";i:182;s:19:\"freeform/editor.css\";i:183;s:23:\"freeform/editor.min.css\";i:184;s:22:\"gallery/editor-rtl.css\";i:185;s:26:\"gallery/editor-rtl.min.css\";i:186;s:18:\"gallery/editor.css\";i:187;s:22:\"gallery/editor.min.css\";i:188;s:21:\"gallery/style-rtl.css\";i:189;s:25:\"gallery/style-rtl.min.css\";i:190;s:17:\"gallery/style.css\";i:191;s:21:\"gallery/style.min.css\";i:192;s:21:\"gallery/theme-rtl.css\";i:193;s:25:\"gallery/theme-rtl.min.css\";i:194;s:17:\"gallery/theme.css\";i:195;s:21:\"gallery/theme.min.css\";i:196;s:20:\"group/editor-rtl.css\";i:197;s:24:\"group/editor-rtl.min.css\";i:198;s:16:\"group/editor.css\";i:199;s:20:\"group/editor.min.css\";i:200;s:19:\"group/style-rtl.css\";i:201;s:23:\"group/style-rtl.min.css\";i:202;s:15:\"group/style.css\";i:203;s:19:\"group/style.min.css\";i:204;s:19:\"group/theme-rtl.css\";i:205;s:23:\"group/theme-rtl.min.css\";i:206;s:15:\"group/theme.css\";i:207;s:19:\"group/theme.min.css\";i:208;s:21:\"heading/style-rtl.css\";i:209;s:25:\"heading/style-rtl.min.css\";i:210;s:17:\"heading/style.css\";i:211;s:21:\"heading/style.min.css\";i:212;s:19:\"html/editor-rtl.css\";i:213;s:23:\"html/editor-rtl.min.css\";i:214;s:15:\"html/editor.css\";i:215;s:19:\"html/editor.min.css\";i:216;s:20:\"image/editor-rtl.css\";i:217;s:24:\"image/editor-rtl.min.css\";i:218;s:16:\"image/editor.css\";i:219;s:20:\"image/editor.min.css\";i:220;s:19:\"image/style-rtl.css\";i:221;s:23:\"image/style-rtl.min.css\";i:222;s:15:\"image/style.css\";i:223;s:19:\"image/style.min.css\";i:224;s:19:\"image/theme-rtl.css\";i:225;s:23:\"image/theme-rtl.min.css\";i:226;s:15:\"image/theme.css\";i:227;s:19:\"image/theme.min.css\";i:228;s:29:\"latest-comments/style-rtl.css\";i:229;s:33:\"latest-comments/style-rtl.min.css\";i:230;s:25:\"latest-comments/style.css\";i:231;s:29:\"latest-comments/style.min.css\";i:232;s:27:\"latest-posts/editor-rtl.css\";i:233;s:31:\"latest-posts/editor-rtl.min.css\";i:234;s:23:\"latest-posts/editor.css\";i:235;s:27:\"latest-posts/editor.min.css\";i:236;s:26:\"latest-posts/style-rtl.css\";i:237;s:30:\"latest-posts/style-rtl.min.css\";i:238;s:22:\"latest-posts/style.css\";i:239;s:26:\"latest-posts/style.min.css\";i:240;s:18:\"list/style-rtl.css\";i:241;s:22:\"list/style-rtl.min.css\";i:242;s:14:\"list/style.css\";i:243;s:18:\"list/style.min.css\";i:244;s:22:\"loginout/style-rtl.css\";i:245;s:26:\"loginout/style-rtl.min.css\";i:246;s:18:\"loginout/style.css\";i:247;s:22:\"loginout/style.min.css\";i:248;s:19:\"math/editor-rtl.css\";i:249;s:23:\"math/editor-rtl.min.css\";i:250;s:15:\"math/editor.css\";i:251;s:19:\"math/editor.min.css\";i:252;s:18:\"math/style-rtl.css\";i:253;s:22:\"math/style-rtl.min.css\";i:254;s:14:\"math/style.css\";i:255;s:18:\"math/style.min.css\";i:256;s:25:\"media-text/editor-rtl.css\";i:257;s:29:\"media-text/editor-rtl.min.css\";i:258;s:21:\"media-text/editor.css\";i:259;s:25:\"media-text/editor.min.css\";i:260;s:24:\"media-text/style-rtl.css\";i:261;s:28:\"media-text/style-rtl.min.css\";i:262;s:20:\"media-text/style.css\";i:263;s:24:\"media-text/style.min.css\";i:264;s:19:\"more/editor-rtl.css\";i:265;s:23:\"more/editor-rtl.min.css\";i:266;s:15:\"more/editor.css\";i:267;s:19:\"more/editor.min.css\";i:268;s:30:\"navigation-link/editor-rtl.css\";i:269;s:34:\"navigation-link/editor-rtl.min.css\";i:270;s:26:\"navigation-link/editor.css\";i:271;s:30:\"navigation-link/editor.min.css\";i:272;s:29:\"navigation-link/style-rtl.css\";i:273;s:33:\"navigation-link/style-rtl.min.css\";i:274;s:25:\"navigation-link/style.css\";i:275;s:29:\"navigation-link/style.min.css\";i:276;s:33:\"navigation-submenu/editor-rtl.css\";i:277;s:37:\"navigation-submenu/editor-rtl.min.css\";i:278;s:29:\"navigation-submenu/editor.css\";i:279;s:33:\"navigation-submenu/editor.min.css\";i:280;s:25:\"navigation/editor-rtl.css\";i:281;s:29:\"navigation/editor-rtl.min.css\";i:282;s:21:\"navigation/editor.css\";i:283;s:25:\"navigation/editor.min.css\";i:284;s:24:\"navigation/style-rtl.css\";i:285;s:28:\"navigation/style-rtl.min.css\";i:286;s:20:\"navigation/style.css\";i:287;s:24:\"navigation/style.min.css\";i:288;s:23:\"nextpage/editor-rtl.css\";i:289;s:27:\"nextpage/editor-rtl.min.css\";i:290;s:19:\"nextpage/editor.css\";i:291;s:23:\"nextpage/editor.min.css\";i:292;s:24:\"page-list/editor-rtl.css\";i:293;s:28:\"page-list/editor-rtl.min.css\";i:294;s:20:\"page-list/editor.css\";i:295;s:24:\"page-list/editor.min.css\";i:296;s:23:\"page-list/style-rtl.css\";i:297;s:27:\"page-list/style-rtl.min.css\";i:298;s:19:\"page-list/style.css\";i:299;s:23:\"page-list/style.min.css\";i:300;s:24:\"paragraph/editor-rtl.css\";i:301;s:28:\"paragraph/editor-rtl.min.css\";i:302;s:20:\"paragraph/editor.css\";i:303;s:24:\"paragraph/editor.min.css\";i:304;s:23:\"paragraph/style-rtl.css\";i:305;s:27:\"paragraph/style-rtl.min.css\";i:306;s:19:\"paragraph/style.css\";i:307;s:23:\"paragraph/style.min.css\";i:308;s:35:\"post-author-biography/style-rtl.css\";i:309;s:39:\"post-author-biography/style-rtl.min.css\";i:310;s:31:\"post-author-biography/style.css\";i:311;s:35:\"post-author-biography/style.min.css\";i:312;s:30:\"post-author-name/style-rtl.css\";i:313;s:34:\"post-author-name/style-rtl.min.css\";i:314;s:26:\"post-author-name/style.css\";i:315;s:30:\"post-author-name/style.min.css\";i:316;s:25:\"post-author/style-rtl.css\";i:317;s:29:\"post-author/style-rtl.min.css\";i:318;s:21:\"post-author/style.css\";i:319;s:25:\"post-author/style.min.css\";i:320;s:33:\"post-comments-count/style-rtl.css\";i:321;s:37:\"post-comments-count/style-rtl.min.css\";i:322;s:29:\"post-comments-count/style.css\";i:323;s:33:\"post-comments-count/style.min.css\";i:324;s:33:\"post-comments-form/editor-rtl.css\";i:325;s:37:\"post-comments-form/editor-rtl.min.css\";i:326;s:29:\"post-comments-form/editor.css\";i:327;s:33:\"post-comments-form/editor.min.css\";i:328;s:32:\"post-comments-form/style-rtl.css\";i:329;s:36:\"post-comments-form/style-rtl.min.css\";i:330;s:28:\"post-comments-form/style.css\";i:331;s:32:\"post-comments-form/style.min.css\";i:332;s:32:\"post-comments-link/style-rtl.css\";i:333;s:36:\"post-comments-link/style-rtl.min.css\";i:334;s:28:\"post-comments-link/style.css\";i:335;s:32:\"post-comments-link/style.min.css\";i:336;s:26:\"post-content/style-rtl.css\";i:337;s:30:\"post-content/style-rtl.min.css\";i:338;s:22:\"post-content/style.css\";i:339;s:26:\"post-content/style.min.css\";i:340;s:23:\"post-date/style-rtl.css\";i:341;s:27:\"post-date/style-rtl.min.css\";i:342;s:19:\"post-date/style.css\";i:343;s:23:\"post-date/style.min.css\";i:344;s:27:\"post-excerpt/editor-rtl.css\";i:345;s:31:\"post-excerpt/editor-rtl.min.css\";i:346;s:23:\"post-excerpt/editor.css\";i:347;s:27:\"post-excerpt/editor.min.css\";i:348;s:26:\"post-excerpt/style-rtl.css\";i:349;s:30:\"post-excerpt/style-rtl.min.css\";i:350;s:22:\"post-excerpt/style.css\";i:351;s:26:\"post-excerpt/style.min.css\";i:352;s:34:\"post-featured-image/editor-rtl.css\";i:353;s:38:\"post-featured-image/editor-rtl.min.css\";i:354;s:30:\"post-featured-image/editor.css\";i:355;s:34:\"post-featured-image/editor.min.css\";i:356;s:33:\"post-featured-image/style-rtl.css\";i:357;s:37:\"post-featured-image/style-rtl.min.css\";i:358;s:29:\"post-featured-image/style.css\";i:359;s:33:\"post-featured-image/style.min.css\";i:360;s:34:\"post-navigation-link/style-rtl.css\";i:361;s:38:\"post-navigation-link/style-rtl.min.css\";i:362;s:30:\"post-navigation-link/style.css\";i:363;s:34:\"post-navigation-link/style.min.css\";i:364;s:27:\"post-template/style-rtl.css\";i:365;s:31:\"post-template/style-rtl.min.css\";i:366;s:23:\"post-template/style.css\";i:367;s:27:\"post-template/style.min.css\";i:368;s:24:\"post-terms/style-rtl.css\";i:369;s:28:\"post-terms/style-rtl.min.css\";i:370;s:20:\"post-terms/style.css\";i:371;s:24:\"post-terms/style.min.css\";i:372;s:31:\"post-time-to-read/style-rtl.css\";i:373;s:35:\"post-time-to-read/style-rtl.min.css\";i:374;s:27:\"post-time-to-read/style.css\";i:375;s:31:\"post-time-to-read/style.min.css\";i:376;s:24:\"post-title/style-rtl.css\";i:377;s:28:\"post-title/style-rtl.min.css\";i:378;s:20:\"post-title/style.css\";i:379;s:24:\"post-title/style.min.css\";i:380;s:26:\"preformatted/style-rtl.css\";i:381;s:30:\"preformatted/style-rtl.min.css\";i:382;s:22:\"preformatted/style.css\";i:383;s:26:\"preformatted/style.min.css\";i:384;s:24:\"pullquote/editor-rtl.css\";i:385;s:28:\"pullquote/editor-rtl.min.css\";i:386;s:20:\"pullquote/editor.css\";i:387;s:24:\"pullquote/editor.min.css\";i:388;s:23:\"pullquote/style-rtl.css\";i:389;s:27:\"pullquote/style-rtl.min.css\";i:390;s:19:\"pullquote/style.css\";i:391;s:23:\"pullquote/style.min.css\";i:392;s:23:\"pullquote/theme-rtl.css\";i:393;s:27:\"pullquote/theme-rtl.min.css\";i:394;s:19:\"pullquote/theme.css\";i:395;s:23:\"pullquote/theme.min.css\";i:396;s:39:\"query-pagination-numbers/editor-rtl.css\";i:397;s:43:\"query-pagination-numbers/editor-rtl.min.css\";i:398;s:35:\"query-pagination-numbers/editor.css\";i:399;s:39:\"query-pagination-numbers/editor.min.css\";i:400;s:31:\"query-pagination/editor-rtl.css\";i:401;s:35:\"query-pagination/editor-rtl.min.css\";i:402;s:27:\"query-pagination/editor.css\";i:403;s:31:\"query-pagination/editor.min.css\";i:404;s:30:\"query-pagination/style-rtl.css\";i:405;s:34:\"query-pagination/style-rtl.min.css\";i:406;s:26:\"query-pagination/style.css\";i:407;s:30:\"query-pagination/style.min.css\";i:408;s:25:\"query-title/style-rtl.css\";i:409;s:29:\"query-title/style-rtl.min.css\";i:410;s:21:\"query-title/style.css\";i:411;s:25:\"query-title/style.min.css\";i:412;s:25:\"query-total/style-rtl.css\";i:413;s:29:\"query-total/style-rtl.min.css\";i:414;s:21:\"query-total/style.css\";i:415;s:25:\"query-total/style.min.css\";i:416;s:20:\"query/editor-rtl.css\";i:417;s:24:\"query/editor-rtl.min.css\";i:418;s:16:\"query/editor.css\";i:419;s:20:\"query/editor.min.css\";i:420;s:19:\"quote/style-rtl.css\";i:421;s:23:\"quote/style-rtl.min.css\";i:422;s:15:\"quote/style.css\";i:423;s:19:\"quote/style.min.css\";i:424;s:19:\"quote/theme-rtl.css\";i:425;s:23:\"quote/theme-rtl.min.css\";i:426;s:15:\"quote/theme.css\";i:427;s:19:\"quote/theme.min.css\";i:428;s:23:\"read-more/style-rtl.css\";i:429;s:27:\"read-more/style-rtl.min.css\";i:430;s:19:\"read-more/style.css\";i:431;s:23:\"read-more/style.min.css\";i:432;s:18:\"rss/editor-rtl.css\";i:433;s:22:\"rss/editor-rtl.min.css\";i:434;s:14:\"rss/editor.css\";i:435;s:18:\"rss/editor.min.css\";i:436;s:17:\"rss/style-rtl.css\";i:437;s:21:\"rss/style-rtl.min.css\";i:438;s:13:\"rss/style.css\";i:439;s:17:\"rss/style.min.css\";i:440;s:21:\"search/editor-rtl.css\";i:441;s:25:\"search/editor-rtl.min.css\";i:442;s:17:\"search/editor.css\";i:443;s:21:\"search/editor.min.css\";i:444;s:20:\"search/style-rtl.css\";i:445;s:24:\"search/style-rtl.min.css\";i:446;s:16:\"search/style.css\";i:447;s:20:\"search/style.min.css\";i:448;s:20:\"search/theme-rtl.css\";i:449;s:24:\"search/theme-rtl.min.css\";i:450;s:16:\"search/theme.css\";i:451;s:20:\"search/theme.min.css\";i:452;s:24:\"separator/editor-rtl.css\";i:453;s:28:\"separator/editor-rtl.min.css\";i:454;s:20:\"separator/editor.css\";i:455;s:24:\"separator/editor.min.css\";i:456;s:23:\"separator/style-rtl.css\";i:457;s:27:\"separator/style-rtl.min.css\";i:458;s:19:\"separator/style.css\";i:459;s:23:\"separator/style.min.css\";i:460;s:23:\"separator/theme-rtl.css\";i:461;s:27:\"separator/theme-rtl.min.css\";i:462;s:19:\"separator/theme.css\";i:463;s:23:\"separator/theme.min.css\";i:464;s:24:\"shortcode/editor-rtl.css\";i:465;s:28:\"shortcode/editor-rtl.min.css\";i:466;s:20:\"shortcode/editor.css\";i:467;s:24:\"shortcode/editor.min.css\";i:468;s:24:\"site-logo/editor-rtl.css\";i:469;s:28:\"site-logo/editor-rtl.min.css\";i:470;s:20:\"site-logo/editor.css\";i:471;s:24:\"site-logo/editor.min.css\";i:472;s:23:\"site-logo/style-rtl.css\";i:473;s:27:\"site-logo/style-rtl.min.css\";i:474;s:19:\"site-logo/style.css\";i:475;s:23:\"site-logo/style.min.css\";i:476;s:27:\"site-tagline/editor-rtl.css\";i:477;s:31:\"site-tagline/editor-rtl.min.css\";i:478;s:23:\"site-tagline/editor.css\";i:479;s:27:\"site-tagline/editor.min.css\";i:480;s:26:\"site-tagline/style-rtl.css\";i:481;s:30:\"site-tagline/style-rtl.min.css\";i:482;s:22:\"site-tagline/style.css\";i:483;s:26:\"site-tagline/style.min.css\";i:484;s:25:\"site-title/editor-rtl.css\";i:485;s:29:\"site-title/editor-rtl.min.css\";i:486;s:21:\"site-title/editor.css\";i:487;s:25:\"site-title/editor.min.css\";i:488;s:24:\"site-title/style-rtl.css\";i:489;s:28:\"site-title/style-rtl.min.css\";i:490;s:20:\"site-title/style.css\";i:491;s:24:\"site-title/style.min.css\";i:492;s:26:\"social-link/editor-rtl.css\";i:493;s:30:\"social-link/editor-rtl.min.css\";i:494;s:22:\"social-link/editor.css\";i:495;s:26:\"social-link/editor.min.css\";i:496;s:27:\"social-links/editor-rtl.css\";i:497;s:31:\"social-links/editor-rtl.min.css\";i:498;s:23:\"social-links/editor.css\";i:499;s:27:\"social-links/editor.min.css\";i:500;s:26:\"social-links/style-rtl.css\";i:501;s:30:\"social-links/style-rtl.min.css\";i:502;s:22:\"social-links/style.css\";i:503;s:26:\"social-links/style.min.css\";i:504;s:21:\"spacer/editor-rtl.css\";i:505;s:25:\"spacer/editor-rtl.min.css\";i:506;s:17:\"spacer/editor.css\";i:507;s:21:\"spacer/editor.min.css\";i:508;s:20:\"spacer/style-rtl.css\";i:509;s:24:\"spacer/style-rtl.min.css\";i:510;s:16:\"spacer/style.css\";i:511;s:20:\"spacer/style.min.css\";i:512;s:20:\"table/editor-rtl.css\";i:513;s:24:\"table/editor-rtl.min.css\";i:514;s:16:\"table/editor.css\";i:515;s:20:\"table/editor.min.css\";i:516;s:19:\"table/style-rtl.css\";i:517;s:23:\"table/style-rtl.min.css\";i:518;s:15:\"table/style.css\";i:519;s:19:\"table/style.min.css\";i:520;s:19:\"table/theme-rtl.css\";i:521;s:23:\"table/theme-rtl.min.css\";i:522;s:15:\"table/theme.css\";i:523;s:19:\"table/theme.min.css\";i:524;s:24:\"tag-cloud/editor-rtl.css\";i:525;s:28:\"tag-cloud/editor-rtl.min.css\";i:526;s:20:\"tag-cloud/editor.css\";i:527;s:24:\"tag-cloud/editor.min.css\";i:528;s:23:\"tag-cloud/style-rtl.css\";i:529;s:27:\"tag-cloud/style-rtl.min.css\";i:530;s:19:\"tag-cloud/style.css\";i:531;s:23:\"tag-cloud/style.min.css\";i:532;s:28:\"template-part/editor-rtl.css\";i:533;s:32:\"template-part/editor-rtl.min.css\";i:534;s:24:\"template-part/editor.css\";i:535;s:28:\"template-part/editor.min.css\";i:536;s:27:\"template-part/theme-rtl.css\";i:537;s:31:\"template-part/theme-rtl.min.css\";i:538;s:23:\"template-part/theme.css\";i:539;s:27:\"template-part/theme.min.css\";i:540;s:24:\"term-count/style-rtl.css\";i:541;s:28:\"term-count/style-rtl.min.css\";i:542;s:20:\"term-count/style.css\";i:543;s:24:\"term-count/style.min.css\";i:544;s:30:\"term-description/style-rtl.css\";i:545;s:34:\"term-description/style-rtl.min.css\";i:546;s:26:\"term-description/style.css\";i:547;s:30:\"term-description/style.min.css\";i:548;s:23:\"term-name/style-rtl.css\";i:549;s:27:\"term-name/style-rtl.min.css\";i:550;s:19:\"term-name/style.css\";i:551;s:23:\"term-name/style.min.css\";i:552;s:28:\"term-template/editor-rtl.css\";i:553;s:32:\"term-template/editor-rtl.min.css\";i:554;s:24:\"term-template/editor.css\";i:555;s:28:\"term-template/editor.min.css\";i:556;s:27:\"term-template/style-rtl.css\";i:557;s:31:\"term-template/style-rtl.min.css\";i:558;s:23:\"term-template/style.css\";i:559;s:27:\"term-template/style.min.css\";i:560;s:27:\"text-columns/editor-rtl.css\";i:561;s:31:\"text-columns/editor-rtl.min.css\";i:562;s:23:\"text-columns/editor.css\";i:563;s:27:\"text-columns/editor.min.css\";i:564;s:26:\"text-columns/style-rtl.css\";i:565;s:30:\"text-columns/style-rtl.min.css\";i:566;s:22:\"text-columns/style.css\";i:567;s:26:\"text-columns/style.min.css\";i:568;s:19:\"verse/style-rtl.css\";i:569;s:23:\"verse/style-rtl.min.css\";i:570;s:15:\"verse/style.css\";i:571;s:19:\"verse/style.min.css\";i:572;s:20:\"video/editor-rtl.css\";i:573;s:24:\"video/editor-rtl.min.css\";i:574;s:16:\"video/editor.css\";i:575;s:20:\"video/editor.min.css\";i:576;s:19:\"video/style-rtl.css\";i:577;s:23:\"video/style-rtl.min.css\";i:578;s:15:\"video/style.css\";i:579;s:19:\"video/style.min.css\";i:580;s:19:\"video/theme-rtl.css\";i:581;s:23:\"video/theme-rtl.min.css\";i:582;s:15:\"video/theme.css\";i:583;s:19:\"video/theme.min.css\";}}', 'on'),
(432, 'ai1wm_status', 'a:2:{s:4:\"type\";s:8:\"download\";s:7:\"message\";s:325:\"<a href=\"https://eams.local/wp-content/ai1wm-backups/eams-local-20260429-203310-u4ws3jbcgvm4.wpress\" class=\"ai1wm-button-green ai1wm-emphasize ai1wm-button-download\" title=\"eams.local\" download=\"eams-local-20260429-203310-u4ws3jbcgvm4.wpress\">\n							<span>Download eams.local</span>\n							<em>Size: 24 МБ</em>\n							</a>\";}', 'auto'),
(433, 'swift_performance_plugin_organizer', 'a:0:{}', 'auto'),
(434, 'jetpack_active_modules', 'a:0:{}', 'auto'),
(435, '_site_transient_ai1wm_last_check_for_updates', '1778452459', 'off'),
(448, '_transient_health-check-site-status-result', '{\"good\":19,\"recommended\":4,\"critical\":1}', 'on'),
(451, '_site_transient_wp_plugin_dependencies_plugin_data', 'a:0:{}', 'off'),
(455, '_transient_wp_styles_for_blocks', 'a:2:{s:4:\"hash\";s:32:\"26b7018a5462e44e87a96d318e7da6ef\";s:6:\"blocks\";a:53:{s:11:\"core/button\";s:0:\"\";s:14:\"core/site-logo\";s:0:\"\";s:18:\"core/post-template\";s:0:\"\";s:18:\"core/term-template\";s:0:\"\";s:12:\"core/columns\";s:769:\":root :where(.wp-block-columns-is-layout-flow) > :first-child{margin-block-start: 0;}:root :where(.wp-block-columns-is-layout-flow) > :last-child{margin-block-end: 0;}:root :where(.wp-block-columns-is-layout-flow) > *{margin-block-start: var(--wp--preset--spacing--50);margin-block-end: 0;}:root :where(.wp-block-columns-is-layout-constrained) > :first-child{margin-block-start: 0;}:root :where(.wp-block-columns-is-layout-constrained) > :last-child{margin-block-end: 0;}:root :where(.wp-block-columns-is-layout-constrained) > *{margin-block-start: var(--wp--preset--spacing--50);margin-block-end: 0;}:root :where(.wp-block-columns-is-layout-flex){gap: var(--wp--preset--spacing--50);}:root :where(.wp-block-columns-is-layout-grid){gap: var(--wp--preset--spacing--50);}\";s:14:\"core/pullquote\";s:306:\":root :where(.wp-block-pullquote){font-size: var(--wp--preset--font-size--xx-large);font-weight: 300;line-height: 1.2;padding-top: var(--wp--preset--spacing--30);padding-bottom: var(--wp--preset--spacing--30);}:root :where(.wp-block-pullquote p:last-of-type){margin-bottom: var(--wp--preset--spacing--30);}\";s:32:\"c48738dcb285a3f6ab83acff204fc486\";s:106:\":root :where(.wp-block-pullquote cite){font-size: var(--wp--preset--font-size--small);font-style: normal;}\";s:11:\"core/avatar\";s:57:\":root :where(.wp-block-avatar img){border-radius: 100px;}\";s:12:\"core/buttons\";s:665:\":root :where(.wp-block-buttons-is-layout-flow) > :first-child{margin-block-start: 0;}:root :where(.wp-block-buttons-is-layout-flow) > :last-child{margin-block-end: 0;}:root :where(.wp-block-buttons-is-layout-flow) > *{margin-block-start: 16px;margin-block-end: 0;}:root :where(.wp-block-buttons-is-layout-constrained) > :first-child{margin-block-start: 0;}:root :where(.wp-block-buttons-is-layout-constrained) > :last-child{margin-block-end: 0;}:root :where(.wp-block-buttons-is-layout-constrained) > *{margin-block-start: 16px;margin-block-end: 0;}:root :where(.wp-block-buttons-is-layout-flex){gap: 16px;}:root :where(.wp-block-buttons-is-layout-grid){gap: 16px;}\";s:9:\"core/code\";s:427:\":root :where(.wp-block-code){background-color: var(--wp--preset--color--accent-5);color: var(--wp--preset--color--contrast);font-family: var(--wp--preset--font-family--fira-code);font-size: var(--wp--preset--font-size--medium);font-weight: 300;padding-top: var(--wp--preset--spacing--40);padding-right: var(--wp--preset--spacing--40);padding-bottom: var(--wp--preset--spacing--40);padding-left: var(--wp--preset--spacing--40);}\";s:24:\"core/comment-author-name\";s:169:\":root :where(.wp-block-comment-author-name){color: var(--wp--preset--color--accent-4);font-size: var(--wp--preset--font-size--small);margin-top: 5px;margin-bottom: 0px;}\";s:32:\"c0002c260f8238c4212f3e4c369fc4f7\";s:143:\":root :where(.wp-block-comment-author-name a:where(:not(.wp-element-button))){color: var(--wp--preset--color--accent-4);text-decoration: none;}\";s:32:\"1e7c38b45537b325dbbbaec17a301676\";s:112:\":root :where(.wp-block-comment-author-name a:where(:not(.wp-element-button)):hover){text-decoration: underline;}\";s:20:\"core/comment-content\";s:178:\":root :where(.wp-block-comment-content){font-size: var(--wp--preset--font-size--medium);margin-top: var(--wp--preset--spacing--30);margin-bottom: var(--wp--preset--spacing--30);}\";s:17:\"core/comment-date\";s:127:\":root :where(.wp-block-comment-date){color: var(--wp--preset--color--contrast);font-size: var(--wp--preset--font-size--small);}\";s:32:\"c83ca7b3e52884c70f7830c54f99b318\";s:114:\":root :where(.wp-block-comment-date a:where(:not(.wp-element-button))){color: var(--wp--preset--color--contrast);}\";s:22:\"core/comment-edit-link\";s:90:\":root :where(.wp-block-comment-edit-link){font-size: var(--wp--preset--font-size--small);}\";s:32:\"41d70710612536a90e368c12bcb0efea\";s:119:\":root :where(.wp-block-comment-edit-link a:where(:not(.wp-element-button))){color: var(--wp--preset--color--contrast);}\";s:23:\"core/comment-reply-link\";s:91:\":root :where(.wp-block-comment-reply-link){font-size: var(--wp--preset--font-size--small);}\";s:32:\"13c96340dbf37700add1f4c5cae19f3e\";s:120:\":root :where(.wp-block-comment-reply-link a:where(:not(.wp-element-button))){color: var(--wp--preset--color--contrast);}\";s:23:\"core/post-comments-form\";s:565:\":root :where(.wp-block-post-comments-form){font-size: var(--wp--preset--font-size--medium);padding-top: var(--wp--preset--spacing--40);padding-bottom: var(--wp--preset--spacing--40);}:root :where(.wp-block-post-comments-form textarea, .wp-block-post-comments-form input:not([type=submit])){border-radius:.25rem; border-color: var(--wp--preset--color--accent-6) !important;}:root :where(.wp-block-post-comments-form input[type=checkbox]){margin:0 .2rem 0 0 !important;}:root :where(.wp-block-post-comments-form label){font-size: var(--wp--preset--font-size--small);}\";s:24:\"core/comments-pagination\";s:182:\":root :where(.wp-block-comments-pagination){font-size: var(--wp--preset--font-size--medium);margin-top: var(--wp--preset--spacing--40);margin-bottom: var(--wp--preset--spacing--40);}\";s:29:\"core/comments-pagination-next\";s:98:\":root :where(.wp-block-comments-pagination-next){font-size: var(--wp--preset--font-size--medium);}\";s:32:\"core/comments-pagination-numbers\";s:101:\":root :where(.wp-block-comments-pagination-numbers){font-size: var(--wp--preset--font-size--medium);}\";s:33:\"core/comments-pagination-previous\";s:102:\":root :where(.wp-block-comments-pagination-previous){font-size: var(--wp--preset--font-size--medium);}\";s:14:\"core/post-date\";s:124:\":root :where(.wp-block-post-date){color: var(--wp--preset--color--accent-4);font-size: var(--wp--preset--font-size--small);}\";s:32:\"ac0d4e00f5ec22d14451759983e5bd43\";s:133:\":root :where(.wp-block-post-date a:where(:not(.wp-element-button))){color: var(--wp--preset--color--accent-4);text-decoration: none;}\";s:32:\"0ae6ffd1b886044c2da62d75d05ab13d\";s:102:\":root :where(.wp-block-post-date a:where(:not(.wp-element-button)):hover){text-decoration: underline;}\";s:25:\"core/post-navigation-link\";s:94:\":root :where(.wp-block-post-navigation-link){font-size: var(--wp--preset--font-size--medium);}\";s:15:\"core/post-terms\";s:158:\":root :where(.wp-block-post-terms){font-size: var(--wp--preset--font-size--small);font-weight: 600;}:root :where(.wp-block-post-terms a){white-space: nowrap;}\";s:15:\"core/post-title\";s:0:\"\";s:32:\"bb496d3fcd9be3502ce57ff8281e5687\";s:92:\":root :where(.wp-block-post-title a:where(:not(.wp-element-button))){text-decoration: none;}\";s:32:\"12380ab98fdc81351bb32a39bbfc9249\";s:103:\":root :where(.wp-block-post-title a:where(:not(.wp-element-button)):hover){text-decoration: underline;}\";s:10:\"core/quote\";s:1315:\":root :where(.wp-block-quote){border-color: currentColor;border-width: 0 0 0 2px;border-style: solid;font-size: var(--wp--preset--font-size--large);font-weight: 300;margin-right: 0;margin-left: 0;padding-top: var(--wp--preset--spacing--30);padding-right: var(--wp--preset--spacing--40);padding-bottom: var(--wp--preset--spacing--30);padding-left: var(--wp--preset--spacing--40);}:root :where(.wp-block-quote-is-layout-flow) > :first-child{margin-block-start: 0;}:root :where(.wp-block-quote-is-layout-flow) > :last-child{margin-block-end: 0;}:root :where(.wp-block-quote-is-layout-flow) > *{margin-block-start: var(--wp--preset--spacing--30);margin-block-end: 0;}:root :where(.wp-block-quote-is-layout-constrained) > :first-child{margin-block-start: 0;}:root :where(.wp-block-quote-is-layout-constrained) > :last-child{margin-block-end: 0;}:root :where(.wp-block-quote-is-layout-constrained) > *{margin-block-start: var(--wp--preset--spacing--30);margin-block-end: 0;}:root :where(.wp-block-quote-is-layout-flex){gap: var(--wp--preset--spacing--30);}:root :where(.wp-block-quote-is-layout-grid){gap: var(--wp--preset--spacing--30);}:root :where(.wp-block-quote.has-text-align-right ){border-width: 0 2px 0 0;}:root :where(.wp-block-quote.has-text-align-center ){border-width: 0;border-inline: 0; padding-inline: 0;}\";s:32:\"1de7a22e22013106efc5be82788cb6c0\";s:176:\":root :where(.wp-block-quote cite){font-size: var(--wp--preset--font-size--small);font-style: normal;font-weight: 300;}:root :where(.wp-block-quote cite sub){font-size: 0.65em}\";s:21:\"core/query-pagination\";s:107:\":root :where(.wp-block-query-pagination){font-size: var(--wp--preset--font-size--medium);font-weight: 500;}\";s:11:\"core/search\";s:380:\":root :where(.wp-block-search .wp-block-search__label, .wp-block-search .wp-block-search__input, .wp-block-search .wp-block-search__button){font-size: var(--wp--preset--font-size--medium);line-height: 1.6;}:root :where(.wp-block-search .wp-block-search__input){border-radius:3.125rem;padding-left:1.5625rem;padding-right:1.5625rem;border-color:var(--wp--preset--color--accent-6);}\";s:32:\"14fa6a3d0cfbde171cbc0fb04aa8a6cf\";s:138:\":root :where(.wp-block-search .wp-element-button,.wp-block-search  .wp-block-button__link){border-radius: 3.125rem;margin-left: 1.125rem;}\";s:32:\"05993ee2f3de94b5d1350998a7e9b6b0\";s:130:\":root :where(.wp-block-search .wp-element-button:hover,.wp-block-search  .wp-block-button__link:hover){border-color: transparent;}\";s:14:\"core/separator\";s:148:\":root :where(.wp-block-separator){border-color: currentColor;border-width: 0 0 1px 0;border-style: solid;color: var(--wp--preset--color--accent-6);}\";s:17:\"core/site-tagline\";s:86:\":root :where(.wp-block-site-tagline){font-size: var(--wp--preset--font-size--medium);}\";s:15:\"core/site-title\";s:75:\":root :where(.wp-block-site-title){font-weight: 700;letter-spacing: -.5px;}\";s:32:\"f513d889cf971b13995cc3fffed2f39b\";s:92:\":root :where(.wp-block-site-title a:where(:not(.wp-element-button))){text-decoration: none;}\";s:32:\"22c37a317cc0ebd50155b5ad78564f37\";s:103:\":root :where(.wp-block-site-title a:where(:not(.wp-element-button)):hover){text-decoration: underline;}\";s:21:\"core/term-description\";s:90:\":root :where(.wp-block-term-description){font-size: var(--wp--preset--font-size--medium);}\";s:15:\"core/navigation\";s:84:\":root :where(.wp-block-navigation){font-size: var(--wp--preset--font-size--medium);}\";s:32:\"25289a01850f5a0264ddb79a9a3baf3d\";s:92:\":root :where(.wp-block-navigation a:where(:not(.wp-element-button))){text-decoration: none;}\";s:32:\"026c04da08398d655a95047f1f235d97\";s:103:\":root :where(.wp-block-navigation a:where(:not(.wp-element-button)):hover){text-decoration: underline;}\";s:9:\"core/list\";s:52:\":root :where(.wp-block-list li){margin-top: 0.5rem;}\";s:12:\"core/heading\";s:0:\"\";s:14:\"core/paragraph\";s:0:\"\";s:10:\"core/group\";s:0:\"\";s:11:\"core/column\";s:0:\"\";}}', 'on'),
(472, '_site_transient_timeout_php_check_10e5105aadbc205bbc043b5282f5b85a', '1779014012', 'off'),
(473, '_site_transient_php_check_10e5105aadbc205bbc043b5282f5b85a', 'a:5:{s:19:\"recommended_version\";s:3:\"8.3\";s:15:\"minimum_version\";s:6:\"7.2.24\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'off'),
(501, '_site_transient_timeout_theme_roots', '1778454266', 'off'),
(502, '_site_transient_theme_roots', 'a:3:{s:16:\"twentytwentyfive\";s:7:\"/themes\";s:16:\"twentytwentyfour\";s:7:\"/themes\";s:17:\"twentytwentythree\";s:7:\"/themes\";}', 'off'),
(505, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/ru_RU/wordpress-6.9.4.zip\";s:6:\"locale\";s:5:\"ru_RU\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/ru_RU/wordpress-6.9.4.zip\";s:10:\"no_content\";s:0:\"\";s:11:\"new_bundled\";s:0:\"\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"6.9.4\";s:7:\"version\";s:5:\"6.9.4\";s:11:\"php_version\";s:6:\"7.2.24\";s:13:\"mysql_version\";s:5:\"5.5.5\";s:11:\"new_bundled\";s:3:\"6.7\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1778452469;s:15:\"version_checked\";s:5:\"6.9.4\";s:12:\"translations\";a:1:{i:0;a:7:{s:4:\"type\";s:4:\"core\";s:4:\"slug\";s:7:\"default\";s:8:\"language\";s:5:\"ru_RU\";s:7:\"version\";s:5:\"6.9.4\";s:7:\"updated\";s:19:\"2026-03-28 07:09:12\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/6.9.4/ru_RU.zip\";s:10:\"autoupdate\";b:1;}}}', 'off');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(506, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1778452470;s:7:\"checked\";a:3:{s:16:\"twentytwentyfive\";s:3:\"1.2\";s:16:\"twentytwentyfour\";s:3:\"1.3\";s:17:\"twentytwentythree\";s:3:\"1.6\";}s:8:\"response\";a:2:{s:16:\"twentytwentyfive\";a:6:{s:5:\"theme\";s:16:\"twentytwentyfive\";s:11:\"new_version\";s:3:\"1.4\";s:3:\"url\";s:46:\"https://wordpress.org/themes/twentytwentyfive/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/theme/twentytwentyfive.1.4.zip\";s:8:\"requires\";s:3:\"6.7\";s:12:\"requires_php\";s:3:\"7.2\";}s:16:\"twentytwentyfour\";a:6:{s:5:\"theme\";s:16:\"twentytwentyfour\";s:11:\"new_version\";s:3:\"1.4\";s:3:\"url\";s:46:\"https://wordpress.org/themes/twentytwentyfour/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/theme/twentytwentyfour.1.4.zip\";s:8:\"requires\";s:3:\"6.4\";s:12:\"requires_php\";s:3:\"7.0\";}}s:9:\"no_update\";a:1:{s:17:\"twentytwentythree\";a:6:{s:5:\"theme\";s:17:\"twentytwentythree\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:47:\"https://wordpress.org/themes/twentytwentythree/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/theme/twentytwentythree.1.6.zip\";s:8:\"requires\";s:3:\"6.1\";s:12:\"requires_php\";s:3:\"5.6\";}}s:12:\"translations\";a:0:{}}', 'off'),
(507, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1778452471;s:8:\"response\";a:3:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":13:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:3:\"5.7\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:54:\"https://downloads.wordpress.org/plugin/akismet.5.7.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:60:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=2818463\";s:2:\"1x\";s:60:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=2818463\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/akismet/assets/banner-1544x500.png?rev=2900731\";s:2:\"1x\";s:62:\"https://ps.w.org/akismet/assets/banner-772x250.png?rev=2900731\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.8\";s:6:\"tested\";s:3:\"7.0\";s:12:\"requires_php\";s:3:\"7.2\";s:16:\"requires_plugins\";a:0:{}}s:51:\"all-in-one-wp-migration/all-in-one-wp-migration.php\";O:8:\"stdClass\":13:{s:2:\"id\";s:37:\"w.org/plugins/all-in-one-wp-migration\";s:4:\"slug\";s:23:\"all-in-one-wp-migration\";s:6:\"plugin\";s:51:\"all-in-one-wp-migration/all-in-one-wp-migration.php\";s:11:\"new_version\";s:5:\"7.105\";s:3:\"url\";s:54:\"https://wordpress.org/plugins/all-in-one-wp-migration/\";s:7:\"package\";s:72:\"https://downloads.wordpress.org/plugin/all-in-one-wp-migration.7.105.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:76:\"https://ps.w.org/all-in-one-wp-migration/assets/icon-256x256.png?rev=2458334\";s:2:\"1x\";s:76:\"https://ps.w.org/all-in-one-wp-migration/assets/icon-128x128.png?rev=2458334\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:79:\"https://ps.w.org/all-in-one-wp-migration/assets/banner-1544x500.png?rev=3490368\";s:2:\"1x\";s:78:\"https://ps.w.org/all-in-one-wp-migration/assets/banner-772x250.png?rev=3490368\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"3.3\";s:6:\"tested\";s:3:\"7.0\";s:12:\"requires_php\";s:3:\"5.3\";s:16:\"requires_plugins\";a:0:{}}s:19:\"members/members.php\";O:8:\"stdClass\":13:{s:2:\"id\";s:21:\"w.org/plugins/members\";s:4:\"slug\";s:7:\"members\";s:6:\"plugin\";s:19:\"members/members.php\";s:11:\"new_version\";s:6:\"3.2.21\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/members/\";s:7:\"package\";s:57:\"https://downloads.wordpress.org/plugin/members.3.2.21.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:60:\"https://ps.w.org/members/assets/icon-256x256.png?rev=3508404\";s:2:\"1x\";s:60:\"https://ps.w.org/members/assets/icon-128x128.png?rev=3508404\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/members/assets/banner-1544x500.png?rev=3508404\";s:2:\"1x\";s:62:\"https://ps.w.org/members/assets/banner-772x250.png?rev=3508404\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"6.0\";s:6:\"tested\";s:5:\"6.9.4\";s:12:\"requires_php\";s:3:\"7.4\";s:16:\"requires_plugins\";a:0:{}}}s:12:\"translations\";a:1:{i:0;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:23:\"all-in-one-wp-migration\";s:8:\"language\";s:5:\"ru_RU\";s:7:\"version\";s:5:\"7.104\";s:7:\"updated\";s:19:\"2026-04-01 14:09:33\";s:7:\"package\";s:90:\"https://downloads.wordpress.org/translation/plugin/all-in-one-wp-migration/7.104/ru_RU.zip\";s:10:\"autoupdate\";b:1;}}s:9:\"no_update\";a:1:{s:9:\"hello.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/hello-dolly/assets/banner-1544x500.jpg?rev=2645582\";s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.6\";}}s:7:\"checked\";a:4:{s:19:\"akismet/akismet.php\";s:5:\"5.3.7\";s:51:\"all-in-one-wp-migration/all-in-one-wp-migration.php\";s:5:\"7.104\";s:9:\"hello.php\";s:5:\"1.7.2\";s:19:\"members/members.php\";s:6:\"3.2.19\";}}', 'off'),
(513, '_site_transient_timeout_wp_theme_files_patterns-eeb903b9a688fe996cd78ed6d917112c', '1778458516', 'off'),
(514, '_site_transient_wp_theme_files_patterns-eeb903b9a688fe996cd78ed6d917112c', 'a:2:{s:7:\"version\";s:3:\"1.2\";s:8:\"patterns\";a:98:{s:21:\"banner-about-book.php\";a:4:{s:5:\"title\";s:28:\"Banner with book description\";s:4:\"slug\";s:34:\"twentytwentyfive/banner-about-book\";s:11:\"description\";s:66:\"Banner with book description and accompanying image for promotion.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}}s:28:\"banner-cover-big-heading.php\";a:4:{s:5:\"title\";s:22:\"Cover with big heading\";s:4:\"slug\";s:41:\"twentytwentyfive/banner-cover-big-heading\";s:11:\"description\";s:82:\"A full-width cover section with a large background image and an oversized heading.\";s:10:\"categories\";a:3:{i:0;s:6:\"banner\";i:1;s:5:\"about\";i:2;s:8:\"featured\";}}s:22:\"banner-intro-image.php\";a:4:{s:5:\"title\";s:49:\"Short heading and paragraph and image on the left\";s:4:\"slug\";s:35:\"twentytwentyfive/banner-intro-image\";s:11:\"description\";s:68:\"A Intro pattern with Short heading, paragraph and image on the left.\";s:10:\"categories\";a:2:{i:0;s:6:\"banner\";i:1;s:8:\"featured\";}}s:16:\"banner-intro.php\";a:4:{s:5:\"title\";s:35:\"Intro with left-aligned description\";s:4:\"slug\";s:29:\"twentytwentyfive/banner-intro\";s:11:\"description\";s:66:\"A large left-aligned heading with a brand name emphasized in bold.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}}s:17:\"banner-poster.php\";a:4:{s:5:\"title\";s:19:\"Poster-like section\";s:4:\"slug\";s:30:\"twentytwentyfive/banner-poster\";s:11:\"description\";s:78:\"A section that can be used as a banner or a landing page to announce an event.\";s:10:\"categories\";a:2:{i:0;s:6:\"banner\";i:1;s:5:\"media\";}}s:43:\"banner-with-description-and-images-grid.php\";a:4:{s:5:\"title\";s:39:\"Banner with description and images grid\";s:4:\"slug\";s:47:\"twentytwentyfive/banner-description-images-grid\";s:11:\"description\";s:75:\"A banner with a short paragraph, and two images displayed in a grid layout.\";s:10:\"categories\";a:2:{i:0;s:6:\"banner\";i:1;s:8:\"featured\";}}s:18:\"binding-format.php\";a:4:{s:5:\"title\";s:16:\"Post format name\";s:4:\"slug\";s:31:\"twentytwentyfive/binding-format\";s:11:\"description\";s:75:\"Prints the name of the post format with the help of the Block Bindings API.\";s:10:\"categories\";a:1:{i:0;s:28:\"twentytwentyfive_post-format\";}}s:12:\"comments.php\";a:5:{s:5:\"title\";s:8:\"Comments\";s:4:\"slug\";s:25:\"twentytwentyfive/comments\";s:11:\"description\";s:63:\"Comments area with comments list, pagination, and comment form.\";s:10:\"categories\";a:1:{i:0;s:4:\"text\";}s:10:\"blockTypes\";a:1:{i:0;s:13:\"core/comments\";}}s:32:\"contact-centered-social-link.php\";a:5:{s:5:\"title\";s:30:\"Centered link and social links\";s:4:\"slug\";s:45:\"twentytwentyfive/contact-centered-social-link\";s:11:\"description\";s:73:\"Centered contact section with a prominent message and social media links.\";s:10:\"categories\";a:1:{i:0;s:7:\"contact\";}s:8:\"keywords\";a:3:{i:0;s:7:\"contact\";i:1;s:3:\"faq\";i:2;s:9:\"questions\";}}s:26:\"contact-info-locations.php\";a:6:{s:5:\"title\";s:27:\"Contact, info and locations\";s:4:\"slug\";s:39:\"twentytwentyfive/contact-info-locations\";s:11:\"description\";s:78:\"Contact section with social media links, email, and multiple location details.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:1:{i:0;s:7:\"contact\";}s:8:\"keywords\";a:2:{i:0;s:7:\"contact\";i:1;s:8:\"location\";}}s:29:\"contact-location-and-link.php\";a:4:{s:5:\"title\";s:25:\"Contact location and link\";s:4:\"slug\";s:42:\"twentytwentyfive/contact-location-and-link\";s:11:\"description\";s:89:\"Contact section with a location address, a directions link, and an image of the location.\";s:10:\"categories\";a:2:{i:0;s:7:\"contact\";i:1;s:8:\"featured\";}}s:18:\"cta-book-links.php\";a:4:{s:5:\"title\";s:30:\"Call to action with book links\";s:4:\"slug\";s:31:\"twentytwentyfive/cta-book-links\";s:11:\"description\";s:74:\"A call to action section with links to get the book in different websites.\";s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}}s:22:\"cta-book-locations.php\";a:4:{s:5:\"title\";s:29:\"Call to action with locations\";s:4:\"slug\";s:35:\"twentytwentyfive/cta-book-locations\";s:11:\"description\";s:82:\"A call to action section with links to get the book in the most popular locations.\";s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}}s:24:\"cta-centered-heading.php\";a:4:{s:5:\"title\";s:16:\"Centered heading\";s:4:\"slug\";s:37:\"twentytwentyfive/cta-centered-heading\";s:11:\"description\";s:53:\"A hero with a centered heading, paragraph and button.\";s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}}s:19:\"cta-events-list.php\";a:4:{s:5:\"title\";s:11:\"Events list\";s:4:\"slug\";s:32:\"twentytwentyfive/cta-events-list\";s:11:\"description\";s:37:\"A list of events with call to action.\";s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}}s:26:\"cta-grid-products-link.php\";a:5:{s:5:\"title\";s:54:\"Call to action with grid layout with products and link\";s:4:\"slug\";s:39:\"twentytwentyfive/cta-grid-products-link\";s:11:\"description\";s:42:\"A call to action featuring product images.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:14:\"call-to-action\";i:1;s:8:\"featured\";}}s:22:\"cta-heading-search.php\";a:4:{s:5:\"title\";s:23:\"Heading and search form\";s:4:\"slug\";s:35:\"twentytwentyfive/cta-heading-search\";s:11:\"description\";s:54:\"Large heading with a search form for quick navigation.\";s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}}s:18:\"cta-newsletter.php\";a:5:{s:5:\"title\";s:18:\"Newsletter sign-up\";s:4:\"slug\";s:31:\"twentytwentyfive/cta-newsletter\";s:11:\"description\";s:0:\"\";s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}s:8:\"keywords\";a:2:{i:0;s:14:\"call-to-action\";i:1;s:10:\"newsletter\";}}s:15:\"event-3-col.php\";a:5:{s:5:\"title\";s:46:\"Events, 3 columns with event images and titles\";s:4:\"slug\";s:28:\"twentytwentyfive/event-3-col\";s:11:\"description\";s:95:\"A header with title and text and three columns that show 3 events with their images and titles.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}s:8:\"keywords\";a:3:{i:0;s:6:\"events\";i:1;s:7:\"columns\";i:2;s:6:\"images\";}}s:14:\"event-rsvp.php\";a:7:{s:5:\"title\";s:10:\"Event RSVP\";s:4:\"slug\";s:27:\"twentytwentyfive/event-rsvp\";s:11:\"description\";s:64:\"RSVP for an upcoming event with a cover image and event details.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}s:8:\"keywords\";a:3:{i:0;s:14:\"call-to-action\";i:1;s:4:\"rsvp\";i:2;s:5:\"event\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}}s:18:\"event-schedule.php\";a:5:{s:5:\"title\";s:14:\"Event schedule\";s:4:\"slug\";s:31:\"twentytwentyfive/event-schedule\";s:11:\"description\";s:54:\"A section with specified dates and times for an event.\";s:10:\"categories\";a:1:{i:0;s:5:\"about\";}s:8:\"keywords\";a:4:{i:0;s:6:\"events\";i:1;s:6:\"agenda\";i:2;s:8:\"schedule\";i:3;s:8:\"lectures\";}}s:19:\"footer-centered.php\";a:5:{s:5:\"title\";s:15:\"Centered footer\";s:4:\"slug\";s:32:\"twentytwentyfive/footer-centered\";s:11:\"description\";s:44:\"Footer with centered site title and tagline.\";s:10:\"categories\";a:1:{i:0;s:6:\"footer\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/footer\";}}s:18:\"footer-columns.php\";a:5:{s:5:\"title\";s:19:\"Footer with columns\";s:4:\"slug\";s:31:\"twentytwentyfive/footer-columns\";s:11:\"description\";s:45:\"Footer columns with title, tagline and links.\";s:10:\"categories\";a:1:{i:0;s:6:\"footer\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/footer\";}}s:21:\"footer-newsletter.php\";a:5:{s:5:\"title\";s:29:\"Footer with newsletter signup\";s:4:\"slug\";s:34:\"twentytwentyfive/footer-newsletter\";s:11:\"description\";s:51:\"Footer with large site title and newsletter signup.\";s:10:\"categories\";a:1:{i:0;s:6:\"footer\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/footer\";}}s:17:\"footer-social.php\";a:5:{s:5:\"title\";s:33:\"Centered footer with social links\";s:4:\"slug\";s:30:\"twentytwentyfive/footer-social\";s:11:\"description\";s:49:\"Footer with centered site title and social links.\";s:10:\"categories\";a:1:{i:0;s:6:\"footer\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/footer\";}}s:10:\"footer.php\";a:5:{s:5:\"title\";s:6:\"Footer\";s:4:\"slug\";s:23:\"twentytwentyfive/footer\";s:11:\"description\";s:51:\"Footer columns with logo, title, tagline and links.\";s:10:\"categories\";a:1:{i:0;s:6:\"footer\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/footer\";}}s:16:\"format-audio.php\";a:4:{s:5:\"title\";s:12:\"Audio format\";s:4:\"slug\";s:29:\"twentytwentyfive/format-audio\";s:11:\"description\";s:73:\"An audio post format with an image, title, audio player, and description.\";s:10:\"categories\";a:1:{i:0;s:28:\"twentytwentyfive_post-format\";}}s:15:\"format-link.php\";a:4:{s:5:\"title\";s:11:\"Link format\";s:4:\"slug\";s:28:\"twentytwentyfive/format-link\";s:11:\"description\";s:77:\"A link post format with a description and an emphasized link for key content.\";s:10:\"categories\";a:1:{i:0;s:28:\"twentytwentyfive_post-format\";}}s:15:\"grid-videos.php\";a:4:{s:5:\"title\";s:16:\"Grid with videos\";s:4:\"slug\";s:28:\"twentytwentyfive/grid-videos\";s:11:\"description\";s:19:\"A grid with videos.\";s:10:\"categories\";a:1:{i:0;s:5:\"about\";}}s:24:\"grid-with-categories.php\";a:5:{s:5:\"title\";s:20:\"Grid with categories\";s:4:\"slug\";s:37:\"twentytwentyfive/grid-with-categories\";s:11:\"description\";s:41:\"A grid section with different categories.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}}s:19:\"header-centered.php\";a:5:{s:5:\"title\";s:20:\"Centered site header\";s:4:\"slug\";s:32:\"twentytwentyfive/header-centered\";s:11:\"description\";s:52:\"Site header with centered site title and navigation.\";s:10:\"categories\";a:1:{i:0;s:6:\"header\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/header\";}}s:18:\"header-columns.php\";a:5:{s:5:\"title\";s:19:\"Header with columns\";s:4:\"slug\";s:31:\"twentytwentyfive/header-columns\";s:11:\"description\";s:54:\"Site header with site title and navigation in columns.\";s:10:\"categories\";a:1:{i:0;s:6:\"header\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/header\";}}s:22:\"header-large-title.php\";a:5:{s:5:\"title\";s:23:\"Header with large title\";s:4:\"slug\";s:35:\"twentytwentyfive/header-large-title\";s:11:\"description\";s:63:\"Site header with large site title and right-aligned navigation.\";s:10:\"categories\";a:1:{i:0;s:6:\"header\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/header\";}}s:10:\"header.php\";a:5:{s:5:\"title\";s:6:\"Header\";s:4:\"slug\";s:23:\"twentytwentyfive/header\";s:11:\"description\";s:43:\"Site header with site title and navigation.\";s:10:\"categories\";a:1:{i:0;s:6:\"header\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/header\";}}s:36:\"heading-and-paragraph-with-image.php\";a:4:{s:5:\"title\";s:45:\"Heading and paragraph with image on the right\";s:4:\"slug\";s:49:\"twentytwentyfive/heading-and-paragraph-with-image\";s:11:\"description\";s:89:\"A two-column section with a heading and paragraph on the left, and an image on the right.\";s:10:\"categories\";a:1:{i:0;s:5:\"about\";}}s:13:\"hero-book.php\";a:5:{s:5:\"title\";s:9:\"Hero book\";s:4:\"slug\";s:26:\"twentytwentyfive/hero-book\";s:11:\"description\";s:66:\"A hero section for the book with a description and pre-order link.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}s:8:\"keywords\";a:3:{i:0;s:7:\"podcast\";i:1;s:4:\"hero\";i:2;s:7:\"stories\";}}s:25:\"hero-full-width-image.php\";a:4:{s:5:\"title\";s:22:\"Hero, full width image\";s:4:\"slug\";s:38:\"twentytwentyfive/hero-full-width-image\";s:11:\"description\";s:68:\"A hero with a full width image, heading, short paragraph and button.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}}s:41:\"hero-overlapped-book-cover-with-links.php\";a:4:{s:5:\"title\";s:38:\"Hero, overlapped book cover with links\";s:4:\"slug\";s:54:\"twentytwentyfive/hero-overlapped-book-cover-with-links\";s:11:\"description\";s:47:\"A hero with an overlapped book cover and links.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}}s:16:\"hero-podcast.php\";a:5:{s:5:\"title\";s:12:\"Hero podcast\";s:4:\"slug\";s:29:\"twentytwentyfive/hero-podcast\";s:11:\"description\";s:0:\"\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}s:8:\"keywords\";a:3:{i:0;s:7:\"podcast\";i:1;s:4:\"hero\";i:2;s:7:\"stories\";}}s:14:\"hidden-404.php\";a:4:{s:5:\"title\";s:3:\"404\";s:4:\"slug\";s:27:\"twentytwentyfive/hidden-404\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:23:\"hidden-blog-heading.php\";a:4:{s:5:\"title\";s:19:\"Hidden blog heading\";s:4:\"slug\";s:36:\"twentytwentyfive/hidden-blog-heading\";s:11:\"description\";s:52:\"Hidden heading for the home page and index template.\";s:8:\"inserter\";b:0;}s:17:\"hidden-search.php\";a:4:{s:5:\"title\";s:6:\"Search\";s:4:\"slug\";s:30:\"twentytwentyfive/hidden-search\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:18:\"hidden-sidebar.php\";a:4:{s:5:\"title\";s:7:\"Sidebar\";s:4:\"slug\";s:31:\"twentytwentyfive/hidden-sidebar\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:21:\"hidden-written-by.php\";a:4:{s:5:\"title\";s:10:\"Written by\";s:4:\"slug\";s:34:\"twentytwentyfive/hidden-written-by\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:9:\"logos.php\";a:4:{s:5:\"title\";s:5:\"Logos\";s:4:\"slug\";s:22:\"twentytwentyfive/logos\";s:11:\"description\";s:77:\"Showcasing the podcast\'s clients with a heading and a series of client logos.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}}s:24:\"media-instagram-grid.php\";a:5:{s:5:\"title\";s:14:\"Instagram grid\";s:4:\"slug\";s:37:\"twentytwentyfive/media-instagram-grid\";s:11:\"description\";s:62:\"A grid section with photos and a link to an Instagram profile.\";s:13:\"viewportWidth\";i:1440;s:10:\"categories\";a:3:{i:0;s:5:\"media\";i:1;s:7:\"gallery\";i:2;s:8:\"featured\";}}s:14:\"more-posts.php\";a:5:{s:5:\"title\";s:10:\"More posts\";s:4:\"slug\";s:27:\"twentytwentyfive/more-posts\";s:11:\"description\";s:45:\"Displays a list of posts with title and date.\";s:10:\"categories\";a:1:{i:0;s:5:\"query\";}s:10:\"blockTypes\";a:1:{i:0;s:10:\"core/query\";}}s:21:\"overlapped-images.php\";a:4:{s:5:\"title\";s:41:\"Overlapping images and paragraph on right\";s:4:\"slug\";s:34:\"twentytwentyfive/overlapped-images\";s:11:\"description\";s:53:\"A section with overlapping images, and a description.\";s:10:\"categories\";a:2:{i:0;s:5:\"about\";i:1;s:8:\"featured\";}}s:22:\"page-business-home.php\";a:8:{s:5:\"title\";s:17:\"Business homepage\";s:4:\"slug\";s:35:\"twentytwentyfive/page-business-home\";s:11:\"description\";s:28:\"A business homepage pattern.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:20:\"page-coming-soon.php\";a:8:{s:5:\"title\";s:11:\"Coming soon\";s:4:\"slug\";s:33:\"twentytwentyfive/page-coming-soon\";s:11:\"description\";s:96:\"A full-width cover banner that can be applied to a page or it can work as a single landing page.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:15:\"page-cv-bio.php\";a:7:{s:5:\"title\";s:6:\"CV/bio\";s:4:\"slug\";s:28:\"twentytwentyfive/page-cv-bio\";s:11:\"description\";s:36:\"A pattern for a CV/Bio landing page.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:3:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:5:\"about\";i:2;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}}s:21:\"page-landing-book.php\";a:8:{s:5:\"title\";s:21:\"Landing page for book\";s:4:\"slug\";s:34:\"twentytwentyfive/page-landing-book\";s:11:\"description\";s:104:\"A landing page for the book with a hero section, pre-order links, locations, FAQs and newsletter signup.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:22:\"page-landing-event.php\";a:8:{s:5:\"title\";s:22:\"Landing page for event\";s:4:\"slug\";s:35:\"twentytwentyfive/page-landing-event\";s:11:\"description\";s:87:\"A landing page for the event with a hero section, description, FAQs and call to action.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:24:\"page-landing-podcast.php\";a:8:{s:5:\"title\";s:24:\"Landing page for podcast\";s:4:\"slug\";s:37:\"twentytwentyfive/page-landing-podcast\";s:11:\"description\";s:111:\"A landing page for the podcast with a hero section, description, logos, grid with videos and newsletter signup.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:50:\"page-link-in-bio-heading-paragraph-links-image.php\";a:7:{s:5:\"title\";s:59:\"Link in bio heading, paragraph, links and full-height image\";s:4:\"slug\";s:63:\"twentytwentyfive/page-link-in-bio-heading-paragraph-links-image\";s:11:\"description\";s:84:\"A link in bio landing page with a heading, paragraph, links and a full height image.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:3:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:6:\"banner\";i:2;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}}s:33:\"page-link-in-bio-wide-margins.php\";a:7:{s:5:\"title\";s:48:\"Link in bio with profile, links and wide margins\";s:4:\"slug\";s:46:\"twentytwentyfive/page-link-in-bio-wide-margins\";s:11:\"description\";s:86:\"A link in bio landing page with social links, a profile photo and a brief description.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:3:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:6:\"banner\";i:2;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}}s:39:\"page-link-in-bio-with-tight-margins.php\";a:8:{s:5:\"title\";s:30:\"Link in bio with tight margins\";s:4:\"slug\";s:52:\"twentytwentyfive/page-link-in-bio-with-tight-margins\";s:11:\"description\";s:90:\"A full-width, full-height link in bio section with an image, a paragraph and social links.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:6:\"banner\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:23:\"page-portfolio-home.php\";a:8:{s:5:\"title\";s:18:\"Portfolio homepage\";s:4:\"slug\";s:36:\"twentytwentyfive/page-portfolio-home\";s:11:\"description\";s:29:\"A portfolio homepage pattern.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:5:\"posts\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:18:\"page-shop-home.php\";a:8:{s:5:\"title\";s:13:\"Shop homepage\";s:4:\"slug\";s:31:\"twentytwentyfive/page-shop-home\";s:11:\"description\";s:24:\"A shop homepage pattern.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:1:{i:0;s:21:\"twentytwentyfive_page\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:19:\"post-navigation.php\";a:5:{s:5:\"title\";s:15:\"Post navigation\";s:4:\"slug\";s:32:\"twentytwentyfive/post-navigation\";s:11:\"description\";s:29:\"Next and previous post links.\";s:10:\"categories\";a:1:{i:0;s:4:\"text\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/post-navigation-link\";}}s:17:\"pricing-2-col.php\";a:5:{s:5:\"title\";s:18:\"Pricing, 2 columns\";s:4:\"slug\";s:30:\"twentytwentyfive/pricing-2-col\";s:11:\"description\";s:88:\"Pricing section with two columns, pricing plan, description, and call-to-action buttons.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}}s:17:\"pricing-3-col.php\";a:4:{s:5:\"title\";s:18:\"Pricing, 3 columns\";s:4:\"slug\";s:30:\"twentytwentyfive/pricing-3-col\";s:11:\"description\";s:100:\"A three-column boxed pricing table designed to showcase services, descriptions, and pricing options.\";s:10:\"categories\";a:3:{i:0;s:14:\"call-to-action\";i:1;s:6:\"banner\";i:2;s:8:\"services\";}}s:18:\"services-3-col.php\";a:4:{s:5:\"title\";s:19:\"Services, 3 columns\";s:4:\"slug\";s:31:\"twentytwentyfive/services-3-col\";s:11:\"description\";s:56:\"Three columns with images and text to showcase services.\";s:10:\"categories\";a:3:{i:0;s:14:\"call-to-action\";i:1;s:6:\"banner\";i:2;s:8:\"services\";}}s:36:\"services-subscriber-only-section.php\";a:4:{s:5:\"title\";s:33:\"Services, subscriber only section\";s:4:\"slug\";s:49:\"twentytwentyfive/services-subscriber-only-section\";s:11:\"description\";s:72:\"A subscriber-only section highlighting exclusive services and offerings.\";s:10:\"categories\";a:2:{i:0;s:14:\"call-to-action\";i:1;s:8:\"services\";}}s:24:\"services-team-photos.php\";a:4:{s:5:\"title\";s:21:\"Services, team photos\";s:4:\"slug\";s:37:\"twentytwentyfive/services-team-photos\";s:11:\"description\";s:59:\"Display team photos in a services section with grid layout.\";s:10:\"categories\";a:3:{i:0;s:6:\"banner\";i:1;s:14:\"call-to-action\";i:2;s:8:\"featured\";}}s:37:\"template-404-vertical-header-blog.php\";a:5:{s:5:\"title\";s:17:\"Right-aligned 404\";s:4:\"slug\";s:50:\"twentytwentyfive/template-404-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:13:\"templateTypes\";a:1:{i:0;s:3:\"404\";}}s:30:\"template-archive-news-blog.php\";a:6:{s:5:\"title\";s:17:\"News blog archive\";s:4:\"slug\";s:43:\"twentytwentyfive/template-archive-news-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:7:\"archive\";}}s:31:\"template-archive-photo-blog.php\";a:6:{s:5:\"title\";s:18:\"Photo blog archive\";s:4:\"slug\";s:44:\"twentytwentyfive/template-archive-photo-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:7:\"archive\";}}s:30:\"template-archive-text-blog.php\";a:6:{s:5:\"title\";s:17:\"Text blog archive\";s:4:\"slug\";s:43:\"twentytwentyfive/template-archive-text-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:7:\"archive\";}}s:41:\"template-archive-vertical-header-blog.php\";a:6:{s:5:\"title\";s:21:\"Right-aligned archive\";s:4:\"slug\";s:54:\"twentytwentyfive/template-archive-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:7:\"archive\";}}s:27:\"template-home-news-blog.php\";a:6:{s:5:\"title\";s:14:\"News blog home\";s:4:\"slug\";s:40:\"twentytwentyfive/template-home-news-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:3:{i:0;s:10:\"front-page\";i:1;s:5:\"index\";i:2;s:4:\"home\";}}s:28:\"template-home-photo-blog.php\";a:6:{s:5:\"title\";s:15:\"Photo blog home\";s:4:\"slug\";s:41:\"twentytwentyfive/template-home-photo-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:3:{i:0;s:10:\"front-page\";i:1;s:5:\"index\";i:2;s:4:\"home\";}}s:38:\"template-home-posts-grid-news-blog.php\";a:5:{s:5:\"title\";s:34:\"News blog with featured posts grid\";s:4:\"slug\";s:51:\"twentytwentyfive/template-home-posts-grid-news-blog\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:3:{i:0;s:10:\"front-page\";i:1;s:5:\"index\";i:2;s:4:\"home\";}}s:27:\"template-home-text-blog.php\";a:6:{s:5:\"title\";s:14:\"Text blog home\";s:4:\"slug\";s:40:\"twentytwentyfive/template-home-text-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:10:\"front-page\";i:1;s:4:\"home\";}}s:38:\"template-home-vertical-header-blog.php\";a:6:{s:5:\"title\";s:18:\"Right-aligned home\";s:4:\"slug\";s:51:\"twentytwentyfive/template-home-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:3:{i:0;s:10:\"front-page\";i:1;s:5:\"index\";i:2;s:4:\"home\";}}s:40:\"template-home-with-sidebar-news-blog.php\";a:6:{s:5:\"title\";s:22:\"News blog with sidebar\";s:4:\"slug\";s:53:\"twentytwentyfive/template-home-with-sidebar-news-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:3:{i:0;s:10:\"front-page\";i:1;s:5:\"index\";i:2;s:4:\"home\";}}s:28:\"template-page-photo-blog.php\";a:5:{s:5:\"title\";s:15:\"Photo blog page\";s:4:\"slug\";s:41:\"twentytwentyfive/template-page-photo-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:13:\"templateTypes\";a:1:{i:0;s:4:\"page\";}}s:38:\"template-page-vertical-header-blog.php\";a:5:{s:5:\"title\";s:18:\"Right-aligned page\";s:4:\"slug\";s:51:\"twentytwentyfive/template-page-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:13:\"templateTypes\";a:1:{i:0;s:4:\"page\";}}s:33:\"template-query-loop-news-blog.php\";a:4:{s:5:\"title\";s:20:\"News blog query loop\";s:4:\"slug\";s:46:\"twentytwentyfive/template-query-loop-news-blog\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:34:\"template-query-loop-photo-blog.php\";a:6:{s:5:\"title\";s:16:\"Photo blog posts\";s:4:\"slug\";s:47:\"twentytwentyfive/template-query-loop-photo-blog\";s:11:\"description\";s:54:\"A list of posts, 3 columns, with only featured images.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:1:{i:0;s:5:\"query\";}s:10:\"blockTypes\";a:1:{i:0;s:10:\"core/query\";}}s:33:\"template-query-loop-text-blog.php\";a:4:{s:5:\"title\";s:20:\"Text blog query loop\";s:4:\"slug\";s:46:\"twentytwentyfive/template-query-loop-text-blog\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:44:\"template-query-loop-vertical-header-blog.php\";a:4:{s:5:\"title\";s:24:\"Right-aligned query loop\";s:4:\"slug\";s:57:\"twentytwentyfive/template-query-loop-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:23:\"template-query-loop.php\";a:5:{s:5:\"title\";s:23:\"List of posts, 1 column\";s:4:\"slug\";s:36:\"twentytwentyfive/template-query-loop\";s:11:\"description\";s:61:\"A list of posts, 1 column, with featured image and post date.\";s:10:\"categories\";a:1:{i:0;s:5:\"query\";}s:10:\"blockTypes\";a:1:{i:0;s:10:\"core/query\";}}s:29:\"template-search-news-blog.php\";a:6:{s:5:\"title\";s:24:\"News blog search results\";s:4:\"slug\";s:42:\"twentytwentyfive/template-search-news-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:6:\"search\";}}s:30:\"template-search-photo-blog.php\";a:6:{s:5:\"title\";s:25:\"Photo blog search results\";s:4:\"slug\";s:43:\"twentytwentyfive/template-search-photo-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:6:\"search\";}}s:29:\"template-search-text-blog.php\";a:6:{s:5:\"title\";s:24:\"Text blog search results\";s:4:\"slug\";s:42:\"twentytwentyfive/template-search-text-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:6:\"search\";}}s:40:\"template-search-vertical-header-blog.php\";a:6:{s:5:\"title\";s:26:\"Right-aligned blog, search\";s:4:\"slug\";s:53:\"twentytwentyfive/template-search-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:6:\"search\";}}s:40:\"template-single-left-aligned-content.php\";a:6:{s:5:\"title\";s:30:\"Post with left-aligned content\";s:4:\"slug\";s:47:\"twentytwentyfive/post-with-left-aligned-content\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:5:\"posts\";i:1;s:6:\"single\";}}s:29:\"template-single-news-blog.php\";a:6:{s:5:\"title\";s:34:\"News blog single post with sidebar\";s:4:\"slug\";s:42:\"twentytwentyfive/template-single-news-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:5:\"posts\";i:1;s:6:\"single\";}}s:26:\"template-single-offset.php\";a:6:{s:5:\"title\";s:34:\"Offset post without featured image\";s:4:\"slug\";s:39:\"twentytwentyfive/template-single-offset\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:5:\"posts\";i:1;s:6:\"single\";}}s:30:\"template-single-photo-blog.php\";a:6:{s:5:\"title\";s:22:\"Photo blog single post\";s:4:\"slug\";s:43:\"twentytwentyfive/template-single-photo-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:5:\"posts\";i:1;s:6:\"single\";}}s:29:\"template-single-text-blog.php\";a:6:{s:5:\"title\";s:21:\"Text blog single post\";s:4:\"slug\";s:42:\"twentytwentyfive/template-single-text-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:5:\"posts\";i:1;s:6:\"single\";}}s:40:\"template-single-vertical-header-blog.php\";a:6:{s:5:\"title\";s:25:\"Right-aligned single post\";s:4:\"slug\";s:53:\"twentytwentyfive/template-single-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:5:\"posts\";i:1;s:6:\"single\";}}s:22:\"testimonials-2-col.php\";a:5:{s:5:\"title\";s:21:\"2 columns with avatar\";s:4:\"slug\";s:35:\"twentytwentyfive/testimonials-2-col\";s:11:\"description\";s:42:\"Two columns with testimonials and avatars.\";s:10:\"categories\";a:1:{i:0;s:12:\"testimonials\";}s:8:\"keywords\";a:1:{i:0;s:11:\"testimonial\";}}s:22:\"testimonials-6-col.php\";a:5:{s:5:\"title\";s:35:\"3 column layout with 6 testimonials\";s:4:\"slug\";s:35:\"twentytwentyfive/testimonials-6-col\";s:11:\"description\";s:86:\"A section with three columns and two rows, each containing a testimonial and citation.\";s:10:\"categories\";a:1:{i:0;s:12:\"testimonials\";}s:8:\"keywords\";a:1:{i:0;s:11:\"testimonial\";}}s:22:\"testimonials-large.php\";a:5:{s:5:\"title\";s:32:\"Review with large image on right\";s:4:\"slug\";s:35:\"twentytwentyfive/testimonials-large\";s:11:\"description\";s:46:\"A testimonial with a large image on the right.\";s:10:\"categories\";a:1:{i:0;s:12:\"testimonials\";}s:8:\"keywords\";a:1:{i:0;s:11:\"testimonial\";}}s:13:\"text-faqs.php\";a:6:{s:5:\"title\";s:4:\"FAQs\";s:4:\"slug\";s:26:\"twentytwentyfive/text-faqs\";s:11:\"description\";s:68:\"A FAQs section with a FAQ heading and list of questions and answers.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:4:\"text\";i:1;s:5:\"about\";}s:8:\"keywords\";a:5:{i:0;s:3:\"faq\";i:1;s:5:\"about\";i:2;s:10:\"frequently\";i:3;s:5:\"asked\";i:4;s:9:\"questions\";}}s:19:\"vertical-header.php\";a:6:{s:5:\"title\";s:20:\"Vertical site header\";s:4:\"slug\";s:32:\"twentytwentyfive/vertical-header\";s:11:\"description\";s:52:\"Vertical site header with site title and navigation.\";s:13:\"viewportWidth\";i:300;s:10:\"categories\";a:1:{i:0;s:6:\"header\";}s:10:\"blockTypes\";a:1:{i:0;s:34:\"core/template-part/vertical-header\";}}}}', 'off');

-- --------------------------------------------------------

--
-- Структура таблицы `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(9, 7, '_edit_lock', '1774381610:1'),
(10, 10, '_edit_lock', '1775582963:1'),
(11, 12, '_edit_lock', '1774985852:1'),
(15, 12, '_edit_last', '1'),
(16, 12, '_members_access_role', 'manager'),
(17, 12, '_members_access_role', 'administrator'),
(18, 12, '_members_access_role', 'department_employee_a'),
(19, 12, '_members_access_role', 'department_employee_b'),
(21, 10, '_edit_last', '1'),
(22, 10, '_members_access_role', 'admin_asset'),
(23, 10, '_members_access_role', 'manager'),
(24, 10, '_members_access_role', 'administrator'),
(25, 10, '_members_access_role', 'department_employee_a'),
(26, 10, '_members_access_role', 'department_employee_b'),
(28, 10, '_wp_page_template', 'page-dashboard.php'),
(29, 12, '_wp_page_template', 'page-request.php'),
(31, 7, '_edit_last', '1'),
(33, 20, 'origin', 'theme'),
(34, 21, 'origin', 'theme'),
(35, 7, '_wp_page_template', 'page-login.php'),
(36, 26, 'origin', 'theme');

-- --------------------------------------------------------

--
-- Структура таблицы `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint UNSIGNED NOT NULL,
  `post_author` bigint UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int NOT NULL DEFAULT '0',
  `post_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2026-03-24 20:03:40', '2026-03-24 17:03:40', '<!-- wp:paragraph -->\n<p>Добро пожаловать в WordPress. Это ваша первая запись. Отредактируйте или удалите ее, затем начинайте создавать!</p>\n<!-- /wp:paragraph -->', 'Привет, мир!', '', 'publish', 'open', 'open', '', '%d0%bf%d1%80%d0%b8%d0%b2%d0%b5%d1%82-%d0%bc%d0%b8%d1%80', '', '', '2026-03-24 20:03:40', '2026-03-24 17:03:40', '', 0, 'https://eams.local/?p=1', 0, 'post', '', 1),
(7, 1, '2026-03-24 20:18:48', '2026-03-24 17:18:48', '<!-- wp:shortcode -->\n[login_form]\n<!-- /wp:shortcode -->', 'EAMS - Вход', '', 'publish', 'closed', 'closed', '', 'eams-%d0%b2%d1%85%d0%be%d0%b4', '', '', '2026-03-24 22:36:29', '2026-03-24 19:36:29', '', 0, 'https://eams.local/?page_id=7', 0, 'page', '', 0),
(8, 1, '2026-03-24 20:18:13', '2026-03-24 17:18:13', '{\"version\": 3, \"isGlobalStylesUserThemeJSON\": true }', 'Custom Styles', '', 'publish', 'closed', 'closed', '', 'wp-global-styles-twentytwentyfive', '', '', '2026-03-24 20:18:13', '2026-03-24 17:18:13', '', 0, 'https://eams.local/?p=8', 0, 'wp_global_styles', '', 0),
(9, 1, '2026-03-24 20:18:48', '2026-03-24 17:18:48', '', 'EAMS - Вход', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2026-03-24 20:18:48', '2026-03-24 17:18:48', '', 7, 'https://eams.local/?p=9', 0, 'revision', '', 0),
(10, 1, '2026-03-24 20:20:55', '2026-03-24 17:20:55', '', 'Главное меню', '', 'publish', 'closed', 'closed', '', '%d0%b3%d0%bb%d0%b0%d0%b2%d0%bd%d0%be%d0%b5-%d0%bc%d0%b5%d0%bd%d1%8e', '', '', '2026-04-07 20:07:18', '2026-04-07 17:07:18', '', 7, 'https://eams.local/?page_id=10', 0, 'page', '', 0),
(11, 1, '2026-03-24 20:20:55', '2026-03-24 17:20:55', '', 'Главное меню', '', 'inherit', 'closed', 'closed', '', '10-revision-v1', '', '', '2026-03-24 20:20:55', '2026-03-24 17:20:55', '', 10, 'https://eams.local/?p=11', 0, 'revision', '', 0),
(12, 1, '2026-03-24 20:21:18', '2026-03-24 17:21:18', '', 'Заявка', '', 'publish', 'closed', 'closed', '', '%d0%b7%d0%b0%d1%8f%d0%b2%d0%ba%d0%b0', '', '', '2026-03-31 22:37:32', '2026-03-31 19:37:32', '', 10, 'https://eams.local/?page_id=12', 0, 'page', '', 0),
(13, 1, '2026-03-24 20:21:18', '2026-03-24 17:21:18', '', 'Заявка', '', 'inherit', 'closed', 'closed', '', '12-revision-v1', '', '', '2026-03-24 20:21:18', '2026-03-24 17:21:18', '', 12, 'https://eams.local/?p=13', 0, 'revision', '', 0),
(16, 1, '2026-03-24 22:10:52', '2026-03-24 19:10:52', '<!-- wp:page-list /-->', 'Навигация', '', 'publish', 'closed', 'closed', '', 'navigation', '', '', '2026-03-24 22:10:52', '2026-03-24 19:10:52', '', 0, 'https://eams.local/?p=16', 0, 'wp_navigation', '', 0),
(18, 1, '2026-03-24 22:21:39', '2026-03-24 19:21:39', '<!-- wp:shortcode -->\n[login_form]\n<!-- /wp:shortcode -->', 'EAMS - Вход', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2026-03-24 22:21:39', '2026-03-24 19:21:39', '', 7, 'https://eams.local/?p=18', 0, 'revision', '', 0),
(20, 1, '2026-03-24 22:27:17', '2026-03-24 19:27:17', '<!-- wp:template-part {\"slug\":\"header\",\"theme\":\"twentytwentyfive\",\"metadata\":{\"blockVisibility\":false}} /-->\n\n<!-- wp:group {\"tagName\":\"main\",\"style\":{\"spacing\":{\"margin\":{\"top\":\"var:preset|spacing|60\"}}},\"layout\":{\"type\":\"constrained\"}} -->\n<main class=\"wp-block-group\" style=\"margin-top:var(--wp--preset--spacing--60)\"><!-- wp:heading {\"textAlign\":\"center\",\"level\":1} -->\n<h1 class=\"wp-block-heading has-text-align-center\">Блог</h1>\n<!-- /wp:heading -->\n\n<!-- wp:query {\"queryId\":0,\"query\":{\"perPage\":10,\"pages\":0,\"offset\":0,\"postType\":\"post\",\"order\":\"desc\",\"orderBy\":\"date\",\"author\":\"\",\"search\":\"\",\"exclude\":[],\"sticky\":\"\",\"inherit\":true,\"taxQuery\":null,\"parents\":[]},\"align\":\"full\",\"layout\":{\"type\":\"default\"}} -->\n<div class=\"wp-block-query alignfull\"><!-- wp:post-template {\"align\":\"full\",\"layout\":{\"type\":\"default\"}} -->\n<!-- wp:group {\"metadata\":{\"blockVisibility\":false},\"align\":\"full\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|60\",\"bottom\":\"var:preset|spacing|60\"}}},\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group alignfull\" style=\"padding-top:var(--wp--preset--spacing--60);padding-bottom:var(--wp--preset--spacing--60)\"><!-- wp:post-featured-image {\"isLink\":true,\"aspectRatio\":\"3/2\"} /-->\n\n<!-- wp:post-title {\"isLink\":true,\"fontSize\":\"x-large\"} /-->\n\n<!-- wp:post-content {\"align\":\"full\",\"fontSize\":\"medium\",\"layout\":{\"type\":\"constrained\"}} /-->\n\n<!-- wp:post-date {\"isLink\":true,\"metadata\":{\"bindings\":{\"datetime\":{\"source\":\"core/post-data\",\"args\":{\"field\":\"date\"}}}},\"style\":{\"spacing\":{\"margin\":{\"top\":\"var:preset|spacing|40\"}}},\"fontSize\":\"small\"} /--></div>\n<!-- /wp:group -->\n<!-- /wp:post-template -->\n\n<!-- wp:group {\"metadata\":{\"blockVisibility\":false},\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|60\",\"bottom\":\"var:preset|spacing|60\"}}},\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\" style=\"padding-top:var(--wp--preset--spacing--60);padding-bottom:var(--wp--preset--spacing--60)\"><!-- wp:query-no-results -->\n<!-- wp:paragraph -->\n<p>Извините, но ничего не найдено. Пожалуйста, попробуйте выполнить поиск с другими ключевыми словами.</p>\n<!-- /wp:paragraph -->\n<!-- /wp:query-no-results --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"align\":\"wide\",\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group alignwide\"><!-- wp:query-pagination {\"paginationArrow\":\"arrow\",\"metadata\":{\"blockVisibility\":false},\"align\":\"wide\",\"layout\":{\"type\":\"flex\",\"justifyContent\":\"space-between\"}} -->\n<!-- wp:query-pagination-previous /-->\n\n<!-- wp:query-pagination-numbers {\"metadata\":{\"blockVisibility\":false}} /-->\n\n<!-- wp:query-pagination-next /-->\n<!-- /wp:query-pagination --></div>\n<!-- /wp:group --></div>\n<!-- /wp:query --></main>\n<!-- /wp:group -->\n\n<!-- wp:template-part {\"slug\":\"footer\",\"theme\":\"twentytwentyfive\",\"metadata\":{\"blockVisibility\":false}} /-->', 'Главная страница блога', 'Отображает последние записи либо как главную страницу сайта, либо как \"страницу записей\", определенную в настройках чтения. Если существует, шаблон главной страницы переопределяет этот шаблон при отображении записей на главной странице.', 'publish', 'closed', 'closed', '', 'home', '', '', '2026-03-24 22:28:33', '2026-03-24 19:28:33', '', 0, 'https://eams.local/?p=20', 0, 'wp_template', '', 0),
(21, 1, '2026-03-24 22:28:10', '2026-03-24 19:28:10', '<!-- wp:template-part {\"slug\":\"header\",\"theme\":\"twentytwentyfive\",\"metadata\":{\"blockVisibility\":false}} /-->\n\n<!-- wp:group {\"tagName\":\"main\",\"style\":{\"spacing\":{\"margin\":{\"top\":\"var:preset|spacing|60\"}}},\"layout\":{\"type\":\"constrained\"}} -->\n<main class=\"wp-block-group\" style=\"margin-top:var(--wp--preset--spacing--60)\"><!-- wp:group {\"align\":\"full\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|60\",\"bottom\":\"var:preset|spacing|60\"}}},\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group alignfull\" style=\"padding-top:var(--wp--preset--spacing--60);padding-bottom:var(--wp--preset--spacing--60)\"><!-- wp:post-featured-image {\"metadata\":{\"blockVisibility\":false},\"style\":{\"spacing\":{\"margin\":{\"bottom\":\"var:preset|spacing|60\"}}}} /-->\n\n<!-- wp:post-title {\"textAlign\":\"center\",\"level\":1} /-->\n\n<!-- wp:post-content {\"metadata\":{\"blockVisibility\":false},\"align\":\"full\",\"layout\":{\"type\":\"constrained\"}} /--></div>\n<!-- /wp:group --></main>\n<!-- /wp:group -->\n\n<!-- wp:template-part {\"slug\":\"footer\",\"theme\":\"twentytwentyfive\",\"metadata\":{\"blockVisibility\":false}} /-->', 'Страницы', 'Отображение всех статических страниц, если не был применен пользовательский шаблон или не существует специального шаблона.', 'publish', 'closed', 'closed', '', 'page', '', '', '2026-03-24 22:29:16', '2026-03-24 19:29:16', '', 0, 'https://eams.local/?p=21', 0, 'wp_template', '', 0),
(22, 1, '2026-03-24 22:28:33', '2026-03-24 19:28:33', '<!-- wp:template-part {\"slug\":\"header\",\"theme\":\"twentytwentyfive\",\"metadata\":{\"blockVisibility\":false}} /-->\n\n<!-- wp:group {\"tagName\":\"main\",\"style\":{\"spacing\":{\"margin\":{\"top\":\"var:preset|spacing|60\"}}},\"layout\":{\"type\":\"constrained\"}} -->\n<main class=\"wp-block-group\" style=\"margin-top:var(--wp--preset--spacing--60)\"><!-- wp:heading {\"textAlign\":\"center\",\"level\":1} -->\n<h1 class=\"wp-block-heading has-text-align-center\">Блог</h1>\n<!-- /wp:heading -->\n\n<!-- wp:query {\"queryId\":0,\"query\":{\"perPage\":10,\"pages\":0,\"offset\":0,\"postType\":\"post\",\"order\":\"desc\",\"orderBy\":\"date\",\"author\":\"\",\"search\":\"\",\"exclude\":[],\"sticky\":\"\",\"inherit\":true,\"taxQuery\":null,\"parents\":[]},\"align\":\"full\",\"layout\":{\"type\":\"default\"}} -->\n<div class=\"wp-block-query alignfull\"><!-- wp:post-template {\"align\":\"full\",\"layout\":{\"type\":\"default\"}} -->\n<!-- wp:group {\"metadata\":{\"blockVisibility\":false},\"align\":\"full\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|60\",\"bottom\":\"var:preset|spacing|60\"}}},\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group alignfull\" style=\"padding-top:var(--wp--preset--spacing--60);padding-bottom:var(--wp--preset--spacing--60)\"><!-- wp:post-featured-image {\"isLink\":true,\"aspectRatio\":\"3/2\"} /-->\n\n<!-- wp:post-title {\"isLink\":true,\"fontSize\":\"x-large\"} /-->\n\n<!-- wp:post-content {\"align\":\"full\",\"fontSize\":\"medium\",\"layout\":{\"type\":\"constrained\"}} /-->\n\n<!-- wp:post-date {\"isLink\":true,\"metadata\":{\"bindings\":{\"datetime\":{\"source\":\"core/post-data\",\"args\":{\"field\":\"date\"}}}},\"style\":{\"spacing\":{\"margin\":{\"top\":\"var:preset|spacing|40\"}}},\"fontSize\":\"small\"} /--></div>\n<!-- /wp:group -->\n<!-- /wp:post-template -->\n\n<!-- wp:group {\"metadata\":{\"blockVisibility\":false},\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|60\",\"bottom\":\"var:preset|spacing|60\"}}},\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\" style=\"padding-top:var(--wp--preset--spacing--60);padding-bottom:var(--wp--preset--spacing--60)\"><!-- wp:query-no-results -->\n<!-- wp:paragraph -->\n<p>Извините, но ничего не найдено. Пожалуйста, попробуйте выполнить поиск с другими ключевыми словами.</p>\n<!-- /wp:paragraph -->\n<!-- /wp:query-no-results --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"align\":\"wide\",\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group alignwide\"><!-- wp:query-pagination {\"paginationArrow\":\"arrow\",\"metadata\":{\"blockVisibility\":false},\"align\":\"wide\",\"layout\":{\"type\":\"flex\",\"justifyContent\":\"space-between\"}} -->\n<!-- wp:query-pagination-previous /-->\n\n<!-- wp:query-pagination-numbers {\"metadata\":{\"blockVisibility\":false}} /-->\n\n<!-- wp:query-pagination-next /-->\n<!-- /wp:query-pagination --></div>\n<!-- /wp:group --></div>\n<!-- /wp:query --></main>\n<!-- /wp:group -->\n\n<!-- wp:template-part {\"slug\":\"footer\",\"theme\":\"twentytwentyfive\",\"metadata\":{\"blockVisibility\":false}} /-->', 'Главная страница блога', 'Отображает последние записи либо как главную страницу сайта, либо как \"страницу записей\", определенную в настройках чтения. Если существует, шаблон главной страницы переопределяет этот шаблон при отображении записей на главной странице.', 'inherit', 'closed', 'closed', '', '20-revision-v1', '', '', '2026-03-24 22:28:33', '2026-03-24 19:28:33', '', 20, 'https://eams.local/?p=22', 0, 'revision', '', 0),
(23, 1, '2026-03-24 22:29:16', '2026-03-24 19:29:16', '<!-- wp:template-part {\"slug\":\"header\",\"theme\":\"twentytwentyfive\",\"metadata\":{\"blockVisibility\":false}} /-->\n\n<!-- wp:group {\"tagName\":\"main\",\"style\":{\"spacing\":{\"margin\":{\"top\":\"var:preset|spacing|60\"}}},\"layout\":{\"type\":\"constrained\"}} -->\n<main class=\"wp-block-group\" style=\"margin-top:var(--wp--preset--spacing--60)\"><!-- wp:group {\"align\":\"full\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|60\",\"bottom\":\"var:preset|spacing|60\"}}},\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group alignfull\" style=\"padding-top:var(--wp--preset--spacing--60);padding-bottom:var(--wp--preset--spacing--60)\"><!-- wp:post-featured-image {\"metadata\":{\"blockVisibility\":false},\"style\":{\"spacing\":{\"margin\":{\"bottom\":\"var:preset|spacing|60\"}}}} /-->\n\n<!-- wp:post-title {\"textAlign\":\"center\",\"level\":1} /-->\n\n<!-- wp:post-content {\"metadata\":{\"blockVisibility\":false},\"align\":\"full\",\"layout\":{\"type\":\"constrained\"}} /--></div>\n<!-- /wp:group --></main>\n<!-- /wp:group -->\n\n<!-- wp:template-part {\"slug\":\"footer\",\"theme\":\"twentytwentyfive\",\"metadata\":{\"blockVisibility\":false}} /-->', 'Страницы', 'Отображение всех статических страниц, если не был применен пользовательский шаблон или не существует специального шаблона.', 'inherit', 'closed', 'closed', '', '21-revision-v1', '', '', '2026-03-24 22:29:16', '2026-03-24 19:29:16', '', 21, 'https://eams.local/?p=23', 0, 'revision', '', 0),
(26, 1, '2026-04-07 19:52:50', '2026-04-07 16:52:50', '<!-- wp:group {\"align\":\"full\",\"layout\":{\"type\":\"default\"}} -->\n<div class=\"wp-block-group alignfull\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|30\",\"bottom\":\"var:preset|spacing|30\"}}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"space-between\"}} -->\n<div class=\"wp-block-group alignwide\" style=\"padding-top:var(--wp--preset--spacing--30);padding-bottom:var(--wp--preset--spacing--30)\"><!-- wp:site-title {\"level\":0} /-->\n\n<!-- wp:navigation {\"ref\":16} /--></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->', 'Заголовок', '', 'publish', 'closed', 'closed', '', 'header', '', '', '2026-04-07 21:01:58', '2026-04-07 18:01:58', '', 0, 'https://eams.local/?p=26', 0, 'wp_template_part', '', 0),
(27, 1, '2026-04-07 19:53:18', '2026-04-07 16:53:18', '<!-- wp:group {\"align\":\"full\",\"layout\":{\"type\":\"default\"}} -->\n<div class=\"wp-block-group alignfull\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|30\",\"bottom\":\"var:preset|spacing|30\"}}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"space-between\"}} -->\n<div class=\"wp-block-group alignwide\" style=\"padding-top:var(--wp--preset--spacing--30);padding-bottom:var(--wp--preset--spacing--30)\"><!-- wp:site-title {\"level\":0} /-->\n\n<!-- wp:paragraph -->\n<p>asdasdasd</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:group {\"style\":{\"spacing\":{\"blockGap\":\"var:preset|spacing|10\"}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"right\"}} -->\n<div class=\"wp-block-group\"><!-- wp:navigation {\"ref\":16,\"overlayBackgroundColor\":\"base\",\"overlayTextColor\":\"contrast\",\"layout\":{\"type\":\"flex\",\"justifyContent\":\"right\",\"flexWrap\":\"wrap\"}} /--></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->', 'Заголовок', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2026-04-07 19:53:18', '2026-04-07 16:53:18', '', 26, 'https://eams.local/?p=27', 0, 'revision', '', 0),
(28, 1, '2026-04-07 19:54:17', '2026-04-07 16:54:17', '<!-- wp:group {\"align\":\"full\",\"layout\":{\"type\":\"default\"}} -->\n<div class=\"wp-block-group alignfull\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|30\",\"bottom\":\"var:preset|spacing|30\"}}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"space-between\"}} -->\n<div class=\"wp-block-group alignwide\" style=\"padding-top:var(--wp--preset--spacing--30);padding-bottom:var(--wp--preset--spacing--30)\"><!-- wp:site-title {\"level\":0} /-->\n\n<!-- wp:group {\"style\":{\"spacing\":{\"blockGap\":\"var:preset|spacing|10\"}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"right\"}} -->\n<div class=\"wp-block-group\"><!-- wp:navigation {\"ref\":16,\"overlayBackgroundColor\":\"base\",\"overlayTextColor\":\"contrast\",\"layout\":{\"type\":\"flex\",\"justifyContent\":\"right\",\"flexWrap\":\"wrap\"}} /--></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->', 'Заголовок', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2026-04-07 19:54:17', '2026-04-07 16:54:17', '', 26, 'https://eams.local/?p=28', 0, 'revision', '', 0),
(29, 1, '2026-04-07 19:55:39', '2026-04-07 16:55:39', '<!-- wp:group {\"align\":\"full\",\"layout\":{\"type\":\"default\"}} -->\n<div class=\"wp-block-group alignfull\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|30\",\"bottom\":\"var:preset|spacing|30\"}}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"space-between\"}} -->\n<div class=\"wp-block-group alignwide\" style=\"padding-top:var(--wp--preset--spacing--30);padding-bottom:var(--wp--preset--spacing--30)\"><!-- wp:site-title {\"level\":0} /-->\n\n<!-- wp:group {\"style\":{\"spacing\":{\"blockGap\":\"var:preset|spacing|10\"}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"right\"}} -->\n<div class=\"wp-block-group\"><!-- wp:avatar /--></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->', 'Заголовок', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2026-04-07 19:55:39', '2026-04-07 16:55:39', '', 26, 'https://eams.local/?p=29', 0, 'revision', '', 0),
(30, 1, '2026-04-07 19:55:50', '2026-04-07 16:55:50', '<!-- wp:group {\"align\":\"full\",\"layout\":{\"type\":\"default\"}} -->\n<div class=\"wp-block-group alignfull\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|30\",\"bottom\":\"var:preset|spacing|30\"}}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"space-between\"}} -->\n<div class=\"wp-block-group alignwide\" style=\"padding-top:var(--wp--preset--spacing--30);padding-bottom:var(--wp--preset--spacing--30)\"><!-- wp:site-title {\"level\":0} /-->\n\n<!-- wp:group {\"style\":{\"spacing\":{\"blockGap\":\"var:preset|spacing|10\"}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"right\"}} -->\n<div class=\"wp-block-group\"></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->', 'Заголовок', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2026-04-07 19:55:50', '2026-04-07 16:55:50', '', 26, 'https://eams.local/?p=30', 0, 'revision', '', 0),
(31, 1, '2026-04-07 19:56:09', '2026-04-07 16:56:09', '<!-- wp:group {\"align\":\"full\",\"layout\":{\"type\":\"default\"}} -->\n<div class=\"wp-block-group alignfull\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|30\",\"bottom\":\"var:preset|spacing|30\"}}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"space-between\"}} -->\n<div class=\"wp-block-group alignwide\" style=\"padding-top:var(--wp--preset--spacing--30);padding-bottom:var(--wp--preset--spacing--30)\"><!-- wp:site-title {\"level\":0} /-->\n\n<!-- wp:group {\"style\":{\"spacing\":{\"blockGap\":\"var:preset|spacing|10\"}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"right\"}} -->\n<div class=\"wp-block-group\"><!-- wp:navigation {\"ref\":16,\"overlayBackgroundColor\":\"base\",\"overlayTextColor\":\"contrast\",\"layout\":{\"type\":\"flex\",\"justifyContent\":\"right\",\"flexWrap\":\"wrap\"}} /--></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->', 'Заголовок', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2026-04-07 19:56:09', '2026-04-07 16:56:09', '', 26, 'https://eams.local/?p=31', 0, 'revision', '', 0),
(32, 1, '2026-04-07 20:01:31', '2026-04-07 17:01:31', '<!-- wp:group {\"align\":\"full\",\"layout\":{\"type\":\"default\"}} -->\n<div class=\"wp-block-group alignfull\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|30\",\"bottom\":\"var:preset|spacing|30\"}}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"space-between\"}} -->\n<div class=\"wp-block-group alignwide\" style=\"padding-top:var(--wp--preset--spacing--30);padding-bottom:var(--wp--preset--spacing--30)\"><!-- wp:site-title {\"level\":0} /-->\n\n<!-- wp:group {\"style\":{\"spacing\":{\"blockGap\":\"var:preset|spacing|10\"}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"right\"}} -->\n<div class=\"wp-block-group\"><!-- wp:shortcode -->\n[user_info]\n<!-- /wp:shortcode --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->', 'Заголовок', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2026-04-07 20:01:31', '2026-04-07 17:01:31', '', 26, 'https://eams.local/?p=32', 0, 'revision', '', 0),
(33, 1, '2026-04-07 20:01:46', '2026-04-07 17:01:46', '<!-- wp:group {\"align\":\"full\",\"layout\":{\"type\":\"default\"}} -->\n<div class=\"wp-block-group alignfull\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|30\",\"bottom\":\"var:preset|spacing|30\"}}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"space-between\"}} -->\n<div class=\"wp-block-group alignwide\" style=\"padding-top:var(--wp--preset--spacing--30);padding-bottom:var(--wp--preset--spacing--30)\"><!-- wp:site-title {\"level\":0} /-->\n\n<!-- wp:paragraph -->\n<p>ADADADA</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:group {\"style\":{\"spacing\":{\"blockGap\":\"var:preset|spacing|10\"}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"right\"}} -->\n<div class=\"wp-block-group\"><!-- wp:shortcode -->\n[user_info]\n<!-- /wp:shortcode --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->', 'Заголовок', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2026-04-07 20:01:46', '2026-04-07 17:01:46', '', 26, 'https://eams.local/?p=33', 0, 'revision', '', 0),
(34, 1, '2026-04-07 20:02:15', '2026-04-07 17:02:15', '<!-- wp:group {\"align\":\"full\",\"layout\":{\"type\":\"default\"}} -->\n<div class=\"wp-block-group alignfull\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|30\",\"bottom\":\"var:preset|spacing|30\"}}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"space-between\"}} -->\n<div class=\"wp-block-group alignwide\" style=\"padding-top:var(--wp--preset--spacing--30);padding-bottom:var(--wp--preset--spacing--30)\"><!-- wp:group {\"style\":{\"spacing\":{\"blockGap\":\"var:preset|spacing|10\"}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"right\"}} -->\n<div class=\"wp-block-group\"><!-- wp:shortcode -->\n[user_info]\n<!-- /wp:shortcode --></div>\n<!-- /wp:group -->\n\n<!-- wp:site-title {\"level\":0} /--></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->', 'Заголовок', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2026-04-07 20:02:15', '2026-04-07 17:02:15', '', 26, 'https://eams.local/?p=34', 0, 'revision', '', 0),
(35, 1, '2026-04-07 20:03:35', '2026-04-07 17:03:35', '<!-- wp:group {\"metadata\":{\"categories\":[\"header\"],\"patternName\":\"twentytwentyfive/header\",\"name\":\"Заголовок\"},\"align\":\"full\",\"layout\":{\"type\":\"default\"}} -->\n<div class=\"wp-block-group alignfull\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|30\",\"bottom\":\"var:preset|spacing|30\"}}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"space-between\"}} -->\n<div class=\"wp-block-group alignwide\" style=\"padding-top:var(--wp--preset--spacing--30);padding-bottom:var(--wp--preset--spacing--30)\"><!-- wp:site-title {\"level\":0} /-->\n\n<!-- wp:group {\"style\":{\"spacing\":{\"blockGap\":\"var:preset|spacing|10\"}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"right\"}} -->\n<div class=\"wp-block-group\"><!-- wp:navigation {\"ref\":16,\"overlayBackgroundColor\":\"base\",\"overlayTextColor\":\"contrast\",\"layout\":{\"type\":\"flex\",\"justifyContent\":\"right\",\"flexWrap\":\"wrap\"}} /--></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->', 'Главное меню', '', 'inherit', 'closed', 'closed', '', '10-revision-v1', '', '', '2026-04-07 20:03:35', '2026-04-07 17:03:35', '', 10, 'https://eams.local/?p=35', 0, 'revision', '', 0),
(36, 1, '2026-04-07 20:03:35', '2026-04-07 17:03:35', '<!-- wp:group {\"align\":\"full\",\"layout\":{\"type\":\"default\"}} -->\n<div class=\"wp-block-group alignfull\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|30\",\"bottom\":\"var:preset|spacing|30\"}}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"space-between\"}} -->\n<div class=\"wp-block-group alignwide\" style=\"padding-top:var(--wp--preset--spacing--30);padding-bottom:var(--wp--preset--spacing--30)\"><!-- wp:site-title {\"level\":0} /-->\n\n<!-- wp:group {\"style\":{\"spacing\":{\"blockGap\":\"var:preset|spacing|10\"}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"right\"}} -->\n<div class=\"wp-block-group\"><!-- wp:shortcode -->\n[user_info]\n<!-- /wp:shortcode --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->', 'Заголовок', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2026-04-07 20:03:35', '2026-04-07 17:03:35', '', 26, 'https://eams.local/?p=36', 0, 'revision', '', 0),
(37, 1, '2026-04-07 20:03:51', '2026-04-07 17:03:51', '', 'Главное меню', '', 'inherit', 'closed', 'closed', '', '10-revision-v1', '', '', '2026-04-07 20:03:51', '2026-04-07 17:03:51', '', 10, 'https://eams.local/?p=37', 0, 'revision', '', 0),
(38, 1, '2026-04-07 20:03:51', '2026-04-07 17:03:51', '<!-- wp:group {\"align\":\"full\",\"layout\":{\"type\":\"default\"}} -->\n<div class=\"wp-block-group alignfull\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|30\",\"bottom\":\"var:preset|spacing|30\"}}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"space-between\"}} -->\n<div class=\"wp-block-group alignwide\" style=\"padding-top:var(--wp--preset--spacing--30);padding-bottom:var(--wp--preset--spacing--30)\"><!-- wp:site-title {\"level\":0} /-->\n\n<!-- wp:group {\"style\":{\"spacing\":{\"blockGap\":\"var:preset|spacing|10\"}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"right\"}} -->\n<div class=\"wp-block-group\"><!-- wp:html /--></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->', 'Заголовок', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2026-04-07 20:03:51', '2026-04-07 17:03:51', '', 26, 'https://eams.local/?p=38', 0, 'revision', '', 0),
(39, 1, '2026-04-07 20:04:42', '2026-04-07 17:04:42', '<!-- wp:group {\"align\":\"full\",\"layout\":{\"type\":\"default\"}} -->\n<div class=\"wp-block-group alignfull\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|30\",\"bottom\":\"var:preset|spacing|30\"}}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"space-between\"}} -->\n<div class=\"wp-block-group alignwide\" style=\"padding-top:var(--wp--preset--spacing--30);padding-bottom:var(--wp--preset--spacing--30)\"><!-- wp:site-title {\"level\":0} /-->\n\n<!-- wp:group {\"style\":{\"spacing\":{\"blockGap\":\"var:preset|spacing|10\"}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"right\"}} -->\n<div class=\"wp-block-group\"><!-- wp:html -->\n[user_info]\n<!-- /wp:html --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->', 'Заголовок', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2026-04-07 20:04:42', '2026-04-07 17:04:42', '', 26, 'https://eams.local/?p=39', 0, 'revision', '', 0),
(40, 1, '2026-04-07 20:07:18', '2026-04-07 17:07:18', '<!-- wp:group {\"align\":\"full\",\"layout\":{\"type\":\"default\"}} -->\n<div class=\"wp-block-group alignfull\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|30\",\"bottom\":\"var:preset|spacing|30\"}}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"space-between\"}} -->\n<div class=\"wp-block-group alignwide\" style=\"padding-top:var(--wp--preset--spacing--30);padding-bottom:var(--wp--preset--spacing--30)\"><!-- wp:site-title {\"level\":0} /--></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->', 'Заголовок', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2026-04-07 20:07:18', '2026-04-07 17:07:18', '', 26, 'https://eams.local/?p=40', 0, 'revision', '', 0),
(41, 1, '2026-04-07 20:20:04', '2026-04-07 17:20:04', '<!-- wp:group {\"align\":\"full\",\"layout\":{\"type\":\"default\"}} -->\n<div class=\"wp-block-group alignfull\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|30\",\"bottom\":\"var:preset|spacing|30\"}}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"space-between\"}} -->\n<div class=\"wp-block-group alignwide\" style=\"padding-top:var(--wp--preset--spacing--30);padding-bottom:var(--wp--preset--spacing--30)\"><!-- wp:site-title {\"level\":0} /-->\n\n<!-- wp:shortcode -->\n[user_info]\n<!-- /wp:shortcode --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->', 'Заголовок', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2026-04-07 20:20:04', '2026-04-07 17:20:04', '', 26, 'https://eams.local/?p=41', 0, 'revision', '', 0),
(42, 1, '2026-04-07 20:20:29', '2026-04-07 17:20:29', '<!-- wp:shortcode -->\n[user_info]\n<!-- /wp:shortcode -->\n\n<!-- wp:group {\"align\":\"full\",\"layout\":{\"type\":\"default\"}} -->\n<div class=\"wp-block-group alignfull\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|30\",\"bottom\":\"var:preset|spacing|30\"}}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"space-between\"}} -->\n<div class=\"wp-block-group alignwide\" style=\"padding-top:var(--wp--preset--spacing--30);padding-bottom:var(--wp--preset--spacing--30)\"><!-- wp:site-title {\"level\":0} /--></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->', 'Заголовок', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2026-04-07 20:20:29', '2026-04-07 17:20:29', '', 26, 'https://eams.local/?p=42', 0, 'revision', '', 0),
(43, 1, '2026-04-07 20:23:03', '2026-04-07 17:23:03', '<!-- wp:group {\"align\":\"full\",\"layout\":{\"type\":\"default\"}} -->\n<div class=\"wp-block-group alignfull\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|30\",\"bottom\":\"var:preset|spacing|30\"}}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"space-between\"}} -->\n<div class=\"wp-block-group alignwide\" style=\"padding-top:var(--wp--preset--spacing--30);padding-bottom:var(--wp--preset--spacing--30)\"><!-- wp:site-title {\"level\":0} /-->\n\n<!-- wp:navigation {\"ref\":16} /--></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->', 'Заголовок', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2026-04-07 20:23:03', '2026-04-07 17:23:03', '', 26, 'https://eams.local/?p=43', 0, 'revision', '', 0),
(44, 1, '2026-04-07 20:27:01', '2026-04-07 17:27:01', '<!-- wp:group {\"align\":\"full\",\"layout\":{\"type\":\"default\"}} -->\n<div class=\"wp-block-group alignfull\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|30\",\"bottom\":\"var:preset|spacing|30\"}}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"space-between\"}} -->\n<div class=\"wp-block-group alignwide\" style=\"padding-top:var(--wp--preset--spacing--30);padding-bottom:var(--wp--preset--spacing--30)\"><!-- wp:site-title {\"level\":0} /-->\n\n<!-- wp:group {\"metadata\":{\"categories\":[\"header\"],\"patternName\":\"twentytwentyfive/header\",\"name\":\"Заголовок\"},\"align\":\"full\",\"layout\":{\"type\":\"default\"}} -->\n<div class=\"wp-block-group alignfull\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|30\",\"bottom\":\"var:preset|spacing|30\"}}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"space-between\"}} -->\n<div class=\"wp-block-group alignwide\" style=\"padding-top:var(--wp--preset--spacing--30);padding-bottom:var(--wp--preset--spacing--30)\"><!-- wp:site-title {\"level\":0} /-->\n\n<!-- wp:group {\"style\":{\"spacing\":{\"blockGap\":\"var:preset|spacing|10\"}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"right\"}} -->\n<div class=\"wp-block-group\"><!-- wp:navigation {\"ref\":16,\"overlayBackgroundColor\":\"base\",\"overlayTextColor\":\"contrast\",\"layout\":{\"type\":\"flex\",\"justifyContent\":\"right\",\"flexWrap\":\"wrap\"}} /--></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->\n\n<!-- wp:navigation {\"ref\":16} /--></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->', 'Заголовок', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2026-04-07 20:27:01', '2026-04-07 17:27:01', '', 26, 'https://eams.local/?p=44', 0, 'revision', '', 0),
(45, 1, '2026-04-07 20:27:24', '2026-04-07 17:27:24', '<!-- wp:group {\"align\":\"full\",\"layout\":{\"type\":\"default\"}} -->\n<div class=\"wp-block-group alignfull\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|30\",\"bottom\":\"var:preset|spacing|30\"}}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"space-between\"}} -->\n<div class=\"wp-block-group alignwide\" style=\"padding-top:var(--wp--preset--spacing--30);padding-bottom:var(--wp--preset--spacing--30)\"><!-- wp:site-title {\"level\":0} /-->\n\n<!-- wp:navigation {\"ref\":16} /--></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->', 'Заголовок', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2026-04-07 20:27:24', '2026-04-07 17:27:24', '', 26, 'https://eams.local/?p=45', 0, 'revision', '', 0),
(46, 1, '2026-04-07 21:01:02', '2026-04-07 18:01:02', '', 'Заголовок', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2026-04-07 21:01:02', '2026-04-07 18:01:02', '', 26, 'https://eams.local/?p=46', 0, 'revision', '', 0),
(47, 1, '2026-04-07 21:01:11', '2026-04-07 18:01:11', '<!-- wp:group {\"align\":\"full\",\"layout\":{\"type\":\"default\"}} -->\n<div class=\"wp-block-group alignfull\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|30\",\"bottom\":\"var:preset|spacing|30\"}}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"space-between\"}} -->\n<div class=\"wp-block-group alignwide\" style=\"padding-top:var(--wp--preset--spacing--30);padding-bottom:var(--wp--preset--spacing--30)\"><!-- wp:site-title {\"level\":0} /-->\n\n<!-- wp:navigation {\"ref\":16} /--></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->', 'Заголовок', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2026-04-07 21:01:11', '2026-04-07 18:01:11', '', 26, 'https://eams.local/?p=47', 0, 'revision', '', 0),
(48, 1, '2026-04-07 21:01:28', '2026-04-07 18:01:28', '<!-- wp:group {\"align\":\"full\",\"layout\":{\"type\":\"default\"}} -->\n<div class=\"wp-block-group alignfull\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->', 'Заголовок', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2026-04-07 21:01:28', '2026-04-07 18:01:28', '', 26, 'https://eams.local/?p=48', 0, 'revision', '', 0),
(49, 1, '2026-04-07 21:01:57', '2026-04-07 18:01:57', '<!-- wp:group {\"align\":\"full\",\"layout\":{\"type\":\"default\"}} -->\n<div class=\"wp-block-group alignfull\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"align\":\"wide\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|30\",\"bottom\":\"var:preset|spacing|30\"}}},\"layout\":{\"type\":\"flex\",\"flexWrap\":\"nowrap\",\"justifyContent\":\"space-between\"}} -->\n<div class=\"wp-block-group alignwide\" style=\"padding-top:var(--wp--preset--spacing--30);padding-bottom:var(--wp--preset--spacing--30)\"><!-- wp:site-title {\"level\":0} /-->\n\n<!-- wp:navigation {\"ref\":16} /--></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->', 'Заголовок', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2026-04-07 21:01:57', '2026-04-07 18:01:57', '', 26, 'https://eams.local/?p=49', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `wp_requests`
--

CREATE TABLE `wp_requests` (
  `RequestID` int UNSIGNED NOT NULL,
  `RequestCreator` bigint UNSIGNED NOT NULL,
  `AssetGroup` varchar(100) NOT NULL,
  `AssetName` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `Report` text NOT NULL,
  `ReportFiles` text NOT NULL,
  `Department` varchar(100) NOT NULL,
  `Executor` bigint UNSIGNED NOT NULL,
  `RequestStatus` varchar(50) NOT NULL,
  `DataCreation` datetime NOT NULL,
  `DateCompletion` datetime NOT NULL,
  `Theme` text NOT NULL,
  `AI_Risk` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `wp_requests`
--

INSERT INTO `wp_requests` (`RequestID`, `RequestCreator`, `AssetGroup`, `AssetName`, `Address`, `Description`, `Report`, `ReportFiles`, `Department`, `Executor`, `RequestStatus`, `DataCreation`, `DateCompletion`, `Theme`, `AI_Risk`) VALUES
(1, 2, 'Гидроэлектростанция', 'Турбина-03', 'ГЭС \"Ишим\"', 'Нужно провести проверку работоспособности и целостности турбины', 'На месте, занимаюсь проверкой', '', 'B', 7, 'In Progress', '2026-05-11 02:49:18', '2026-05-11 02:49:18', 'Ежемесячное обслуживание турбины', 'unknown'),
(2, 2, 'Гидроэлектростанция', 'Генератор', 'ГЭС \"Ишим\"', 'Монитор не показывает выработку энергии генератором. Сотрудники сообщают, что эта проблема появилась в связи с последним обновлением системы оборудования', 'Обновление не будет работать на таком старом компьютере, сколько раз я уже говорил им. Откатил до прошлой версии, всё работает', '', 'D', 10, 'Completed', '2026-05-11 02:51:30', '2026-05-11 02:51:30', 'Монитор не показывает выработку', 'unknown'),
(3, 2, 'Гидроэлектростанция', 'Турбина-01', 'ГЭС \"Ишим\"', 'После работы на максимальной нагрузке, турбина начала слегка пошатываться при работе. Требуется внеплановая диагностика оборудования на работоспособность и целостность', '', '', 'C', 9, 'In Progress', '2026-05-11 02:54:28', '2026-05-11 02:54:28', 'Турбина пошатывается', 'unknown');

-- --------------------------------------------------------

--
-- Структура таблицы `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint UNSIGNED NOT NULL,
  `term_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint UNSIGNED NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Без рубрики', '%d0%b1%d0%b5%d0%b7-%d1%80%d1%83%d0%b1%d1%80%d0%b8%d0%ba%d0%b8', 0),
(2, 'twentytwentyfive', 'twentytwentyfive', 0),
(3, 'header', 'header', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(8, 2, 0),
(20, 2, 0),
(21, 2, 0),
(26, 2, 0),
(26, 3, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint UNSIGNED NOT NULL,
  `term_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'wp_theme', '', 0, 4),
(3, 3, 'wp_template_part_area', '', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'root'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '1'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '25'),
(18, 1, 'community-events-location', 'a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}'),
(19, 1, 'wp_persisted_preferences', 'a:4:{s:4:\"core\";a:3:{s:26:\"isComplementaryAreaVisible\";b:0;s:24:\"enableChoosePatternModal\";b:1;s:10:\"editorMode\";s:6:\"visual\";}s:14:\"core/edit-post\";a:3:{s:12:\"welcomeGuide\";b:0;s:19:\"metaBoxesMainIsOpen\";b:1;s:23:\"metaBoxesMainOpenHeight\";i:338;}s:9:\"_modified\";s:24:\"2026-04-07T17:28:47.180Z\";s:14:\"core/edit-site\";a:3:{s:12:\"welcomeGuide\";b:0;s:16:\"welcomeGuidePage\";b:0;s:18:\"welcomeGuideStyles\";b:0;}}'),
(20, 2, 'nickname', 'asset_administrator'),
(21, 2, 'first_name', 'Сергей'),
(22, 2, 'last_name', 'Банкевич'),
(23, 2, 'description', ''),
(24, 2, 'rich_editing', 'true'),
(25, 2, 'syntax_highlighting', 'true'),
(26, 2, 'comment_shortcuts', 'false'),
(27, 2, 'admin_color', 'fresh'),
(28, 2, 'use_ssl', '0'),
(29, 2, 'show_admin_bar_front', 'true'),
(30, 2, 'locale', ''),
(31, 2, 'wp_capabilities', 'a:1:{s:11:\"admin_asset\";b:1;}'),
(32, 2, 'wp_user_level', '0'),
(33, 2, 'dismissed_wp_pointers', ''),
(34, 3, 'nickname', 'manager'),
(35, 3, 'first_name', 'Валентин'),
(36, 3, 'last_name', 'Кознев'),
(37, 3, 'description', ''),
(38, 3, 'rich_editing', 'true'),
(39, 3, 'syntax_highlighting', 'true'),
(40, 3, 'comment_shortcuts', 'false'),
(41, 3, 'admin_color', 'fresh'),
(42, 3, 'use_ssl', '0'),
(43, 3, 'show_admin_bar_front', 'true'),
(44, 3, 'locale', ''),
(45, 3, 'wp_capabilities', 'a:1:{s:7:\"manager\";b:1;}'),
(46, 3, 'wp_user_level', '0'),
(47, 3, 'dismissed_wp_pointers', ''),
(76, 1, '_new_email', 'a:2:{s:4:\"hash\";s:32:\"8510ad4402e89ae1f52dd8db11bc8f7a\";s:8:\"newemail\";s:11:\"0@gmail.com\";}'),
(82, 3, 'community-events-location', 'a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}'),
(87, 1, 'wp_user-settings', 'libraryContent=browse'),
(88, 1, 'wp_user-settings-time', '1775581482'),
(93, 1, 'session_tokens', 'a:1:{s:64:\"a4fcb6a95acb3286042c1712370127b3d539516c9e0a0c86c92ba48ce786f283\";a:4:{s:10:\"expiration\";i:1778582174;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:125:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0\";s:5:\"login\";i:1778409374;}}'),
(94, 1, 'meta-box-order_members_page_roles', 'a:1:{s:4:\"side\";s:19:\"submitdiv,newcapdiv\";}'),
(95, 1, 'screen_layout_members_page_roles', '2'),
(96, 6, 'nickname', 'mechanic_1'),
(97, 6, 'first_name', 'Роман'),
(98, 6, 'last_name', 'Постовалов'),
(99, 6, 'description', ''),
(100, 6, 'rich_editing', 'true'),
(101, 6, 'syntax_highlighting', 'true'),
(102, 6, 'comment_shortcuts', 'false'),
(103, 6, 'admin_color', 'fresh'),
(104, 6, 'use_ssl', '0'),
(105, 6, 'show_admin_bar_front', 'true'),
(106, 6, 'locale', ''),
(107, 6, 'wp_capabilities', 'a:1:{s:21:\"department_employee_b\";b:1;}'),
(108, 6, 'wp_user_level', '0'),
(109, 6, 'dismissed_wp_pointers', ''),
(110, 7, 'nickname', 'mechanic_2'),
(111, 7, 'first_name', 'Филипп'),
(112, 7, 'last_name', 'Пилипенко'),
(113, 7, 'description', ''),
(114, 7, 'rich_editing', 'true'),
(115, 7, 'syntax_highlighting', 'true'),
(116, 7, 'comment_shortcuts', 'false'),
(117, 7, 'admin_color', 'fresh'),
(118, 7, 'use_ssl', '0'),
(119, 7, 'show_admin_bar_front', 'true'),
(120, 7, 'locale', ''),
(121, 7, 'wp_capabilities', 'a:1:{s:21:\"department_employee_b\";b:1;}'),
(122, 7, 'wp_user_level', '0'),
(123, 7, 'dismissed_wp_pointers', ''),
(124, 8, 'nickname', 'engineer_1'),
(125, 8, 'first_name', 'Борис'),
(126, 8, 'last_name', 'Кольцев'),
(127, 8, 'description', ''),
(128, 8, 'rich_editing', 'true'),
(129, 8, 'syntax_highlighting', 'true'),
(130, 8, 'comment_shortcuts', 'false'),
(131, 8, 'admin_color', 'fresh'),
(132, 8, 'use_ssl', '0'),
(133, 8, 'show_admin_bar_front', 'true'),
(134, 8, 'locale', ''),
(135, 8, 'wp_capabilities', 'a:1:{s:21:\"department_employee_c\";b:1;}'),
(136, 8, 'wp_user_level', '0'),
(137, 8, 'dismissed_wp_pointers', ''),
(138, 9, 'nickname', 'engineer_2'),
(139, 9, 'first_name', 'Кирилл'),
(140, 9, 'last_name', 'Шерстов'),
(141, 9, 'description', ''),
(142, 9, 'rich_editing', 'true'),
(143, 9, 'syntax_highlighting', 'true'),
(144, 9, 'comment_shortcuts', 'false'),
(145, 9, 'admin_color', 'fresh'),
(146, 9, 'use_ssl', '0'),
(147, 9, 'show_admin_bar_front', 'true'),
(148, 9, 'locale', ''),
(149, 9, 'wp_capabilities', 'a:1:{s:21:\"department_employee_c\";b:1;}'),
(150, 9, 'wp_user_level', '0'),
(151, 9, 'dismissed_wp_pointers', ''),
(152, 4, 'nickname', 'electric_1'),
(153, 4, 'first_name', 'Дмитрий'),
(154, 4, 'last_name', 'Пробкин'),
(155, 4, 'description', ''),
(156, 4, 'rich_editing', 'true'),
(157, 4, 'syntax_highlighting', 'true'),
(158, 4, 'comment_shortcuts', 'false'),
(159, 4, 'admin_color', 'fresh'),
(160, 4, 'use_ssl', '0'),
(161, 4, 'show_admin_bar_front', 'true'),
(162, 4, 'locale', ''),
(163, 4, 'wp_capabilities', 'a:1:{s:21:\"department_employee_a\";b:1;}'),
(164, 4, 'wp_user_level', '0'),
(165, 5, 'nickname', 'electric_2'),
(166, 5, 'first_name', 'Иван'),
(167, 5, 'last_name', 'Железняк'),
(168, 5, 'description', ''),
(169, 5, 'rich_editing', 'true'),
(170, 5, 'syntax_highlighting', 'true'),
(171, 5, 'comment_shortcuts', 'false'),
(172, 5, 'admin_color', 'fresh'),
(173, 5, 'use_ssl', '0'),
(174, 5, 'show_admin_bar_front', 'true'),
(175, 5, 'locale', ''),
(176, 5, 'wp_capabilities', 'a:1:{s:21:\"department_employee_a\";b:1;}'),
(177, 5, 'wp_user_level', '0'),
(178, 10, 'nickname', 'engineer_1'),
(179, 10, 'first_name', 'Фёдор'),
(180, 10, 'last_name', 'Константинов'),
(181, 10, 'description', ''),
(182, 10, 'rich_editing', 'true'),
(183, 10, 'syntax_highlighting', 'true'),
(184, 10, 'comment_shortcuts', 'false'),
(185, 10, 'admin_color', 'fresh'),
(186, 10, 'use_ssl', '0'),
(187, 10, 'show_admin_bar_front', 'true'),
(188, 10, 'locale', ''),
(189, 10, 'wp_capabilities', 'a:1:{s:21:\"department_employee_d\";b:1;}'),
(190, 10, 'wp_user_level', '0'),
(191, 10, 'dismissed_wp_pointers', ''),
(206, 10, 'nickname', 'engineer_1'),
(207, 10, 'first_name', 'Фёдор'),
(208, 10, 'last_name', 'Константинов'),
(209, 10, 'description', ''),
(210, 10, 'rich_editing', 'true'),
(211, 10, 'syntax_highlighting', 'true'),
(212, 10, 'comment_shortcuts', 'false'),
(213, 10, 'admin_color', 'fresh'),
(214, 10, 'use_ssl', '0'),
(215, 10, 'show_admin_bar_front', 'true'),
(216, 10, 'locale', ''),
(217, 10, 'dismissed_wp_pointers', ''),
(218, 11, 'nickname', 'it_2'),
(219, 11, 'first_name', 'Евгений'),
(220, 11, 'last_name', 'Швальц'),
(221, 11, 'description', ''),
(222, 11, 'rich_editing', 'true'),
(223, 11, 'syntax_highlighting', 'true'),
(224, 11, 'comment_shortcuts', 'false'),
(225, 11, 'admin_color', 'fresh'),
(226, 11, 'use_ssl', '0'),
(227, 11, 'show_admin_bar_front', 'true'),
(228, 11, 'locale', ''),
(229, 11, 'wp_capabilities', 'a:1:{s:21:\"department_employee_d\";b:1;}'),
(230, 11, 'wp_user_level', '0'),
(231, 11, 'dismissed_wp_pointers', ''),
(236, 2, 'session_tokens', 'a:1:{s:64:\"e483f40fb5fdae8fc8b761db9202379d32e9ce9f5a551dd222f3e017ade22ad3\";a:4:{s:10:\"expiration\";i:1778592351;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:125:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0\";s:5:\"login\";i:1778419551;}}'),
(248, 3, 'session_tokens', 'a:1:{s:64:\"2086955e13222cbd0a19d3a5aa24c96b221fce91ea21fd57c680f39b1e4d1a5b\";a:4:{s:10:\"expiration\";i:1778631133;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:125:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0\";s:5:\"login\";i:1778458333;}}');

-- --------------------------------------------------------

--
-- Структура таблицы `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint UNSIGNED NOT NULL,
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_activation_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int NOT NULL DEFAULT '0',
  `display_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'root', '$wp$2y$12$wyoGRNLoBM0dyf3zDyuEh.zrMeUnZNxL5LcWnPi4FBQBcV/C0y84G', 'root', 'a@gmail.com', '', '2026-03-24 12:03:39', '', 0, 'root'),
(2, 'asset_administrator', '$wp$2y$12$Ydg9A0BiXx2FbSa.0E77iOhxfwF26owoiXv6jNHxCAsh7uoL3KGqi', 'asset_administrator', '1@gmail.com', '', '2026-03-24 14:04:19', '', 0, 'Сергей Леонидович'),
(3, 'manager', '$wp$2y$12$htUeEz5RewW1r3L/l9XUB.bvYuxWUaCVE74ZkGdvhB3JRvpfGcAIK', 'manager', '2@gmail.com', '', '2026-03-24 14:05:07', '', 0, 'Валентин Дмитриевич'),
(4, 'electric_1', '$wp$2y$12$91NtGm8isXAtp5rm2DDo..kvacfoPxVm98kj93f6W1kzcyU2r1jRW', 'electric_1', '3@gmail.com', '', '2026-05-10 06:51:16', '', 0, 'Дмитрий Пробкин'),
(5, 'electric_2', '$wp$2y$12$y1IvafNw9Q6Cm/MuZYm85uln1TGfuN/OUBPfbvpSjdf5roz9uzJVO', 'electric_2', '4@gmail.com', '', '2026-05-10 06:52:41', '', 0, 'Иван Железняк'),
(6, 'mechanic_1', '$wp$2y$12$Q5x3012BOnB0mGSUzeA8OuGg8q7v0GfSRyC39l6VgTIYIV/k.0tOu', 'mechanic_1', '5@gmail.com', '', '2026-05-10 06:58:34', '', 0, 'Роман Постовалов'),
(7, 'mechanic_2', '$wp$2y$12$JPcBVPRiZ4NswU3oi5OwUuw/2AFjlYCKuQFFLIyR0kRq2d5M5a5hq', 'mechanic_2', '6@gmail.com', '', '2026-05-10 07:01:52', '', 0, 'Филипп Пилипенко'),
(8, 'engineer_1', '$wp$2y$12$3heQXPUEMMMKMyvHhzVquO7DbaCIQxvqZSQGClYkA8wT9gz0UsjRm', 'engineer_1', '7@gmail.com', '', '2026-05-10 07:08:07', '', 0, 'Борис Кольцев'),
(9, 'engineer_2', '$wp$2y$12$FZecjZljZU99CTT8qmGTMu95T0/bIL7H7Yw3mev77cGC7rB260w8W', 'engineer_2', '8@gmail.com', '', '2026-05-10 07:13:50', '', 0, 'Кирилл Шерстов'),
(10, 'it_1', '$wp$2y$12$.yd./gMI5fx3ugqFpA6vc.gjDj6kDghAie8Fcmz9y/G1AIuPFrzPO', 'it_1', '9@gmail.com', '', '2026-05-10 07:30:56', '', 0, 'Фёдор Константинов'),
(11, 'it_2', '$wp$2y$12$JJ4pjk58VQ3.6iTjV0IzteUylM2IUM36zUv7NN4SDqNPbj0yGsqRa', 'it_2', '10@gmail.com', '', '2026-05-10 07:39:33', '', 0, 'Евгений Швальц');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `wp_assets`
--
ALTER TABLE `wp_assets`
  ADD PRIMARY KEY (`AssetID`);

--
-- Индексы таблицы `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Индексы таблицы `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Индексы таблицы `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Индексы таблицы `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Индексы таблицы `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Индексы таблицы `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`),
  ADD KEY `type_status_author` (`post_type`,`post_status`,`post_author`);

--
-- Индексы таблицы `wp_requests`
--
ALTER TABLE `wp_requests`
  ADD PRIMARY KEY (`RequestID`),
  ADD KEY `Executor` (`Executor`);

--
-- Индексы таблицы `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Индексы таблицы `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Индексы таблицы `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Индексы таблицы `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Индексы таблицы `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Индексы таблицы `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `wp_assets`
--
ALTER TABLE `wp_assets`
  MODIFY `AssetID` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=516;

--
-- AUTO_INCREMENT для таблицы `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT для таблицы `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT для таблицы `wp_requests`
--
ALTER TABLE `wp_requests`
  MODIFY `RequestID` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;

--
-- AUTO_INCREMENT для таблицы `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
