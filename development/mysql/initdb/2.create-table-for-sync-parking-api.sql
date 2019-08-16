CREATE TABLE `location_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_fee` double NOT NULL,
  `user_fee_class` int(11) NOT NULL,
  `user_key_money` double NOT NULL,
  `user_key_money_class` int(11) NOT NULL,
  `deposit` double NOT NULL,
  `deposit_class` int(11) NOT NULL,
  `agent_fee_for_procedure` double DEFAULT NULL,
  `agent_fee_for_procedure_class` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2114131 DEFAULT CHARSET=utf8;

CREATE TABLE `location_availabletimerange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time_class` int(11) NOT NULL,
  `opened_at` varchar(255) NOT NULL,
  `closed_at` varchar(255) NOT NULL,
  `opened_at_saturday` varchar(255) NOT NULL,
  `closed_at_saturday` varchar(255) NOT NULL,
  `opened_at_sunday` varchar(255) NOT NULL,
  `closed_at_sunday` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2114131 DEFAULT CHARSET=utf8;

CREATE TABLE `location_parking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lat` decimal(24,20) NOT NULL,
  `lng` decimal(24,20) NOT NULL,
  `status` int(11) NOT NULL,
  `parking_type` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `address_view` varchar(255) NOT NULL,
  `capacity` int(11) NOT NULL,
  `special_instruction` longtext NOT NULL,
  `corp_limited` int(11) DEFAULT NULL,
  `is_noticed_about_cancel` tinyint(1) NOT NULL,
  `retention_corp` int(11) DEFAULT NULL,
  `created_from` int(11) NOT NULL,
  `source_type` int(11) NOT NULL,
  `is_public_about_hire` tinyint(1) NOT NULL,
  `negotiation_about_hire` int(11) NOT NULL,
  `has_division_drawing` tinyint(1) NOT NULL,
  `can_search_by_address` tinyint(1) NOT NULL,
  `has_appointment_for_sublease` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `hire_updated_at` datetime DEFAULT NULL,
  `space_updated_at` datetime DEFAULT NULL,
  `private_memo_id` int(11) DEFAULT NULL,
  `payment_id` int(11) NOT NULL,
  `income_for_agency_id` int(11) NOT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `available_time_range_id` int(11) NOT NULL,
  `strage_document_id` int(11) NOT NULL,
  `management_of_azoom_side_id` int(11) DEFAULT NULL,
  `last_updated_by_id` int(11) DEFAULT NULL,
  `same_parking_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `use_record_in_short_term` int(11) NOT NULL,
  `name_prefix` varchar(255) NOT NULL,
  `owner_contact_id` int(11) DEFAULT NULL,
  `management_contact_id` int(11) DEFAULT NULL,
  `rentable_for_outside` int(11) NOT NULL,
  `is_important_for_marketing` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_id` (`payment_id`),
  UNIQUE KEY `income_for_agency_id` (`income_for_agency_id`),
  UNIQUE KEY `available_time_range_id` (`available_time_range_id`),
  UNIQUE KEY `strage_document_id` (`strage_document_id`),
  UNIQUE KEY `private_memo_id` (`private_memo_id`),
  UNIQUE KEY `comment_id` (`comment_id`),
  KEY `location_parking_status_5ae589e21bf662e5` (`status`,`lat`,`lng`),
  KEY `location_parking_260bb888` (`management_of_azoom_side_id`),
  KEY `location_parking_410a79ac` (`last_updated_by_id`),
  KEY `location_parking_28ac141f` (`same_parking_id`),
  KEY `location_parking_b376980e` (`city_id`),
  KEY `location_parking_55a4ce96` (`region_id`),
  KEY `location_parking_0c98d849` (`created_by_id`),
  KEY `location_parking_9acb4454` (`status`),
  KEY `location_parking_b9266fc3` (`owner_contact_id`),
  KEY `location_parking_bb3b0437` (`management_contact_id`),
  CONSTRAINT `available_time_range_id_refs_id_d46a0f67` FOREIGN KEY (`available_time_range_id`) REFERENCES `location_availabletimerange` (`id`),
  CONSTRAINT `city_id_refs_id_45be1399` FOREIGN KEY (`city_id`) REFERENCES `location_city` (`id`),
  CONSTRAINT `payment_id_refs_id_094d17b4` FOREIGN KEY (`payment_id`) REFERENCES `location_payment` (`id`),
  CONSTRAINT `region_id_refs_id_76ed539f` FOREIGN KEY (`region_id`) REFERENCES `location_region` (`id`),
  CONSTRAINT `same_parking_id_refs_id_9eeec320` FOREIGN KEY (`same_parking_id`) REFERENCES `location_parking` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1093799 DEFAULT CHARSET=utf8;

CREATE TABLE `location_space` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_visible` tinyint(1) NOT NULL,
  `total_empty_rooms` int(10) unsigned NOT NULL,
  `hire` int(10) unsigned NOT NULL,
  `facility` int(11) NOT NULL,
  `setting_type` int(11) NOT NULL,
  `is_available_for_small_cars` tinyint(1) NOT NULL,
  `is_available_for_middle_cars` tinyint(1) NOT NULL,
  `is_available_for_large_cars` tinyint(1) NOT NULL,
  `is_available_for_middle_roof_cars` tinyint(1) NOT NULL,
  `is_available_for_high_roof_cars` tinyint(1) NOT NULL,
  `parking_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `is_ignore_for_aggregate_markets_hire` tinyint(1) NOT NULL,
  `capacity` int(11) NOT NULL,
  `hire_min` int(10) unsigned DEFAULT NULL,
  `roof_type` int(11) DEFAULT NULL,
  `hire_tax_class` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `space_type` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `size_id` (`size_id`),
  KEY `location_space_658dfd17` (`is_visible`),
  KEY `location_space_a2a4ca6d` (`parking_id`),
  CONSTRAINT `parking_id_refs_id_73d0f814` FOREIGN KEY (`parking_id`) REFERENCES `location_parking` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6636114 DEFAULT CHARSET=utf8;

CREATE TABLE `location_station` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lat` decimal(24,20) NOT NULL,
  `lng` decimal(24,20) NOT NULL,
  `group_code` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `railway_company_id` int(11) NOT NULL,
  `line_id` int(11) NOT NULL,
  `prefecture_id` int(11) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `name_furigana` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_station_5c30b5d1` (`group_code`),
  KEY `location_station_b376980e` (`city_id`),
  KEY `location_station_eecc71f7` (`railway_company_id`),
  KEY `location_station_dc784296` (`line_id`),
  KEY `location_station_b068931c` (`name`),
  KEY `prefecture_id` (`prefecture_id`),
  KEY `region_id` (`region_id`),
  CONSTRAINT `city_id_refs_id_eb5b98c8` FOREIGN KEY (`city_id`) REFERENCES `location_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9992805 DEFAULT CHARSET=utf8;

CREATE TABLE `location_securityfacility` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `parking_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `location_securityfacility_type_3fd6ae5ec29f8be2_uniq` (`type`,`parking_id`),
  KEY `location_securityfacility_a2a4ca6d` (`parking_id`),
  KEY `location_securityfacility_9acb4454` (`status`),
  CONSTRAINT `parking_id_refs_id_5b5a68e2` FOREIGN KEY (`parking_id`) REFERENCES `location_parking` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7174366 DEFAULT CHARSET=utf8;