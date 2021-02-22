
-- *** STRUCTURE:`tbl_fields_author` ***
DROP TABLE IF EXISTS`tbl_fields_author`;
CREATE TABLE`tbl_fields_author` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `default_to_current_user` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL,
  `author_types` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_author` ***

-- *** STRUCTURE:`tbl_fields_checkbox` ***
DROP TABLE IF EXISTS`tbl_fields_checkbox`;
CREATE TABLE`tbl_fields_checkbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_state` enum('on','off') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'on',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_checkbox` ***
INSERT INTO`tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (7, 27, 'off', NULL);

-- *** STRUCTURE:`tbl_fields_date` ***
DROP TABLE IF EXISTS`tbl_fields_date`;
CREATE TABLE`tbl_fields_date` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `pre_populate` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calendar` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `time` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_date` ***
INSERT INTO`tbl_fields_date` (`id`, `field_id`, `pre_populate`, `calendar`, `time`) VALUES (3, 28, NULL, 'yes', 'no');

-- *** STRUCTURE:`tbl_fields_image_upload` ***
DROP TABLE IF EXISTS`tbl_fields_image_upload`;
CREATE TABLE`tbl_fields_image_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validator` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unique` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `min_width` int(11) unsigned DEFAULT NULL,
  `min_height` int(11) unsigned DEFAULT NULL,
  `max_width` int(11) unsigned DEFAULT NULL,
  `max_height` int(11) unsigned DEFAULT NULL,
  `resize` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_image_upload` ***
INSERT INTO`tbl_fields_image_upload` (`id`, `field_id`, `destination`, `validator`, `unique`, `min_width`, `min_height`, `max_width`, `max_height`, `resize`) VALUES (22, 19, '/workspace/images/covers', '/\\.(?:bmp|gif|jpe?g|png)$/i', 'yes', 0, 0, 1920, 1080, 'yes');
INSERT INTO`tbl_fields_image_upload` (`id`, `field_id`, `destination`, `validator`, `unique`, `min_width`, `min_height`, `max_width`, `max_height`, `resize`) VALUES (24, 24, '/workspace/images/about', '/\\.(?:bmp|gif|jpe?g|png)$/i', 'yes', 0, 0, 1920, 1080, 'yes');

-- *** STRUCTURE:`tbl_fields_input` ***
DROP TABLE IF EXISTS`tbl_fields_input`;
CREATE TABLE`tbl_fields_input` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_input` ***

-- *** STRUCTURE:`tbl_fields_languages` ***
DROP TABLE IF EXISTS`tbl_fields_languages`;
CREATE TABLE`tbl_fields_languages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `available_codes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_languages` ***

-- *** STRUCTURE:`tbl_fields_multilingual_selectbox_link` ***
DROP TABLE IF EXISTS`tbl_fields_multilingual_selectbox_link`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sym_fields_multilingual_selectbox_link` AS select `sym_fields_selectbox_link`.`id` AS `id`,`sym_fields_selectbox_link`.`field_id` AS `field_id`,`sym_fields_selectbox_link`.`allow_multiple_selection` AS `allow_multiple_selection`,`sym_fields_selectbox_link`.`hide_when_prepopulated` AS `hide_when_prepopulated`,`sym_fields_selectbox_link`.`related_field_id` AS `related_field_id`,`sym_fields_selectbox_link`.`limit` AS `limit` from `sym_fields_selectbox_link`;

-- *** DATA:`tbl_fields_multilingual_selectbox_link` ***
INSERT INTO`tbl_fields_multilingual_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `hide_when_prepopulated`, `related_field_id`, `limit`) VALUES (10, 22, 'no', 'no', 16, 20);

-- *** STRUCTURE:`tbl_fields_multilingual_textbox` ***
DROP TABLE IF EXISTS`tbl_fields_multilingual_textbox`;
CREATE TABLE`tbl_fields_multilingual_textbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `column_length` int(11) unsigned DEFAULT '75',
  `text_size` enum('single','small','medium','large','huge') COLLATE utf8_unicode_ci DEFAULT 'medium',
  `text_formatter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_length` int(11) unsigned DEFAULT '0',
  `text_cdata` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `text_handle` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `handle_unique` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `default_main_lang` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `required_languages` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_multilingual_textbox` ***
INSERT INTO`tbl_fields_multilingual_textbox` (`id`, `field_id`, `column_length`, `text_size`, `text_formatter`, `text_validator`, `text_length`, `text_cdata`, `text_handle`, `handle_unique`, `default_main_lang`, `required_languages`) VALUES (119, 11, 75, 'single', 'none', NULL, 0, 'no', 'yes', 'yes', 'yes', 'main');
INSERT INTO`tbl_fields_multilingual_textbox` (`id`, `field_id`, `column_length`, `text_size`, `text_formatter`, `text_validator`, `text_length`, `text_cdata`, `text_handle`, `handle_unique`, `default_main_lang`, `required_languages`) VALUES (121, 14, 75, 'medium', 'markdown_extra_with_smartypants', NULL, 0, 'no', 'no', 'no', 'yes', NULL);
INSERT INTO`tbl_fields_multilingual_textbox` (`id`, `field_id`, `column_length`, `text_size`, `text_formatter`, `text_validator`, `text_length`, `text_cdata`, `text_handle`, `handle_unique`, `default_main_lang`, `required_languages`) VALUES (120, 12, 75, 'single', 'none', NULL, 0, 'no', 'yes', 'yes', 'yes', 'main');
INSERT INTO`tbl_fields_multilingual_textbox` (`id`, `field_id`, `column_length`, `text_size`, `text_formatter`, `text_validator`, `text_length`, `text_cdata`, `text_handle`, `handle_unique`, `default_main_lang`, `required_languages`) VALUES (122, 15, 75, 'large', 'markdown_extra_with_smartypants', NULL, 0, 'no', 'no', 'no', 'yes', NULL);
INSERT INTO`tbl_fields_multilingual_textbox` (`id`, `field_id`, `column_length`, `text_size`, `text_formatter`, `text_validator`, `text_length`, `text_cdata`, `text_handle`, `handle_unique`, `default_main_lang`, `required_languages`) VALUES (30, 16, 75, 'single', 'none', NULL, 0, 'no', 'yes', 'yes', 'no', 'all');
INSERT INTO`tbl_fields_multilingual_textbox` (`id`, `field_id`, `column_length`, `text_size`, `text_formatter`, `text_validator`, `text_length`, `text_cdata`, `text_handle`, `handle_unique`, `default_main_lang`, `required_languages`) VALUES (126, 25, 75, 'single', 'none', NULL, 0, 'no', 'yes', 'yes', 'no', NULL);
INSERT INTO`tbl_fields_multilingual_textbox` (`id`, `field_id`, `column_length`, `text_size`, `text_formatter`, `text_validator`, `text_length`, `text_cdata`, `text_handle`, `handle_unique`, `default_main_lang`, `required_languages`) VALUES (125, 23, 75, 'medium', 'markdown_extra_with_smartypants', NULL, 0, 'no', 'no', 'yes', 'yes', 'main');

-- *** STRUCTURE:`tbl_fields_multiupload` ***
DROP TABLE IF EXISTS`tbl_fields_multiupload`;
CREATE TABLE`tbl_fields_multiupload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_multiupload` ***
INSERT INTO`tbl_fields_multiupload` (`id`, `field_id`, `destination`, `validator`) VALUES (18, 20, '/workspace/images/projects', '/\\.(?:bmp|gif|jpe?g|png)$/i');

-- *** STRUCTURE:`tbl_fields_order_entries` ***
DROP TABLE IF EXISTS`tbl_fields_order_entries`;
CREATE TABLE`tbl_fields_order_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `force_sort` enum('yes','no') DEFAULT 'no',
  `hide` enum('yes','no') DEFAULT 'no',
  `disable_pagination` enum('yes','no') DEFAULT 'no',
  `filtered_fields` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

-- *** DATA:`tbl_fields_order_entries` ***
INSERT INTO`tbl_fields_order_entries` (`id`, `field_id`, `force_sort`, `hide`, `disable_pagination`, `filtered_fields`) VALUES (2, 17, NULL, 'yes', NULL, NULL);
INSERT INTO`tbl_fields_order_entries` (`id`, `field_id`, `force_sort`, `hide`, `disable_pagination`, `filtered_fields`) VALUES (22, 18, NULL, 'yes', NULL, NULL);

-- *** STRUCTURE:`tbl_fields_publish_tabs` ***
DROP TABLE IF EXISTS`tbl_fields_publish_tabs`;
CREATE TABLE`tbl_fields_publish_tabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_publish_tabs` ***

-- *** STRUCTURE:`tbl_fields_publishbutton` ***
DROP TABLE IF EXISTS`tbl_fields_publishbutton`;
CREATE TABLE`tbl_fields_publishbutton` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_state` enum('on','off') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'on',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_publishbutton` ***

-- *** STRUCTURE:`tbl_fields_select` ***
DROP TABLE IF EXISTS`tbl_fields_select`;
CREATE TABLE`tbl_fields_select` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `sort_options` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `static_options` text COLLATE utf8_unicode_ci,
  `dynamic_options` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_select` ***

-- *** STRUCTURE:`tbl_fields_selectbox_link` ***
DROP TABLE IF EXISTS`tbl_fields_selectbox_link`;
CREATE TABLE`tbl_fields_selectbox_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `hide_when_prepopulated` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `related_field_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `limit` int(4) unsigned NOT NULL DEFAULT '20',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_selectbox_link` ***
INSERT INTO`tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `hide_when_prepopulated`, `related_field_id`, `limit`) VALUES (10, 22, 'no', 'no', 16, 20);

-- *** STRUCTURE:`tbl_fields_taglist` ***
DROP TABLE IF EXISTS`tbl_fields_taglist`;
CREATE TABLE`tbl_fields_taglist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pre_populate_source` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `pre_populate_source` (`pre_populate_source`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_taglist` ***

-- *** STRUCTURE:`tbl_fields_textarea` ***
DROP TABLE IF EXISTS`tbl_fields_textarea`;
CREATE TABLE`tbl_fields_textarea` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `formatter` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_textarea` ***

-- *** STRUCTURE:`tbl_fields_textbox` ***
DROP TABLE IF EXISTS`tbl_fields_textbox`;
CREATE TABLE`tbl_fields_textbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `column_length` int(11) unsigned DEFAULT '75',
  `text_size` enum('single','small','medium','large','huge') COLLATE utf8_unicode_ci DEFAULT 'medium',
  `text_formatter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_length` int(11) unsigned DEFAULT '0',
  `text_cdata` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `text_handle` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `handle_unique` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_textbox` ***

-- *** STRUCTURE:`tbl_fields_upload` ***
DROP TABLE IF EXISTS`tbl_fields_upload`;
CREATE TABLE`tbl_fields_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_upload` ***

-- *** STRUCTURE:`tbl_entries_data_11` ***
DROP TABLE IF EXISTS`tbl_entries_data_11`;
CREATE TABLE`tbl_entries_data_11` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `value_formatted` text COLLATE utf8_unicode_ci,
  `word_count` int(11) unsigned DEFAULT NULL,
  `handle-en` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-en` text COLLATE utf8_unicode_ci,
  `value_formatted-en` text COLLATE utf8_unicode_ci,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `handle-pl` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-pl` text COLLATE utf8_unicode_ci,
  `value_formatted-pl` text COLLATE utf8_unicode_ci,
  `word_count-pl` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle-en` (`handle-en`(333)),
  KEY `handle-pl` (`handle-pl`(333)),
  KEY `handle` (`handle`(333)),
  FULLTEXT KEY `value-en` (`value-en`),
  FULLTEXT KEY `value_formatted-en` (`value_formatted-en`),
  FULLTEXT KEY `value-pl` (`value-pl`),
  FULLTEXT KEY `value_formatted-pl` (`value_formatted-pl`),
  FULLTEXT KEY `value` (`value`),
  FULLTEXT KEY `value_formatted` (`value_formatted`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_11` ***
INSERT INTO`tbl_entries_data_11` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (25, 6, 'tytul', 'Tytuł', 'Tytuł', 1, NULL, NULL, NULL, 0, 'tytul', 'Tytuł', 'Tytuł', 1);
INSERT INTO`tbl_entries_data_11` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (29, 7, 'projekt-numer-jeden', 'Projekt numer jeden', 'Projekt numer jeden', 3, 'first-project', 'First project', 'First project', 2, 'projekt-numer-jeden', 'Projekt numer jeden', 'Projekt numer jeden', 3);
INSERT INTO`tbl_entries_data_11` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (26, 8, 'projekt-numer-dwa', 'Projekt numer dwa', 'Projekt numer dwa', 3, 'second-project', 'Second project', 'Second project', 2, 'projekt-numer-dwa', 'Projekt numer dwa', 'Projekt numer dwa', 3);

-- *** STRUCTURE:`tbl_entries_data_12` ***
DROP TABLE IF EXISTS`tbl_entries_data_12`;
CREATE TABLE`tbl_entries_data_12` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `value_formatted` text COLLATE utf8_unicode_ci,
  `word_count` int(11) unsigned DEFAULT NULL,
  `handle-en` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-en` text COLLATE utf8_unicode_ci,
  `value_formatted-en` text COLLATE utf8_unicode_ci,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `handle-pl` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-pl` text COLLATE utf8_unicode_ci,
  `value_formatted-pl` text COLLATE utf8_unicode_ci,
  `word_count-pl` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle-en` (`handle-en`(333)),
  KEY `handle-pl` (`handle-pl`(333)),
  KEY `handle` (`handle`(333)),
  FULLTEXT KEY `value-en` (`value-en`),
  FULLTEXT KEY `value_formatted-en` (`value_formatted-en`),
  FULLTEXT KEY `value-pl` (`value-pl`),
  FULLTEXT KEY `value_formatted-pl` (`value_formatted-pl`),
  FULLTEXT KEY `value` (`value`),
  FULLTEXT KEY `value_formatted` (`value_formatted`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_12` ***
INSERT INTO`tbl_entries_data_12` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (25, 6, 2020, 2020, 2020, 0, NULL, NULL, NULL, 0, 2020, 2020, 2020, 0);
INSERT INTO`tbl_entries_data_12` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (29, 7, '2018-2019', '2018–2019', '2018–2019', 1, '2017-2018', '2017–2018', '2017–2018', 1, '2018-2019', '2018–2019', '2018–2019', 1);
INSERT INTO`tbl_entries_data_12` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (26, 8, '2020-2', 2020, 2020, 0, 2019, 2019, 2019, 0, '2020-2', 2020, 2020, 0);

-- *** STRUCTURE:`tbl_entries_data_14` ***
DROP TABLE IF EXISTS`tbl_entries_data_14`;
CREATE TABLE`tbl_entries_data_14` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `value_formatted` text COLLATE utf8_unicode_ci,
  `word_count` int(11) unsigned DEFAULT NULL,
  `handle-en` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-en` text COLLATE utf8_unicode_ci,
  `value_formatted-en` text COLLATE utf8_unicode_ci,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `handle-pl` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-pl` text COLLATE utf8_unicode_ci,
  `value_formatted-pl` text COLLATE utf8_unicode_ci,
  `word_count-pl` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle-en` (`handle-en`(333)),
  KEY `handle-pl` (`handle-pl`(333)),
  KEY `handle` (`handle`(333)),
  FULLTEXT KEY `value-en` (`value-en`),
  FULLTEXT KEY `value_formatted-en` (`value_formatted-en`),
  FULLTEXT KEY `value-pl` (`value-pl`),
  FULLTEXT KEY `value_formatted-pl` (`value_formatted-pl`),
  FULLTEXT KEY `value` (`value`),
  FULLTEXT KEY `value_formatted` (`value_formatted`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_14` ***
INSERT INTO`tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (25, 6, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0);
INSERT INTO`tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (29, 7, 'skwer-aktywnosci-miejskich-w-parku-swietokrzyskim-powstal-w-ramach-warszawskiego-budzetu-partycypacyjnego-projekt-aplikuje-nowe-publiczne-funkcje-w-do-tej-pory-najbardziej-zaniedbanym-narozniku-parku-wskrzesza-istniejacy-szpiczasty-pawilon-warszawa-i-porzadkuje-przestrzen-od-strony-placu-budowy-nowego-muzeum-marzeniem-kazdego-architekta-jest-zbudowanie-drapacza-chmur-dlatego-idac-sladem-mlodzienczych-fantazji-rema-koolhaas-a-zrealizowalismy-przewrocony-wiezowiec-szara-plaszczyzna-wydluzonego-prostokata-podlogi-swoja-geometria-barwa-i-skala-nawiazuje-do-okolicznych-biurowcow-i-w-ten-sposob-wpisuje-w-wielkomiejski-kontekst-zlokalizowana-w-przedpolu-palacu-kultury-i-nauki-platforma-o-proporcjach-deski-i-wymiarach-80-x-20-m-jest-pomyslana-jako-niewielka-uporzadkowana-przestrzen-publiczna-unoszaca-sie-niczym-tratwa-nad-zgielkiem-nieustannie-zmieniajacego-sie-miasta-mozna-tu-pograc-w-pilke-pojezdzic-na-deskorolce-rowerze-lub-hulajnodze-albo-z-przylegajacej-do-placu-niewielkiej-zielonej-gorki-podziwiac', 'Skwer aktywności miejskich w Parku Świętokrzyskim powstał w ramach warszawskiego budżetu partycypacyjnego. Projekt aplikuje nowe publiczne funkcje w do tej pory najbardziej zaniedbanym narożniku parku, wskrzesza istniejący, szpiczasty pawilon „Warszawa”  i porządkuje przestrzeń od strony placu budowy nowego muzeum. Marzeniem każdego architekta jest zbudowanie drapacza chmur, dlatego idąc śladem młodzieńczych fantazji Rema Koolhaas’a, zrealizowaliśmy przewrócony wieżowiec: szara płaszczyzna wydłużonego prostokąta podłogi swoją geometrią, barwą i skalą nawiązuje do okolicznych biurowców i w ten sposób wpisuje w wielkomiejski kontekst. Zlokalizowana w przedpolu Pałacu Kultury i Nauki platforma o proporcjach deski i wymiarach 80 x 20 m jest pomyślana jako niewielka, uporządkowana przestrzeń publiczna unosząca się, niczym tratwa, nad zgiełkiem nieustannie zmieniającego się miasta. Można tu pograć w piłkę, pojeździć na deskorolce, rowerze lub hulajnodze albo, z przylegającej do placu niewielkiej zielonej górki, podziwiać, niczym z widowni, sportowe ewolucje zażywając jednocześnie kąpieli słonecznych. Albo nie robić nic, leżąc na deskach.\r\n\r\n\r\nMarcin Kwietowicz, Michał Sikorski', '<p>Skwer aktywności miejskich w Parku Świętokrzyskim powstał w ramach warszawskiego budżetu partycypacyjnego. Projekt aplikuje nowe publiczne funkcje w do tej pory najbardziej zaniedbanym narożniku parku, wskrzesza istniejący, szpiczasty pawilon „Warszawa”  i porządkuje przestrzeń od strony placu budowy nowego muzeum. Marzeniem każdego architekta jest zbudowanie drapacza chmur, dlatego idąc śladem młodzieńczych fantazji Rema Koolhaas’a, zrealizowaliśmy przewrócony wieżowiec: szara płaszczyzna wydłużonego prostokąta podłogi swoją geometrią, barwą i skalą nawiązuje do okolicznych biurowców i w ten sposób wpisuje w wielkomiejski kontekst. Zlokalizowana w przedpolu Pałacu Kultury i Nauki platforma o proporcjach deski i wymiarach 80 x 20 m jest pomyślana jako niewielka, uporządkowana przestrzeń publiczna unosząca się, niczym tratwa, nad zgiełkiem nieustannie zmieniającego się miasta. Można tu pograć w piłkę, pojeździć na deskorolce, rowerze lub hulajnodze albo, z przylegającej do placu niewielkiej zielonej górki, podziwiać, niczym z widowni, sportowe ewolucje zażywając jednocześnie kąpieli słonecznych. Albo nie robić nic, leżąc na deskach.</p>\n\n<p>Marcin Kwietowicz, Michał Sikorski</p>', 150, 'skwer-aktywnosci-miejskich-w-parku-swietokrzyskim-powstal-w-ramach-warszawskiego-budzetu-partycypacyjnego-projekt-aplikuje-nowe-publiczne-funkcje-w-do-tej-pory-najbardziej-zaniedbanym-narozniku-parku-wskrzesza-istniejacy-szpiczasty-pawilon-warszawa-i-porzadkuje-przestrzen-od-strony-placu-budowy-nowego-muzeum-marzeniem-kazdego-architekta-jest-zbudowanie-drapacza-chmur-dlatego-idac-sladem-mlodzienczych-fantazji-rema-koolhaas-a-zrealizowalismy-przewrocony-wiezowiec-szara-plaszczyzna-wydluzonego-prostokata-podlogi-swoja-geometria-barwa-i-skala-nawiazuje-do-okolicznych-biurowcow-i-w-ten-sposob-wpisuje-w-wielkomiejski-kontekst-zlokalizowana-w-przedpolu-palacu-kultury-i-nauki-platforma-o-proporcjach-deski-i-wymiarach-80-x-20-m-jest-pomyslana-jako-niewielka-uporzadkowana-przestrzen-publiczna-unoszaca-sie-niczym-tratwa-nad-zgielkiem-nieustannie-zmieniajacego-sie-miasta-mozna-tu-pograc-w-pilke-pojezdzic-na-deskorolce-rowerze-lub-hulajnodze-albo-z-przylegajacej-do-placu-niewielkiej-zielonej-gorki-podziwiac', 'Skwer aktywności miejskich w Parku Świętokrzyskim powstał w ramach warszawskiego budżetu partycypacyjnego. Projekt aplikuje nowe publiczne funkcje w do tej pory najbardziej zaniedbanym narożniku parku, wskrzesza istniejący, szpiczasty pawilon „Warszawa”  i porządkuje przestrzeń od strony placu budowy nowego muzeum. Marzeniem każdego architekta jest zbudowanie drapacza chmur, dlatego idąc śladem młodzieńczych fantazji Rema Koolhaas’a, zrealizowaliśmy przewrócony wieżowiec: szara płaszczyzna wydłużonego prostokąta podłogi swoją geometrią, barwą i skalą nawiązuje do okolicznych biurowców i w ten sposób wpisuje w wielkomiejski kontekst. Zlokalizowana w przedpolu Pałacu Kultury i Nauki platforma o proporcjach deski i wymiarach 80 x 20 m jest pomyślana jako niewielka, uporządkowana przestrzeń publiczna unosząca się, niczym tratwa, nad zgiełkiem nieustannie zmieniającego się miasta. Można tu pograć w piłkę, pojeździć na deskorolce, rowerze lub hulajnodze albo, z przylegającej do placu niewielkiej zielonej górki, podziwiać, niczym z widowni, sportowe ewolucje zażywając jednocześnie kąpieli słonecznych. Albo nie robić nic, leżąc na deskach.\r\n\r\nMarcin Kwietowicz, Michał Sikorski', '<p>Skwer aktywności miejskich w Parku Świętokrzyskim powstał w ramach warszawskiego budżetu partycypacyjnego. Projekt aplikuje nowe publiczne funkcje w do tej pory najbardziej zaniedbanym narożniku parku, wskrzesza istniejący, szpiczasty pawilon „Warszawa”  i porządkuje przestrzeń od strony placu budowy nowego muzeum. Marzeniem każdego architekta jest zbudowanie drapacza chmur, dlatego idąc śladem młodzieńczych fantazji Rema Koolhaas’a, zrealizowaliśmy przewrócony wieżowiec: szara płaszczyzna wydłużonego prostokąta podłogi swoją geometrią, barwą i skalą nawiązuje do okolicznych biurowców i w ten sposób wpisuje w wielkomiejski kontekst. Zlokalizowana w przedpolu Pałacu Kultury i Nauki platforma o proporcjach deski i wymiarach 80 x 20 m jest pomyślana jako niewielka, uporządkowana przestrzeń publiczna unosząca się, niczym tratwa, nad zgiełkiem nieustannie zmieniającego się miasta. Można tu pograć w piłkę, pojeździć na deskorolce, rowerze lub hulajnodze albo, z przylegającej do placu niewielkiej zielonej górki, podziwiać, niczym z widowni, sportowe ewolucje zażywając jednocześnie kąpieli słonecznych. Albo nie robić nic, leżąc na deskach.</p>\n\n<p>Marcin Kwietowicz, Michał Sikorski</p>', 150, 'skwer-aktywnosci-miejskich-w-parku-swietokrzyskim-powstal-w-ramach-warszawskiego-budzetu-partycypacyjnego-projekt-aplikuje-nowe-publiczne-funkcje-w-do-tej-pory-najbardziej-zaniedbanym-narozniku-parku-wskrzesza-istniejacy-szpiczasty-pawilon-warszawa-i-porzadkuje-przestrzen-od-strony-placu-budowy-nowego-muzeum-marzeniem-kazdego-architekta-jest-zbudowanie-drapacza-chmur-dlatego-idac-sladem-mlodzienczych-fantazji-rema-koolhaas-a-zrealizowalismy-przewrocony-wiezowiec-szara-plaszczyzna-wydluzonego-prostokata-podlogi-swoja-geometria-barwa-i-skala-nawiazuje-do-okolicznych-biurowcow-i-w-ten-sposob-wpisuje-w-wielkomiejski-kontekst-zlokalizowana-w-przedpolu-palacu-kultury-i-nauki-platforma-o-proporcjach-deski-i-wymiarach-80-x-20-m-jest-pomyslana-jako-niewielka-uporzadkowana-przestrzen-publiczna-unoszaca-sie-niczym-tratwa-nad-zgielkiem-nieustannie-zmieniajacego-sie-miasta-mozna-tu-pograc-w-pilke-pojezdzic-na-deskorolce-rowerze-lub-hulajnodze-albo-z-przylegajacej-do-placu-niewielkiej-zielonej-gorki-podziwiac', 'Skwer aktywności miejskich w Parku Świętokrzyskim powstał w ramach warszawskiego budżetu partycypacyjnego. Projekt aplikuje nowe publiczne funkcje w do tej pory najbardziej zaniedbanym narożniku parku, wskrzesza istniejący, szpiczasty pawilon „Warszawa”  i porządkuje przestrzeń od strony placu budowy nowego muzeum. Marzeniem każdego architekta jest zbudowanie drapacza chmur, dlatego idąc śladem młodzieńczych fantazji Rema Koolhaas’a, zrealizowaliśmy przewrócony wieżowiec: szara płaszczyzna wydłużonego prostokąta podłogi swoją geometrią, barwą i skalą nawiązuje do okolicznych biurowców i w ten sposób wpisuje w wielkomiejski kontekst. Zlokalizowana w przedpolu Pałacu Kultury i Nauki platforma o proporcjach deski i wymiarach 80 x 20 m jest pomyślana jako niewielka, uporządkowana przestrzeń publiczna unosząca się, niczym tratwa, nad zgiełkiem nieustannie zmieniającego się miasta. Można tu pograć w piłkę, pojeździć na deskorolce, rowerze lub hulajnodze albo, z przylegającej do placu niewielkiej zielonej górki, podziwiać, niczym z widowni, sportowe ewolucje zażywając jednocześnie kąpieli słonecznych. Albo nie robić nic, leżąc na deskach.\r\n\r\n\r\nMarcin Kwietowicz, Michał Sikorski', '<p>Skwer aktywności miejskich w Parku Świętokrzyskim powstał w ramach warszawskiego budżetu partycypacyjnego. Projekt aplikuje nowe publiczne funkcje w do tej pory najbardziej zaniedbanym narożniku parku, wskrzesza istniejący, szpiczasty pawilon „Warszawa”  i porządkuje przestrzeń od strony placu budowy nowego muzeum. Marzeniem każdego architekta jest zbudowanie drapacza chmur, dlatego idąc śladem młodzieńczych fantazji Rema Koolhaas’a, zrealizowaliśmy przewrócony wieżowiec: szara płaszczyzna wydłużonego prostokąta podłogi swoją geometrią, barwą i skalą nawiązuje do okolicznych biurowców i w ten sposób wpisuje w wielkomiejski kontekst. Zlokalizowana w przedpolu Pałacu Kultury i Nauki platforma o proporcjach deski i wymiarach 80 x 20 m jest pomyślana jako niewielka, uporządkowana przestrzeń publiczna unosząca się, niczym tratwa, nad zgiełkiem nieustannie zmieniającego się miasta. Można tu pograć w piłkę, pojeździć na deskorolce, rowerze lub hulajnodze albo, z przylegającej do placu niewielkiej zielonej górki, podziwiać, niczym z widowni, sportowe ewolucje zażywając jednocześnie kąpieli słonecznych. Albo nie robić nic, leżąc na deskach.</p>\n\n<p>Marcin Kwietowicz, Michał Sikorski</p>', 150);
INSERT INTO`tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (26, 8, 'skwer-aktywnosci-miejskich-w-parku-swietokrzyskim-powstal-w-ramach-warszawskiego-budzetu-partycypacyjnego-projekt-aplikuje-nowe-publiczne-funkcje-w-do-tej-pory-najbardziej-zaniedbanym-narozniku-parku-wskrzesza-istniejacy-szpiczasty-pawilon-warszawa-i-porzadkuje-przestrzen-od-strony-placu-budowy-nowego-muzeum-marzeniem-kazdego-architekta-jest-zbudowanie-drapacza-chmur-dlatego-idac-sladem-mlodzienczych-fantazji-rema-koolhaas-a-zrealizowalismy-przewrocony-wiezowiec-szara-plaszczyzna-wydluzonego-prostokata-podlogi-swoja-geometria-barwa-i-skala-nawiazuje-do-okolicznych-biurowcow-i-w-ten-sposob-wpisuje-w-wielkomiejski-kontekst-zlokalizowana-w-przedpolu-palacu-kultury-i-nauki-platforma-o-proporcjach-deski-i-wymiarach-80-x-20-m-jest-pomyslana-jako-niewielka-uporzadkowana-przestrzen-publiczna-unoszaca-sie-niczym-tratwa-nad-zgielkiem-nieustannie-zmieniajacego-sie-miasta-mozna-tu-pograc-w-pilke-pojezdzic-na-deskorolce-rowerze-lub-hulajnodze-albo-z-przylegajacej-do-placu-niewielkiej-zielonej-gorki-podziwiac', 'Skwer aktywności miejskich w Parku Świętokrzyskim powstał w ramach warszawskiego budżetu partycypacyjnego. Projekt aplikuje nowe publiczne funkcje w do tej pory najbardziej zaniedbanym narożniku parku, wskrzesza istniejący, szpiczasty pawilon „Warszawa”  i porządkuje przestrzeń od strony placu budowy nowego muzeum. Marzeniem każdego architekta jest zbudowanie drapacza chmur, dlatego idąc śladem młodzieńczych fantazji Rema Koolhaas’a, zrealizowaliśmy przewrócony wieżowiec: szara płaszczyzna wydłużonego prostokąta podłogi swoją geometrią, barwą i skalą nawiązuje do okolicznych biurowców i w ten sposób wpisuje w wielkomiejski kontekst. Zlokalizowana w przedpolu Pałacu Kultury i Nauki platforma o proporcjach deski i wymiarach 80 x 20 m jest pomyślana jako niewielka, uporządkowana przestrzeń publiczna unosząca się, niczym tratwa, nad zgiełkiem nieustannie zmieniającego się miasta. Można tu pograć w piłkę, pojeździć na deskorolce, rowerze lub hulajnodze albo, z przylegającej do placu niewielkiej zielonej górki, podziwiać, niczym z widowni, sportowe ewolucje zażywając jednocześnie kąpieli słonecznych. Albo nie robić nic, leżąc na deskach.\r\n\r\n\r\nMarcin Kwietowicz, Michał Sikorski', '<p>Skwer aktywności miejskich w Parku Świętokrzyskim powstał w ramach warszawskiego budżetu partycypacyjnego. Projekt aplikuje nowe publiczne funkcje w do tej pory najbardziej zaniedbanym narożniku parku, wskrzesza istniejący, szpiczasty pawilon „Warszawa”  i porządkuje przestrzeń od strony placu budowy nowego muzeum. Marzeniem każdego architekta jest zbudowanie drapacza chmur, dlatego idąc śladem młodzieńczych fantazji Rema Koolhaas’a, zrealizowaliśmy przewrócony wieżowiec: szara płaszczyzna wydłużonego prostokąta podłogi swoją geometrią, barwą i skalą nawiązuje do okolicznych biurowców i w ten sposób wpisuje w wielkomiejski kontekst. Zlokalizowana w przedpolu Pałacu Kultury i Nauki platforma o proporcjach deski i wymiarach 80 x 20 m jest pomyślana jako niewielka, uporządkowana przestrzeń publiczna unosząca się, niczym tratwa, nad zgiełkiem nieustannie zmieniającego się miasta. Można tu pograć w piłkę, pojeździć na deskorolce, rowerze lub hulajnodze albo, z przylegającej do placu niewielkiej zielonej górki, podziwiać, niczym z widowni, sportowe ewolucje zażywając jednocześnie kąpieli słonecznych. Albo nie robić nic, leżąc na deskach.</p>\n\n<p>Marcin Kwietowicz, Michał Sikorski</p>', 150, 'skwer-aktywnosci-miejskich-w-parku-swietokrzyskim-powstal-w-ramach-warszawskiego-budzetu-partycypacyjnego-projekt-aplikuje-nowe-publiczne-funkcje-w-do-tej-pory-najbardziej-zaniedbanym-narozniku-parku-wskrzesza-istniejacy-szpiczasty-pawilon-warszawa-i-porzadkuje-przestrzen-od-strony-placu-budowy-nowego-muzeum-marzeniem-kazdego-architekta-jest-zbudowanie-drapacza-chmur-dlatego-idac-sladem-mlodzienczych-fantazji-rema-koolhaas-a-zrealizowalismy-przewrocony-wiezowiec-szara-plaszczyzna-wydluzonego-prostokata-podlogi-swoja-geometria-barwa-i-skala-nawiazuje-do-okolicznych-biurowcow-i-w-ten-sposob-wpisuje-w-wielkomiejski-kontekst-zlokalizowana-w-przedpolu-palacu-kultury-i-nauki-platforma-o-proporcjach-deski-i-wymiarach-80-x-20-m-jest-pomyslana-jako-niewielka-uporzadkowana-przestrzen-publiczna-unoszaca-sie-niczym-tratwa-nad-zgielkiem-nieustannie-zmieniajacego-sie-miasta-mozna-tu-pograc-w-pilke-pojezdzic-na-deskorolce-rowerze-lub-hulajnodze-albo-z-przylegajacej-do-placu-niewielkiej-zielonej-gorki-podziwiac', 'Skwer aktywności miejskich w Parku Świętokrzyskim powstał w ramach warszawskiego budżetu partycypacyjnego. Projekt aplikuje nowe publiczne funkcje w do tej pory najbardziej zaniedbanym narożniku parku, wskrzesza istniejący, szpiczasty pawilon „Warszawa”  i porządkuje przestrzeń od strony placu budowy nowego muzeum. Marzeniem każdego architekta jest zbudowanie drapacza chmur, dlatego idąc śladem młodzieńczych fantazji Rema Koolhaas’a, zrealizowaliśmy przewrócony wieżowiec: szara płaszczyzna wydłużonego prostokąta podłogi swoją geometrią, barwą i skalą nawiązuje do okolicznych biurowców i w ten sposób wpisuje w wielkomiejski kontekst. Zlokalizowana w przedpolu Pałacu Kultury i Nauki platforma o proporcjach deski i wymiarach 80 x 20 m jest pomyślana jako niewielka, uporządkowana przestrzeń publiczna unosząca się, niczym tratwa, nad zgiełkiem nieustannie zmieniającego się miasta. Można tu pograć w piłkę, pojeździć na deskorolce, rowerze lub hulajnodze albo, z przylegającej do placu niewielkiej zielonej górki, podziwiać, niczym z widowni, sportowe ewolucje zażywając jednocześnie kąpieli słonecznych. Albo nie robić nic, leżąc na deskach.\r\n\r\n\r\nMarcin Kwietowicz, Michał Sikorski', '<p>Skwer aktywności miejskich w Parku Świętokrzyskim powstał w ramach warszawskiego budżetu partycypacyjnego. Projekt aplikuje nowe publiczne funkcje w do tej pory najbardziej zaniedbanym narożniku parku, wskrzesza istniejący, szpiczasty pawilon „Warszawa”  i porządkuje przestrzeń od strony placu budowy nowego muzeum. Marzeniem każdego architekta jest zbudowanie drapacza chmur, dlatego idąc śladem młodzieńczych fantazji Rema Koolhaas’a, zrealizowaliśmy przewrócony wieżowiec: szara płaszczyzna wydłużonego prostokąta podłogi swoją geometrią, barwą i skalą nawiązuje do okolicznych biurowców i w ten sposób wpisuje w wielkomiejski kontekst. Zlokalizowana w przedpolu Pałacu Kultury i Nauki platforma o proporcjach deski i wymiarach 80 x 20 m jest pomyślana jako niewielka, uporządkowana przestrzeń publiczna unosząca się, niczym tratwa, nad zgiełkiem nieustannie zmieniającego się miasta. Można tu pograć w piłkę, pojeździć na deskorolce, rowerze lub hulajnodze albo, z przylegającej do placu niewielkiej zielonej górki, podziwiać, niczym z widowni, sportowe ewolucje zażywając jednocześnie kąpieli słonecznych. Albo nie robić nic, leżąc na deskach.</p>\n\n<p>Marcin Kwietowicz, Michał Sikorski</p>', 150, 'skwer-aktywnosci-miejskich-w-parku-swietokrzyskim-powstal-w-ramach-warszawskiego-budzetu-partycypacyjnego-projekt-aplikuje-nowe-publiczne-funkcje-w-do-tej-pory-najbardziej-zaniedbanym-narozniku-parku-wskrzesza-istniejacy-szpiczasty-pawilon-warszawa-i-porzadkuje-przestrzen-od-strony-placu-budowy-nowego-muzeum-marzeniem-kazdego-architekta-jest-zbudowanie-drapacza-chmur-dlatego-idac-sladem-mlodzienczych-fantazji-rema-koolhaas-a-zrealizowalismy-przewrocony-wiezowiec-szara-plaszczyzna-wydluzonego-prostokata-podlogi-swoja-geometria-barwa-i-skala-nawiazuje-do-okolicznych-biurowcow-i-w-ten-sposob-wpisuje-w-wielkomiejski-kontekst-zlokalizowana-w-przedpolu-palacu-kultury-i-nauki-platforma-o-proporcjach-deski-i-wymiarach-80-x-20-m-jest-pomyslana-jako-niewielka-uporzadkowana-przestrzen-publiczna-unoszaca-sie-niczym-tratwa-nad-zgielkiem-nieustannie-zmieniajacego-sie-miasta-mozna-tu-pograc-w-pilke-pojezdzic-na-deskorolce-rowerze-lub-hulajnodze-albo-z-przylegajacej-do-placu-niewielkiej-zielonej-gorki-podziwiac', 'Skwer aktywności miejskich w Parku Świętokrzyskim powstał w ramach warszawskiego budżetu partycypacyjnego. Projekt aplikuje nowe publiczne funkcje w do tej pory najbardziej zaniedbanym narożniku parku, wskrzesza istniejący, szpiczasty pawilon „Warszawa”  i porządkuje przestrzeń od strony placu budowy nowego muzeum. Marzeniem każdego architekta jest zbudowanie drapacza chmur, dlatego idąc śladem młodzieńczych fantazji Rema Koolhaas’a, zrealizowaliśmy przewrócony wieżowiec: szara płaszczyzna wydłużonego prostokąta podłogi swoją geometrią, barwą i skalą nawiązuje do okolicznych biurowców i w ten sposób wpisuje w wielkomiejski kontekst. Zlokalizowana w przedpolu Pałacu Kultury i Nauki platforma o proporcjach deski i wymiarach 80 x 20 m jest pomyślana jako niewielka, uporządkowana przestrzeń publiczna unosząca się, niczym tratwa, nad zgiełkiem nieustannie zmieniającego się miasta. Można tu pograć w piłkę, pojeździć na deskorolce, rowerze lub hulajnodze albo, z przylegającej do placu niewielkiej zielonej górki, podziwiać, niczym z widowni, sportowe ewolucje zażywając jednocześnie kąpieli słonecznych. Albo nie robić nic, leżąc na deskach.\r\n\r\n\r\nMarcin Kwietowicz, Michał Sikorski', '<p>Skwer aktywności miejskich w Parku Świętokrzyskim powstał w ramach warszawskiego budżetu partycypacyjnego. Projekt aplikuje nowe publiczne funkcje w do tej pory najbardziej zaniedbanym narożniku parku, wskrzesza istniejący, szpiczasty pawilon „Warszawa”  i porządkuje przestrzeń od strony placu budowy nowego muzeum. Marzeniem każdego architekta jest zbudowanie drapacza chmur, dlatego idąc śladem młodzieńczych fantazji Rema Koolhaas’a, zrealizowaliśmy przewrócony wieżowiec: szara płaszczyzna wydłużonego prostokąta podłogi swoją geometrią, barwą i skalą nawiązuje do okolicznych biurowców i w ten sposób wpisuje w wielkomiejski kontekst. Zlokalizowana w przedpolu Pałacu Kultury i Nauki platforma o proporcjach deski i wymiarach 80 x 20 m jest pomyślana jako niewielka, uporządkowana przestrzeń publiczna unosząca się, niczym tratwa, nad zgiełkiem nieustannie zmieniającego się miasta. Można tu pograć w piłkę, pojeździć na deskorolce, rowerze lub hulajnodze albo, z przylegającej do placu niewielkiej zielonej górki, podziwiać, niczym z widowni, sportowe ewolucje zażywając jednocześnie kąpieli słonecznych. Albo nie robić nic, leżąc na deskach.</p>\n\n<p>Marcin Kwietowicz, Michał Sikorski</p>', 150);

-- *** STRUCTURE:`tbl_entries_data_15` ***
DROP TABLE IF EXISTS`tbl_entries_data_15`;
CREATE TABLE`tbl_entries_data_15` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `value_formatted` text COLLATE utf8_unicode_ci,
  `word_count` int(11) unsigned DEFAULT NULL,
  `handle-en` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-en` text COLLATE utf8_unicode_ci,
  `value_formatted-en` text COLLATE utf8_unicode_ci,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `handle-pl` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-pl` text COLLATE utf8_unicode_ci,
  `value_formatted-pl` text COLLATE utf8_unicode_ci,
  `word_count-pl` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle-en` (`handle-en`(333)),
  KEY `handle-pl` (`handle-pl`(333)),
  KEY `handle` (`handle`(333)),
  FULLTEXT KEY `value-en` (`value-en`),
  FULLTEXT KEY `value_formatted-en` (`value_formatted-en`),
  FULLTEXT KEY `value-pl` (`value-pl`),
  FULLTEXT KEY `value_formatted-pl` (`value_formatted-pl`),
  FULLTEXT KEY `value` (`value`),
  FULLTEXT KEY `value_formatted` (`value_formatted`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_15` ***
INSERT INTO`tbl_entries_data_15` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (25, 6, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0);
INSERT INTO`tbl_entries_data_15` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (29, 7, 'nazwa-realizacji-taras-w-parku-swietokrzyskim-adres-warszawa-park-swietokrzyski-ul-marszalkowska-autorzy-marcin-kwietowicz-michal-sikorski-wspolpraca-autorska-agnieszka-kolacinska-konsultacje-grzegorz-gadek-monika-wrobel-fundacja-skwer-sportow-miejskich-konstrukcja-daniel-przybylek-wykonawca-palmett-inwestor-zarzad-zieleni-m-st-warszawy-powierzchnia-terenu-2-500-m2-powierzchnia-zabudowy-2-500-m2-powierzchnia-uzytkowa-2-500-m2-powierzchnia-calkowita-2-500-m2-projekt-2017-2018-realizacja-2019-koszt-inwestycji-1-600-000-pln-projekt-zrealizowano-w-ramach-budzetu-obywatelskiego-fotografie-blazej-pindor', '**Nazwa realizacji**\r\nTaras w Parku Świętokrzyskim\r\n\r\n**Adres**\r\nWarszawa, Park Świętokrzyski, ul. Marszałkowska\r\n\r\n**Autorzy**\r\nMarcin Kwietowicz, Michał Sikorski\r\n\r\n**Współpraca autorska**\r\nAgnieszka Kołacińska\r\n\r\n**Konsultacje**\r\nGrzegorz Gądek, Monika Wróbel\r\n(Fundacja Skwer Sportów Miejskich)\r\n\r\n**Konstrukcja**\r\nDaniel Przybyłek\r\n\r\n**Wykonawca**\r\nPalmett\r\n\r\n**Inwestor**\r\nZarząd Zieleni m. st. Warszawy\r\n\r\n**Powierzchnia terenu**\r\n2 500 m2\r\n\r\n**Powierzchnia zabudowy**\r\n2 500 m2\r\n\r\n**Powierzchnia użytkowa**\r\n2 500 m2\r\n\r\n**Powierzchnia całkowita**\r\n2 500 m2\r\n\r\n**Projekt**\r\n2017–2018\r\n\r\n**Realizacja**\r\n2019\r\n\r\n**Koszt inwestycji**\r\n1 600 000 PLN\r\n\r\nprojekt zrealizowano w ramach budżetu obywatelskiego\r\n\r\n**Fotografie**\r\nBłażej Pindor', '<p><strong>Nazwa realizacji</strong>\nTaras w Parku Świętokrzyskim</p>\n\n<p><strong>Adres</strong>\nWarszawa, Park Świętokrzyski, ul. Marszałkowska</p>\n\n<p><strong>Autorzy</strong>\nMarcin Kwietowicz, Michał Sikorski</p>\n\n<p><strong>Współpraca autorska</strong>\nAgnieszka Kołacińska</p>\n\n<p><strong>Konsultacje</strong>\nGrzegorz Gądek, Monika Wróbel\n(Fundacja Skwer Sportów Miejskich)</p>\n\n<p><strong>Konstrukcja</strong>\nDaniel Przybyłek</p>\n\n<p><strong>Wykonawca</strong>\nPalmett</p>\n\n<p><strong>Inwestor</strong>\nZarząd Zieleni m. st. Warszawy</p>\n\n<p><strong>Powierzchnia terenu</strong>\n2 500 m2</p>\n\n<p><strong>Powierzchnia zabudowy</strong>\n2 500 m2</p>\n\n<p><strong>Powierzchnia użytkowa</strong>\n2 500 m2</p>\n\n<p><strong>Powierzchnia całkowita</strong>\n2 500 m2</p>\n\n<p><strong>Projekt</strong>\n2017–2018</p>\n\n<p><strong>Realizacja</strong>\n2019</p>\n\n<p><strong>Koszt inwestycji</strong>\n1 600 000 PLN</p>\n\n<p>projekt zrealizowano w ramach budżetu obywatelskiego</p>\n\n<p><strong>Fotografie</strong>\nBłażej Pindor</p>', 68, 'nazwa-realizacji-taras-w-parku-swietokrzyskim-adres-warszawa-park-swietokrzyski-ul-marszalkowska-autorzy-marcin-kwietowicz-michal-sikorski-wspolpraca-autorska-agnieszka-kolacinska-konsultacje-grzegorz-gadek-monika-wrobel-fundacja-skwer-sportow-miejskich-konstrukcja-daniel-przybylek-wykonawca-palmett-inwestor-zarzad-zieleni-m-st-warszawy-powierzchnia-terenu-2-500-m2-powierzchnia-zabudowy-2-500-m2-powierzchnia-uzytkowa-2-500-m2-powierzchnia-calkowita-2-500-m2-projekt-2017-2018-realizacja-2019-koszt-inwestycji-1-600-000-pln-projekt-zrealizowano-w-ramach-budzetu-obywatelskiego-fotografie-blazej-pindor', '**Nazwa realizacji**\r\nTaras w Parku Świętokrzyskim\r\n\r\n**Adres**\r\nWarszawa, Park Świętokrzyski, ul. Marszałkowska\r\n\r\n**Autorzy**\r\nMarcin Kwietowicz, Michał Sikorski\r\n\r\n**Współpraca autorska**\r\nAgnieszka Kołacińska\r\n\r\n**Konsultacje**\r\nGrzegorz Gądek, Monika Wróbel\r\n(Fundacja Skwer Sportów Miejskich)\r\n\r\n**Konstrukcja**\r\nDaniel Przybyłek\r\n\r\n**Wykonawca**\r\nPalmett\r\n\r\n**Inwestor**\r\nZarząd Zieleni m. st. Warszawy\r\n\r\n**Powierzchnia terenu**\r\n2 500 m2\r\n\r\n**Powierzchnia zabudowy**\r\n2 500 m2\r\n\r\n**Powierzchnia użytkowa**\r\n2 500 m2\r\n\r\n**Powierzchnia całkowita**\r\n2 500 m2\r\n\r\n**Projekt**\r\n2017–2018\r\n\r\n**Realizacja**\r\n2019\r\n\r\n**Koszt inwestycji**\r\n1 600 000 PLN\r\n\r\nprojekt zrealizowano w ramach budżetu obywatelskiego\r\n\r\n**Fotografie**\r\nBłażej Pindor', '<p><strong>Nazwa realizacji</strong>\nTaras w Parku Świętokrzyskim</p>\n\n<p><strong>Adres</strong>\nWarszawa, Park Świętokrzyski, ul. Marszałkowska</p>\n\n<p><strong>Autorzy</strong>\nMarcin Kwietowicz, Michał Sikorski</p>\n\n<p><strong>Współpraca autorska</strong>\nAgnieszka Kołacińska</p>\n\n<p><strong>Konsultacje</strong>\nGrzegorz Gądek, Monika Wróbel\n(Fundacja Skwer Sportów Miejskich)</p>\n\n<p><strong>Konstrukcja</strong>\nDaniel Przybyłek</p>\n\n<p><strong>Wykonawca</strong>\nPalmett</p>\n\n<p><strong>Inwestor</strong>\nZarząd Zieleni m. st. Warszawy</p>\n\n<p><strong>Powierzchnia terenu</strong>\n2 500 m2</p>\n\n<p><strong>Powierzchnia zabudowy</strong>\n2 500 m2</p>\n\n<p><strong>Powierzchnia użytkowa</strong>\n2 500 m2</p>\n\n<p><strong>Powierzchnia całkowita</strong>\n2 500 m2</p>\n\n<p><strong>Projekt</strong>\n2017–2018</p>\n\n<p><strong>Realizacja</strong>\n2019</p>\n\n<p><strong>Koszt inwestycji</strong>\n1 600 000 PLN</p>\n\n<p>projekt zrealizowano w ramach budżetu obywatelskiego</p>\n\n<p><strong>Fotografie</strong>\nBłażej Pindor</p>', 68, 'nazwa-realizacji-taras-w-parku-swietokrzyskim-adres-warszawa-park-swietokrzyski-ul-marszalkowska-autorzy-marcin-kwietowicz-michal-sikorski-wspolpraca-autorska-agnieszka-kolacinska-konsultacje-grzegorz-gadek-monika-wrobel-fundacja-skwer-sportow-miejskich-konstrukcja-daniel-przybylek-wykonawca-palmett-inwestor-zarzad-zieleni-m-st-warszawy-powierzchnia-terenu-2-500-m2-powierzchnia-zabudowy-2-500-m2-powierzchnia-uzytkowa-2-500-m2-powierzchnia-calkowita-2-500-m2-projekt-2017-2018-realizacja-2019-koszt-inwestycji-1-600-000-pln-projekt-zrealizowano-w-ramach-budzetu-obywatelskiego-fotografie-blazej-pindor', '**Nazwa realizacji**\r\nTaras w Parku Świętokrzyskim\r\n\r\n**Adres**\r\nWarszawa, Park Świętokrzyski, ul. Marszałkowska\r\n\r\n**Autorzy**\r\nMarcin Kwietowicz, Michał Sikorski\r\n\r\n**Współpraca autorska**\r\nAgnieszka Kołacińska\r\n\r\n**Konsultacje**\r\nGrzegorz Gądek, Monika Wróbel\r\n(Fundacja Skwer Sportów Miejskich)\r\n\r\n**Konstrukcja**\r\nDaniel Przybyłek\r\n\r\n**Wykonawca**\r\nPalmett\r\n\r\n**Inwestor**\r\nZarząd Zieleni m. st. Warszawy\r\n\r\n**Powierzchnia terenu**\r\n2 500 m2\r\n\r\n**Powierzchnia zabudowy**\r\n2 500 m2\r\n\r\n**Powierzchnia użytkowa**\r\n2 500 m2\r\n\r\n**Powierzchnia całkowita**\r\n2 500 m2\r\n\r\n**Projekt**\r\n2017–2018\r\n\r\n**Realizacja**\r\n2019\r\n\r\n**Koszt inwestycji**\r\n1 600 000 PLN\r\n\r\nprojekt zrealizowano w ramach budżetu obywatelskiego\r\n\r\n**Fotografie**\r\nBłażej Pindor', '<p><strong>Nazwa realizacji</strong>\nTaras w Parku Świętokrzyskim</p>\n\n<p><strong>Adres</strong>\nWarszawa, Park Świętokrzyski, ul. Marszałkowska</p>\n\n<p><strong>Autorzy</strong>\nMarcin Kwietowicz, Michał Sikorski</p>\n\n<p><strong>Współpraca autorska</strong>\nAgnieszka Kołacińska</p>\n\n<p><strong>Konsultacje</strong>\nGrzegorz Gądek, Monika Wróbel\n(Fundacja Skwer Sportów Miejskich)</p>\n\n<p><strong>Konstrukcja</strong>\nDaniel Przybyłek</p>\n\n<p><strong>Wykonawca</strong>\nPalmett</p>\n\n<p><strong>Inwestor</strong>\nZarząd Zieleni m. st. Warszawy</p>\n\n<p><strong>Powierzchnia terenu</strong>\n2 500 m2</p>\n\n<p><strong>Powierzchnia zabudowy</strong>\n2 500 m2</p>\n\n<p><strong>Powierzchnia użytkowa</strong>\n2 500 m2</p>\n\n<p><strong>Powierzchnia całkowita</strong>\n2 500 m2</p>\n\n<p><strong>Projekt</strong>\n2017–2018</p>\n\n<p><strong>Realizacja</strong>\n2019</p>\n\n<p><strong>Koszt inwestycji</strong>\n1 600 000 PLN</p>\n\n<p>projekt zrealizowano w ramach budżetu obywatelskiego</p>\n\n<p><strong>Fotografie</strong>\nBłażej Pindor</p>', 68);
INSERT INTO`tbl_entries_data_15` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (26, 8, 'nazwa-realizacji-taras-w-parku-swietokrzyskim-adres-warszawa-park-swietokrzyski-ul-marszalkowska-autorzy-marcin-kwietowicz-michal-sikorski-wspolpraca-autorska-agnieszka-kolacinska-konsultacje-grzegorz-gadek-monika-wrobel-fundacja-skwer-sportow-miejskich-konstrukcja-daniel-przybylek-wykonawca-palmett-inwestor-zarzad-zieleni-m-st-warszawy-powierzchnia-terenu-2-500-m2-powierzchnia-zabudowy-2-500-m2-powierzchnia-uzytkowa-2-500-m2-powierzchnia-calkowita-2-500-m2-projekt-2017-2018-realizacja-2019-koszt-inwestycji-1-600-000-pln-projekt-zrealizowano-w-ramach-budzetu-obywatelskiego-fotografie-blazej-pindor', '**Nazwa realizacji**\r\nTaras w Parku Świętokrzyskim\r\n\r\n**Adres**\r\nWarszawa, Park Świętokrzyski, ul. Marszałkowska\r\n\r\n**Autorzy**\r\nMarcin Kwietowicz, Michał Sikorski\r\n\r\n**Współpraca autorska**\r\nAgnieszka Kołacińska\r\n\r\n**Konsultacje**\r\nGrzegorz Gądek, Monika Wróbel\r\n(Fundacja Skwer Sportów Miejskich)\r\n\r\nKonstrukcja\r\nDaniel Przybyłek\r\n\r\nWykonawca\r\nPalmett\r\n\r\n**Inwestor**\r\nZarząd Zieleni m. st. Warszawy\r\n\r\n**Powierzchnia terenu**\r\n2 500 m2\r\n\r\n**Powierzchnia zabudowy**\r\n2 500 m2\r\n\r\n**Powierzchnia użytkowa**\r\n2 500 m2\r\n\r\n**Powierzchnia całkowita**\r\n2 500 m2\r\n\r\n**Projekt**\r\n2017–2018\r\n\r\n**Realizacja**\r\n2019\r\n\r\n**Koszt inwestycji**\r\n1 600 000 PLN\r\n\r\nprojekt zrealizowano w ramach budżetu obywatelskiego\r\n\r\n**Fotografie**\r\nBłażej Pindor', '<p><strong>Nazwa realizacji</strong>\nTaras w Parku Świętokrzyskim</p>\n\n<p><strong>Adres</strong>\nWarszawa, Park Świętokrzyski, ul. Marszałkowska</p>\n\n<p><strong>Autorzy</strong>\nMarcin Kwietowicz, Michał Sikorski</p>\n\n<p><strong>Współpraca autorska</strong>\nAgnieszka Kołacińska</p>\n\n<p><strong>Konsultacje</strong>\nGrzegorz Gądek, Monika Wróbel\n(Fundacja Skwer Sportów Miejskich)</p>\n\n<p>Konstrukcja\nDaniel Przybyłek</p>\n\n<p>Wykonawca\nPalmett</p>\n\n<p><strong>Inwestor</strong>\nZarząd Zieleni m. st. Warszawy</p>\n\n<p><strong>Powierzchnia terenu</strong>\n2 500 m2</p>\n\n<p><strong>Powierzchnia zabudowy</strong>\n2 500 m2</p>\n\n<p><strong>Powierzchnia użytkowa</strong>\n2 500 m2</p>\n\n<p><strong>Powierzchnia całkowita</strong>\n2 500 m2</p>\n\n<p><strong>Projekt</strong>\n2017–2018</p>\n\n<p><strong>Realizacja</strong>\n2019</p>\n\n<p><strong>Koszt inwestycji</strong>\n1 600 000 PLN</p>\n\n<p>projekt zrealizowano w ramach budżetu obywatelskiego</p>\n\n<p><strong>Fotografie</strong>\nBłażej Pindor</p>', 68, 'nazwa-realizacji-taras-w-parku-swietokrzyskim-adres-warszawa-park-swietokrzyski-ul-marszalkowska-autorzy-marcin-kwietowicz-michal-sikorski-wspolpraca-autorska-agnieszka-kolacinska-konsultacje-grzegorz-gadek-monika-wrobel-fundacja-skwer-sportow-miejskich-konstrukcja-daniel-przybylek-wykonawca-palmett-inwestor-zarzad-zieleni-m-st-warszawy-powierzchnia-terenu-2-500-m2-powierzchnia-zabudowy-2-500-m2-powierzchnia-uzytkowa-2-500-m2-powierzchnia-calkowita-2-500-m2-projekt-2017-2018-realizacja-2019-koszt-inwestycji-1-600-000-pln-projekt-zrealizowano-w-ramach-budzetu-obywatelskiego-fotografie-blazej-pindor', '**Nazwa realizacji**\r\nTaras w Parku Świętokrzyskim\r\n\r\n**Adres**\r\nWarszawa, Park Świętokrzyski, ul. Marszałkowska\r\n\r\n**Autorzy**\r\nMarcin Kwietowicz, Michał Sikorski\r\n\r\n**Współpraca autorska**\r\nAgnieszka Kołacińska\r\n\r\n**Konsultacje**\r\nGrzegorz Gądek, Monika Wróbel\r\n(Fundacja Skwer Sportów Miejskich)\r\n\r\nKonstrukcja\r\nDaniel Przybyłek\r\n\r\nWykonawca\r\nPalmett\r\n\r\n**Inwestor**\r\nZarząd Zieleni m. st. Warszawy\r\n\r\n**Powierzchnia terenu**\r\n2 500 m2\r\n\r\n**Powierzchnia zabudowy**\r\n2 500 m2\r\n\r\n**Powierzchnia użytkowa**\r\n2 500 m2\r\n\r\n**Powierzchnia całkowita**\r\n2 500 m2\r\n\r\n**Projekt**\r\n2017–2018\r\n\r\n**Realizacja**\r\n2019\r\n\r\n**Koszt inwestycji**\r\n1 600 000 PLN\r\n\r\nprojekt zrealizowano w ramach budżetu obywatelskiego\r\n\r\n**Fotografie**\r\nBłażej Pindor', '<p><strong>Nazwa realizacji</strong>\nTaras w Parku Świętokrzyskim</p>\n\n<p><strong>Adres</strong>\nWarszawa, Park Świętokrzyski, ul. Marszałkowska</p>\n\n<p><strong>Autorzy</strong>\nMarcin Kwietowicz, Michał Sikorski</p>\n\n<p><strong>Współpraca autorska</strong>\nAgnieszka Kołacińska</p>\n\n<p><strong>Konsultacje</strong>\nGrzegorz Gądek, Monika Wróbel\n(Fundacja Skwer Sportów Miejskich)</p>\n\n<p>Konstrukcja\nDaniel Przybyłek</p>\n\n<p>Wykonawca\nPalmett</p>\n\n<p><strong>Inwestor</strong>\nZarząd Zieleni m. st. Warszawy</p>\n\n<p><strong>Powierzchnia terenu</strong>\n2 500 m2</p>\n\n<p><strong>Powierzchnia zabudowy</strong>\n2 500 m2</p>\n\n<p><strong>Powierzchnia użytkowa</strong>\n2 500 m2</p>\n\n<p><strong>Powierzchnia całkowita</strong>\n2 500 m2</p>\n\n<p><strong>Projekt</strong>\n2017–2018</p>\n\n<p><strong>Realizacja</strong>\n2019</p>\n\n<p><strong>Koszt inwestycji</strong>\n1 600 000 PLN</p>\n\n<p>projekt zrealizowano w ramach budżetu obywatelskiego</p>\n\n<p><strong>Fotografie</strong>\nBłażej Pindor</p>', 68, 'nazwa-realizacji-taras-w-parku-swietokrzyskim-adres-warszawa-park-swietokrzyski-ul-marszalkowska-autorzy-marcin-kwietowicz-michal-sikorski-wspolpraca-autorska-agnieszka-kolacinska-konsultacje-grzegorz-gadek-monika-wrobel-fundacja-skwer-sportow-miejskich-konstrukcja-daniel-przybylek-wykonawca-palmett-inwestor-zarzad-zieleni-m-st-warszawy-powierzchnia-terenu-2-500-m2-powierzchnia-zabudowy-2-500-m2-powierzchnia-uzytkowa-2-500-m2-powierzchnia-calkowita-2-500-m2-projekt-2017-2018-realizacja-2019-koszt-inwestycji-1-600-000-pln-projekt-zrealizowano-w-ramach-budzetu-obywatelskiego-fotografie-blazej-pindor', '**Nazwa realizacji**\r\nTaras w Parku Świętokrzyskim\r\n\r\n**Adres**\r\nWarszawa, Park Świętokrzyski, ul. Marszałkowska\r\n\r\n**Autorzy**\r\nMarcin Kwietowicz, Michał Sikorski\r\n\r\n**Współpraca autorska**\r\nAgnieszka Kołacińska\r\n\r\n**Konsultacje**\r\nGrzegorz Gądek, Monika Wróbel\r\n(Fundacja Skwer Sportów Miejskich)\r\n\r\nKonstrukcja\r\nDaniel Przybyłek\r\n\r\nWykonawca\r\nPalmett\r\n\r\n**Inwestor**\r\nZarząd Zieleni m. st. Warszawy\r\n\r\n**Powierzchnia terenu**\r\n2 500 m2\r\n\r\n**Powierzchnia zabudowy**\r\n2 500 m2\r\n\r\n**Powierzchnia użytkowa**\r\n2 500 m2\r\n\r\n**Powierzchnia całkowita**\r\n2 500 m2\r\n\r\n**Projekt**\r\n2017–2018\r\n\r\n**Realizacja**\r\n2019\r\n\r\n**Koszt inwestycji**\r\n1 600 000 PLN\r\n\r\nprojekt zrealizowano w ramach budżetu obywatelskiego\r\n\r\n**Fotografie**\r\nBłażej Pindor', '<p><strong>Nazwa realizacji</strong>\nTaras w Parku Świętokrzyskim</p>\n\n<p><strong>Adres</strong>\nWarszawa, Park Świętokrzyski, ul. Marszałkowska</p>\n\n<p><strong>Autorzy</strong>\nMarcin Kwietowicz, Michał Sikorski</p>\n\n<p><strong>Współpraca autorska</strong>\nAgnieszka Kołacińska</p>\n\n<p><strong>Konsultacje</strong>\nGrzegorz Gądek, Monika Wróbel\n(Fundacja Skwer Sportów Miejskich)</p>\n\n<p>Konstrukcja\nDaniel Przybyłek</p>\n\n<p>Wykonawca\nPalmett</p>\n\n<p><strong>Inwestor</strong>\nZarząd Zieleni m. st. Warszawy</p>\n\n<p><strong>Powierzchnia terenu</strong>\n2 500 m2</p>\n\n<p><strong>Powierzchnia zabudowy</strong>\n2 500 m2</p>\n\n<p><strong>Powierzchnia użytkowa</strong>\n2 500 m2</p>\n\n<p><strong>Powierzchnia całkowita</strong>\n2 500 m2</p>\n\n<p><strong>Projekt</strong>\n2017–2018</p>\n\n<p><strong>Realizacja</strong>\n2019</p>\n\n<p><strong>Koszt inwestycji</strong>\n1 600 000 PLN</p>\n\n<p>projekt zrealizowano w ramach budżetu obywatelskiego</p>\n\n<p><strong>Fotografie</strong>\nBłażej Pindor</p>', 68);

-- *** STRUCTURE:`tbl_entries_data_16` ***
DROP TABLE IF EXISTS`tbl_entries_data_16`;
CREATE TABLE`tbl_entries_data_16` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `value_formatted` text COLLATE utf8_unicode_ci,
  `word_count` int(11) unsigned DEFAULT NULL,
  `handle-en` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-en` text COLLATE utf8_unicode_ci,
  `value_formatted-en` text COLLATE utf8_unicode_ci,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `handle-pl` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-pl` text COLLATE utf8_unicode_ci,
  `value_formatted-pl` text COLLATE utf8_unicode_ci,
  `word_count-pl` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle-en` (`handle-en`(333)),
  KEY `handle-pl` (`handle-pl`(333)),
  KEY `handle` (`handle`(333)),
  FULLTEXT KEY `value-en` (`value-en`),
  FULLTEXT KEY `value_formatted-en` (`value_formatted-en`),
  FULLTEXT KEY `value-pl` (`value-pl`),
  FULLTEXT KEY `value_formatted-pl` (`value_formatted-pl`),
  FULLTEXT KEY `value` (`value`),
  FULLTEXT KEY `value_formatted` (`value_formatted`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_16` ***
INSERT INTO`tbl_entries_data_16` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (8, 2, 'wnetrza', 'Wnętrza', 'Wnętrza', 1, 'interior', 'Interior', 'Interior', 1, 'wnetrza', 'Wnętrza', 'Wnętrza', 1);
INSERT INTO`tbl_entries_data_16` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (9, 3, 'wystawy', 'Wystawy', 'Wystawy', 1, 'exhibition', 'Exhibition', 'Exhibition', 1, 'wystawy', 'Wystawy', 'Wystawy', 1);
INSERT INTO`tbl_entries_data_16` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (10, 4, 'inne', 'Inne', 'Inne', 1, 'more', 'More', 'More', 1, 'inne', 'Inne', 'Inne', 1);
INSERT INTO`tbl_entries_data_16` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (7, 5, 'architektura', 'Architektura', 'Architektura', 1, 'architecture', 'Architecture', 'Architecture', 1, 'architektura', 'Architektura', 'Architektura', 1);

-- *** STRUCTURE:`tbl_entries_data_17` ***
DROP TABLE IF EXISTS`tbl_entries_data_17`;
CREATE TABLE`tbl_entries_data_17` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- *** DATA:`tbl_entries_data_17` ***
INSERT INTO`tbl_entries_data_17` (`id`, `entry_id`, `value`) VALUES (7, 3, 3);
INSERT INTO`tbl_entries_data_17` (`id`, `entry_id`, `value`) VALUES (6, 2, 2);
INSERT INTO`tbl_entries_data_17` (`id`, `entry_id`, `value`) VALUES (8, 4, 4);
INSERT INTO`tbl_entries_data_17` (`id`, `entry_id`, `value`) VALUES (5, 5, 1);

-- *** STRUCTURE:`tbl_entries_data_18` ***
DROP TABLE IF EXISTS`tbl_entries_data_18`;
CREATE TABLE`tbl_entries_data_18` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

-- *** DATA:`tbl_entries_data_18` ***
INSERT INTO`tbl_entries_data_18` (`id`, `entry_id`, `value`) VALUES (25, 6, 1);
INSERT INTO`tbl_entries_data_18` (`id`, `entry_id`, `value`) VALUES (29, 7, 2);
INSERT INTO`tbl_entries_data_18` (`id`, `entry_id`, `value`) VALUES (26, 8, 3);

-- *** STRUCTURE:`tbl_entries_data_19` ***
DROP TABLE IF EXISTS`tbl_entries_data_19`;
CREATE TABLE`tbl_entries_data_19` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_19` ***
INSERT INTO`tbl_entries_data_19` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (25, 6, 'ewsho6nuyaebbi0-1611153636.jpg', 372619, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2021-01-20T15:40:36+01:00\";s:5:\"width\";i:1080;s:6:\"height\";i:1080;}');
INSERT INTO`tbl_entries_data_19` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (29, 7, '15235553_10211026219630875_681127199330396107_o-1611247872.jpg', 120552, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2021-01-21T17:51:12+01:00\";s:5:\"width\";i:720;s:6:\"height\";i:1080;}');
INSERT INTO`tbl_entries_data_19` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (26, 8, '12240440_10207783486764580_7512170331505058673_o-1611248023.jpg', 87178, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2021-01-21T17:53:43+01:00\";s:5:\"width\";i:657;s:6:\"height\";i:985;}');

-- *** STRUCTURE:`tbl_entries_data_20` ***
DROP TABLE IF EXISTS`tbl_entries_data_20`;
CREATE TABLE`tbl_entries_data_20` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM AUTO_INCREMENT=253 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_20` ***
INSERT INTO`tbl_entries_data_20` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (206, 6, 'ewsho6pvcaafnmn.jpg', 185508, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2021-01-20T15:39:21+01:00\";s:5:\"width\";i:1029;s:6:\"height\";i:1029;}');
INSERT INTO`tbl_entries_data_20` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (205, 6, 'ewsho6nuyaebbi0.jpg', 1045283, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2021-01-20T15:39:17+01:00\";s:5:\"width\";i:2048;s:6:\"height\";i:2048;}');
INSERT INTO`tbl_entries_data_20` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (252, 7, '15259556_10211026215510772_3104226320057128075_o.jpg', 147231, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2021-01-21T17:49:04+01:00\";s:5:\"width\";i:1480;s:6:\"height\";i:833;}');
INSERT INTO`tbl_entries_data_20` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (251, 7, '15252743_10211026212150688_7304196682968778287_o.jpg', 73427, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2021-01-21T17:49:03+01:00\";s:5:\"width\";i:1471;s:6:\"height\";i:981;}');
INSERT INTO`tbl_entries_data_20` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (250, 7, '15250849_10211026215110762_4499416405088423070_o.jpg', 149690, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2021-01-21T17:49:01+01:00\";s:5:\"width\";i:1325;s:6:\"height\";i:883;}');
INSERT INTO`tbl_entries_data_20` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (249, 7, '15235649_10211026210550648_1325779086959950731_o.jpg', 63566, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2021-01-21T17:49:00+01:00\";s:5:\"width\";i:1343;s:6:\"height\";i:896;}');
INSERT INTO`tbl_entries_data_20` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (248, 7, '15235553_10211026219630875_681127199330396107_o.jpg', 146868, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2021-01-21T17:48:58+01:00\";s:5:\"width\";i:940;s:6:\"height\";i:1410;}');
INSERT INTO`tbl_entries_data_20` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (247, 7, '15168736_10211026214590749_7819470355070025539_o.jpg', 78682, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2021-01-21T17:48:56+01:00\";s:5:\"width\";i:1425;s:6:\"height\";i:950;}');
INSERT INTO`tbl_entries_data_20` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (246, 7, '15157036_10211026227871081_4470090408041371349_o.jpg', 69619, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2021-01-21T17:48:54+01:00\";s:5:\"width\";i:1024;s:6:\"height\";i:576;}');
INSERT INTO`tbl_entries_data_20` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (245, 7, '15156949_10211026213230715_1189947431416550790_o.jpg', 65013, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2021-01-21T17:48:52+01:00\";s:5:\"width\";i:1477;s:6:\"height\";i:831;}');
INSERT INTO`tbl_entries_data_20` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (244, 7, '15138458_10211026208390594_3870738073583917324_o.jpg', 149207, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2021-01-21T17:48:50+01:00\";s:5:\"width\";i:1495;s:6:\"height\";i:841;}');
INSERT INTO`tbl_entries_data_20` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (243, 7, '15137612_10211026208510597_7945757716642992980_o.jpg', 113660, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2021-01-21T17:48:48+01:00\";s:5:\"width\";i:1480;s:6:\"height\";i:987;}');
INSERT INTO`tbl_entries_data_20` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (242, 7, '15137455_10211026226631050_5353300994144219066_o.jpg', 97015, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2021-01-21T17:48:46+01:00\";s:5:\"width\";i:1506;s:6:\"height\";i:847;}');
INSERT INTO`tbl_entries_data_20` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (241, 7, '14976633_10211026229271116_2171095035459483992_o.jpg', 88099, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2021-01-21T17:48:43+01:00\";s:5:\"width\";i:1024;s:6:\"height\";i:683;}');
INSERT INTO`tbl_entries_data_20` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (216, 8, '12244707_10207783487964610_5479445310785737970_o.jpg', 57544, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2021-01-21T17:52:27+01:00\";s:5:\"width\";i:657;s:6:\"height\";i:985;}');
INSERT INTO`tbl_entries_data_20` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (215, 8, '12244707_10207783486444572_6934967137601557196_o.jpg', 35629, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2021-01-21T17:52:27+01:00\";s:5:\"width\";i:985;s:6:\"height\";i:657;}');
INSERT INTO`tbl_entries_data_20` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (214, 8, '12244672_10207783487364595_719263073542451220_o.jpg', 91023, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2021-01-21T17:52:27+01:00\";s:5:\"width\";i:985;s:6:\"height\";i:657;}');
INSERT INTO`tbl_entries_data_20` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (213, 8, '12244540_10207783485524549_2706925304864839096_o.jpg', 56680, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2021-01-21T17:52:27+01:00\";s:5:\"width\";i:657;s:6:\"height\";i:985;}');
INSERT INTO`tbl_entries_data_20` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (212, 8, '12240884_10207783485644552_5738968813581298213_o.jpg', 65902, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2021-01-21T17:52:28+01:00\";s:5:\"width\";i:985;s:6:\"height\";i:657;}');
INSERT INTO`tbl_entries_data_20` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (211, 8, '12240440_10207783486764580_7512170331505058673_o.jpg', 87178, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2021-01-21T17:52:27+01:00\";s:5:\"width\";i:657;s:6:\"height\";i:985;}');
INSERT INTO`tbl_entries_data_20` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (210, 8, '12240406_10207783485564550_2483430142074473005_o.jpg', 33909, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2021-01-21T17:52:27+01:00\";s:5:\"width\";i:985;s:6:\"height\";i:657;}');
INSERT INTO`tbl_entries_data_20` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (209, 8, '12238418_10207783486524574_8510523767521393722_o.jpg', 41213, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2021-01-21T17:52:27+01:00\";s:5:\"width\";i:985;s:6:\"height\";i:657;}');
INSERT INTO`tbl_entries_data_20` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (208, 8, '12238085_10207783487284593_6948493480092170143_o.jpg', 86877, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2021-01-21T17:52:27+01:00\";s:5:\"width\";i:985;s:6:\"height\";i:657;}');
INSERT INTO`tbl_entries_data_20` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (207, 8, '11059685_10207783486124564_2244909952068780291_o.jpg', 54714, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2021-01-21T17:52:27+01:00\";s:5:\"width\";i:657;s:6:\"height\";i:985;}');

-- *** STRUCTURE:`tbl_entries_data_22` ***
DROP TABLE IF EXISTS`tbl_entries_data_22`;
CREATE TABLE`tbl_entries_data_22` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_22` ***
INSERT INTO`tbl_entries_data_22` (`id`, `entry_id`, `relation_id`) VALUES (21, 7, 5);
INSERT INTO`tbl_entries_data_22` (`id`, `entry_id`, `relation_id`) VALUES (18, 8, 2);
INSERT INTO`tbl_entries_data_22` (`id`, `entry_id`, `relation_id`) VALUES (17, 6, 5);

-- *** STRUCTURE:`tbl_entries_data_23` ***
DROP TABLE IF EXISTS`tbl_entries_data_23`;
CREATE TABLE`tbl_entries_data_23` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `value_formatted` text COLLATE utf8_unicode_ci,
  `word_count` int(11) unsigned DEFAULT NULL,
  `handle-en` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-en` text COLLATE utf8_unicode_ci,
  `value_formatted-en` text COLLATE utf8_unicode_ci,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `handle-pl` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-pl` text COLLATE utf8_unicode_ci,
  `value_formatted-pl` text COLLATE utf8_unicode_ci,
  `word_count-pl` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle-en` (`handle-en`(333)),
  KEY `handle-pl` (`handle-pl`(333)),
  KEY `handle` (`handle`(333)),
  FULLTEXT KEY `value-en` (`value-en`),
  FULLTEXT KEY `value_formatted-en` (`value_formatted-en`),
  FULLTEXT KEY `value-pl` (`value-pl`),
  FULLTEXT KEY `value_formatted-pl` (`value_formatted-pl`),
  FULLTEXT KEY `value` (`value`),
  FULLTEXT KEY `value_formatted` (`value_formatted`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_23` ***
INSERT INTO`tbl_entries_data_23` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (3, 9, 'marcin-kwietowicz-potem-podrapal-sie-w-glowe-i-dodal-konstantemu-makaryczowi-zadowolony-ze-mu-nikt-nie-przeszkodzil-w-pisaniu-wlozyl-czapke-i-nie-narzucajac-na-siebie-kozuszka-w-koszulinie-tylko-wybiegl-na-ulice-subiekci-ze-sklepu-miesnego-ktorych-rozpytywal-poprzedniego-dnia-powiedzieli-mu-ze-listy-wrzuca-sie-do-skrzynek-pocztowych-a-ze-skrzynek-zostaja-rozwozone-po-calym-kraju-na-trojkach-pocztowych-z-pijanymi-woznicami-i-dzwiecznymi-dzwonkami-wanka-dobiegl-do-pierwszej-skrzynki-pocztowej-i-wsunal-cenny-list-do-otworu-ukolysany-slodkimi-nadziejami-w-godzine-pozniej-spal-mocno-snil-mu-sie-piec-na-piecu-siedzi-dziadek-ze-spuszczonymi-bosymi-nogami-i-czyta-list-kucharkom-kolo-pieca-chodzi-piskorz-i-kreci-ogonem', '**Marcin Kwietowicz**\r\n\r\nPotem podrapał się w głowę i dodał: „Konstantemu Makaryczowi”. Zadowolony, że mu nikt nie przeszkodził w pisaniu, włożył czapkę i nie narzucając na siebie kożuszka, w koszulinie tylko wybiegł na ulicę…\r\n\r\nSubiekci ze sklepu mięsnego, których rozpytywał poprzedniego dnia, powiedzieli mu, że listy wrzuca się do skrzynek pocztowych, a ze skrzynek zostają rozwożone po całym kraju na trójkach pocztowych z pijanymi woźnicami i dźwięcznymi dzwonkami. Wańka dobiegł do pierwszej skrzynki pocztowej i wsunął cenny list do otworu. Ukołysany słodkimi nadziejami w godzinę później, spał mocno. Śnił mu się piec. Na piecu siedzi dziadek ze spuszczonymi bosymi nogami i czyta list kucharkom. Koło pieca chodzi „Piskorz” i kręci ogonem…', '<p><strong>Marcin Kwietowicz</strong></p>\n\n<p>Potem podrapał się w głowę i dodał: „Konstantemu Makaryczowi”. Zadowolony, że mu nikt nie przeszkodził w pisaniu, włożył czapkę i nie narzucając na siebie kożuszka, w koszulinie tylko wybiegł na ulicę…</p>\n\n<p>Subiekci ze sklepu mięsnego, których rozpytywał poprzedniego dnia, powiedzieli mu, że listy wrzuca się do skrzynek pocztowych, a ze skrzynek zostają rozwożone po całym kraju na trójkach pocztowych z pijanymi woźnicami i dźwięcznymi dzwonkami. Wańka dobiegł do pierwszej skrzynki pocztowej i wsunął cenny list do otworu. Ukołysany słodkimi nadziejami w godzinę później, spał mocno. Śnił mu się piec. Na piecu siedzi dziadek ze spuszczonymi bosymi nogami i czyta list kucharkom. Koło pieca chodzi „Piskorz” i kręci ogonem…</p>', 110, NULL, NULL, NULL, 0, 'marcin-kwietowicz-potem-podrapal-sie-w-glowe-i-dodal-konstantemu-makaryczowi-zadowolony-ze-mu-nikt-nie-przeszkodzil-w-pisaniu-wlozyl-czapke-i-nie-narzucajac-na-siebie-kozuszka-w-koszulinie-tylko-wybiegl-na-ulice-subiekci-ze-sklepu-miesnego-ktorych-rozpytywal-poprzedniego-dnia-powiedzieli-mu-ze-listy-wrzuca-sie-do-skrzynek-pocztowych-a-ze-skrzynek-zostaja-rozwozone-po-calym-kraju-na-trojkach-pocztowych-z-pijanymi-woznicami-i-dzwiecznymi-dzwonkami-wanka-dobiegl-do-pierwszej-skrzynki-pocztowej-i-wsunal-cenny-list-do-otworu-ukolysany-slodkimi-nadziejami-w-godzine-pozniej-spal-mocno-snil-mu-sie-piec-na-piecu-siedzi-dziadek-ze-spuszczonymi-bosymi-nogami-i-czyta-list-kucharkom-kolo-pieca-chodzi-piskorz-i-kreci-ogonem', '**Marcin Kwietowicz**\r\n\r\nPotem podrapał się w głowę i dodał: „Konstantemu Makaryczowi”. Zadowolony, że mu nikt nie przeszkodził w pisaniu, włożył czapkę i nie narzucając na siebie kożuszka, w koszulinie tylko wybiegł na ulicę…\r\n\r\nSubiekci ze sklepu mięsnego, których rozpytywał poprzedniego dnia, powiedzieli mu, że listy wrzuca się do skrzynek pocztowych, a ze skrzynek zostają rozwożone po całym kraju na trójkach pocztowych z pijanymi woźnicami i dźwięcznymi dzwonkami. Wańka dobiegł do pierwszej skrzynki pocztowej i wsunął cenny list do otworu. Ukołysany słodkimi nadziejami w godzinę później, spał mocno. Śnił mu się piec. Na piecu siedzi dziadek ze spuszczonymi bosymi nogami i czyta list kucharkom. Koło pieca chodzi „Piskorz” i kręci ogonem…', '<p><strong>Marcin Kwietowicz</strong></p>\n\n<p>Potem podrapał się w głowę i dodał: „Konstantemu Makaryczowi”. Zadowolony, że mu nikt nie przeszkodził w pisaniu, włożył czapkę i nie narzucając na siebie kożuszka, w koszulinie tylko wybiegł na ulicę…</p>\n\n<p>Subiekci ze sklepu mięsnego, których rozpytywał poprzedniego dnia, powiedzieli mu, że listy wrzuca się do skrzynek pocztowych, a ze skrzynek zostają rozwożone po całym kraju na trójkach pocztowych z pijanymi woźnicami i dźwięcznymi dzwonkami. Wańka dobiegł do pierwszej skrzynki pocztowej i wsunął cenny list do otworu. Ukołysany słodkimi nadziejami w godzinę później, spał mocno. Śnił mu się piec. Na piecu siedzi dziadek ze spuszczonymi bosymi nogami i czyta list kucharkom. Koło pieca chodzi „Piskorz” i kręci ogonem…</p>', 110);

-- *** STRUCTURE:`tbl_entries_data_24` ***
DROP TABLE IF EXISTS`tbl_entries_data_24`;
CREATE TABLE`tbl_entries_data_24` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_24` ***
INSERT INTO`tbl_entries_data_24` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (3, 9, 'web_marcinkwietowicz_09-1611256536.jpg', 248310, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2021-01-21T20:15:36+01:00\";s:5:\"width\";i:667;s:6:\"height\";i:1000;}');

-- *** STRUCTURE:`tbl_entries_data_25` ***
DROP TABLE IF EXISTS`tbl_entries_data_25`;
CREATE TABLE`tbl_entries_data_25` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `value_formatted` text COLLATE utf8_unicode_ci,
  `word_count` int(11) unsigned DEFAULT NULL,
  `handle-en` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-en` text COLLATE utf8_unicode_ci,
  `value_formatted-en` text COLLATE utf8_unicode_ci,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `handle-pl` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-pl` text COLLATE utf8_unicode_ci,
  `value_formatted-pl` text COLLATE utf8_unicode_ci,
  `word_count-pl` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle-en` (`handle-en`(333)),
  KEY `handle-pl` (`handle-pl`(333)),
  KEY `handle` (`handle`(333)),
  FULLTEXT KEY `value-en` (`value-en`),
  FULLTEXT KEY `value_formatted-en` (`value_formatted-en`),
  FULLTEXT KEY `value-pl` (`value-pl`),
  FULLTEXT KEY `value_formatted-pl` (`value_formatted-pl`),
  FULLTEXT KEY `value` (`value`),
  FULLTEXT KEY `value_formatted` (`value_formatted`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_25` ***
INSERT INTO`tbl_entries_data_25` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (3, 9, 'autor-foty', 'Autor foty', 'Autor foty', 2, NULL, NULL, NULL, 0, 'autor-foty', 'Autor foty', 'Autor foty', 2);

-- *** STRUCTURE:`tbl_entries_data_27` ***
DROP TABLE IF EXISTS`tbl_entries_data_27`;
CREATE TABLE`tbl_entries_data_27` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_27` ***
INSERT INTO`tbl_entries_data_27` (`id`, `entry_id`, `value`) VALUES (15, 7, 'yes');
INSERT INTO`tbl_entries_data_27` (`id`, `entry_id`, `value`) VALUES (12, 8, 'yes');
INSERT INTO`tbl_entries_data_27` (`id`, `entry_id`, `value`) VALUES (11, 6, 'yes');

-- *** STRUCTURE:`tbl_entries_data_28` ***
DROP TABLE IF EXISTS`tbl_entries_data_28`;
CREATE TABLE`tbl_entries_data_28` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`),
  KEY `date` (`date`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_28` ***
INSERT INTO`tbl_entries_data_28` (`id`, `entry_id`, `value`, `date`) VALUES (7, 8, '2021-02-03T15:35:06+01:00', '2021-02-03 14:35:06');
INSERT INTO`tbl_entries_data_28` (`id`, `entry_id`, `value`, `date`) VALUES (10, 7, '2021-01-29T16:17:38+01:00', '2021-01-29 15:17:38');
INSERT INTO`tbl_entries_data_28` (`id`, `entry_id`, `value`, `date`) VALUES (6, 6, '2020-09-15T15:32:59+02:00', '2020-09-15 13:32:59');

-- *** DATA:`tbl_anti_brute_force` ***

-- *** DATA:`tbl_anti_brute_force_bl` ***

-- *** DATA:`tbl_anti_brute_force_gl` ***

-- *** DATA:`tbl_anti_brute_force_wl` ***

-- *** DATA:`tbl_entries` ***
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (2, 3, 1, 1, '2021-01-20 15:13:43', '2021-01-20 14:13:43', '2021-01-28 10:24:12', '2021-01-28 09:24:12');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (3, 3, 1, 1, '2021-01-20 15:14:03', '2021-01-20 14:14:03', '2021-01-28 10:24:25', '2021-01-28 09:24:25');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (4, 3, 1, 1, '2021-01-20 15:16:03', '2021-01-20 14:16:03', '2021-01-28 10:24:39', '2021-01-28 09:24:39');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (5, 3, 1, 1, '2021-01-20 15:16:43', '2021-01-20 14:16:43', '2021-01-28 10:23:59', '2021-01-28 09:23:59');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (6, 2, 1, 1, '2021-01-20 15:40:36', '2021-01-20 14:40:36', '2021-01-29 15:33:12', '2021-01-29 14:33:12');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (7, 2, 1, 1, '2021-01-21 17:51:12', '2021-01-21 16:51:12', '2021-02-22 16:17:38', '2021-02-22 15:17:38');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (8, 2, 1, 1, '2021-01-21 17:53:43', '2021-01-21 16:53:43', '2021-01-29 15:35:06', '2021-01-29 14:35:06');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (9, 4, 1, 1, '2021-01-21 20:15:36', '2021-01-21 19:15:36', '2021-01-28 18:28:18', '2021-01-28 17:28:18');

-- *** DATA:`tbl_extensions` ***
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (1, 'xssfilter', 'enabled', '1.5.0');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (2, 'debugdevkit', 'enabled', '1.3.4');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (3, 'export_ensemble', 'enabled', '2.2.1');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (4, 'html5_doctype', 'enabled', '1.3.5');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (5, 'jit_image_manipulation', 'enabled', 1.47);
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (6, 'maintenance_mode', 'enabled', '1.9.4');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (7, 'markdown', 'enabled', 1.21);
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (8, 'profiledevkit', 'enabled', '1.5.2');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (9, 'ajax_checkbox', 'enabled', '1.5.0');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (10, 'anti_brute_force', 'enabled', '2.2.0');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (11, 'cache_management', 'enabled', '1.3.4');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (12, 'order_entries', 'enabled', '2.3.9');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (13, 'selectbox_link_field', 'enabled', '2.0.2');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (14, 'simplemde', 'enabled', '1.0.3');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (15, 'tracker', 'enabled', '2.1.2');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (32, 'multilingual_selectbox_link_field', 'enabled', '1.1.0');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (17, 'publishbutton', 'enabled', '1.2.2');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (18, 'flang_detection_gtlds', 'enabled', '2.0.0');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (19, 'languages', 'enabled', '1.2.2');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (20, 'frontend_localisation', 'enabled', '2.7.3');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (23, 'limit_section_entries', 'enabled', '1.2.2');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (22, 'publish_tabs', 'enabled', '1.3.2');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (25, 'multilingual_field', 'enabled', '3.5.20');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (26, 'textboxfield', 'enabled', '2.8.3');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (27, 'save_and_return', 'enabled', '1.8.2');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (28, 'multiuploadfield', 'enabled', '1.6.2');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (29, 'image_upload', 'enabled', '1.6.6');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (30, 'image_index_preview', 'enabled', '1.4.3');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (33, 'page_lhandles', 'enabled', '2.11.3');

-- *** DATA:`tbl_extensions_delegates` ***
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (1, 1, '/blueprints/events/', 'AppendEventFilterDocumentation', 'appendEventFilterDocumentation');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (2, 1, '/blueprints/events/new/', 'AppendEventFilter', 'appendEventFilter');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (3, 1, '/blueprints/events/edit/', 'AppendEventFilter', 'appendEventFilter');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (4, 1, '/frontend/', 'EventPreSaveFilter', 'eventPreSaveFilter');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (5, 1, '/frontend/', 'FrontendParamsResolve', 'frontendParamsResolve');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (6, 2, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (7, 2, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (8, 3, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (130, 4, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (129, 4, '/frontend/', 'FrontendPageResolved', 'setRenderTrigger');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (128, 4, '/frontend/', 'FrontendOutputPostGenerate', 'parse_html');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (12, 5, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (13, 5, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (14, 6, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (15, 6, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (16, 6, '/system/preferences/', 'CustomActions', '__toggleMaintenanceMode');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (17, 6, '/backend/', 'AppendPageAlert', '__appendAlert');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (18, 6, '/blueprints/pages/', 'AppendPageContent', '__appendType');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (19, 6, '/frontend/', 'FrontendPrePageResolve', '__checkForMaintenanceMode');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (20, 6, '/frontend/', 'FrontendParamsResolve', '__addParam');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (21, 8, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (22, 8, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (23, 9, '/backend/', 'InitaliseAdminPageHead', 'appendToHead');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (24, 10, '/login/', 'AuthorLoginFailure', 'authorLoginFailure');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (25, 10, '/login/', 'AuthorLoginSuccess', 'authorLoginSuccess');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (26, 10, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'addCustomPreferenceFieldsets');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (27, 10, '/system/preferences/', 'Save', 'save');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (28, 10, '/backend/', 'AdminPagePreGenerate', 'adminPagePreGenerate');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (29, 10, '/backend/', 'InitialiseAdminPageHead', 'initialiseAdminPageHead');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (30, 10, '/backend/', 'AppendPageAlert', 'appendPageAlert');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (31, 11, '/backend/', 'NavigationPreRender', 'navigationPreRender');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (32, 12, '/backend/', 'InitialiseAdminPageHead', 'prepareIndex');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (33, 12, '/backend/', 'AdminPagePreGenerate', 'adjustTable');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (34, 12, '/backend/', 'AdminPagePostGenerate', 'resetPagination');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (35, 12, '/frontend/', 'DataSourcePreExecute', 'saveFilterContext');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (36, 14, '/backend/', 'InitaliseAdminPageHead', 'appendAssets');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (37, 15, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (38, 15, '/system/preferences/', 'CustomActions', 'savePreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (39, 15, '/publish/new/', 'EntryPostCreate', 'parseEntryAction');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (40, 15, '/publish/edit/', 'EntryPostEdit', 'parseEntryAction');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (41, 15, '/publish/', 'EntryPreDelete', 'parseEntryAction');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (42, 15, '/frontend/', 'EventPostSaveFilter', 'parseEventSave');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (43, 15, '/blueprints/pages/', 'PagePostCreate', 'parsePageAction');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (44, 15, '/blueprints/pages/', 'PagePostEdit', 'parsePageAction');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (45, 15, '/blueprints/pages/', 'PagePreDelete', 'parsePageAction');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (46, 15, '/blueprints/events/', 'EventPostCreate', 'parseEventAction');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (47, 15, '/blueprints/events/', 'EventPostEdit', 'parseEventAction');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (48, 15, '/blueprints/events/', 'EventPreDelete', 'parseEventAction');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (49, 15, '/blueprints/datasources/', 'DatasourcePostCreate', 'parseDatasourceAction');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (50, 15, '/blueprints/datasources/', 'DatasourcePostEdit', 'parseDatasourceAction');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (51, 15, '/blueprints/datasources/', 'DatasourcePreDelete', 'parseDatasourceAction');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (52, 15, '/blueprints/utilities/', 'UtilityPostCreate', 'parseUtilityAction');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (53, 15, '/blueprints/utilities/', 'UtilityPostEdit', 'parseUtilityAction');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (54, 15, '/blueprints/utilities/', 'UtilityPreDelete', 'parseUtilityAction');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (55, 15, '/blueprints/sections/', 'SectionPostCreate', 'parseSectionAction');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (56, 15, '/blueprints/sections/', 'SectionPostEdit', 'parseSectionAction');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (57, 15, '/blueprints/sections/', 'SectionPreDelete', 'parseSectionAction');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (58, 15, '/system/authors/', 'AuthorPostCreate', 'parseAuthorAction');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (59, 15, '/system/authors/', 'AuthorPostEdit', 'parseAuthorAction');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (60, 15, '/system/authors/', 'AuthorPreDelete', 'parseAuthorAction');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (61, 15, '/system/extensions/', 'ExtensionPreEnable', 'parseExtensionAction');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (62, 15, '/system/extensions/', 'ExtensionPreDisable', 'parseExtensionAction');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (63, 15, '/system/extensions/', 'ExtensionPreUninstall', 'parseExtensionAction');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (64, 15, '/system/preferences/', 'Save', 'parsePreferencesSave');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (65, 15, '/login/', 'AuthorLoginFailure', 'parseLogin');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (66, 15, '/login/', 'AuthorLoginSuccess', 'parseLogin');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (67, 15, '/login/', 'AuthorPostPasswordResetSuccess', 'parsePasswordAction');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (68, 15, '/login/', 'AuthorPostPasswordResetFailure', 'parsePasswordAction');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (69, 15, '/login/', 'AuthorPostPasswordChange', 'parsePasswordAction');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (70, 15, '/login/', 'AuthorPostPasswordResetRequest', 'parsePasswordAction');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (71, 15, '/frontend/', 'MembersPostLogin', 'parseMembersLogin');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (72, 15, '/frontend/', 'MembersLoginFailure', 'parseMembersLoginFailure');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (73, 15, '/frontend/', 'MembersPostActivation', 'parseMembersPostActivation');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (74, 15, '/frontend/', 'MembersPostForgotPassword', 'parseMembersPostForgotPassword');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (75, 15, '/frontend/', 'MembersPostRegenerateActivationCode', 'parseMembersPostRegenerateActivationCode');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (76, 15, '/frontend/', 'MembersPostResetPassword', 'parseMembersPostResetPassword');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (77, 15, '/frontend/', 'MembersPasswordResetFailure', 'parseMembersPasswordResetFailure');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (78, 15, '/backend/', 'DashboardPanelRender', 'renderPanel');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (79, 15, '/backend/', 'DashboardPanelOptions', 'dashboardPanelOptions');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (80, 15, '/backend/', 'DashboardPanelTypes', 'dashboardPanelTypes');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (119, 33, '/frontend/', 'FrontendPrePageResolve', 'dFrontendPrePageResolve');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (83, 17, '/backend/', 'InitaliseAdminPageHead', 'appendPageHead');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (117, 18, '/extensions/frontend_localisation/', 'FLSavePreferences', 'dFLSavePreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (85, 19, '/frontend/', 'ManageEXSLFunctions', 'dManageEXSLFunctions');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (86, 20, '/frontend/', 'FrontendInitialised', 'dFrontendInitialised');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (87, 20, '/frontend/', 'FrontendParamsPostResolve', 'dFrontendParamsPostResolve');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (88, 20, '/backend/', 'AdminPagePreBuild', 'dAdminPagePreBuild');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (89, 20, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'dAddCustomPreferenceFieldsets');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (90, 20, '/system/preferences/', 'Save', 'dSave');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (97, 23, '/backend/', 'AdminPagePreGenerate', 'dAdminPagePreGenerate');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (96, 23, '/backend/', 'AppendPageAlert', 'dAppendPageAlert');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (95, 23, '/backend/', 'InitaliseAdminPageHead', 'dInitaliseAdminPageHead');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (94, 22, '/backend/', 'InitaliseAdminPageHead', 'initializeAdmin');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (98, 23, '/blueprints/sections/', 'AddSectionElements', 'dAddSectionElements');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (99, 23, '/blueprints/sections/', 'SectionPreCreate', 'dSaveSectionSettings');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (100, 23, '/blueprints/sections/', 'SectionPreEdit', 'dSaveSectionSettings');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (108, 25, '/system/preferences/', 'Save', 'dSave');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (109, 25, '/extensions/frontend_localisation/', 'FLSavePreferences', 'dFLSavePreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (107, 25, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'dAddCustomPreferenceFieldsets');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (110, 27, '/backend/', 'InitaliseAdminPageHead', 'appendJS');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (111, 27, '/backend/', 'AdminPagePreGenerate', 'appendElement');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (112, 27, '/publish/edit/', 'EntryPostEdit', 'entryPostEdit');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (113, 27, '/publish/new/', 'EntryPostCreate', 'entryPostEdit');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (114, 30, '/backend/', 'InitaliseAdminPageHead', 'InitaliseAdminPageHead');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (118, 33, '/blueprints/pages/', 'AppendPageContent', 'dAppendPageContent');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (120, 33, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'dAddCustomPreferenceFieldsets');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (121, 33, '/system/preferences/', 'CustomActions', 'dCustomActions');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (122, 33, '/extensions/frontend_localisation/', 'FLSavePreferences', 'dFLSavePreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (123, 33, '/backend/', 'AppendPageAlert', 'dAppendPageAlert');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (124, 33, '/blueprints/datasources/', 'DatasourcePreCreate', 'dDatasourceNavigation');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (125, 33, '/blueprints/datasources/', 'DatasourcePreEdit', 'dDatasourceNavigation');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (126, 33, '/blueprints/pages/', 'PagePreCreate', 'dPagePre');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (127, 33, '/blueprints/pages/', 'PagePreEdit', 'dPagePre');

-- *** DATA:`tbl_fields` ***
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (22, 'Kategoria', 'category', 'multilingual_selectbox_link', 2, 'yes', 2, 'sidebar', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (11, 'Tytuł', 'title', 'multilingual_textbox', 2, 'no', 0, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (12, 'Data', 'date', 'multilingual_textbox', 2, 'no', 4, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (24, 'Portret', 'image', 'image_upload', 4, 'no', 1, 'sidebar', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (14, 'Opis projektu', 'description', 'multilingual_textbox', 2, 'no', 7, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (15, 'Metryczka', 'details', 'multilingual_textbox', 2, 'no', 8, 'sidebar', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (16, 'Nazwa kategorii', 'category', 'multilingual_textbox', 3, 'yes', 0, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (17, 'Sort', 'sort', 'order_entries', 3, 'no', 1, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (18, 'Sort', 'sort', 'order_entries', 2, 'no', 9, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (23, 'O mnie', 'about', 'multilingual_textbox', 4, 'no', 0, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (19, 'Okładka', 'cover-image', 'image_upload', 2, 'yes', 3, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (20, 'Galeria', 'gallery', 'multiupload', 2, 'yes', 6, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (25, 'Podpis', 'caption', 'multilingual_textbox', 4, 'no', 2, 'sidebar', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (28, 'Pozycja w indeksie', 'index-date', 'date', 2, 'yes', 5, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (27, 'Publikuj', 'publish', 'checkbox', 2, 'no', 1, 'sidebar', 'yes');

-- *** DATA:`tbl_pages` ***
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`, `plh_t-en`, `plh_h-en`, `plh_t-pl`, `plh_h-pl`) VALUES (1, NULL, 'Home', 'home', NULL, 'category', 'all_projects,categories,fl_languages,navigation', NULL, 1, 'Home', 'home', 'Home', 'home');
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`, `plh_t-en`, `plh_h-en`, `plh_t-pl`, `plh_h-pl`) VALUES (2, NULL, 'Index', 'index', NULL, NULL, 'categories,fl_languages,index,navigation,plh_page', NULL, 3, 'Index', 'index', 'Indeks', 'indeks');
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`, `plh_t-en`, `plh_h-en`, `plh_t-pl`, `plh_h-pl`) VALUES (3, NULL, 'About', 'about', NULL, NULL, 'about,fl_languages,navigation,plh_page,categories', NULL, 2, 'About', 'about', 'O mnie', 'o-mnie');
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`, `plh_t-en`, `plh_h-en`, `plh_t-pl`, `plh_h-pl`) VALUES (5, NULL, 'Projekt', 'projekt', NULL, 'title', 'categories,fl_languages,plh_page,project,navigation', NULL, 4, 'Project', 'project', 'Projekt', 'projekt');

-- *** DATA:`tbl_pages_types` ***
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (4, 1, 'index');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (7, 2, 'menu');
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (6, 3, 'menu');

-- *** DATA:`tbl_sections` ***
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `max_entries`, `filter`, `navigation_group`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (2, 'Projekty', 'projects', 1, 'no', 0, 'yes', 'Projekty', 1, 1, '2021-01-20 09:33:32', '2021-01-20 08:33:32', '2021-02-22 18:30:28', '2021-02-22 17:30:28');
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `max_entries`, `filter`, `navigation_group`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (3, 'Kategorie postów', 'posts-category', 2, 'no', 0, 'no', 'Projekty', 1, 1, '2021-01-20 15:13:11', '2021-01-20 14:13:11', '2021-02-22 18:31:11', '2021-02-22 17:31:11');
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `max_entries`, `filter`, `navigation_group`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (4, 'O mnie', 'about', 3, 'no', 1, 'no', 'O mnie', 1, 1, '2021-01-21 20:02:08', '2021-01-21 19:02:08', '2021-02-22 19:54:10', '2021-02-22 18:54:10');

-- *** DATA:`tbl_sections_association` ***
INSERT INTO`tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`, `interface`, `editor`) VALUES (17, 3, 16, 2, 22, 'yes', NULL, NULL);

-- *** DATA:`tbl_tracker_activity` ***
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (1, 'extensions', 'media_library', 'enabled', 1, '2021-01-08 16:11:07', 'Olaf Schindler', 'the Media Library extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (2, 'extensions', 'publishbutton', 'enabled', 1, '2021-01-08 16:11:07', 'Olaf Schindler', 'the Publish Button extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (3, 'extensions', 'flang_detection_gtlds', 'enabled', 1, '2021-01-08 16:12:18', 'Olaf Schindler', 'the FLang detection gTLDs extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (4, 'extensions', 'languages', 'enabled', 1, '2021-01-08 16:12:18', 'Olaf Schindler', 'the Languages extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (5, 'extensions', 'frontend_localisation', 'enabled', 1, '2021-01-08 16:12:26', 'Olaf Schindler', 'the Frontend Localisation extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (6, 'extensions', 'multilingual_field', 'enabled', 1, '2021-01-08 16:12:31', 'Olaf Schindler', 'the Field: Multilingual Text Box extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (7, 'extensions', 'publish_tabs', 'enabled', 1, '2021-01-08 16:19:22', 'Olaf Schindler', 'the Publish Tabs extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (8, 'extensions', 'multilingual_field', 'uninstalled', 1, '2021-01-08 16:34:25', 'Olaf Schindler', 'the Field: Multilingual Text Box extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (9, 'extensions', 'limit_section_entries', 'enabled', 1, '2021-01-08 16:34:34', 'Olaf Schindler', 'the Limit Section Entries extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (10, 'extensions', 'multilingual_field', 'enabled', 1, '2021-01-08 16:34:54', 'Olaf Schindler', 'the Field: Multilingual Text Box extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (11, 'preferences', NULL, 'updated', 1, '2021-01-08 16:38:06', 'Olaf Schindler', ' the <a href=\"http://kwietowicz.local/symphony/system/preferences\">system preferences</a>');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (12, 'preferences', NULL, 'updated', 1, '2021-01-08 16:38:14', 'Olaf Schindler', ' the <a href=\"http://kwietowicz.local/symphony/system/preferences\">system preferences</a>');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (13, 'preferences', NULL, 'updated', 1, '2021-01-08 16:38:52', 'Olaf Schindler', ' the <a href=\"http://kwietowicz.local/symphony/system/preferences\">system preferences</a>');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (14, 'extensions', 'multilingual_field', 'uninstalled', 1, '2021-01-08 16:39:18', 'Olaf Schindler', 'the Field: Multilingual Text Box extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (15, 'extensions', 'multilingual_field', 'enabled', 1, '2021-01-08 16:39:23', 'Olaf Schindler', 'the Field: Multilingual Text Box extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (16, 'extensions', 'multilingual_field', 'disabled', 1, '2021-01-08 16:39:45', 'Olaf Schindler', 'the Field: Multilingual Text Box extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (17, 'sections', 1, 'created', 1, '2021-01-08 16:43:46', 'Olaf Schindler', ' the Testy section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (18, 'extensions', 'multilingual_field', 'disabled', 1, '2021-01-08 16:45:38', 'Olaf Schindler', 'the Field: Multilingual Text Box extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (19, 'extensions', 'multilingual_field', 'enabled', 1, '2021-01-08 16:45:46', 'Olaf Schindler', 'the Field: Multilingual Text Box extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (20, 'extensions', 'textboxfield', 'enabled', 1, '2021-01-08 16:48:22', 'Olaf Schindler', 'the Text Box extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (21, 'sections', 1, 'updated', 1, '2021-01-08 16:49:37', 'Olaf Schindler', ' the Testy section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (22, 'sections', 1, 'updated', 1, '2021-01-08 16:50:47', 'Olaf Schindler', ' the Testy section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (23, 'sections', 1, 'updated', 1, '2021-01-08 16:52:21', 'Olaf Schindler', ' the Testy section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (24, 'sections', 1, 'updated', 1, '2021-01-08 16:52:52', 'Olaf Schindler', ' the Testy section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (25, 'sections', 1, 'updated', 1, '2021-01-08 16:53:26', 'Olaf Schindler', ' the Testy section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (26, 1, 1, 'created', 1, '2021-01-08 16:53:49', 'Olaf Schindler', 'No:::Testy');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (27, 1, 1, 'updated', 1, '2021-01-08 16:54:14', 'Olaf Schindler', 'No:::Testy');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (28, 'sections', 1, 'updated', 1, '2021-01-08 16:55:24', 'Olaf Schindler', ' the Testy section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (29, 1, 1, 'updated', 1, '2021-01-08 16:55:43', 'Olaf Schindler', 'No:::Testy');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (30, 'extensions', 'save_and_return', 'enabled', 1, '2021-01-08 16:57:46', 'Olaf Schindler', 'the Save and Return/New Buttons extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (31, 'sections', 2, 'created', 1, '2021-01-20 08:33:32', 'Olaf Schindler', ' the Projekty section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (32, 'sections', 2, 'updated', 1, '2021-01-20 08:37:04', 'Olaf Schindler', ' the Projekty section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (33, 'preferences', NULL, 'updated', 1, '2021-01-20 08:41:01', 'Olaf Schindler', ' the <a href=\"http://kwietowicz.local/symphony/system/preferences\">system preferences</a>');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (34, 'sections', 2, 'updated', 1, '2021-01-20 08:43:04', 'Olaf Schindler', ' the Projekty section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (35, 'sections', 2, 'updated', 1, '2021-01-20 08:43:22', 'Olaf Schindler', ' the Projekty section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (36, 'sections', 2, 'updated', 1, '2021-01-20 08:43:33', 'Olaf Schindler', ' the Projekty section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (37, 'sections', 2, 'updated', 1, '2021-01-20 08:43:46', 'Olaf Schindler', ' the Projekty section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (38, 'sections', 2, 'updated', 1, '2021-01-20 08:46:06', 'Olaf Schindler', ' the Projekty section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (39, 'sections', 2, 'updated', 1, '2021-01-20 08:46:22', 'Olaf Schindler', ' the Projekty section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (40, 'sections', 2, 'updated', 1, '2021-01-20 08:46:40', 'Olaf Schindler', ' the Projekty section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (41, 'preferences', NULL, 'updated', 1, '2021-01-20 08:47:48', 'Olaf Schindler', ' the <a href=\"http://kwietowicz.local/symphony/system/preferences\">system preferences</a>');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (42, 'preferences', NULL, 'updated', 1, '2021-01-20 08:48:33', 'Olaf Schindler', ' the <a href=\"http://kwietowicz.local/symphony/system/preferences\">system preferences</a>');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (43, 'sections', 1, 'updated', 1, '2021-01-20 13:52:03', 'Olaf Schindler', ' the Testy section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (44, 1, 1, 'updated', 1, '2021-01-20 13:52:45', 'Olaf Schindler', 'Yes:::Testy');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (45, 'sections', 3, 'created', 1, '2021-01-20 14:13:12', 'Olaf Schindler', ' the Kategorie postów section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (46, 3, 2, 'updated', 1, '2021-01-20 14:16:17', 'Olaf Schindler', 'interior:::Kategorie postów');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (47, 'sections', 3, 'updated', 1, '2021-01-20 14:17:21', 'Olaf Schindler', ' the Kategorie postów section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (48, 'sections', 3, 'updated', 1, '2021-01-20 14:17:58', 'Olaf Schindler', ' the Kategorie postów section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (49, 'sections', 2, 'updated', 1, '2021-01-20 14:18:42', 'Olaf Schindler', ' the Projekty section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (50, 'extensions', 'image_upload', 'enabled', 1, '2021-01-20 14:35:29', 'Olaf Schindler', 'the Field: Image Upload extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (51, 'extensions', 'multiuploadfield', 'enabled', 1, '2021-01-20 14:35:29', 'Olaf Schindler', 'the Multi Upload Field extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (52, 'extensions', 'multiuploadfield', 'enabled', 1, '2021-01-20 14:35:46', 'Olaf Schindler', 'the Multi Upload Field extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (53, 'extensions', 'image_upload', 'enabled', 1, '2021-01-20 14:35:54', 'Olaf Schindler', 'the Field: Image Upload extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (54, 'extensions', 'image_upload', 'enabled', 1, '2021-01-20 14:36:21', 'Olaf Schindler', 'the Field: Image Upload extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (55, 'sections', 2, 'updated', 1, '2021-01-20 14:37:16', 'Olaf Schindler', ' the Projekty section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (56, 'sections', 2, 'updated', 1, '2021-01-20 14:38:26', 'Olaf Schindler', ' the Projekty section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (57, 'sections', 2, 'updated', 1, '2021-01-20 14:40:20', 'Olaf Schindler', ' the Projekty section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (58, 2, 6, 'created', 1, '2021-01-20 14:40:36', 'Olaf Schindler', 'Tytuł:::Projekty');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (59, 'sections', 2, 'updated', 1, '2021-01-20 15:10:34', 'Olaf Schindler', ' the Projekty section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (60, 'extensions', 'image_index_preview', 'enabled', 1, '2021-01-20 15:10:42', 'Olaf Schindler', 'the Image Index Preview extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (61, 'sections', 2, 'updated', 1, '2021-01-20 15:11:48', 'Olaf Schindler', ' the Projekty section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (62, 'sections', 2, 'updated', 1, '2021-01-20 15:12:17', 'Olaf Schindler', ' the Projekty section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (63, 'sections', 2, 'updated', 1, '2021-01-20 15:12:43', 'Olaf Schindler', ' the Projekty section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (64, 'sections', 2, 'updated', 1, '2021-01-20 15:15:05', 'Olaf Schindler', ' the Projekty section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (65, 'sections', 2, 'updated', 1, '2021-01-20 15:16:53', 'Olaf Schindler', ' the Projekty section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (66, 'extensions', 'media_library', 'uninstalled', 1, '2021-01-20 15:17:39', 'Olaf Schindler', 'the Media Library extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (67, 'sections', 1, 'updated', 1, '2021-01-20 15:18:10', 'Olaf Schindler', ' the Testy section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (68, 'extensions', 'media_library', 'uninstalled', 1, '2021-01-20 15:18:20', 'Olaf Schindler', 'the Media Library extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (69, 'extensions', 'media_library', 'enabled', 1, '2021-01-21 16:36:55', 'Olaf Schindler', 'the Media Library extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (70, 'sections', 1, 'updated', 1, '2021-01-21 16:37:36', 'Olaf Schindler', ' the Testy section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (71, 'sections', 1, 'updated', 1, '2021-01-21 16:38:13', 'Olaf Schindler', ' the Testy section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (72, 'extensions', 'media_library', 'uninstalled', 1, '2021-01-21 16:38:27', 'Olaf Schindler', 'the Media Library extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (73, 2, 7, 'created', 1, '2021-01-21 16:51:12', 'Olaf Schindler', 'First project:::Projekty');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (74, 2, 7, 'updated', 1, '2021-01-21 16:51:24', 'Olaf Schindler', 'First project:::Projekty');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (75, 2, 7, 'updated', 1, '2021-01-21 16:51:44', 'Olaf Schindler', 'First project:::Projekty');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (76, 2, 8, 'created', 1, '2021-01-21 16:53:43', 'Olaf Schindler', 'Second project:::Projekty');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (77, 2, 8, 'updated', 1, '2021-01-21 16:54:23', 'Olaf Schindler', 'Second project:::Projekty');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (78, 'pages', 1, 'created', 1, '2021-01-21 16:54:54', 'Olaf Schindler', ' the Home page');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (79, 'datasources', 'data.all_projects.php', 'created', 1, '2021-01-21 16:59:22', 'Olaf Schindler', ' the All projects data source');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (80, 'pages', 1, 'updated', 1, '2021-01-21 17:00:13', 'Olaf Schindler', ' the Home page');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (81, 2, 6, 'updated', 1, '2021-01-21 17:01:03', 'Olaf Schindler', 'Tytuł:::Projekty');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (82, 'pages', 1, 'updated', 1, '2021-01-21 17:03:26', 'Olaf Schindler', ' the Home page');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (83, 'datasources', 'data.categories.php', 'created', 1, '2021-01-21 17:22:04', 'Olaf Schindler', ' the Categories data source');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (84, 'datasources', 'data.all_projects.php', 'updated', 1, '2021-01-21 17:22:38', 'Olaf Schindler', ' the All projects data source');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (85, 'extensions', 'multilingual_selectbox_link_field', 'enabled', 1, '2021-01-21 17:30:46', 'Olaf Schindler', 'the Field: Multilingual Selectbox Link extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (86, 'sections', 2, 'updated', 1, '2021-01-21 17:32:16', 'Olaf Schindler', ' the Projekty section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (87, 2, 7, 'updated', 1, '2021-01-21 17:32:32', 'Olaf Schindler', 'First project:::Projekty');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (88, 'datasources', 'data.all_projects.php', 'updated', 1, '2021-01-21 17:33:40', 'Olaf Schindler', ' the All projects data source');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (89, 'sections', 2, 'updated', 1, '2021-01-21 17:34:40', 'Olaf Schindler', ' the Projekty section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (90, 'pages', 2, 'created', 1, '2021-01-21 17:37:35', 'Olaf Schindler', ' the Index page');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (91, 'extensions', 'flang_detection_gtlds', 'enabled', 1, '2021-01-21 17:42:57', 'Olaf Schindler', 'the FLang detection gTLDs extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (92, 'extensions', 'page_lhandles', 'enabled', 1, '2021-01-21 17:45:55', 'Olaf Schindler', 'the Page LHandles extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (93, 'pages', 1, 'updated', 1, '2021-01-21 17:46:45', 'Olaf Schindler', ' the Home page');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (94, 'pages', 2, 'updated', 1, '2021-01-21 17:47:00', 'Olaf Schindler', ' the Index page');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (95, 'pages', 3, 'created', 1, '2021-01-21 18:36:17', 'Olaf Schindler', ' the About page');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (96, 'pages', 4, 'created', 1, '2021-01-21 18:36:52', 'Olaf Schindler', ' the Contact page');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (97, 'pages', 4, 'updated', 1, '2021-01-21 18:53:30', 'Olaf Schindler', ' the Contact page');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (98, 'sections', 4, 'created', 1, '2021-01-21 19:02:09', 'Olaf Schindler', ' the O mnie section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (99, 'sections', 4, 'updated', 1, '2021-01-21 19:08:34', 'Olaf Schindler', ' the O mnie section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (100, 4, 9, 'created', 1, '2021-01-21 19:15:36', 'Olaf Schindler', 'Potem podrapał się w głowę i dodał: „Konstantemu Makaryczowi”. Zadowolony, że mu nikt nie przeszkodził w pisaniu, włożył czapkę i nie narzucając na siebie kożuszka, w koszulinie tylko wybiegł na ulicę…\r\n\r\nSubiekci ze sklepu mięsnego, których rozpytywał poprzedniego dnia, powiedzieli mu, że listy wrzuca się do skrzynek pocztowych, a ze skrzynek zostają rozwożone po całym kraju na trójkach pocztowych z pijanymi woźnicami i dźwięcznymi dzwonkami. Wańka dobiegł do pierwszej skrzynki pocztowej i wsunął cenny list do otworu. Ukołysany słodkimi nadziejami w godzinę później, spał mocno. Śnił mu się piec. Na piecu siedzi dziadek ze spuszczonymi bosymi nogami i czyta list kucharkom. Koło pieca chodzi „Piskorz” i kręci ogonem…:::O mnie');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (101, 'datasources', 'data.about.php', 'created', 1, '2021-01-21 19:18:51', 'Olaf Schindler', ' the About data source');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (102, 'datasources', 'data.about.php', 'updated', 1, '2021-01-21 19:21:41', 'Olaf Schindler', ' the About data source');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (103, 'sections', 4, 'updated', 1, '2021-01-21 19:23:29', 'Olaf Schindler', ' the O mnie section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (104, 'sections', 4, 'updated', 1, '2021-01-21 19:24:08', 'Olaf Schindler', ' the O mnie section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (105, 'sections', 4, 'updated', 1, '2021-01-21 19:24:54', 'Olaf Schindler', ' the O mnie section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (106, 4, 9, 'updated', 1, '2021-01-21 19:25:02', 'Olaf Schindler', 'Potem podrapał się w głowę i dodał: „Konstantemu Makaryczowi”. Zadowolony, że mu nikt nie przeszkodził w pisaniu, włożył czapkę i nie narzucając na siebie kożuszka, w koszulinie tylko wybiegł na ulicę…\r\n\r\nSubiekci ze sklepu mięsnego, których rozpytywał poprzedniego dnia, powiedzieli mu, że listy wrzuca się do skrzynek pocztowych, a ze skrzynek zostają rozwożone po całym kraju na trójkach pocztowych z pijanymi woźnicami i dźwięcznymi dzwonkami. Wańka dobiegł do pierwszej skrzynki pocztowej i wsunął cenny list do otworu. Ukołysany słodkimi nadziejami w godzinę później, spał mocno. Śnił mu się piec. Na piecu siedzi dziadek ze spuszczonymi bosymi nogami i czyta list kucharkom. Koło pieca chodzi „Piskorz” i kręci ogonem…:::O mnie');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (107, 'extensions', 'html5_doctype', 'enabled', 1, '2021-01-22 16:47:17', 'Olaf Schindler', 'the HTML5 Doctype extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (108, 'login', NULL, 'logged in', 1, '2021-01-27 14:57:49', 'Olaf Schindler', ' to the back end');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (109, 'datasources', 'data.categories.php', 'updated', 1, '2021-01-27 16:09:46', 'Olaf Schindler', ' the Categories data source');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (110, 'datasources', 'data.all_projects.php', 'updated', 1, '2021-01-27 16:10:01', 'Olaf Schindler', ' the All projects data source');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (111, 'sections', 2, 'updated', 1, '2021-01-27 16:51:13', 'Olaf Schindler', ' the Projekty section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (112, 2, 7, 'updated', 1, '2021-01-27 16:52:02', 'Olaf Schindler', 'First project:::Projekty');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (113, 2, 8, 'updated', 1, '2021-01-27 16:52:08', 'Olaf Schindler', 'Second project:::Projekty');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (114, 'datasources', 'data.all_projects.php', 'updated', 1, '2021-01-27 16:52:40', 'Olaf Schindler', ' the All projects data source');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (115, 'datasources', 'data.all_projects.php', 'updated', 1, '2021-01-27 16:53:09', 'Olaf Schindler', ' the All projects data source');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (116, 'datasources', 'data.all_projects.php', 'updated', 1, '2021-01-27 16:53:39', 'Olaf Schindler', ' the All projects data source');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (117, 'datasources', 'data.all_projects.php', 'updated', 1, '2021-01-27 16:54:18', 'Olaf Schindler', ' the All projects data source');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (118, 'datasources', 'data.all_projects.php', 'updated', 1, '2021-01-27 16:54:49', 'Olaf Schindler', ' the All projects data source');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (119, 'datasources', 'data.all_projects.php', 'updated', 1, '2021-01-27 16:55:10', 'Olaf Schindler', ' the All projects data source');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (120, 'sections', 2, 'updated', 1, '2021-01-27 16:56:09', 'Olaf Schindler', ' the Projekty section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (121, 2, 7, 'updated', 1, '2021-01-27 16:56:23', 'Olaf Schindler', 'First project:::Projekty');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (122, 2, 8, 'updated', 1, '2021-01-27 16:56:24', 'Olaf Schindler', 'Second project:::Projekty');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (123, 'datasources', 'data.all_projects.php', 'updated', 1, '2021-01-27 16:56:44', 'Olaf Schindler', ' the All projects data source');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (124, 'sections', 2, 'updated', 1, '2021-01-27 16:58:11', 'Olaf Schindler', ' the Projekty section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (125, 'datasources', 'data.all_projects.php', 'updated', 1, '2021-01-27 16:58:38', 'Olaf Schindler', ' the All projects data source');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (126, 2, 6, 'updated', 1, '2021-01-27 16:58:57', 'Olaf Schindler', 'Tytuł:::Projekty');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (127, 2, 6, 'updated', 1, '2021-01-27 16:59:03', 'Olaf Schindler', 'Tytuł:::Projekty');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (128, 'sections', 2, 'updated', 1, '2021-01-27 17:06:07', 'Olaf Schindler', ' the Projekty section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (129, 'sections', 2, 'updated', 1, '2021-01-27 17:06:41', 'Olaf Schindler', ' the Projekty section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (130, 'sections', 2, 'updated', 1, '2021-01-27 18:34:43', 'Olaf Schindler', ' the Projekty section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (131, 'pages', 4, 'deleted', 1, '2021-01-27 21:05:17', 'Olaf Schindler', ' the Contact page');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (132, 'pages', 5, 'created', 1, '2021-01-27 21:05:58', 'Olaf Schindler', ' the Projekt page');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (133, 'datasources', 'data.projekt.php', 'created', 1, '2021-01-27 21:08:25', 'Olaf Schindler', ' the Projekt data source');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (134, 'pages', 5, 'updated', 1, '2021-01-27 21:09:15', 'Olaf Schindler', ' the Projekt page');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (135, 'pages', 5, 'updated', 1, '2021-01-27 21:09:41', 'Olaf Schindler', ' the Projekt page');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (136, 'sections', 2, 'updated', 1, '2021-01-27 21:11:20', 'Olaf Schindler', ' the Projekty section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (137, 'datasources', 'data.project.php', 'updated', 1, '2021-01-28 08:31:14', 'Olaf Schindler', ' the Project data source');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (138, 'datasources', 'data.project.php', 'updated', 1, '2021-01-28 08:42:55', 'Olaf Schindler', ' the Project data source');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (139, 2, 8, 'updated', 1, '2021-01-28 14:04:33', 'Olaf Schindler', 'Second project:::Projekty');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (140, 2, 8, 'updated', 1, '2021-01-28 14:58:30', 'Olaf Schindler', 'Second project:::Projekty');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (141, 'pages', 3, 'updated', 1, '2021-01-28 17:06:42', 'Olaf Schindler', ' the About page');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (142, 'datasources', 'data.navigation.php', 'created', 1, '2021-01-28 17:13:42', 'Olaf Schindler', ' the Navigation data source');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (143, 'pages', 2, 'updated', 1, '2021-01-28 17:15:00', 'Olaf Schindler', ' the Index page');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (144, 'pages', 3, 'updated', 1, '2021-01-28 17:15:09', 'Olaf Schindler', ' the About page');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (145, 'datasources', 'data.navigation.php', 'updated', 1, '2021-01-28 17:15:32', 'Olaf Schindler', ' the Navigation data source');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (146, 4, 9, 'updated', 1, '2021-01-28 17:28:18', 'Olaf Schindler', '**Marcin Kwietowicz**\r\n\r\nPotem podrapał się w głowę i dodał: „Konstantemu Makaryczowi”. Zadowolony, że mu nikt nie przeszkodził w pisaniu, włożył czapkę i nie narzucając na siebie kożuszka, w koszulinie tylko wybiegł na ulicę…\r\n\r\nSubiekci ze sklepu mięsnego, których rozpytywał poprzedniego dnia, powiedzieli mu, że listy wrzuca się do skrzynek pocztowych, a ze skrzynek zostają rozwożone po całym kraju na trójkach pocztowych z pijanymi woźnicami i dźwięcznymi dzwonkami. Wańka dobiegł do pierwszej skrzynki pocztowej i wsunął cenny list do otworu. Ukołysany słodkimi nadziejami w godzinę później, spał mocno. Śnił mu się piec. Na piecu siedzi dziadek ze spuszczonymi bosymi nogami i czyta list kucharkom. Koło pieca chodzi „Piskorz” i kręci ogonem…:::O mnie');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (147, 'datasources', 'data.index.php', 'created', 1, '2021-01-29 14:29:21', 'Olaf Schindler', ' the Index data source');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (148, 'datasources', 'data.index.php', 'updated', 1, '2021-01-29 14:30:57', 'Olaf Schindler', ' the Index data source');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (149, 'datasources', 'data.index.php', 'updated', 1, '2021-01-29 14:31:46', 'Olaf Schindler', ' the Index data source');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (150, 2, 7, 'updated', 1, '2021-01-29 14:32:37', 'Olaf Schindler', 'First project:::Projekty');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (151, 2, 6, 'updated', 1, '2021-01-29 14:32:59', 'Olaf Schindler', 'Tytuł:::Projekty');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (152, 2, 6, 'updated', 1, '2021-01-29 14:33:12', 'Olaf Schindler', 'Tytuł:::Projekty');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (153, 'datasources', 'data.index.php', 'updated', 1, '2021-01-29 14:33:58', 'Olaf Schindler', ' the Index data source');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (154, 2, 8, 'updated', 1, '2021-01-29 14:35:06', 'Olaf Schindler', 'Second project:::Projekty');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (155, 'extensions', 'entry_deep_duplicator', 'enabled', 1, '2021-01-29 15:27:12', 'Olaf Schindler', 'the Entry Deep Duplicator extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (156, 'extensions', 'entry_deep_duplicator', 'uninstalled', 1, '2021-01-29 15:27:31', 'Olaf Schindler', 'the Entry Deep Duplicator extension');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (157, 'pages', 2, 'updated', 1, '2021-02-15 14:45:24', 'Olaf Schindler', ' the Index page');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (158, 'datasources', 'data.categories.php', 'updated', 1, '2021-02-17 12:18:15', 'Olaf Schindler', ' the Categories data source');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (159, 2, 7, 'updated', 1, '2021-02-22 15:16:59', 'Olaf Schindler', 'First project:::Projekty');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (160, 2, 7, 'updated', 1, '2021-02-22 15:17:19', 'Olaf Schindler', 'First project:::Projekty');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (161, 2, 7, 'updated', 1, '2021-02-22 15:17:38', 'Olaf Schindler', 'First project:::Projekty');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (162, 'sections', 1, 'deleted', 1, '2021-02-22 17:30:03', 'Olaf Schindler', ' the Testy section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (163, 'sections', 2, 'updated', 1, '2021-02-22 17:30:28', 'Olaf Schindler', ' the Projekty section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (164, 'sections', 4, 'updated', 1, '2021-02-22 17:30:56', 'Olaf Schindler', ' the O mnie section');
INSERT INTO`tbl_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`) VALUES (165, 'sections', 4, 'updated', 1, '2021-02-22 18:54:10', 'Olaf Schindler', ' the O mnie section');
