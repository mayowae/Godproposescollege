-- Smart School DB
-- Version 6.4.0
-- https://smart-school.in
-- https://qdocs.net
-- New tables added: 30

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE if exists question_answers;
DROP TABLE if exists timetables;
DROP TABLE if exists student_sibling;
DROP TABLE if exists question_options;
DROP TABLE if exists multi_class_students;
DROP TABLE if exists feecategory;
DROP TABLE if exists exam_results;
DROP TABLE if exists teacher_subjects;

ALTER TABLE `alumni_events` CHANGE `session_id` `session_id` INT(11) NULL DEFAULT NULL;
ALTER TABLE `alumni_events` CHANGE `class_id` `class_id` INT(11) NULL DEFAULT NULL;
ALTER TABLE `alumni_events` CHANGE `from_date` `from_date` datetime NOT NULL;

ALTER TABLE `alumni_events` CHANGE `to_date` `to_date` DATETIME NOT NULL;

ALTER TABLE `alumni_events` CHANGE `photo` `photo` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;

ALTER TABLE `alumni_students` MODIFY `student_id` int(11) NOT NULL AFTER id; 

ALTER TABLE `book_issues` MODIFY  `member_id` int(11) DEFAULT NULL AFTER book_id; 

ALTER TABLE `class_teacher` MODIFY   `session_id` int(11) NOT NULL AFTER id;
ALTER TABLE `class_teacher` MODIFY   `staff_id` int(11) NOT NULL AFTER section_id; 

ALTER TABLE `contents` MODIFY  `date` date NOT NULL AFTER file;
ALTER TABLE `contents` MODIFY  `note` text AFTER date;
ALTER TABLE `contents` MODIFY  `created_by` int(11) NOT NULL AFTER is_active; 

ALTER TABLE `dispatch_receive` MODIFY   `type` varchar(10) NOT NULL AFTER to_title; 

ALTER TABLE `feetype` MODIFY  `description` text DEFAULT NULL AFTER is_active; 

ALTER TABLE `follow_up` CHANGE `followup_by` `followup_by` INT(11) NULL DEFAULT NULL;

ALTER TABLE `staff` CHANGE   `date_of_joining` `date_of_joining` date DEFAULT NULL;
ALTER TABLE `staff` CHANGE  `date_of_leaving` `date_of_leaving` date DEFAULT NULL;
ALTER TABLE `staff` CHANGE  `basic_salary` `basic_salary` int(11) DEFAULT NULL;

ALTER TABLE `front_cms_pages` CHANGE  `publish_date` `publish_date` date DEFAULT NULL;

ALTER TABLE `front_cms_programs` CHANGE  `publish_date` `publish_date` date DEFAULT NULL;

ALTER TABLE `general_calls` CHANGE  `call_dureation` `call_duration` varchar(50) NOT NULL; 

ALTER TABLE `staff_leave_request` CHANGE  `status` `status` varchar(50) NOT NULL;

ALTER TABLE `topic` CHANGE  `complete_date` `complete_date` date DEFAULT NULL; 

ALTER TABLE `income` MODIFY   `documents` varchar(255) DEFAULT NULL AFTER is_active;  
ALTER TABLE `income` CHANGE    `amount` `amount` float(10,2) DEFAULT '0.00'; 

ALTER TABLE `homework` MODIFY  `staff_id` int(11) NOT NULL AFTER session_id; 
ALTER TABLE `homework` MODIFY   `subject_group_subject_id` int(11) DEFAULT NULL AFTER staff_id;
ALTER TABLE `homework` MODIFY   `subject_id` int(11) DEFAULT NULL AFTER subject_group_subject_id;  
ALTER TABLE `homework`  CHANGE `document` `document` varchar(200) DEFAULT NULL; 

ALTER TABLE `item`  MODIFY `item_store_id` int(11) DEFAULT NULL AFTER item_category_id;  
ALTER TABLE `item`  MODIFY  `item_supplier_id` int(11) DEFAULT NULL AFTER item_store_id;  
ALTER TABLE `item`  MODIFY   `quantity` int(100) NOT NULL AFTER description;  
ALTER TABLE `item`  MODIFY   `date` date DEFAULT NULL AFTER quantity; 

ALTER TABLE `item_stock`  MODIFY   `symbol` varchar(10) NOT NULL DEFAULT '+' AFTER store_id;

ALTER TABLE `onlineexam`  MODIFY  `session_id` int(11) DEFAULT NULL AFTER id;

ALTER TABLE `subject_timetable`  MODIFY `session_id` int(11) DEFAULT NULL AFTER id;  
ALTER TABLE `subject_timetable`  MODIFY  `day` varchar(20) DEFAULT NULL AFTER staff_id; 

ALTER TABLE `sch_settings`  CHANGE `is_duplicate_fees_invoice` `is_duplicate_fees_invoice` varchar(100) DEFAULT '0'; 
  
ALTER TABLE `visitors_purpose`
 ADD `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER `description`;

ALTER TABLE `exam_group_exam_results` MODIFY  `exam_group_student_id` int(11) DEFAULT NULL AFTER exam_group_class_batch_exam_subject_id; 

ALTER TABLE `alumni_students` CHANGE `photo` `photo` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;

ALTER TABLE `book_issues` CHANGE `id` `id` INT(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `book_issues` CHANGE `book_id` `book_id` INT(11) NOT NULL;
ALTER TABLE `book_issues` CHANGE `member_id` `member_id` INT(11) DEFAULT NULL;

ALTER TABLE `certificates` CHANGE `background_image` `background_image` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;
ALTER TABLE `certificates` MODIFY  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() AFTER enable_image_height; 
ALTER TABLE `certificates` MODIFY  `updated_at` date DEFAULT NULL AFTER created_at; 

CREATE TABLE `class_section_times` (
  `id` int(11) NOT NULL,
  `class_section_id` int(11) DEFAULT NULL,
  `time` time DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `complaint` CHANGE `source` `source` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE `complaint` CHANGE `image` `image` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;
ALTER TABLE `contents` CHANGE `cls_sec_id` `cls_sec_id` INT(10) NULL DEFAULT NULL;

CREATE TABLE `content_types` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` text,
  `is_active` int(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `short_name` varchar(100) DEFAULT NULL,
  `symbol` varchar(10) DEFAULT NULL,
  `base_price` varchar(10) NOT NULL DEFAULT '1',
  `is_active` int(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `currencies` (`id`, `name`, `short_name`, `symbol`, `base_price`, `is_active`, `created_at`) VALUES
(1, 'AED', 'AED', 'AEDf', '1', 0, '2022-12-30 06:19:15'),
(2, 'AFN', 'AFN', '؋', '1', 0, '2022-12-30 06:19:19'),
(3, 'ALL', 'ALL', 'ALL', '1', 0, '2022-12-30 06:19:22'),
(4, 'AMD', 'AMD', 'AMD', '1', 0, '2022-07-22 10:55:15'),
(5, 'ANG', 'ANG', 'ANG', '1', 0, '2022-07-22 10:55:15'),
(6, 'AOA', 'AOA', 'AOA', '1', 0, '2022-07-22 10:55:15'),
(7, 'ARS', 'ARS', 'ARS', '1', 0, '2022-07-22 10:55:15'),
(8, 'AUD', 'AUD', 'AUD', '1', 0, '2022-07-22 10:55:15'),
(9, 'AWG', 'AWG', 'AWG', '1', 0, '2022-07-22 10:55:15'),
(10, 'AZN', 'AZN', 'AZN', '1', 0, '2022-07-22 10:55:15'),
(11, 'BAM', 'BAM', 'BAM', '1', 0, '2022-07-22 10:55:15'),
(12, 'BAM', 'BAM', 'BAM', '1', 0, '2022-07-22 10:55:15'),
(13, 'BDT', 'BDT', 'BDT', '1', 0, '2022-07-22 10:55:15'),
(14, 'BGN', 'BGN', 'BGN', '1', 0, '2022-07-22 10:55:15'),
(15, 'BHD', 'BHD', 'BHD', '1', 0, '2022-07-22 10:55:15'),
(16, 'BIF', 'BIF', 'BIF', '1', 0, '2022-07-22 10:55:15'),
(17, 'BMD', 'BMD', 'BMD', '1', 0, '2022-07-22 10:55:15'),
(18, 'BND', 'BND', 'BND', '1', 0, '2022-07-22 10:55:15'),
(19, 'BOB', 'BOB', 'BOB', '1', 0, '2022-12-30 06:19:29'),
(20, 'BOV', 'BOV', 'BOV', '1', 0, '2022-12-30 06:19:38'),
(21, 'BRL', 'BRL', 'BRL', '1', 0, '2022-07-22 10:55:15'),
(22, 'BSD', 'BSD', 'BSD', '1', 0, '2022-12-30 06:19:40'),
(23, 'BTN', 'BTN', 'BTN', '1', 0, '2022-12-30 06:19:42'),
(24, 'BWP', 'BWP', 'BWP', '1', 0, '2022-07-22 10:55:15'),
(25, 'BYN', 'BYN', 'BYN', '1', 0, '2022-07-22 10:55:15'),
(26, 'BYR', 'BYR', 'BYR', '1', 0, '2022-07-22 10:55:15'),
(27, 'BZD', 'BZD', 'BZD', '1', 0, '2022-07-22 10:55:15'),
(28, 'CAD', 'CAD', 'CAD', '1', 0, '2022-07-22 10:55:15'),
(29, 'CDF', 'CDF', 'CDF', '1', 0, '2022-07-22 10:55:15'),
(30, 'CHE', 'CHE', 'CHE', '1', 0, '2022-07-22 10:55:15'),
(31, 'CHF', 'CHF', 'CHF', '1', 0, '2022-07-22 10:55:15'),
(32, 'CHW', 'CHW', 'CHW', '1', 0, '2022-07-22 10:55:15'),
(33, 'CLF', 'CLF', 'CLF', '1', 0, '2022-07-22 10:55:15'),
(34, 'CLP', 'CLP', 'CLP', '1', 0, '2022-07-22 10:55:15'),
(35, 'CNY', 'CNY', 'CNY', '1', 0, '2022-07-22 10:55:15'),
(36, 'COP', 'COP', 'COP', '1', 0, '2022-07-22 10:55:15'),
(37, 'COU', 'COU', 'COU', '1', 0, '2022-07-22 10:55:15'),
(38, 'CRC', 'CRC', 'CRC', '1', 0, '2022-07-22 10:55:15'),
(39, 'CUC', 'CUC', 'CUC', '1', 0, '2022-07-22 10:55:15'),
(40, 'CUP', 'CUP', 'CUP', '1', 0, '2022-07-22 10:55:15'),
(41, 'CVE', 'CVE', 'CVE', '1', 0, '2022-07-22 10:55:15'),
(42, 'CZK', 'CZK', 'CZK', '1', 0, '2022-07-22 10:55:15'),
(43, 'DJF', 'DJF', 'DJF', '1', 0, '2022-07-22 10:55:15'),
(44, 'DKK', 'DKK', 'DKK', '1', 0, '2022-07-22 10:55:15'),
(45, 'DOP', 'DOP', 'DOP', '1', 0, '2022-07-22 10:55:15'),
(46, 'DZD', 'DZD', 'DZD', '1', 0, '2022-07-22 10:55:15'),
(47, 'EGP', 'EGP', 'EGP', '1', 0, '2022-07-22 10:55:15'),
(48, 'ERN', 'ERN', 'ERN', '1', 0, '2022-07-22 10:55:15'),
(49, 'ETB', 'ETB', 'ETB', '1', 0, '2022-07-22 10:55:15'),
(50, 'EUR', 'EUR', '€', '1', 0, '2022-12-30 06:20:25'),
(51, 'FJD', 'FJD', 'FJD', '1', 0, '2022-07-22 10:55:15'),
(52, 'FKP', 'FKP', 'FKP', '1', 0, '2022-07-22 10:55:15'),
(53, 'GBP', 'GBP', '£', '1', 0, '2022-12-30 06:20:29'),
(54, 'GEL', 'GEL', 'GEL', '1', 0, '2022-07-22 10:55:15'),
(55, 'GHS', 'GHS', 'GHS', '1', 0, '2022-07-22 10:55:15'),
(56, 'GIP', 'GIP', 'GIP', '1', 0, '2022-07-22 10:55:15'),
(57, 'GMD', 'GMD', 'GMD', '1', 0, '2022-07-22 10:55:15'),
(58, 'GNF', 'GNF', 'GNF', '1', 0, '2022-07-22 10:55:15'),
(59, 'GTQ', 'GTQ', 'GTQ', '1', 0, '2022-07-22 10:55:15'),
(60, 'GYD', 'GYD', 'GYD', '1', 0, '2022-07-22 10:55:15'),
(61, 'HKD', 'HKD', 'HKD', '1', 0, '2022-07-22 10:55:15'),
(62, 'HNL', 'HNL', 'HNL', '1', 0, '2022-07-22 10:55:15'),
(63, 'HRK', 'HRK', 'HRK', '1', 0, '2022-07-22 10:55:15'),
(64, 'HTG', 'HTG', 'HTG', '1', 0, '2022-07-22 10:55:15'),
(65, 'HUF', 'HUF', 'HUF', '1', 0, '2022-07-22 10:55:15'),
(66, 'IDR', 'IDR', 'IDR', '1', 0, '2022-12-30 06:20:34'),
(67, 'ILS', 'ILS', 'ILS', '1', 0, '2022-07-22 10:55:15'),
(68, 'INR', 'INR', '₹', '1', 0, '2022-12-30 06:20:37'),
(69, 'IQD', 'IQD', 'IQD', '1', 0, '2022-07-22 10:55:15'),
(70, 'IRR', 'IRR', 'IRR', '1', 0, '2022-07-22 10:55:15'),
(71, 'ISK', 'ISK', 'ISK', '1', 0, '2022-07-22 10:55:15'),
(72, 'JMD', 'JMD', 'JMD', '1', 0, '2022-07-22 10:55:15'),
(73, 'JOD', 'JOD', 'JOD', '1', 0, '2022-07-22 10:55:15'),
(74, 'JPY', 'JPY', 'JPY', '1', 0, '2022-12-30 06:19:56'),
(75, 'KES', 'KES', 'KES', '1', 0, '2022-07-22 10:55:15'),
(76, 'KGS', 'KGS', 'KGS', '1', 0, '2022-07-22 10:55:15'),
(77, 'KHR', 'KHR', 'KHR', '1', 0, '2022-07-22 10:55:15'),
(78, 'KMF', 'KMF', 'KMF', '1', 0, '2022-07-22 10:55:15'),
(79, 'KPW', 'KPW', 'KPW', '1', 0, '2022-07-22 10:55:15'),
(80, 'KRW', 'KRW', 'KRW', '1', 0, '2022-07-22 10:55:15'),
(81, 'KWD', 'KWD', 'KWD', '1', 0, '2022-07-22 10:55:15'),
(82, 'KYD', 'KYD', 'KYD', '1', 0, '2022-07-22 10:55:15'),
(83, 'KZT', 'KZT', 'KZT', '1', 0, '2022-07-22 10:55:15'),
(84, 'LAK', 'LAK', 'LAK', '1', 0, '2022-07-22 10:55:15'),
(85, 'LBP', 'LBP', 'LBP', '1', 0, '2022-07-22 10:55:15'),
(86, 'LKR', 'LKR', 'LKR', '1', 0, '2022-07-22 10:55:15'),
(87, 'LRD', 'LRD', 'LRD', '1', 0, '2022-07-22 10:55:15'),
(88, 'LSL', 'LSL', 'LSL', '1', 0, '2022-07-22 10:55:15'),
(89, 'LYD', 'LYD', 'LYD', '1', 0, '2022-07-22 10:55:15'),
(90, 'MAD', 'MAD', 'MAD', '1', 0, '2022-07-22 10:55:15'),
(91, 'MDL', 'MDL', 'MDL', '1', 0, '2022-07-22 10:55:15'),
(92, 'MGA', 'MGA', 'MGA', '1', 0, '2022-07-22 10:55:15'),
(93, 'MKD', 'MKD', 'MKD', '1', 0, '2022-07-22 10:55:15'),
(94, 'MMK', 'MMK', 'MMK', '1', 0, '2022-07-22 10:55:15'),
(95, 'MNT', 'MNT', 'MNT', '1', 0, '2022-07-22 10:55:15'),
(96, 'MOP', 'MOP', 'MOP', '1', 0, '2022-07-22 10:55:15'),
(97, 'MRO', 'MRO', 'MRO', '1', 0, '2022-07-22 10:55:15'),
(98, 'MUR', 'MUR', 'MUR', '1', 0, '2022-07-22 10:55:15'),
(99, 'MVR', 'MVR', 'MVR', '1', 0, '2022-07-22 10:55:15'),
(100, 'MWK', 'MWK', 'MWK', '1', 0, '2022-07-22 10:55:15'),
(101, 'MXN', 'MXN', 'MXN', '1', 0, '2022-07-22 10:55:15'),
(102, 'MXV', 'MXV', 'MXV', '1', 0, '2022-07-22 10:55:15'),
(103, 'MYR', 'MYR', 'MYR', '1', 0, '2022-07-22 10:55:15'),
(104, 'MZN', 'MZN', 'MZN', '1', 0, '2022-07-22 10:55:15'),
(105, 'NAD', 'NAD', 'NAD', '1', 0, '2022-07-30 09:32:37'),
(106, 'NGN', 'NGN', 'NGN', '1', 0, '2022-12-30 06:20:42'),
(107, 'NIO', 'NIO', 'NIO', '1', 0, '2022-07-22 10:55:15'),
(108, 'NOK', 'NOK', 'NOK', '1', 0, '2022-07-22 10:55:15'),
(109, 'NPR', 'NPR', 'NPR', '1', 0, '2022-07-22 10:55:15'),
(110, 'NZD', 'NZD', 'NZD', '1', 0, '2022-07-22 10:55:15'),
(111, 'OMR', 'OMR', 'OMR', '1', 0, '2022-07-22 10:55:15'),
(112, 'PAB', 'PAB', 'PAB', '1', 0, '2022-07-22 10:55:15'),
(113, 'PEN', 'PEN', 'PEN', '1', 0, '2022-07-22 10:55:15'),
(114, 'PGK', 'PGK', 'PGK', '1', 0, '2022-07-22 10:55:15'),
(115, 'PHP', 'PHP', 'PHP', '1', 0, '2022-07-22 10:55:15'),
(116, 'PKR', 'PKR', 'PKR', '1', 0, '2022-12-30 06:20:19'),
(117, 'PLN', 'PLN', 'PLN', '1', 0, '2022-07-22 10:55:15'),
(118, 'PYG', 'PYG', 'PYG', '1', 0, '2022-07-22 10:55:15'),
(119, 'QAR', 'QAR', 'QAR', '1', 0, '2022-07-22 10:55:15'),
(120, 'RON', 'RON', 'RON', '1', 0, '2022-07-22 10:55:15'),
(121, 'RSD', 'RSD', 'RSD', '1', 0, '2022-07-22 10:55:15'),
(122, 'RUB', 'RUB', 'RUB', '1', 0, '2022-12-30 06:20:16'),
(123, 'RWF', 'RWF', 'RWF', '1', 0, '2022-07-22 10:55:15'),
(124, 'SAR', 'SAR', 'SAR', '1', 0, '2022-07-22 10:55:15'),
(125, 'SBD', 'SBD', 'SBD', '1', 0, '2022-07-22 10:55:15'),
(126, 'SCR', 'SCR', 'SCR', '1', 0, '2022-07-22 10:55:15'),
(127, 'SDG', 'SDG', 'SDG', '1', 0, '2022-07-22 10:55:15'),
(128, 'SEK', 'SEK', 'SEK', '1', 0, '2022-07-22 10:55:15'),
(129, 'SGD', 'SGD', 'SGD', '1', 0, '2022-07-22 10:55:15'),
(130, 'SHP', 'SHP', 'SHP', '1', 0, '2022-07-22 10:55:15'),
(131, 'SLL', 'SLL', 'SLL', '1', 0, '2022-07-22 10:55:15'),
(132, 'SOS', 'SOS', 'SOS', '1', 0, '2022-07-22 10:55:15'),
(133, 'SRD', 'SRD', 'SRD', '1', 0, '2022-07-22 10:55:15'),
(134, 'SSP', 'SSP', 'SSP', '1', 0, '2022-07-22 10:55:15'),
(135, 'STD', 'STD', 'STD', '1', 0, '2022-07-22 10:55:15'),
(136, 'SVC', 'SVC', 'SVC', '1', 0, '2022-07-22 10:55:15'),
(137, 'SYP', 'SYP', 'SYP', '1', 0, '2022-07-22 10:55:15'),
(138, 'SZL', 'SZL', 'SZL', '1', 0, '2022-07-22 10:55:15'),
(139, 'THB', 'THB', 'THB', '1', 0, '2022-07-22 10:55:15'),
(140, 'TJS', 'TJS', 'TJS', '1', 0, '2022-07-22 10:55:15'),
(141, 'TMT', 'TMT', 'TMT', '1', 0, '2022-07-22 10:55:15'),
(142, 'TND', 'TND', 'TND', '1', 0, '2022-07-22 10:55:15'),
(143, 'TOP', 'TOP', 'TOP', '1', 0, '2022-07-22 10:55:15'),
(144, 'TRY', 'TRY', 'TRY', '1', 0, '2022-07-22 10:55:15'),
(145, 'TTD', 'TTD', 'TTD', '1', 0, '2022-07-22 10:55:15'),
(146, 'TWD', 'TWD', 'TWD', '1', 0, '2022-07-22 10:55:15'),
(147, 'TZS', 'TZS', 'TZS', '1', 0, '2022-07-22 10:55:15'),
(148, 'UAH', 'UAH', 'UAH', '1', 0, '2022-07-22 10:55:15'),
(149, 'UGX', 'UGX', 'UGX', '1', 0, '2022-07-22 10:55:15'),
(150, 'USD', 'USD', '$', '1', 1, '2022-07-22 10:55:15'),
(151, 'USN', 'USN', 'USN', '1', 0, '2022-12-30 06:20:03'),
(152, 'UYI', 'UYI', 'UYI', '1', 0, '2022-07-22 10:55:15'),
(153, 'UYU', 'UYU', 'UYU', '1', 0, '2022-07-22 10:55:15'),
(154, 'UZS', 'UZS', 'UZS', '1', 0, '2022-07-22 10:55:15'),
(155, 'VEF', 'VEF', 'VEF', '1', 0, '2022-07-22 10:55:15'),
(156, 'VND', 'VND', 'VND', '1', 0, '2022-07-22 10:55:15'),
(157, 'VUV', 'VUV', 'VUV', '1', 0, '2022-07-22 10:55:15'),
(158, 'WST', 'WST', 'WST', '1', 0, '2022-07-22 10:55:15'),
(159, 'XAF', 'XAF', 'XAF', '1', 0, '2022-07-22 10:55:15'),
(160, 'XAG', 'XAG', 'XAG', '1', 0, '2022-07-22 10:55:15'),
(161, 'XAU', 'XAU', 'XAU', '1', 0, '2022-07-22 10:55:15'),
(162, 'XBA', 'XBA', 'XBA', '1', 0, '2022-07-22 10:55:15'),
(163, 'XBB', 'XBB', 'XBB', '1', 0, '2022-07-22 10:55:15'),
(164, 'XBC', 'XBC', 'XBC', '1', 0, '2022-07-22 10:55:15'),
(165, 'XBD', 'XBD', 'XBD', '1', 0, '2022-07-22 10:55:15'),
(166, 'XCD', 'XCD', 'XCD', '1', 0, '2022-07-22 10:55:15'),
(167, 'XDR', 'XDR', 'XDR', '1', 0, '2022-07-22 10:55:15'),
(168, 'XOF', 'XOF', 'XOF', '1', 0, '2022-07-22 10:55:15'),
(169, 'XPD', 'XPD', 'XPD', '1', 0, '2022-07-22 10:55:15'),
(170, 'XPF', 'XPF', 'XPF', '1', 0, '2022-07-22 10:55:15'),
(171, 'XPT', 'XPT', 'XPT', '1', 0, '2022-07-22 10:55:15'),
(172, 'XSU', 'XSU', 'XSU', '1', 0, '2022-07-22 10:55:15'),
(173, 'XTS', 'XTS', 'XTS', '1', 0, '2022-07-22 10:55:15'),
(174, 'XUA', 'XUA', 'XUA', '1', 0, '2022-07-22 10:55:15'),
(175, 'XXX', 'XXX', 'XXX', '1', 0, '2022-07-22 10:55:15'),
(176, 'YER', 'YER', 'YER', '1', 0, '2022-07-22 10:55:15'),
(177, 'ZAR', 'ZAR', 'ZAR', '1', 0, '2022-12-30 06:20:07'),
(178, 'ZMW', 'ZMW', 'ZMW', '1', 0, '2022-07-30 07:34:00'),
(179, 'ZWL', 'ZWL', 'ZWL', '1', 0, '2022-07-22 10:55:15');

ALTER TABLE `custom_field_values` CHANGE `field_value` `field_value` VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;

CREATE TABLE `daily_assignment` (
  `id` int(11) NOT NULL,
  `student_session_id` int(11) NOT NULL,
  `subject_group_subject_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `attachment` varchar(255) DEFAULT NULL,
  `evaluated_by` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `evaluation_date` date DEFAULT NULL,
  `remark` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `dispatch_receive` DROP `updated_at`;
ALTER TABLE `dispatch_receive` CHANGE `date` `date` DATE NULL DEFAULT NULL; 
ALTER TABLE `dispatch_receive` CHANGE `image` `image` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;

CREATE TABLE `email_attachments` (
  `id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `directory` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `attachment_name` varchar(200) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `email_config` ADD `api_key` VARCHAR(255) NULL DEFAULT NULL AFTER `smtp_auth`,
 ADD `api_secret` VARCHAR(255) NULL DEFAULT NULL AFTER `api_key`,
 ADD `region` VARCHAR(255) NULL DEFAULT NULL AFTER `api_secret`;

CREATE TABLE `email_template` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `email_template_attachment` (
  `id` int(11) NOT NULL,
  `email_template_id` int(11) NOT NULL,
  `attachment` varchar(100) NOT NULL,
  `attachment_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `enquiry` CHANGE `assigned` `assigned` INT(11) NULL DEFAULT NULL;
ALTER TABLE `enquiry` CHANGE `class` `class_id` INT(11) NULL DEFAULT NULL;
ALTER TABLE `enquiry` ADD `created_by` INT(11) DEFAULT NULL AFTER `status`,
 ADD `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER `created_by`;

ALTER TABLE `events` CHANGE `event_description` `event_description` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE `events` CHANGE `role_id` `role_id` INT(11) NULL DEFAULT NULL;

ALTER TABLE `exam_group_class_batch_exams` ADD `passing_percentage` FLOAT(10,2) NULL DEFAULT NULL AFTER `exam`;
ALTER TABLE `exam_group_class_batch_exams` ADD `is_rank_generated` INT(1) NOT NULL DEFAULT '0' AFTER `is_publish`;
ALTER TABLE `exam_group_class_batch_exams` MODIFY   `description` text DEFAULT NULL AFTER `is_rank_generated`; 

ALTER TABLE `exam_group_class_batch_exam_students` ADD `rank` INT(20) NOT NULL DEFAULT '0' AFTER `teacher_remark`;
ALTER TABLE `exam_group_class_batch_exam_students` MODIFY `roll_no` int(6) DEFAULT NULL;

ALTER TABLE `expenses` CHANGE `invoice_no` `invoice_no` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;

ALTER TABLE `fees_discounts` ADD `type` VARCHAR(20) NULL DEFAULT NULL AFTER `code`,
 ADD `percentage` FLOAT(10,2) NULL DEFAULT NULL AFTER `type`;

ALTER TABLE `follow_up` ADD `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `followup_by`; 

-- ALTER TABLE `follow_up` CHANGE `followup_by` `followup_by` INT(11) NOT NULL;

CREATE TABLE `gateway_ins` (
  `id` int(11) NOT NULL,
  `online_admission_id` int(11) DEFAULT NULL,
  `gateway_name` varchar(50) NOT NULL,
  `module_type` varchar(255) NOT NULL,
  `unique_id` varchar(255) NOT NULL,
  `parameter_details` mediumtext NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `gateway_ins_response` (
  `id` int(11) NOT NULL,
  `gateway_ins_id` int(11) DEFAULT NULL,
  `posted_data` text,
  `response` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `general_calls` ADD `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER `call_type`;

ALTER TABLE `homework` ADD `marks` FLOAT(10,2) NULL DEFAULT NULL AFTER `submit_date`;
ALTER TABLE `homework` ADD `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP AFTER `evaluated_by`;
ALTER TABLE `homework` CHANGE `evaluation_date` `evaluation_date` DATE NULL DEFAULT NULL;
ALTER TABLE `homework` CHANGE `evaluated_by` `evaluated_by` INT(11) NULL DEFAULT NULL;

ALTER TABLE `homework_evaluation` ADD `marks` FLOAT(10,2) NULL DEFAULT NULL AFTER `student_session_id`,
 ADD `note` VARCHAR(255) NOT NULL AFTER `marks`;
ALTER TABLE `homework_evaluation` ADD `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `status`;

ALTER TABLE `hostel_rooms` DROP `updated_at`;

ALTER TABLE `id_card` ADD `enable_student_barcode` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0=disable,1=enable' AFTER `enable_blood_group`;

ALTER TABLE `income` CHANGE `inc_head_id` `income_head_id` INT(11) NULL DEFAULT NULL;
ALTER TABLE `income` CHANGE `amount` `amount` float(10,2) DEFAULT '0.00';
ALTER TABLE `income` CHANGE `invoice_no` `invoice_no` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;

ALTER TABLE `item` CHANGE `date` `date` DATE NULL DEFAULT NULL;

ALTER TABLE `item_issue` CHANGE `issue_to` `issue_to` INT(11) NOT NULL, CHANGE `issue_by` `issue_by` INT(11) DEFAULT NULL;

ALTER TABLE `item_stock` CHANGE `purchase_price` `purchase_price` FLOAT(10,2) NOT NULL;

ALTER TABLE `item_store` ADD `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER `description`;

ALTER TABLE `languages` ADD `is_rtl` INT(1) NOT NULL AFTER `country_code`;
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_rtl`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 'Croatia', 'hr', 'hr', 0, 'no', 'no', '2022-06-07 11:48:21', NULL);

CREATE TABLE `lesson_plan_forum` (
  `id` int(11) NOT NULL,
  `subject_syllabus_id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL COMMENT 'staff,student',
  `staff_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `libarary_members` CHANGE `id` `id` INT(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE `mark_divisions` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `percentage_from` float(10,2) DEFAULT NULL,
  `percentage_to` float(10,2) DEFAULT NULL,
  `is_active` int(10) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `messages` ADD `email_template_id` INT(11) NULL DEFAULT NULL AFTER `template_id`,
 ADD `sms_template_id` INT(11) NULL DEFAULT NULL AFTER `email_template_id`,
 ADD `send_through` VARCHAR(20) NULL DEFAULT NULL AFTER `sms_template_id`;

ALTER TABLE `messages` ADD `is_schedule` INT(1) NOT NULL AFTER `is_class`,
 ADD `sent` INT(11) NULL DEFAULT NULL AFTER `is_schedule`,
 ADD `schedule_date_time` DATETIME NULL DEFAULT NULL AFTER `sent`;

ALTER TABLE `messages` ADD `schedule_class` INT(11) NULL DEFAULT NULL AFTER `user_list`,
 ADD `schedule_section` VARCHAR(255) NULL DEFAULT NULL AFTER `schedule_class`;

ALTER TABLE `messages` CHANGE `template_id` `template_id` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;

ALTER TABLE `notification_setting` ADD `is_student_recipient` INT(1) NULL DEFAULT NULL AFTER `display_sms`,
 ADD `is_guardian_recipient` INT(1) NULL DEFAULT NULL AFTER `is_student_recipient`,
 ADD `is_staff_recipient` INT(1) NULL DEFAULT NULL AFTER `is_guardian_recipient`,
 ADD `display_student_recipient` INT(1) NULL DEFAULT NULL AFTER `is_staff_recipient`,
 ADD `display_guardian_recipient` INT(1) NULL DEFAULT NULL AFTER `display_student_recipient`,
 ADD `display_staff_recipient` INT(1) NULL DEFAULT NULL AFTER `display_guardian_recipient`;

DELETE FROM notification_setting WHERE `notification_setting`.`id` = 5;

UPDATE `notification_setting` SET `is_student_recipient` = '1' WHERE `notification_setting`.`type` = 'student_admission';
UPDATE `notification_setting` SET `is_guardian_recipient` = '1' WHERE `notification_setting`.`type` = 'student_admission';
UPDATE `notification_setting` SET `display_student_recipient` = '1' WHERE `notification_setting`.`type` = 'student_admission';
UPDATE `notification_setting` SET `display_guardian_recipient` = '1' WHERE `notification_setting`.`type` = 'student_admission';

UPDATE `notification_setting` SET `is_student_recipient` = '1' WHERE `notification_setting`.`type` = 'exam_result';
UPDATE `notification_setting` SET `display_student_recipient` = '1' WHERE `notification_setting`.`type` = 'exam_result';
UPDATE `notification_setting` SET `display_guardian_recipient` = '1' WHERE `notification_setting`.`type` = 'exam_result';

UPDATE `notification_setting` SET `is_student_recipient` = '1' WHERE `notification_setting`.`type` = 'fee_submission';
UPDATE `notification_setting` SET `is_guardian_recipient` = '1' WHERE `notification_setting`.`type` = 'fee_submission';
UPDATE `notification_setting` SET `display_student_recipient` = '1' WHERE `notification_setting`.`type` = 'fee_submission';
UPDATE `notification_setting` SET `display_guardian_recipient` = '1' WHERE `notification_setting`.`type` = 'fee_submission';

UPDATE `notification_setting` SET `is_student_recipient` = '1' WHERE `notification_setting`.`type` = 'absent_attendence';
UPDATE `notification_setting` SET `is_guardian_recipient` = '1' WHERE `notification_setting`.`type` = 'absent_attendence';
UPDATE `notification_setting` SET `display_student_recipient` = '1' WHERE `notification_setting`.`type` = 'absent_attendence';
UPDATE `notification_setting` SET `display_guardian_recipient` = '1' WHERE `notification_setting`.`type` = 'absent_attendence';

UPDATE `notification_setting` SET `is_student_recipient` = '1' WHERE `notification_setting`.`type` = 'homework';
UPDATE `notification_setting` SET `display_student_recipient` = '1' WHERE `notification_setting`.`type` = 'homework';
UPDATE `notification_setting` SET `display_guardian_recipient` = '1' WHERE `notification_setting`.`type` = 'homework';

UPDATE `notification_setting` SET `is_student_recipient` = '1' WHERE `notification_setting`.`type` = 'fees_reminder';
UPDATE `notification_setting` SET `is_guardian_recipient` = '1' WHERE `notification_setting`.`type` = 'fees_reminder';
UPDATE `notification_setting` SET `display_student_recipient` = '1' WHERE `notification_setting`.`type` = 'fees_reminder';
UPDATE `notification_setting` SET `display_guardian_recipient` = '1' WHERE `notification_setting`.`type` = 'fees_reminder';

UPDATE `notification_setting` SET `is_student_recipient` = '1' WHERE `notification_setting`.`type` = 'forgot_password';
UPDATE `notification_setting` SET `is_guardian_recipient` = '1' WHERE `notification_setting`.`type` = 'forgot_password';
UPDATE `notification_setting` SET `is_staff_recipient` = '1' WHERE `notification_setting`.`type` = 'forgot_password';
UPDATE `notification_setting` SET `display_student_recipient` = '1' WHERE `notification_setting`.`type` = 'forgot_password';
UPDATE `notification_setting` SET `display_guardian_recipient` = '1' WHERE `notification_setting`.`type` = 'forgot_password';
UPDATE `notification_setting` SET `display_staff_recipient` = '1' WHERE `notification_setting`.`type` = 'forgot_password';

UPDATE `notification_setting` SET `is_student_recipient` = '1' WHERE `notification_setting`.`type` = 'online_examination_publish_exam';
UPDATE `notification_setting` SET `display_student_recipient` = '1' WHERE `notification_setting`.`type` = 'online_examination_publish_exam';
UPDATE `notification_setting` SET `display_guardian_recipient` = '1' WHERE `notification_setting`.`type` = 'online_examination_publish_exam';

UPDATE `notification_setting` SET `is_student_recipient` = '1' WHERE `notification_setting`.`type` = 'online_examination_publish_result';
UPDATE `notification_setting` SET `display_student_recipient` = '1' WHERE `notification_setting`.`type` = 'online_examination_publish_result';
UPDATE `notification_setting` SET `display_guardian_recipient` = '1' WHERE `notification_setting`.`type` = 'online_examination_publish_result';

INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `is_student_recipient`, `is_guardian_recipient`, `is_staff_recipient`, `display_student_recipient`, `display_guardian_recipient`, `display_staff_recipient`, `subject`, `template_id`, `template`, `variables`, `created_at`) VALUES
(NULL, 'student_login_credential', '1', '1', 0, 0, 1, 1, 1, 0, 1, 1, NULL, 'Student Login Credential', '1707163291685208209', 'Hello {{display_name}} your login details for Url: {{url}} Username: {{username}}  Password: {{password}} admission No: {{admission_no}}', '{{url}} {{display_name}} {{username}} {{password}} {{admission_no}}', '2022-08-06 05:34:41'),
(NULL, 'staff_login_credential', '1', '1', 0, 0, 1, 0, 0, 1, NULL, NULL, 1, 'Staff Login Credential', '1707163291685208209', 'Hello {{first_name}} {{last_name}} your login details for Url: {{url}} Username: {{username}}  Password: {{password}} Employee ID: {{employee_id}}', '{{url}} {{first_name}} {{last_name}} {{username}} {{password}} {{employee_id}}', '2021-12-23 11:59:13'),
(NULL, 'fee_processing', '1', '1', 1, 1, 1, 1, 1, 0, 1, 1, NULL, 'Fee processing', '1707163291301326898', 'Dear parents, we have received Fees Amount {{fee_amount}} for  {{student_name}}  by Your School Name \r\n{{class}} {{section}} {{email}} {{contact_no}}\r\n\r\n{{student_name}} {{class}} {{section}} {{email}} {{contact_no}} transaction_id :{{transaction_id}} {{fee_amount}}', '{{student_name}} {{class}} {{section}} {{email}} {{contact_no}} {{transaction_id}} {{fee_amount}}', '2021-12-22 10:15:42'),
(NULL, 'online_admission_fees_processing', '1', '1', 1, 1, 1, 1, 1, 0, 1, 1, NULL, 'Online Admission Fees Processing', '', 'Dear {{firstname}}  {{lastname}} your online admission form is Submitted successfully and the payment of {{paid_amount}} has processing on date {{date}}. Your Reference number is {{reference_no}} and your transaction id {{transaction_id}}. Please remember your reference number for further process.', ' {{firstname}} {{lastname}} {{date}} {{paid_amount}} {{reference_no}} {{transaction_id}}', '2022-08-06 11:09:47'),
(NULL, 'student_apply_leave', '1', '1', 0, 0, 1, 0, 1, 1, NULL, 1, 1, 'Student Apply Leave ( {{student_name}} - {{admission_no}} )', '', 'My Name is {{student_name}} Class {{class}} section {{section}}. I have to apply leave on {{apply_date}}and from {{from_date}} to {{to_date}}. {{message}} please provide.', '{{message}} {{apply_date}} {{from_date}} {{to_date}} {{student_name}} {{class}} {{section}}', '2022-03-12 11:58:37'),
(NULL, 'email_pdf_exam_marksheet', '1', '0', 0, 0, 0, 1, 1, 0, 1, 1, NULL, 'Email PDF Exam Marksheet ( {{student_name}} - {{admission_no}} )', '', 'Dear {{student_name}} ({{admission_no}}) {{class}} Section {{section}}. We have mailed you the marksheet of Exam {{exam}} Roll no.{{roll_no}}', '{{student_name}} {{class}}  {{section}}  {{admission_no}}  {{roll_no}} {{exam}} {{admit_card_roll_no}} ', '2022-03-12 12:24:42');

UPDATE `notification_setting` SET `variables` = '{{homework_date}} {{submit_date}} {{class}} {{section}} {{subject}} {{student_name}} {{admission_no}}' WHERE `notification_setting`.`type` = 'homework';

UPDATE `notification_setting` SET `display_student_recipient` = '1' WHERE `notification_setting`.`type` = 'online_admission_form_submission';

UPDATE `notification_setting` SET `display_guardian_recipient` = '1' WHERE `notification_setting`.`type` = 'online_admission_form_submission';

UPDATE `notification_setting` SET `display_student_recipient` = '1' WHERE `notification_setting`.`type` = 'online_admission_fees_submission';

UPDATE `notification_setting` SET `display_guardian_recipient` = '1' WHERE `notification_setting`.`type` = 'online_admission_fees_submission';


CREATE TABLE `offline_fees_payments` (
  `id` int(11) NOT NULL,
  `invoice_id` varchar(50) DEFAULT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `student_fees_master_id` int(11) DEFAULT NULL,
  `fee_groups_feetype_id` int(11) DEFAULT NULL,
  `student_transport_fee_id` int(11) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `bank_from` varchar(200) DEFAULT NULL,
  `bank_account_transferred` varchar(200) DEFAULT NULL,
  `reference` varchar(200) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `submit_date` datetime DEFAULT NULL,
  `approve_date` datetime DEFAULT NULL,
  `attachment` text,
  `reply` text,
  `approved_by` int(11) DEFAULT NULL,
  `is_active` varchar(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `onlineexam` ADD `answer_word_count` INT(11) NOT NULL DEFAULT '-1' AFTER `publish_result`;

ALTER TABLE `online_admissions` CHANGE `image` `image` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;
ALTER TABLE `online_admissions` CHANGE `father_pic` `father_pic` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `mother_pic` `mother_pic` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, CHANGE `guardian_pic` `guardian_pic` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE `online_admissions` ADD `submit_date` DATE NULL DEFAULT NULL AFTER `document`;
ALTER TABLE `online_admissions` CHANGE `hostel_room_id` `hostel_room_id` INT(11) NULL DEFAULT NULL;
ALTER TABLE `online_admissions` CHANGE `note` `note` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE `online_admissions` CHANGE `disable_at` `disable_at` DATE NULL DEFAULT NULL;

CREATE TABLE `online_admission_custom_field_value` (
  `id` int(11) NOT NULL,
  `belong_table_id` int(11) DEFAULT NULL,
  `custom_field_id` int(11) DEFAULT NULL,
  `field_value` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `online_admission_fields` (`id`, `name`, `status`, `created_at`) VALUES
(NULL, 'upload_documents', 1, '2022-09-20 08:00:32');

ALTER TABLE `online_admission_payment` CHANGE `admission_id` `online_admission_id` INT(11) NOT NULL;

INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES
(250, 19, 'Daily Assignment', 'daily_assignment', 1, 0, 0, 0, '2022-03-02 07:28:23'),
(251, 6, 'Marks Division', 'marks_division', 1, 1, 1, 1, '2022-07-01 15:24:16'),
(252, 13, 'Schedule Email SMS Log', 'schedule_email_sms_log', 1, 0, 1, 0, '2022-07-09 11:25:16'),
(253, 13, 'Login Credentials Send', 'login_credentials_send', 1, 0, 0, 0, '2022-07-01 15:46:10'),
(254, 13, 'Email Template', 'email_template', 1, 1, 1, 1, '2022-07-01 15:46:10'),
(255, 13, 'SMS Template', 'sms_template', 1, 1, 1, 1, '2022-07-01 15:46:10'),
(256, 14, 'Balance Fees Report With Remark', 'balance_fees_report_with_remark', 1, 0, 0, 0, '2019-10-25 01:55:52'),
(257, 14, 'Balance Fees Statement', 'balance_fees_statement', 1, 0, 0, 0, '2019-10-25 01:55:52'),
(258, 14, 'Daily Collection Report', 'daily_collection_report', 1, 0, 0, 0, '2019-10-25 01:55:52'),
(259, 11, 'Fees Master', 'transport_fees_master', 1, 0, 1, 0, '2022-07-05 09:29:19'),
(260, 11, 'Pickup Point', 'pickup_point', 1, 1, 1, 1, '2022-07-04 09:50:08'),
(261, 11, 'Route Pickup Point', 'route_pickup_point', 1, 1, 1, 1, '2022-07-04 09:50:08'),
(262, 11, 'Student Transport Fees', 'student_transport_fees', 1, 1, 1, 0, '2022-07-05 10:15:55'),
(263, 29, 'Comments', 'lesson_plan_comments', 1, 1, 0, 1, '2020-05-28 22:20:11'),
(264, 15, 'Sidebar Menu', 'sidebar_menu', 1, 0, 0, 0, '2022-07-11 12:01:17'),
(265, 15, 'Currency', 'currency', 1, 0, 0, 0, '2020-08-21 05:36:33'),
(266, 6, 'Exam Schedule', 'exam_schedule', 1, 0, 0, 0, '2019-11-23 23:58:50'),
(267, 6, 'Generate Rank', 'generate_rank', 1, 0, 0, 0, '2019-11-24 05:15:04'),
(268, 8, 'Content Type', 'content_type', 1, 1, 1, 1, '2022-07-08 05:18:54'),
(269, 8, 'Content Share List', 'content_share_list', 1, 0, 0, 1, '2022-07-08 05:18:58'),
(270, 8, 'Video Tutorial', 'video_tutorial', 1, 1, 1, 1, '2022-07-08 05:19:01'),
(271, 15, 'Currency Switcher', 'currency_switcher', 1, 0, 0, 0, '2019-11-24 05:17:11'),
(272, 2, 'Offline Bank Payments', 'offline_bank_payments', 1, 0, 0, 0, '2018-06-27 00:18:15'),
(273, 29, 'Copy Old Lessons', 'copy_old_lesson', 1, 0, 0, 0, '2020-05-28 22:20:11');

UPDATE `permission_category` SET `enable_view` = '1' WHERE `permission_category`.`id` = 128;

UPDATE `permission_category` SET `enable_edit` = '1' WHERE `permission_category`.`id` = 128;

UPDATE `permission_category` SET `enable_view` = '1' WHERE `permission_category`.`id` = 129;

UPDATE `permission_category` SET `enable_edit` = '1' WHERE `permission_category`.`id` = 129; 

UPDATE `permission_category` SET `enable_add` = '1' WHERE `permission_category`.`id` = 136;

UPDATE `permission_category` SET `enable_edit` = '1' WHERE `permission_category`.`id` = 136;

UPDATE `permission_category` SET `enable_delete` = '1' WHERE `permission_category`.`id` = 136;

CREATE TABLE `pickup_point` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `print_headerfooter` ADD `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER `entry_date`;

INSERT INTO `print_headerfooter` (`id`, `print_type`, `header_image`, `footer_content`, `created_by`, `entry_date`, `created_at`) VALUES
(4, 'online_exam', '1655913577-198504634062b33c698fde1!online-exam.jpg', 'This receipt is for online exam computer  generated hence no signature is required.', 1, '2022-08-30 12:58:46', '2022-09-08 17:28:34');

ALTER TABLE `questions` ADD `descriptive_word_limit` INT(11) NOT NULL AFTER `correct`;

ALTER TABLE `questions` CHANGE `section_id` `section_id` INT(11) NULL DEFAULT NULL;

CREATE TABLE `route_pickup_point` (
  `id` int(11) NOT NULL,
  `transport_route_id` int(11) NOT NULL,
  `pickup_point_id` int(11) NOT NULL,
  `fees` float(10,2) DEFAULT '0.00',
  `destination_distance` float(10,1) DEFAULT '0.0',
  `pickup_time` time DEFAULT NULL,
  `order_number` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `sch_settings` ADD `base_url` VARCHAR(500) NULL DEFAULT NULL AFTER `id`,
 ADD `folder_path` text  DEFAULT NULL AFTER `base_url`;

ALTER TABLE `sch_settings` ADD `collect_back_date_fees` INT(11) NOT NULL AFTER `is_duplicate_fees_invoice`,
 ADD `single_page_print` INT(1) DEFAULT '0' AFTER `collect_back_date_fees`;

ALTER TABLE `sch_settings` ADD `currency_format` VARCHAR(20) DEFAULT NULL AFTER `currency_place`;

ALTER TABLE `sch_settings` ADD `admin_login_page_background` VARCHAR(255) NOT NULL AFTER `admin_small_logo`,
 ADD `user_login_page_background` VARCHAR(255) NOT NULL AFTER `admin_login_page_background`;

ALTER TABLE `sch_settings` ADD `online_admission_application_form` VARCHAR(255) NULL DEFAULT NULL AFTER `online_admission_conditions`,
 ADD `exam_result` INT(11) NOT NULL AFTER `online_admission_application_form`;

ALTER TABLE `sch_settings` ADD `student_barcode` INT(11) NOT NULL DEFAULT '1' AFTER `upload_documents`;

ALTER TABLE `sch_settings` ADD `staff_barcode` INT(11) NOT NULL DEFAULT '1' AFTER `staff_upload_documents`,
 ADD `staff_notification_email` VARCHAR(50) NOT NULL AFTER `staff_barcode`;

ALTER TABLE `sch_settings`
 ADD `admin_mobile_api_url` TINYTEXT NOT NULL AFTER `app_secondary_color_code`,
 ADD `admin_app_primary_color_code` varchar(20) NOT NULL AFTER `admin_mobile_api_url`,
  ADD `admin_app_secondary_color_code` VARCHAR(20) NOT NULL AFTER `admin_app_primary_color_code`;

ALTER TABLE `sch_settings`
 ADD `superadmin_restriction` VARCHAR(20) NOT NULL AFTER `my_question`,
  ADD `student_timeline` VARCHAR(20) NOT NULL AFTER `superadmin_restriction`,
   ADD `calendar_event_reminder` INT(2) NULL DEFAULT NULL AFTER `student_timeline`,
    ADD `event_reminder` VARCHAR(20) NOT NULL AFTER `calendar_event_reminder`,
     ADD `student_login` VARCHAR(100) NULL DEFAULT NULL AFTER `event_reminder`,
      ADD `parent_login` VARCHAR(100) NULL DEFAULT NULL AFTER `student_login`,
       ADD `student_panel_login` INT(1) NOT NULL DEFAULT '1' AFTER `parent_login`,
        ADD `parent_panel_login` INT(1) NOT NULL DEFAULT '1' AFTER `student_panel_login`,
         ADD   `is_student_feature_lock` int(1) NOT NULL DEFAULT '0' AFTER `parent_panel_login`,
          ADD `maintenance_mode` INT(1) NOT NULL DEFAULT '0' AFTER `is_student_feature_lock`,
           ADD `lock_grace_period` INT(10) NOT NULL DEFAULT '0' AFTER `maintenance_mode`,
            ADD `is_offline_fee_payment` INT(1) NOT NULL DEFAULT '0' AFTER `lock_grace_period`,
             ADD `offline_bank_payment_instruction` TEXT NOT NULL AFTER `is_offline_fee_payment`;

UPDATE `sch_settings` SET `admin_login_page_background` = '1663064530-1070210809632059d2b8b0b!1662796232-1721792380631c41c80d038!login_bg3.jpg' WHERE `sch_settings`.`id` = 1;

UPDATE `sch_settings` SET `user_login_page_background` = '1663065284-93117584263205cc49769c!1662964519-2099955753631ed327d0ffa!login_bg5.jpg' WHERE `sch_settings`.`id` = 1;

UPDATE `sch_settings` SET `currency` = '150' WHERE `sch_settings`.`id` = 1;

UPDATE `sch_settings` SET `currency_format` = '####.##' WHERE `sch_settings`.`id` = 1;

ALTER TABLE `sch_settings` ADD `low_attendance_limit` FLOAT(10,2) NOT NULL AFTER `attendence_type`;

ALTER TABLE `send_notification` ADD `attachment` VARCHAR(500) NULL DEFAULT NULL AFTER `date`;

CREATE TABLE `share_contents` (
  `id` int(11) NOT NULL,
  `send_to` varchar(50) DEFAULT NULL,
  `title` text,
  `share_date` date DEFAULT NULL,
  `valid_upto` date DEFAULT NULL,
  `description` text,
  `created_by` int(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `share_content_for` (
  `id` int(11) NOT NULL,
  `group_id` varchar(20) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `user_parent_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `class_section_id` int(11) DEFAULT NULL,
  `share_content_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `share_upload_contents` (
  `id` int(11) NOT NULL,
  `upload_content_id` int(11) DEFAULT NULL,
  `share_content_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sidebar_menus` (
  `id` int(11) NOT NULL,
  `permission_group_id` int(10) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `menu` varchar(500) DEFAULT NULL,
  `activate_menu` varchar(100) DEFAULT NULL,
  `lang_key` varchar(250) NOT NULL,
  `system_level` int(3) DEFAULT '0',
  `level` int(5) DEFAULT NULL,
  `sidebar_display` int(1) DEFAULT '0',
  `access_permissions` text,
  `is_active` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sidebar_menus` (`id`, `permission_group_id`, `icon`, `menu`, `activate_menu`, `lang_key`, `system_level`, `level`, `sidebar_display`, `access_permissions`, `is_active`, `created_at`) VALUES
(1, 17, 'fa fa-ioxhost ftlayer', 'Front Office', 'front_office', 'front_office', 10, 1, 1, '(\'admission_enquiry\', \'can_view\') || (\'visitor_book\', \'can_view\') ||       (\'phon_call_log\', \'can_view\') ||  (\'postal_dispatch\', \'can_view\') ||       (\'postal_receive\', \'can_view\') || (\'complaint\', \'can_view\') ||(\'setup_font_office\', \'can_view\')', 1, '2023-01-10 12:49:51'),
(2, 1, 'fa fa-user-plus ftlayer', 'Student Information', 'student_information', 'student_information', 20, 2, 1, '(\'student\', \'can_view\') || (\'student\', \'can_add\') || (\'student_history\', \'can_view\') || (\'student_categories\', \'can_view\') || (\'student_houses\', \'can_view\') || (\'disable_student\', \'can_view\') || (\'disable_reason\', \'can_view\') || (\'online_admission\', \'can_view\') || (\'multiclass_student\', \'can_view\') || (\'disable_reason\', \'can_view\')', 1, '2023-01-10 12:49:51'),
(3, 2, 'fa fa-money ftlayer', 'Fees Collection', 'fees_collection', 'fees_collection', 30, 3, 1, '(\'collect_fees\', \'can_view\') || (\'search_fees_payment\', \'can_view\') || (\'search_due_fees\', \'can_view\') || (\'fees_statement\', \'can_view\') || (\'fees_carry_forward\', \'can_view\') || (\'fees_master\', \'can_view\') || (\'fees_group\', \'can_view\') || (\'fees_type\', \'can_view\') || (\'fees_discount\', \'can_view\') || (\'accountants\', \'can_view\')', 1, '2023-01-10 12:49:51'),
(4, 3, 'fa fa-usd ftlayer', 'Income', 'income', 'income', 40, 10, 1, '(\'income\', \'can_view\') || (\'search_income\', \'can_view\') || (\'income_head\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(7, 4, 'fa fa-credit-card ftlayer', 'Expense', 'expense', 'expenses', 50, 11, 1, '(\'expense\', \'can_view\') || (\'search_expense\', \'can_view\') || (\'expense_head\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(10, 5, 'fa fa-calendar-check-o ftlayer', 'Attendance', 'attendance', 'attendance', 60, 13, 1, '(\'student_attendance\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(11, 6, 'fa fa-map-o ftlayer', 'Examinations', 'examinations', 'examinations', 70, 12, 1, '(\'exam_group\', \'can_view\') || (\'exam_result\', \'can_view\') || (\'design_admit_card\', \'can_view\') || (\'print_admit_card\', \'can_view\') || (\'design_marksheet\', \'can_view\') || (\'print_marksheet\', \'can_view\') || (\'marks_grade\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(12, 23, 'fa fa-rss ftlayer', 'Online Examinations', 'online_examinations', 'online_examinations', 80, 14, 1, '(\'online_examination\', \'can_view\') ||  (\'question_bank\', \'can_view\'', 1, '2023-01-10 12:49:37'),
(13, 29, 'fa fa-list-alt ftlayer', 'Lesson Plan', 'lesson_plan', 'lesson_plan', 90, 16, 1, '(\'manage_lesson_plan\', \'can_view\') || (\'manage_syllabus_status\', \'can_view\') || (\'lesson\', \'can_view\') ||  (\'topic\', \'can_view\')||  (\'copy_old_lesson\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(14, 7, 'fa fa-mortar-board ftlayer', 'Academics', 'academics', 'academics', 100, 15, 1, '(\'class_timetable\', \'can_view\') || (\'teachers_timetable\', \'can_view\') || (\'assign_class_teacher\', \'can_view\') || (\'promote_student\', \'can_view\') || (\'subject_group\', \'can_view\') || (\'section\', \'can_view\') || (\'subject\', \'can_view\') || (\'class\', \'can_view\') || (\'section\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(15, 18, 'fa fa-sitemap ftlayer', 'Human Resource', 'human_resource', 'human_resource', 110, 17, 1, '(\'staff\', \'can_view\') || (\'approve_leave_request\', \'can_view\') || (\'apply_leave\', \'can_view\') || (\'leave_types\', \'can_view\') || (\'teachers_rating\', \'can_view\') || (\'department\', \'can_view\') || (\'designation\', \'can_view\') || (\'disable_staff\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(16, 13, 'fa fa-bullhorn ftlayer', 'Communicate', 'communicate', 'communicate', 120, 18, 1, '(\'notice_board\', \'can_view\') || (\'email\', \'can_view\') || (\'sms\', \'can_view\') || (\'email_sms_log\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(17, 8, 'fa fa-download ftlayer', 'Download Center', 'download_center', 'download_center', 130, 19, 1, '(\'upload_content\', \'can_view\') || (\'video_tutorial\', \'can_view\') || (\'content_type\', \'can_view\') || (\'content_share_list\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(18, 19, 'fa fa-flask ftlayer', 'Homework', 'homework', 'homework', 140, 20, 1, '(\'homework\', \'can_view\') || (\'homework\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(19, 9, 'fa fa-book ftlayer', 'Library', 'library', 'library', 150, 21, 1, '(\'books\', \'can_view\') || (\'issue_return\', \'can_view\') || (\'add_staff_member\', \'can_view\') || (\'add_student\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(20, 10, 'fa fa-object-group ftlayer', 'Inventory', 'inventory', 'inventory', 160, 22, 1, '(\'issue_item\', \'can_view\') || (\'item_stock\', \'can_view\') || (\'item\', \'can_view\') || (\'item_category\', \'can_view\') || (\'item_category\', \'can_view\') || (\'store\', \'can_view\') || (\'supplier\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(21, 11, 'fa fa-bus ftlayer', 'Transport', 'transport', 'transport', 170, 23, 1, '(\'routes\', \'can_view\') || (\'vehicle\', \'can_view\') || (\'assign_vehicle\', \'can_view\') || (\'transport_fees_master\', \'can_view\') || (\'pickup_point\', \'can_view\') || (\'route_pickup_point\', \'can_view\') || (\'student_transport_fees\', \'can_view\')      ', 1, '2023-01-10 12:49:37'),
(22, 12, 'fa fa-building-o ftlayer', 'Hostel', 'hostel', 'hostel', 180, 24, 1, '(\'hostel_rooms\', \'can_view\') || (\'room_type\', \'can_view\') || (\'hostel\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(23, 20, 'fa fa-newspaper-o ftlayer', 'Certificate', 'certificate', 'certificate', 190, 25, 1, '(\'student_certificate\', \'can_view\') || (\'generate_certificate\', \'can_view\') || (\'student_id_card\', \'can_view\') || (\'generate_id_card\', \'can_view\') || (\'staff_id_card\', \'can_view\') || (\'generate_staff_id_card\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(24, 16, 'fa fa-empire ftlayer', 'Front CMS', 'front_cms', 'front_cms', 200, 26, 1, '(\'event\', \'can_view\') || (\'gallery\', \'can_view\') || (\'notice\', \'can_view\') || (\'media_manager\', \'can_view\') || (\'pages\', \'can_view\') || (\'menus\', \'can_view\') || (\'banner_images\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(25, 28, 'fa fa-universal-access ftlayer', 'Alumni', 'alumni', 'alumni', 210, 27, 1, '(\'manage_alumni\', \'can_view\') || (\'events\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(26, 14, 'fa fa-line-chart ftlayer', 'Reports', 'reports', 'reports', 220, 28, 1, '(\'student_report\', \'can_view\') || (\'guardian_report\', \'can_view\') || (\'student_history\', \'can_view\') || (\'student_login_credential_report\', \'can_view\') || (\'class_subject_report\', \'can_view\') || (\'admission_report\', \'can_view\') || (\'sibling_report\', \'can_view\') || (\'evaluation_report\', \'can_view\') || (\'student_profile\', \'can_view\') || (\'fees_statement\', \'can_view\') || (\'balance_fees_report\', \'can_view\') || (\'fees_collection_report\', \'can_view\') || (\'online_fees_collection_report\', \'can_view\') || (\'income_report\', \'can_view\') || (\'expense_report\', \'can_view\') || (\'payroll_report\', \'can_view\') || (\'income_group_report\', \'can_view\') || (\'expense_group_report\', \'can_view\') || (\'attendance_report\', \'can_view\') || (\'staff_attendance_report\', \'can_view\') || (\'exam_marks_report\', \'can_view\') ||        (\'online_exam_wise_report\', \'can_view\') || (\'online_exams_report\', \'can_view\') || (\'online_exams_attempt_report\', \'can_view\') || (\'online_exams_rank_report\', \'can_view\') || (\'payroll_report\', \'can_view\') || (\'transport_report\', \'can_view\') || (\'hostel_report\', \'can_view\') || (\'audit_trail_report\', \'can_view\') || (\'user_log\', \'can_view\') || (\'book_issue_report\', \'can_view\') || (\'book_due_report\', \'can_view\') || (\'book_inventory_report\', \'can_view\') || (\'stock_report\', \'can_view\') ||      (\'add_item_report\', \'can_view\') || (\'issue_inventory_report\', \'can_view\') || (\'syllabus_status_report\', \'can_view\') ||    (\'teacher_syllabus_status_report\', \'can_view\') || (\'daily_collection_report\', \'can_view\') || (\'balance_fees_statement\', \'can_view\') || (\'balance_fees_report_with_remark\', \'can_view\')', 1, '2023-01-10 12:49:37'),
(27, 15, 'fa fa-gears ftlayer', 'System Settings', 'system_settings', 'system_setting', 230, 29, 1, '(\'general_setting\', \'can_view\') || (\'session_setting\', \'can_view\') || (\'notification_setting\', \'can_view\') || (\'sms_setting\', \'can_view\') || (\'email_setting\', \'can_view\') || (\'payment_methods\', \'can_view\') || (\'languages\', \'can_view\') || (\'user_status\', \'can_view\') || (\'backup_restore\', \'can_view\') || (\'print_header_footer\', \'can_view\') || (\'backup\', \'can_view\') || (\'front_cms_setting\', \'can_view\') || (\'custom_fields\', \'can_view\') || (\'system_fields\', \'can_view\') || (\'student_profile_update\', \'can_view\') || (\'currency\', \'can_view\') || (\'language_switcher\', \'can_view\') || (\'sidebar_menu\', \'can_view\') || (\'online_admission\', \'can_view\')\r\n', 1, '2023-01-10 12:49:37');

CREATE TABLE `sidebar_sub_menus` (
  `id` int(11) NOT NULL,
  `sidebar_menu_id` int(10) DEFAULT NULL,
  `menu` varchar(500) DEFAULT NULL,
  `key` varchar(500) DEFAULT NULL,
  `lang_key` varchar(250) DEFAULT NULL,
  `url` text,
  `level` int(5) DEFAULT NULL,
  `access_permissions` varchar(500) DEFAULT NULL,
  `permission_group_id` int(11) DEFAULT NULL,
  `activate_controller` varchar(100) DEFAULT NULL COMMENT 'income',
  `activate_methods` varchar(500) DEFAULT NULL COMMENT 'index,edit',
  `addon_permission` varchar(100) DEFAULT NULL,
  `is_active` int(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sidebar_sub_menus` (`id`, `sidebar_menu_id`, `menu`, `key`, `lang_key`, `url`, `level`, `access_permissions`, `permission_group_id`, `activate_controller`, `activate_methods`, `addon_permission`, `is_active`, `created_at`) VALUES
(1, 1, 'admission_enquiry', NULL, 'admission_enquiry', 'admin/enquiry', 1, '(\'admission_enquiry\', \'can_view\')', NULL, 'enquiry', 'index', NULL, 1, '2022-07-11 12:04:46'),
(2, 1, 'visitor_book', NULL, 'visitor_book', 'admin/visitors', 2, '(\'visitor_book\', \'can_view\')', NULL, 'visitors', 'index', NULL, 1, '2022-07-11 12:04:46'),
(3, 1, 'phone_call_log', NULL, 'phone_call_log', 'admin/generalcall', 3, '(\'phone_call_log\', \'can_view\')', NULL, 'generalcall', 'index,edit', NULL, 1, '2022-05-10 11:40:07'),
(4, 1, 'postal_dispatch', NULL, 'postal_dispatch', 'admin/dispatch', 4, '(\'postal_dispatch\', \'can_view\')', NULL, 'dispatch', 'index,editdispatch', NULL, 1, '2022-05-10 11:40:09'),
(5, 1, 'postal_receive', NULL, 'postal_receive', 'admin/receive', 5, '(\'postal_receive\', \'can_view\')', NULL, 'receive', 'index,editreceive', NULL, 1, '2022-05-10 11:40:09'),
(6, 1, 'complain', NULL, 'complain', 'admin/complaint', 6, '(\'complaint\', \'can_view\')', NULL, 'complaint', 'index,edit', NULL, 1, '2022-05-10 11:40:00'),
(7, 1, 'setup_front_office', NULL, 'setup_front_office', 'admin/visitorspurpose', 7, '(\'setup_font_office\', \'can_view\')', NULL, 'visitorspurpose', 'index,edit', NULL, 1, '2022-04-18 15:43:15'),
(9, 2, 'student_admission', NULL, 'student_admission', 'student/create', 2, '(\'student\', \'can_add\')', NULL, 'student', 'create,import', NULL, 1, '2022-08-30 07:51:02'),
(10, 2, 'online_admission', NULL, 'online_admission', 'admin/onlinestudent', 3, '(\'online_admission\', \'can_view\')', 27, 'onlinestudent', 'index,edit', NULL, 1, '2022-05-10 11:40:30'),
(11, 2, 'disable_student', NULL, 'disabled_students', 'student/disablestudentslist', 4, '(\'disable_student\', \'can_view\')', NULL, 'student', 'disablestudentslist', '', 1, '2022-07-23 06:49:00'),
(12, 3, 'collect_fees', NULL, 'collect_fees', 'studentfee', 1, '(\'collect_fees\', \'can_view\')', NULL, 'studentfee', 'index,addfee', NULL, 1, '2022-07-23 06:53:34'),
(13, 3, 'search_fees_payment', NULL, 'search_fees_payment', 'studentfee/searchpayment', 3, '(\'search_fees_payment\', \'can_view\')', NULL, 'studentfee', 'searchpayment', NULL, 1, '2022-08-08 06:03:40'),
(14, 3, 'search_due_fees', NULL, 'search_due_fees', 'studentfee/feesearch', 4, '(\'search_due_fees\', \'can_view\')', NULL, 'studentfee', 'feesearch', NULL, 1, '2022-08-08 06:03:38'),
(15, 3, 'fees_master', NULL, 'fees_master', 'admin/feemaster', 5, '(\'fees_master\', \'can_view\')', NULL, 'feemaster', 'index,assign,edit', NULL, 1, '2022-09-24 07:35:55'),
(16, 3, 'fees_group', NULL, 'fees_group', 'admin/feegroup', 6, '(\'fees_group\', \'can_view\')', NULL, 'feegroup', 'index,edit', NULL, 1, '2022-08-08 06:03:32'),
(17, 4, 'add_income', NULL, 'add_income', 'admin/income', 1, '(\'income\', \'can_view\')', NULL, 'income', 'index,edit', NULL, 1, '2022-07-23 07:03:40'),
(18, 4, 'search_income', NULL, 'search_income', 'admin/income/incomesearch', 2, '(\'search_income\', \'can_view\')', NULL, 'income', 'incomesearch', NULL, 1, '2022-07-23 07:10:13'),
(19, 4, 'income_head', NULL, 'income_head', 'admin/incomehead', 3, '(\'income_head\', \'can_view\')', NULL, 'incomehead', 'index,edit', NULL, 1, '2022-07-23 07:11:11'),
(20, 2, 'student_details', NULL, 'student_details', 'student/search', 1, '(\'student\', \'can_view\')', NULL, 'student', 'search,view,edit', NULL, 1, '2022-08-30 07:51:05'),
(21, 2, 'multi_class_student', NULL, 'multi_class_student', 'student/multiclass', 5, '(\'multi_class_student\', \'can_view\')', 26, 'student', 'multiclass', NULL, 1, '2022-07-23 06:48:37'),
(22, 2, 'bulk_delete', NULL, 'bulk_delete', 'student/bulkdelete', 6, '(\'student\', \'can_delete\')', NULL, 'student', 'bulkdelete', NULL, 1, '2022-07-23 06:48:11'),
(23, 2, 'student_categories', NULL, 'student_categories', 'category', 7, '(\'student_categories\', \'can_view\')', NULL, 'category', 'index,edit', NULL, 1, '2022-07-23 06:47:24'),
(24, 2, 'student_house', NULL, 'student_house', 'admin/schoolhouse', 8, '(\'student_houses\', \'can_view\')', NULL, 'schoolhouse', 'index,edit', NULL, 1, '2022-07-23 06:49:59'),
(25, 2, 'disable_reason', NULL, 'disable_reason', 'admin/disable_reason', 9, '(\'disable_reason\', \'can_view\')', NULL, 'disable_reason', 'index,edit', NULL, 1, '2022-07-23 06:50:41'),
(29, 7, 'add_expense', NULL, 'add_expense', 'admin/expense', 1, '(\'expense\', \'can_view\')', NULL, 'expense', 'index,edit', '', 1, '2022-07-23 07:12:25'),
(32, 3, 'fees_type', NULL, 'fees_type', 'admin/feetype', 7, '(\'fees_type\', \'can_view\')', NULL, 'feetype', 'index,edit', '', 1, '2022-08-08 06:03:29'),
(33, 10, 'attendance_by_date', 'attendance_by_date', 'attendance_by_date', 'admin/stuattendence/attendencereport', 3, '(\'attendance_by_date\', \'can_view\')', NULL, 'stuattendence', 'attendencereport', '', 1, '2022-10-20 05:50:25'),
(34, 10, 'student_attendance', 'student_attendance', 'student_attendance', 'admin/stuattendence', 1, '(\'student_attendance\', \'can_view\')', NULL, 'stuattendence', 'index', '', 1, '2022-10-20 05:50:25'),
(35, 10, 'approve_leave', 'approve_leave', 'approve_leave', 'admin/approve_leave', 2, '(\'approve_leave\', \'can_view\')', NULL, 'approve_leave', 'index', '', 1, '2022-10-14 16:16:44'),
(36, 11, 'exam_group', NULL, 'exam_group', 'admin/examgroup', 1, '(\'exam_group\', \'can_view\')', NULL, 'examgroup', 'index,addexam,edit', '', 1, '2022-07-23 07:23:01'),
(37, 11, 'exam_schedule', NULL, 'exam_schedule', 'admin/exam_schedule', 2, '(\'student_attendance\', \'can_view\')', NULL, 'exam_schedule', 'index', '', 1, '2022-05-16 07:01:34'),
(38, 11, 'exam_result', NULL, 'exam_result', 'admin/examresult', 3, '(\'exam_result\', \'can_view\')', NULL, 'examresult', 'index', '', 1, '2022-05-16 07:01:34'),
(39, 11, 'design_admit_card', NULL, 'design_admit_card', 'admin/admitcard', 4, '(\'design_admit_card\', \'can_view\')', NULL, 'admitcard', 'index,edit', '', 1, '2022-07-23 07:28:02'),
(40, 11, 'print_admit_card', NULL, 'print_admit_card', 'admin/examresult/admitcard', 5, '(\'print_admit_card\', \'can_view\')', NULL, 'examresult', 'admitcard', '', 1, '2022-05-16 07:01:34'),
(41, 11, 'design_marksheet', NULL, 'design_marksheet', 'admin/marksheet', 6, '(\'design_marksheet\', \'can_view\')', NULL, 'marksheet', 'index,edit', '', 1, '2022-07-23 07:35:35'),
(42, 11, 'print_marksheet', NULL, 'print_marksheet', 'admin/examresult/marksheet', 7, '(\'print_marksheet\', \'can_view\')', NULL, 'examresult', 'marksheet', '', 1, '2022-05-16 07:01:38'),
(43, 11, 'marks_grade', NULL, 'marks_grade', 'admin/grade', 8, '(\'marks_grade\', \'can_view\')', NULL, 'grade', 'index,edit', '', 1, '2022-07-23 07:37:15'),
(44, 11, 'marks_division', NULL, 'marks_division', 'admin/marksdivision', 9, '(\'marks_division\', \'can_view\')', NULL, 'marksdivision', 'index,edit', '', 1, '2022-08-25 06:04:26'),
(45, 12, 'online_exam', NULL, 'online_exam', 'admin/onlineexam', 1, '(\'online_examination\', \'can_view\')', NULL, 'onlineexam', 'index,evalution,assign', '', 1, '2022-08-30 13:03:45'),
(46, 12, 'question_bank', NULL, 'question_bank', 'admin/question', 1, '(\'question_bank\', \'can_view\')', NULL, 'question', 'index,read', '', 1, '2022-08-30 11:03:13'),
(47, 13, 'manage_lesson_plan', NULL, 'manage_lesson_plan', 'admin/syllabus', 2, '(\'manage_lesson_plan\', \'can_view\')', NULL, 'syllabus', 'index', '', 1, '2022-09-03 16:59:31'),
(48, 13, 'manage_syllabus_status', NULL, 'manage_syllabus_status', 'admin/syllabus/status', 3, '(\'manage_syllabus_status\', \'can_view\')', NULL, 'syllabus', 'status', '', 1, '2022-09-03 16:59:35'),
(49, 13, 'lesson', NULL, 'lesson', 'admin/lessonplan/lesson', 4, '(\'lesson\', \'can_view\')', NULL, 'lessonplan', 'lesson,editlesson', '', 1, '2022-09-15 11:30:55'),
(50, 13, 'topic', NULL, 'topic', 'admin/lessonplan/topic', 5, '(\'topic\', \'can_view\')', NULL, 'lessonplan', 'topic,edittopic', '', 1, '2022-09-15 11:30:24'),
(51, 14, 'class_timetable', NULL, 'class_timetable', 'admin/timetable/classreport', 1, '(\'class_timetable\', \'can_view\')', NULL, 'timetable', 'classreport,create', '', 1, '2022-07-23 09:01:22'),
(52, 14, 'teachers_timetable', NULL, 'teachers_timetable', 'admin/timetable/mytimetable', 2, '(\'teachers_time_table\', \'can_view\')', NULL, 'timetable', 'mytimetable', '', 1, '2022-07-20 12:22:59'),
(53, 14, 'assign_class_teacher', NULL, 'assign_class_teacher', 'admin/teacher/assign_class_teacher', 3, '(\'assign_class_teacher\', \'can_view\')', NULL, 'teacher', 'assign_class_teacher,update_class_teacher', '', 1, '2022-07-23 09:00:19'),
(54, 14, 'promote_students', NULL, 'promote_students', 'admin/stdtransfer', 4, '(\'promote_student\', \'can_view\')', NULL, 'stdtransfer', 'index', '', 1, '2022-07-20 12:22:54'),
(55, 14, 'subject_group', NULL, 'subject_group', 'admin/subjectgroup', 5, '(\'subject_group\', \'can_view\')', NULL, 'subjectgroup', 'index,edit', '', 1, '2022-07-23 08:59:42'),
(56, 14, 'subjects', NULL, 'subjects', 'admin/subject', 6, '(\'subject\', \'can_view\')', NULL, 'subject', 'index,edit', '', 1, '2022-07-23 08:59:20'),
(57, 14, 'class', NULL, 'class', 'classes', 7, '(\'class\', \'can_view\')', NULL, 'classes', 'index,edit', '', 1, '2022-07-23 08:58:49'),
(58, 14, 'sections', NULL, 'sections', 'sections', 8, '(\'section\', \'can_view\')', NULL, 'sections', 'index,edit', '', 1, '2022-07-23 08:58:21'),
(59, 15, 'staff_directory', NULL, 'staff_directory', 'admin/staff', 1, '(\'staff\', \'can_view\')', NULL, 'staff', 'index,edit,profile,create', '', 1, '2022-10-12 09:13:24'),
(60, 15, 'staff_attendance', NULL, 'staff_attendance', 'admin/staffattendance', 1, '(\'staff_attendance\', \'can_view\')', NULL, 'staffattendance', 'index', '', 1, '2022-09-07 12:04:15'),
(61, 15, 'payroll', NULL, 'payroll', 'admin/payroll', 1, '(\'staff_payroll\', \'can_view\')', NULL, 'payroll', 'index,edit,create', '', 1, '2022-08-16 11:58:44'),
(62, 15, 'approve_leave_request', NULL, 'approve_leave_request', 'admin/leaverequest/leaverequest', 1, '(\'approve_leave_request\', \'can_view\')', NULL, 'leaverequest', 'leaverequest', '', 1, '2022-05-16 09:04:33'),
(74, 15, 'apply_leave', NULL, 'apply_leave', 'admin/staff/leaverequest', 1, '(\'apply_leave\', \'can_view\')', NULL, 'staff', 'leaverequest', '', 1, '2022-05-16 09:11:41'),
(75, 15, 'leave_type', NULL, 'leave_type', 'admin/leavetypes', 1, '(\'leave_types\', \'can_view\')', NULL, 'leavetypes', 'index,leaveedit,createleavetype', '', 1, '2022-10-18 11:19:22'),
(76, 15, 'teachers_rating', NULL, 'teachers_rating', 'admin/staff/rating', 1, '(\'teachers_rating\', \'can_view\')', NULL, 'staff', 'rating', '', 1, '2022-05-16 09:15:31'),
(77, 15, 'department', NULL, 'department', 'admin/department/department', 1, '(\'department\', \'can_view\')', NULL, 'department', 'department,departmentedit', '', 1, '2022-07-23 09:14:20'),
(78, 15, 'designation', NULL, 'designation', 'admin/designation/designation', 1, '(\'designation\', \'can_view\')', NULL, 'designation', 'designation,designationedit', '', 1, '2022-07-23 09:15:04'),
(79, 15, 'disabled_staff', NULL, 'disabled_staff', 'admin/staff/disablestafflist', 1, '(\'disable_staff\', \'can_view\')', NULL, 'staff', 'disablestafflist', '', 1, '2022-09-13 07:46:56'),
(80, 16, 'notice_board', NULL, 'notice_board', 'admin/notification', 1, '(\'notice_board\', \'can_view\')', NULL, 'notification', 'index,edit,add', '', 1, '2022-07-23 09:17:24'),
(81, 16, 'send_email', NULL, 'send_email', 'admin/mailsms/compose', 2, '(\'email\', \'can_view\')', NULL, 'mailsms', 'compose', '', 1, '2022-09-02 16:52:46'),
(82, 16, 'send_sms', NULL, 'send_sms', 'admin/mailsms/compose_sms', 3, '(\'sms\', \'can_view\')', NULL, 'mailsms', 'compose_sms', '', 1, '2022-09-02 16:52:46'),
(83, 16, 'email_sms_log', NULL, 'email_sms_log', 'admin/mailsms/index', 4, '(\'email_sms_log\', \'can_view\')', NULL, 'mailsms', 'index', '', 1, '2022-09-02 16:52:50'),
(84, 16, 'schedule_email_sms_log', NULL, 'schedule_email_sms_log', 'admin/mailsms/schedule', 5, '(\'schedule_email_sms_log\', \'can_view\')', NULL, 'mailsms', 'schedule,edit_schedule', '', 1, '2022-09-13 07:07:38'),
(85, 16, 'login_credentials_send', NULL, 'login_credentials_send', 'student/bulkmail', 6, '(\'login_credentials_send\', \'can_view\')', NULL, 'student', 'bulkmail', '', 1, '2022-09-02 16:52:46'),
(86, 16, 'email_template', NULL, 'email_template', 'admin/mailsms/email_template', 7, '(\'email_template\', \'can_view\')', NULL, 'mailsms', 'email_template', '', 1, '2022-09-02 16:52:46'),
(87, 16, 'sms_template', NULL, 'sms_template', 'admin/mailsms/sms_template', 8, '(\'sms_template\', \'can_view\')', NULL, 'mailsms', 'sms_template', '', 1, '2022-09-02 16:52:46'),
(88, 17, 'content_type', NULL, 'content_type', 'admin/contenttype', 1, '(\'content_type\', \'can_view\')', NULL, 'contenttype', 'index,edit', '', 1, '2022-07-23 09:24:45'),
(89, 17, 'content_share_list', NULL, 'content_share_list', 'admin/content/list', 1, '(\'content_share_list\', \'can_view\')', NULL, 'content', 'list', '', 1, '2022-07-22 10:07:17'),
(90, 17, 'upload_content', NULL, 'upload_content', 'admin/content/upload', 1, '(\'upload_content\', \'can_view\')', NULL, 'content', 'upload', '', 1, '2022-07-22 10:07:17'),
(91, 17, 'video_tutorial', NULL, 'video_tutorial', 'admin/video_tutorial', 1, '(\'video_tutorial\', \'can_view\')', NULL, 'video_tutorial', 'index', '', 1, '2022-07-22 10:07:17'),
(92, 18, 'add_homework', NULL, 'add_homework', 'homework', 1, '(\'homework\', \'can_view\')', NULL, 'homework', 'index', '', 1, '2022-06-25 09:50:01'),
(93, 18, 'daily_assignment', NULL, 'daily_assignment', 'homework/dailyassignment', 2, '(\'daily_assignment\', \'can_view\')', NULL, 'homework', 'dailyassignment', '', 1, '2022-07-23 09:27:23'),
(94, 19, 'book_list', NULL, 'book_list', 'admin/book/getall', 1, '(\'books\', \'can_view\')', NULL, 'book', 'getall,index,edit,import,issue_returnreport', '', 1, '2022-09-07 11:45:50'),
(95, 19, 'issue_return', NULL, 'issue_return', 'admin/member', 1, '(\'issue_return\', \'can_view\')', NULL, 'member', 'index,issue', '', 1, '2022-07-23 09:32:48'),
(96, 19, 'add_student', NULL, 'add_student', 'admin/member/student', 1, '(\'add_student\', \'can_view\')', NULL, 'member', 'student', '', 1, '2022-05-16 11:22:54'),
(97, 19, 'add_staff_member', NULL, 'add_staff_member', 'admin/member/teacher', 1, '(\'add_staff_member\', \'can_view\')', NULL, 'member', 'teacher', '', 1, '2022-05-16 11:31:43'),
(98, 7, 'search_expense', NULL, 'search_expense', 'admin/expense/expensesearch', 1, '(\'search_expense\', \'can_view\')', NULL, 'expense', 'expensesearch', '', 1, '2022-05-16 11:36:09'),
(99, 7, 'expense_head', NULL, 'expense_head', 'admin/expensehead', 1, '(\'expense_head\', \'can_view\')', NULL, 'expensehead', 'index,edit', '', 1, '2022-07-23 07:16:17'),
(100, 20, 'issue_item', NULL, 'issue_item', 'admin/issueitem', 1, '(\'issue_item\', \'can_view\')', NULL, 'issueitem', 'index,create', '', 1, '2022-07-23 09:35:03'),
(101, 20, 'add_item_stock', NULL, 'add_item_stock', 'admin/itemstock', 1, '(\'item_stock\', \'can_view\')', NULL, 'itemstock', 'index,edit', '', 1, '2022-07-23 09:36:17'),
(102, 20, 'add_item', NULL, 'add_item', 'admin/item', 1, '(\'item\', \'can_view\')', NULL, 'item', 'index,edit', '', 1, '2022-07-23 09:36:56'),
(103, 20, 'item_category', NULL, 'item_category', 'admin/itemcategory', 1, '(\'item_category\', \'can_view\')', NULL, 'itemcategory', 'index,edit', '', 1, '2022-07-23 09:37:12'),
(104, 20, 'item_store', NULL, 'item_store', 'admin/itemstore', 1, '(\'store\', \'can_view\')', NULL, 'itemstore', 'index,edit,create', '', 1, '2022-09-16 11:49:03'),
(105, 20, 'item_supplier', NULL, 'item_supplier', 'admin/itemsupplier', 1, '(\'supplier\', \'can_view\')', NULL, 'itemsupplier', 'index,edit,create', '', 1, '2022-07-23 09:38:22'),
(106, 21, 'fees_master', NULL, 'fees_master', 'admin/transport/feemaster', 1, '(\'transport\', \'can_view\')', NULL, 'transport', 'feemaster', '', 1, '2022-07-16 13:15:23'),
(107, 21, 'pickup_point', NULL, 'pickup_point', 'admin/pickuppoint', 1, '(\'transport\', \'can_view\')', NULL, 'pickuppoint', 'index', '', 1, '2022-05-16 12:25:27'),
(108, 21, 'routes', NULL, 'routes', 'admin/route', 1, '(\'routes\', \'can_view\')', NULL, 'route', 'index,edit', '', 1, '2022-09-17 06:21:23'),
(109, 21, 'vehicles', NULL, 'vehicles', 'admin/vehicle', 1, '(\'vehicle\', \'can_view\')', NULL, 'vehicle', 'index', '', 1, '2022-05-16 12:29:35'),
(110, 21, 'assign_vehicle', NULL, 'assign_vehicle', 'admin/vehroute', 1, '(\'assign_vehicle\',\'can_view\')', NULL, 'vehroute', 'index,edit', '', 1, '2022-10-19 07:06:08'),
(111, 21, 'route_pickup_point', NULL, 'route_pickup_point', 'admin/pickuppoint/assign', 1, '(\'transport\', \'can_view\')', NULL, 'pickuppoint', 'assign', '', 1, '2022-05-16 12:33:05'),
(112, 21, 'student_transport_fees', NULL, 'student_transport_fees', 'admin/pickuppoint/student_fees', 1, '(\'transport\', \'can_view\')', NULL, 'pickuppoint', 'student_fees', '', 1, '2022-05-16 12:49:48'),
(113, 22, 'hostel_rooms', NULL, 'hostel_rooms', 'admin/hostelroom', 1, '(\'hostel_rooms\', \'can_view\')', NULL, 'hostelroom', 'index,edit', '', 1, '2022-07-23 10:27:48'),
(114, 22, 'room_type', NULL, 'room_type', 'admin/roomtype', 2, '(\'room_type\', \'can_view\')', NULL, 'roomtype', 'index,edit', '', 1, '2022-07-23 10:32:14'),
(115, 22, 'hostel', NULL, 'hostel', 'admin/hostel', 3, '(\'hostel\', \'can_view\')', NULL, 'hostel', 'index,edit', '', 1, '2022-07-23 10:32:39'),
(116, 23, 'student_certificate', NULL, 'student_certificate', 'admin/certificate', 1, '(\'student_certificate\', \'can_view\')', NULL, 'certificate', 'index,edit', '', 1, '2022-07-23 10:44:30'),
(117, 23, 'generate_certificate', NULL, 'generate_certificate', 'admin/generatecertificate', 1, '(\'generate_certificate\', \'can_view\')', NULL, 'generatecertificate', 'index,search', '', 1, '2022-07-23 10:46:16'),
(118, 23, 'student_id_card', NULL, 'student_id_card', 'admin/studentidcard', 1, '(\'student_id_card\', \'can_view\')', NULL, 'studentidcard', 'index,edit', '', 1, '2022-07-23 10:47:01'),
(119, 23, 'generate_id_card', NULL, 'generate_id_card', 'admin/generateidcard/search', 1, '(\'generate_id_card\', \'can_view\')', NULL, 'generateidcard', 'search', '', 1, '2022-05-18 05:35:13'),
(120, 23, 'staff_id_card', NULL, 'staff_id_card', 'admin/staffidcard', 1, '(\'staff_id_card\', \'can_view\')', NULL, 'staffidcard', 'index,edit', '', 1, '2022-07-23 10:48:13'),
(121, 23, 'generate_staff_id_card', NULL, 'generate_staff_id_card', 'admin/generatestaffidcard', 1, '(\'generate_staff_id_card\', \'can_view\')', NULL, 'generatestaffidcard', 'index,search', '', 1, '2022-07-23 10:49:06'),
(122, 24, 'event', NULL, 'event', 'admin/front/events', 1, '(\'event\', \'can_view\')', NULL, 'events', 'index,edit,create', '', 1, '2022-07-23 10:51:51'),
(123, 24, 'gallery', NULL, 'gallery', 'admin/front/gallery', 1, '(\'gallery\', \'can_view\')', NULL, 'gallery', 'index,edit,create', '', 1, '2022-07-23 10:52:22'),
(124, 24, 'news', NULL, 'news', 'admin/front/notice', 1, '(\'notice\', \'can_view\')', NULL, 'notice', 'index,edit,create', '', 1, '2022-07-23 10:54:23'),
(125, 24, 'media_manager', NULL, 'media_manager', 'admin/front/media', 1, '(\'media_manager\', \'can_view\')', NULL, 'media', 'index', '', 1, '2022-05-18 06:03:32'),
(126, 24, 'pages', NULL, 'pages', 'admin/front/page', 1, '(\'pages\', \'can_view\')', NULL, 'page', 'index,edit,create', '', 1, '2022-07-23 10:55:28'),
(127, 24, 'menus', NULL, 'menus', 'admin/front/menus', 1, '(\'menus\', \'can_view\')', NULL, 'menus', 'index,additem', '', 1, '2022-07-23 10:56:31'),
(128, 24, 'banner_images', NULL, 'banner_images', 'admin/front/banner', 1, '(\'banner_images\', \'can_view\')', NULL, 'banner', 'index', '', 1, '2022-05-18 06:10:53'),
(129, 25, 'manage_alumini', NULL, 'manage_alumini', 'admin/alumni/alumnilist', 1, '(\'manage_alumni\', \'can_view\')', NULL, 'alumni', 'alumnilist', '', 1, '2022-07-23 10:58:36'),
(130, 25, 'events', NULL, 'events', 'admin/alumni/events', 1, '(\'events\', \'can_view\')', NULL, 'alumni', 'events', '', 1, '2022-07-23 10:59:09'),
(131, 26, 'student_information', NULL, 'student_information', 'report/studentinformation', 1, '(\'student_report\', \'can_view\') || (\'guardian_report\', \'can_view\') || (\'student_history\', \'can_view\') || (\'student_login_credential_report\', \'can_view\') || (\'class_subject_report\', \'can_view\') || (\'admission_report\', \'can_view\') || (\'sibling_report\', \'can_view\') || (\'homehork_evaluation_report\', \'can_view\') || (\'student_profile\', \'can_view\') || (\'student_gender_ratio_report\', \'can_view\') || (\'student_teacher_ratio_report\', \'can_view\')', NULL, 'report', 'studentinformation,studentreport,online_admission_report,student_teacher_ratio,boys_girls_ratio,student_profile,sibling_report,admission_report,class_subject,classsectionreport,guardianreport,admissionreport,logindetailreport,parentlogindetailreport', '', 1, '2022-09-26 05:26:53'),
(132, 26, 'finance', NULL, 'finance', 'financereports/finance', 2, '(\'fees_statement\', \'can_view\') || (\'balance_fees_report\', \'can_view\') || (\'fees_collection_report\', \'can_view\') || (\'online_fees_collection_report\', \'can_view\') || (\'income_report\', \'can_view\') || (\'expense_report\', \'can_view\') || (\'payroll_report\', \'can_view\') || (\'income_group_report\', \'can_view\') || (\'expense_group_report\', \'can_view\') || (\'online_admission\', \'can_view\')', NULL, 'financereports', 'finance,reportduefees,reportdailycollection,reportbyname,studentacademicreport,collection_report,onlinefees_report,duefeesremark,income,expense,payroll,incomegroup,expensegroup,onlineadmission', '', 1, '2022-09-24 12:20:32'),
(133, 26, 'attendance', NULL, 'attendance', 'attendencereports/attendance', 3, '(\'attendance_report\', \'can_view\') || (\'student_attendance_type_report\', \'can_view\') || (\'daily_attendance_report\', \'can_view\') || (\'staff_attendance_report\', \'can_view\')', NULL, 'attendencereports', 'attendance,classattendencereport,attendancereport,daily_attendance_report,staffattendancereport,biometric_attlog,reportbymonthstudent,reportbymonth', '', 1, '2022-09-26 11:36:08'),
(134, 26, 'examinations', NULL, 'examinations', 'admin/examresult/examinations', 4, '(\'rank_report\', \'can_view\')', NULL, 'examresult', 'rankreport,examinations', '', 1, '2022-09-20 08:34:13'),
(135, 26, 'lesson_plan', NULL, 'lesson_plan', 'report/lesson_plan', 6, '(\'syllabus_status_report\', \'can_view\') || (\'teacher_syllabus_status_report\', \'can_view\')', NULL, 'report', 'lesson_plan,teachersyllabusstatus', '', 1, '2022-07-25 11:39:17'),
(136, 26, 'human_resource', NULL, 'human_resource', 'report/human_resource', 7, '(\'staff_report\', \'can_view\') || (\'payroll_report\', \'can_view\')', NULL, 'report', 'human_resource,staff_report,payrollreport', '', 1, '2022-07-25 11:38:20'),
(137, 26, 'library', NULL, 'library', 'report/library', 9, '(\'book_issue_report\', \'can_view\') || (\'book_due_report\', \'can_view\') || (\'book_issue_return_report\', \'can_view\') || (\'book_inventory_report\', \'can_view\')', NULL, 'report', 'library,studentbookissuereport,bookduereport,bookinventory', '', 1, '2022-09-07 11:53:15'),
(138, 26, 'inventory', NULL, 'inventory', 'report/inventory', 10, '(\'stock_report\', \'can_view\') || (\'add_item_report\', \'can_view\') || (\'issue_item_report\', \'can_view\')', NULL, 'report', 'inventory,inventorystock,additem,issueinventory', '', 1, '2022-07-25 11:30:57'),
(139, 26, 'hostel', NULL, 'hostel', 'admin/hostelroom/studenthosteldetails', 12, '(\'hostel_report\', \'can_view\')', NULL, 'hostelroom', 'studenthosteldetails', '', 1, '2022-07-20 12:30:07'),
(140, 26, 'alumni', NULL, 'alumni', 'report/alumnireport', 13, '(\'alumni_report\', \'can_view\')', NULL, 'report', 'alumnireport', '', 1, '2022-07-20 12:30:07'),
(141, 26, 'user_log', NULL, 'user_log', 'admin/userlog', 14, '(\'user_log\', \'can_view\')', NULL, 'userlog', 'index', '', 1, '2022-07-20 12:30:07'),
(142, 26, 'audit_trail_report', NULL, 'audit_trail_report', 'admin/audit', 15, '(\'audit_trail_report\', \'can_view\')', NULL, 'audit', 'index', '', 1, '2022-07-20 12:30:07'),
(143, 26, 'online_examinations', NULL, 'online_examinations', 'admin/onlineexam/report', 5, '(\'online_exam_wise_report\', \'can_view\') || (\'online_exams_report\', \'can_view\') || (\'online_exams_attempt_report\', \'can_view\') || (\'online_exams_rank_report\', \'can_view\')', NULL, 'onlineexam', 'report,onlineexams', '', 1, '2022-07-25 11:48:23'),
(144, 26, 'homework', NULL, 'homework', 'homework/homeworkordailyassignmentreport', 8, '(\'homework\', \'can_view\') || (\'daily_assignment\', \'can_view\')', NULL, 'homework', 'homeworkordailyassignmentreport,homeworkreport,evaluation_report,dailyassignmentreport', '', 1, '2022-09-21 09:28:47'),
(145, 26, 'transport', NULL, 'transport', 'admin/route/studenttransportdetails', 11, '(\'transport_report\', \'can_view\')', NULL, 'route', 'studenttransportdetails', '', 1, '2022-07-20 12:30:07'),
(146, 27, 'general_setting', NULL, 'general_setting', 'schsettings', 1, '(\'general_setting\', \'can_view\')', NULL, 'schsettings', 'index,logo,miscellaneous,backendtheme,mobileapp,studentguardianpanel,fees,idautogeneration,attendancetype,maintenance', '', 1, '2022-07-25 11:14:13'),
(147, 27, 'session_setting', NULL, 'session_setting', 'sessions', 2, '(\'session_setting\', \'can_view\')', NULL, 'sessions', 'index,edit', '', 1, '2022-07-23 11:57:16'),
(148, 27, 'notification_setting', NULL, 'notification_setting', 'admin/notification/setting', 3, '(\'notification_setting\', \'can_view\')', NULL, 'notification', 'setting', '', 1, '2022-07-08 08:12:28'),
(149, 27, 'sms_setting', NULL, 'sms_setting', 'smsconfig', 4, '(\'sms_setting\', \'can_view\')', NULL, 'smsconfig', 'index', '', 1, '2022-07-08 08:12:28'),
(150, 27, 'email_setting', NULL, 'email_setting', 'emailconfig', 5, '(\'email_setting\', \'can_view\')', NULL, 'emailconfig', 'index', '', 1, '2022-07-08 08:12:28'),
(151, 27, 'payment_methods', NULL, 'payment_methods', 'admin/paymentsettings', 6, '(\'payment_methods\', \'can_view\')', NULL, 'paymentsettings', 'index', '', 1, '2022-07-08 08:12:28'),
(152, 27, 'print_headerfooter', NULL, 'print_headerfooter', 'admin/print_headerfooter', 7, '(\'print_header_footer\', \'can_view\')', NULL, 'print_headerfooter', 'index', '', 1, '2022-07-08 08:12:28'),
(153, 27, 'front_cms_setting', NULL, 'front_cms_setting', 'admin/frontcms', 8, '(\'front_cms_setting\', \'can_view\')', NULL, 'frontcms', 'index', '', 1, '2022-07-08 08:12:28'),
(154, 27, 'roles_permissions', NULL, 'roles_permissions', 'admin/roles', 9, '(\'superadmin\', \'can_view\')', NULL, 'roles', 'index,permission', '', 1, '2022-09-09 11:03:34'),
(155, 27, 'backup_restore', NULL, 'backup_restore', 'admin/admin/backup', 10, '(\'backup\', \'can_view\')', NULL, 'admin', 'backup', '', 1, '2022-07-08 08:12:28'),
(156, 27, 'users', NULL, 'users', 'admin/users', 13, '(\'user_status\', \'can_view\')', NULL, 'users', 'index', '', 1, '2022-07-20 12:34:09'),
(157, 27, 'languages', NULL, 'languages', 'admin/language', 11, '(\'languages\', \'can_view\')', NULL, 'language', 'index,create', '', 1, '2022-09-10 09:14:52'),
(158, 27, 'modules', NULL, 'modules', 'admin/module', 14, '(\'superadmin\', \'can_view\')', NULL, 'module', 'index', '', 1, '2022-07-20 12:34:06'),
(159, 27, 'custom_fields', NULL, 'custom_fields', 'admin/customfield', 15, '(\'custom_fields\', \'can_view\')', NULL, 'customfield', 'index,edit', '', 1, '2022-07-23 12:02:14'),
(160, 27, 'captcha_setting', NULL, 'captcha_setting', 'admin/captcha', 16, '(\'superadmin\', \'can_view\')', NULL, 'captcha', 'index', '', 1, '2022-07-20 12:34:06'),
(161, 27, 'system_fields', NULL, 'system_fields', 'admin/systemfield', 17, '(\'system_fields\', \'can_view\')', NULL, 'systemfield', 'index', '', 1, '2022-07-22 06:07:38'),
(162, 27, 'student_profile_update', NULL, 'student_profile_update', 'student/profilesetting', 18, '(\'student_profile_update\', \'can_view\')', NULL, 'student', 'profilesetting', '', 1, '2022-07-20 12:34:06'),
(163, 27, 'online_admission', NULL, 'online_admission', 'admin/onlineadmission/admissionsetting', 19, '(\'online_admission\', \'can_view\')', NULL, 'onlineadmission', 'admissionsetting', '', 1, '2022-07-20 12:34:06'),
(164, 27, 'file_types', NULL, 'file_types', 'admin/admin/filetype', 20, '(\'superadmin\', \'can_view\')', NULL, 'admin', 'filetype', '', 1, '2022-07-20 12:34:30'),
(165, 27, 'system_update', NULL, 'system_update', 'admin/updater', 22, '(\'superadmin\', \'can_view\')', NULL, 'updater', 'index', '', 1, '2022-10-13 11:49:51'),
(166, 27, 'sidebar_menu', NULL, 'sidebar_menu', 'admin/sidemenu', 21, '(\'sidebar_menu\', \'can_view\')', NULL, 'sidemenu', 'index', '', 1, '2022-10-13 11:49:51'),
(181, 3, 'fees_discount', NULL, 'fees_discount', 'admin/feediscount', 8, '(\'fees_discount\', \'can_view\')', NULL, 'feediscount', 'index,edit,assign', '', 1, '2022-08-08 06:03:27'),
(182, 3, 'fees_carry_forward', NULL, 'fees_carry_forward', 'admin/feesforward', 9, '(\'fees_carry_forward\', \'can_view\')', NULL, 'feesforward', 'index', '', 1, '2022-08-08 06:03:24'),
(183, 3, 'fees_reminder', NULL, 'fees_reminder', 'admin/feereminder/setting', 10, '(\'fees_reminder\', \'can_view\')', NULL, 'feereminder', 'setting', '', 1, '2022-08-08 06:03:21'),
(184, 27, 'currency', NULL, 'currency', 'admin/currency', 12, '(\'currency\', \'can_view\')', NULL, 'currency', 'index', '', 1, '2022-07-20 12:34:09'),
(190, 3, 'offline_bank_payments', NULL, 'offline_bank_payments', 'admin/offlinepayment', 2, '(\'offline_bank_payments\', \'can_view\')', NULL, 'offlinepayment', 'index', '', 1, '2022-08-08 06:05:29'),
(191, 13, 'Copy Old Lessons', NULL, 'copy_old_lesson', 'admin/lessonplan/copylesson', 1, '(\'copy_old_lesson\', \'can_view\')', NULL, 'lessonplan', 'copylesson', NULL, 1, '2022-09-09 10:20:37'),
(192, 10, 'Period Attendance', 'period_attendance', 'period_attendance', 'admin/subjectattendence/index', 4, '(\'student_attendance\',\'can_view\')', NULL, 'subjectattendence', 'index', NULL, 0, '2022-10-20 05:50:25'),
(193, 10, 'Period Attendance By Date', 'period_attendance_by_date', 'period_attendance_by_date', 'admin/subjectattendence/reportbydate', 5, '(\'attendance_by_date\', \'can_view\')', NULL, 'subjectattendence', 'reportbydate', NULL, 0, '2022-10-20 05:50:25');

CREATE TABLE `sms_template` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `staff` ADD `currency_id` INT(11) DEFAULT '0' AFTER `lang_id`;

ALTER TABLE `staff` CHANGE `department` `department` INT(11) NULL DEFAULT NULL, CHANGE `designation` `designation` INT(11) NULL DEFAULT NULL;

ALTER TABLE `staff_attendance`
 ADD `biometric_attendence` int(1) DEFAULT '0' AFTER `staff_attendance_type_id`,
 ADD `biometric_device_data` text AFTER `biometric_attendence`;

ALTER TABLE `staff_id_card` ADD `enable_staff_barcode` TINYINT(1) NOT NULL COMMENT '0=disable,1=enable' AFTER `enable_staff_phone`;

ALTER TABLE `staff_leave_request` ADD `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER `date`;
ALTER TABLE `staff_leave_request` CHANGE `applied_by` `applied_by` INT(11) NULL DEFAULT NULL;

ALTER TABLE `staff_payslip` ADD `generated_by` INT(11) NULL DEFAULT NULL AFTER `remark`;

ALTER TABLE `staff_payslip` ADD `created_at` TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER `generated_by`;

ALTER TABLE `staff_timeline` ADD `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER `date`;

ALTER TABLE `students`
  DROP `route_id`,
  DROP `vehroute_id`;

ALTER TABLE `students` CHANGE `measurement_date` `measurement_date` DATE NULL DEFAULT NULL;
ALTER TABLE `students` CHANGE `school_house_id` `school_house_id` INT(11) NULL DEFAULT NULL;
ALTER TABLE `students` CHANGE `hostel_room_id` `hostel_room_id` INT(11) NULL DEFAULT NULL;
ALTER TABLE `students` CHANGE `disable_at` `disable_at` DATE NULL DEFAULT NULL;

ALTER TABLE `student_applyleave` CHANGE `docs` `docs` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;
ALTER TABLE `student_applyleave` ADD `approve_date` DATE NULL DEFAULT NULL AFTER `approve_by`;
ALTER TABLE `student_applyleave` CHANGE `approve_by` `approve_by` INT(11) NULL DEFAULT NULL;
ALTER TABLE `student_applyleave` MODIFY  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() after request_type;

ALTER TABLE `student_attendences` CHANGE `updated_at` `updated_at` TIMESTAMP NULL DEFAULT NULL;

ALTER TABLE `student_fees_deposite` ADD `student_transport_fee_id` INT(11) NULL DEFAULT NULL AFTER `fee_groups_feetype_id`;

CREATE TABLE `student_fees_processing` (
  `id` int(11) NOT NULL,
  `gateway_ins_id` int(11) NOT NULL,
  `fee_category` varchar(255) NOT NULL,
  `student_fees_master_id` int(11) DEFAULT NULL,
  `fee_groups_feetype_id` int(11) DEFAULT NULL,
  `student_transport_fee_id` int(11) DEFAULT NULL,
  `amount_detail` text,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `student_session` DROP `route_id`;
ALTER TABLE `student_session` ADD `route_pickup_point_id` INT(11) NULL DEFAULT NULL AFTER `vehroute_id`;
ALTER TABLE `student_session` ADD `is_leave` INT(1) NOT NULL DEFAULT '0' AFTER `fees_discount`;
ALTER TABLE `student_session` CHANGE `hostel_room_id` `hostel_room_id` INT(11) NULL DEFAULT NULL;

ALTER TABLE `student_timeline` CHANGE `description` `description` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE `student_timeline` ADD `created_student_id` INT(11) NOT NULL AFTER `status`;
ALTER TABLE `student_timeline` CHANGE `document` `document` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;

CREATE TABLE `student_transport_fees` (
  `id` int(11) NOT NULL,
  `transport_feemaster_id` int(10) NOT NULL,
  `student_session_id` int(11) NOT NULL,
  `route_pickup_point_id` int(11) NOT NULL,
  `generated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE `template_marksheets` ADD `header_image` VARCHAR(200) NULL DEFAULT NULL AFTER `id`;
ALTER TABLE `template_marksheets` ADD `is_rank` INT(1) NOT NULL DEFAULT '0' AFTER `is_division`;

CREATE TABLE `transport_feemaster` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `month` varchar(50) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `fine_amount` float(10,2) DEFAULT '0.00',
  `fine_type` varchar(50) DEFAULT NULL,
  `fine_percentage` float(10,2) DEFAULT '0.00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `transport_route` DROP `fare`;

CREATE TABLE `upload_contents` (
  `id` int(11) NOT NULL,
  `content_type_id` int(10) NOT NULL,
  `image` varchar(300) DEFAULT NULL,
  `thumb_path` varchar(300) DEFAULT NULL,
  `dir_path` varchar(300) DEFAULT NULL,
  `real_name` text NOT NULL,
  `img_name` varchar(300) DEFAULT NULL,
  `thumb_name` varchar(300) DEFAULT NULL,
  `file_type` varchar(100) NOT NULL,
  `mime_type` text NOT NULL,
  `file_size` varchar(100) NOT NULL,
  `vid_url` text NOT NULL,
  `vid_title` varchar(250) NOT NULL,
  `upload_by` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `users` ADD `currency_id` INT(1) DEFAULT '0' AFTER `lang_id`;
ALTER TABLE `users`  MODIFY   `verification_code` varchar(200) NOT NULL AFTER currency_id;  

ALTER TABLE `users_authentication` ADD `staff_id` INT(11) NULL DEFAULT NULL AFTER `token`;

ALTER TABLE `vehicles` ADD `vehicle_photo` VARCHAR(255) NULL DEFAULT NULL AFTER `vehicle_model`;
ALTER TABLE `vehicles` ADD `registration_number` VARCHAR(50) NOT NULL AFTER `manufacture_year`,
 ADD `chasis_number` VARCHAR(100) NOT NULL AFTER `registration_number`,
 ADD `max_seating_capacity` VARCHAR(255) NOT NULL AFTER `chasis_number`;

CREATE TABLE `video_tutorial` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `vid_title` text,
  `description` text NOT NULL,
  `thumb_path` varchar(500) DEFAULT NULL,
  `dir_path` varchar(500) DEFAULT NULL,
  `img_name` varchar(300) NOT NULL,
  `thumb_name` varchar(300) NOT NULL,
  `video_link` varchar(100) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `video_tutorial_class_sections` (
  `id` int(11) NOT NULL,
  `video_tutorial_id` int(11) NOT NULL,
  `class_section_id` int(11) NOT NULL,
  `created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `visitors_book` 
 ADD `staff_id` INT(11) NULL DEFAULT NULL AFTER `id`,
 ADD `student_session_id` INT(11) NULL DEFAULT NULL AFTER `staff_id`;
ALTER TABLE `visitors_book` CHANGE `no_of_pepple` `no_of_people` INT(11) NOT NULL;
ALTER TABLE `visitors_book` ADD `meeting_with` VARCHAR(20) NOT NULL AFTER `image`;
ALTER TABLE `visitors_book` ADD `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER `meeting_with`;
ALTER TABLE `visitors_book` CHANGE `image` `image` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;

ALTER TABLE `alumni_events`   
  ADD KEY `session_id` (`session_id`),
  ADD KEY `class_id` (`class_id`); 

ALTER TABLE `book_issues`   
  ADD KEY `book_id` (`book_id`),
  ADD KEY `member_id` (`member_id`);

ALTER TABLE `class_section_times`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_section_id` (`class_section_id`);

ALTER TABLE `class_teacher`
  ADD KEY `class_id` (`class_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `staff_id` (`staff_id`);

ALTER TABLE `contents`
  ADD KEY `created_by` (`created_by`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `cls_sec_id` (`cls_sec_id`);

ALTER TABLE `content_types`
  ADD PRIMARY KEY (`id`); 

ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `custom_fields`
  ADD KEY `idx_name` (`name`),
  ADD KEY `idx_belong_to` (`belong_to`),
  ADD KEY `idx_type` (`type`),
  ADD KEY `idx_visible_on_table` (`visible_on_table`),
  ADD KEY `idx_weight` (`weight`);
  
ALTER TABLE `custom_fields` ADD FULLTEXT KEY `idx_field_values` (`field_values`);

ALTER TABLE `custom_field_values` 
  ADD KEY `idx_belong_table_id` (`belong_table_id`),
  ADD KEY `idx_field_value` (`field_value`);

ALTER TABLE `daily_assignment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_session_id` (`student_session_id`),
  ADD KEY `evaluated_by` (`evaluated_by`),
  ADD KEY `subject_group_subject_id` (`subject_group_subject_id`);

ALTER TABLE `email_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_id` (`message_id`);

ALTER TABLE `email_template`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `email_template_attachment`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `enquiry` 
  ADD KEY `created_by` (`created_by`),
  ADD KEY `assigned` (`assigned`),
  ADD KEY `enquiry_ibfk_4` (`class_id`);

ALTER TABLE `events` 
  ADD KEY `role_id` (`role_id`);

ALTER TABLE `exams`  
  ADD KEY `sesion_id` (`sesion_id`);

ALTER TABLE `exam_group_students`
  ADD KEY `student_session_id` (`student_session_id`);

ALTER TABLE `exam_schedules` 
  ADD KEY `session_id` (`session_id`),
  ADD KEY `exam_id` (`exam_id`);

ALTER TABLE `expenses` 
  ADD KEY `exp_head_id` (`exp_head_id`);

ALTER TABLE `feemasters` 
  ADD KEY `session_id` (`session_id`),
  ADD KEY `feetype_id` (`feetype_id`),
  ADD KEY `class_id` (`class_id`);

ALTER TABLE `follow_up` 
  ADD KEY `enquiry_id` (`enquiry_id`),
  ADD KEY `followup_by` (`followup_by`);

ALTER TABLE `front_cms_menu_items`
  ADD KEY `menu_id` (`menu_id`);

ALTER TABLE `gateway_ins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_admission_id` (`online_admission_id`);

ALTER TABLE `gateway_ins_response`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gateway_ins_id` (`gateway_ins_id`);

ALTER TABLE `homework`    
  ADD KEY `class_id` (`class_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `evaluated_by` (`evaluated_by`),
  ADD KEY `created_by` (`created_by`);

ALTER TABLE `homework_evaluation` 
  ADD KEY `homework_id` (`homework_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `student_session_id` (`student_session_id`);

ALTER TABLE `hostel_rooms` 
  ADD KEY `hostel_id` (`hostel_id`),
  ADD KEY `room_type_id` (`room_type_id`);

ALTER TABLE `income` 
  ADD KEY `income_head_id` (`income_head_id`);

ALTER TABLE `item` 
  ADD KEY `item_category_id` (`item_category_id`),
  ADD KEY `item_store_id` (`item_store_id`),
  ADD KEY `item_supplier_id` (`item_supplier_id`);

ALTER TABLE `item_issue`
  ADD KEY `issue_to` (`issue_to`),
  ADD KEY `issue_by` (`issue_by`);

ALTER TABLE `lesson_plan_forum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_syllabus_id` (`subject_syllabus_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `staff_id` (`staff_id`);

ALTER TABLE `mark_divisions`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `offline_fees_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_fees_master_id` (`student_fees_master_id`),
  ADD KEY `fee_groups_feetype_id` (`fee_groups_feetype_id`),
  ADD KEY `student_transport_fee_id` (`student_transport_fee_id`),
  ADD KEY `offline_fees_payments_ibfk_4` (`approved_by`),
  ADD KEY `student_session_id` (`student_session_id`);

ALTER TABLE `online_admissions` 
  ADD KEY `category_id` (`category_id`),
  ADD KEY `hostel_room_id` (`hostel_room_id`),
  ADD KEY `school_house_id` (`school_house_id`);

ALTER TABLE `online_admission_custom_field_value`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_field_id` (`custom_field_id`);

ALTER TABLE `online_admission_payment` 
  ADD KEY `online_admission_id` (`online_admission_id`);

ALTER TABLE `payslip_allowance`  
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `payslip_id` (`payslip_id`);

ALTER TABLE `permission_category`  
  ADD KEY `idx_short_code` (`short_code`),
  ADD KEY `perm_group_id` (`perm_group_id`);

ALTER TABLE `permission_student`  
  ADD KEY `group_id` (`group_id`);

ALTER TABLE `pickup_point`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `questions` 
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `class_section_id` (`class_section_id`);

ALTER TABLE `read_notification` 
  ADD KEY `notification_id` (`notification_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `student_id` (`student_id`);

ALTER TABLE `roles_permissions`   
  ADD KEY `role_id` (`role_id`),
  ADD KEY `perm_cat_id` (`perm_cat_id`); 

ALTER TABLE `route_pickup_point`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transport_route_id` (`transport_route_id`),
  ADD KEY `pickup_point_id` (`pickup_point_id`);

ALTER TABLE `send_notification`  
  ADD KEY `created_id` (`created_id`);

ALTER TABLE `share_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`); 

ALTER TABLE `share_content_for`
  ADD PRIMARY KEY (`id`),
  ADD KEY `upload_content_id` (`share_content_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `class_section_id` (`class_section_id`),
  ADD KEY `user_parent_id` (`user_parent_id`);

ALTER TABLE `share_upload_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `upload_content_id` (`upload_content_id`),
  ADD KEY `share_content_id` (`share_content_id`);

ALTER TABLE `sidebar_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_group_id` (`permission_group_id`);

ALTER TABLE `sidebar_sub_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sidebar_menu_id` (`sidebar_menu_id`),
  ADD KEY `permission_group_id` (`permission_group_id`);

ALTER TABLE `sms_template`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `staff`     
  ADD KEY `designation` (`designation`),
  ADD KEY `department` (`department`);

ALTER TABLE `student_fees_processing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_fees_master_id` (`student_fees_master_id`),
  ADD KEY `fee_groups_feetype_id` (`fee_groups_feetype_id`),
  ADD KEY `student_transport_fee_id` (`student_transport_fee_id`),
  ADD KEY `gateway_ins_id` (`gateway_ins_id`);

ALTER TABLE `staff_leave_request` 
  ADD KEY `applied_by` (`applied_by`);

ALTER TABLE `student_applyleave` 
  ADD KEY `student_session_id` (`student_session_id`),
  ADD KEY `approve_by` (`approve_by`);

ALTER TABLE `student_fees` 
  ADD KEY `feemaster_id` (`feemaster_id`),
  ADD KEY `student_session_id` (`student_session_id`);

ALTER TABLE `student_fees_deposite`  
  ADD KEY `student_transport_fee_id` (`student_transport_fee_id`);

ALTER TABLE `student_session` 
  ADD KEY `student_session_ibfk_5` (`vehroute_id`),
  ADD KEY `hostel_room_id` (`hostel_room_id`),
  ADD KEY `student_session_ibfk_6` (`route_pickup_point_id`);

ALTER TABLE `student_timeline` 
  ADD KEY `student_id` (`student_id`);

ALTER TABLE `student_transport_fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_session_id` (`student_session_id`),
  ADD KEY `route_pickup_point_id` (`route_pickup_point_id`),
  ADD KEY `transport_feemaster_id` (`transport_feemaster_id`);

ALTER TABLE `submit_assignment`  
  ADD KEY `student_id` (`student_id`),
  ADD KEY `homework_id` (`homework_id`);

ALTER TABLE `transport_feemaster`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`); 

ALTER TABLE `upload_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `upload_by` (`upload_by`),
  ADD KEY `upload_contents_ibfk_2` (`content_type_id`);

ALTER TABLE `userlog`   
  ADD KEY `class_section_id` (`class_section_id`);

ALTER TABLE `vehicle_routes`  
  ADD KEY `route_id` (`route_id`),
  ADD KEY `vehicle_id` (`vehicle_id`); 

ALTER TABLE `video_tutorial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

ALTER TABLE `video_tutorial_class_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_section_id` (`class_section_id`),
  ADD KEY `video_tutorial_id` (`video_tutorial_id`);

ALTER TABLE `visitors_book`  
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `student_session_id` (`student_session_id`);

ALTER TABLE `content_types`
   MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `class_section_times`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
 
ALTER TABLE `currencies`
   MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `daily_assignment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `email_attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `email_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
 
ALTER TABLE `email_template_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `gateway_ins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `gateway_ins_response`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `lesson_plan_forum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `mark_divisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `offline_fees_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `online_admission_custom_field_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT; 

ALTER TABLE `online_admission_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `pickup_point`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `route_pickup_point`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `share_contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `share_content_for`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `share_upload_contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT; 

ALTER TABLE `sidebar_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
 
ALTER TABLE `sidebar_sub_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sms_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT; 

ALTER TABLE `student_fees_processing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `student_transport_fees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `transport_feemaster`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `upload_contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `video_tutorial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
 
ALTER TABLE `video_tutorial_class_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `alumni_events`
  ADD CONSTRAINT `alumni_events_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `alumni_events_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE; 

ALTER TABLE `book_issues`
  ADD CONSTRAINT `book_issues_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_issues_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `libarary_members` (`id`) ON DELETE CASCADE;

ALTER TABLE `class_sections`
  ADD CONSTRAINT `class_sections_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_sections_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE;      

ALTER TABLE `class_section_times`
  ADD CONSTRAINT `class_section_times_ibfk_1` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE;

ALTER TABLE `class_teacher`
  ADD CONSTRAINT `class_teacher_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_teacher_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_teacher_ibfk_3` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_teacher_ibfk_4` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE; 

UPDATE `contents` SET `class_id` = NULL WHERE `contents`.`class_id` = 0;

UPDATE `contents` SET `cls_sec_id` = NULL WHERE `contents`.`cls_sec_id` = 0;

ALTER TABLE `contents`
  ADD CONSTRAINT `contents_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contents_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contents_ibfk_3` FOREIGN KEY (`cls_sec_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE;

ALTER TABLE `daily_assignment`
  ADD CONSTRAINT `daily_assignment_ibfk_1` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `daily_assignment_ibfk_2` FOREIGN KEY (`evaluated_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `daily_assignment_ibfk_3` FOREIGN KEY (`subject_group_subject_id`) REFERENCES `subject_group_subjects` (`id`) ON DELETE CASCADE;

ALTER TABLE `email_attachments`
  ADD CONSTRAINT `email_attachments_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE;

UPDATE `enquiry` SET `created_by` = NULL WHERE `enquiry`.`created_by` = 0;

UPDATE `enquiry` SET `assigned` = NULL WHERE `enquiry`.`assigned` = 0;

UPDATE `enquiry` SET `class_id` = NULL WHERE `enquiry`.`class_id` = 0;
 
ALTER TABLE `enquiry`
  ADD CONSTRAINT `enquiry_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enquiry_ibfk_3` FOREIGN KEY (`assigned`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enquiry_ibfk_4` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE;

UPDATE `events` SET `role_id` = NULL WHERE `events`.`role_id` = 0;

ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

ALTER TABLE `exams`
  ADD CONSTRAINT `exams_ibfk_1` FOREIGN KEY (`sesion_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE;

ALTER TABLE `exam_group_class_batch_exams`
  ADD CONSTRAINT `exam_group_class_batch_exams_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE; 

ALTER TABLE `exam_group_students` 
  ADD CONSTRAINT `exam_group_students_ibfk_3` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE;

ALTER TABLE `exam_schedules`
  ADD CONSTRAINT `exam_schedules_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_schedules_ibfk_2` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE;

ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`exp_head_id`) REFERENCES `expense_head` (`id`) ON DELETE CASCADE;

ALTER TABLE `feemasters`
  ADD CONSTRAINT `feemasters_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `feemasters_ibfk_2` FOREIGN KEY (`feetype_id`) REFERENCES `feetype` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `feemasters_ibfk_3` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE;

 
UPDATE `follow_up` SET `followup_by` = NULL WHERE `follow_up`.`followup_by` = 0; 
 
ALTER TABLE `follow_up`
  ADD CONSTRAINT `follow_up_ibfk_1` FOREIGN KEY (`enquiry_id`) REFERENCES `enquiry` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `follow_up_ibfk_2` FOREIGN KEY (`followup_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

ALTER TABLE `front_cms_menu_items`
  ADD CONSTRAINT `front_cms_menu_items_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `front_cms_menus` (`id`) ON DELETE CASCADE;

ALTER TABLE `gateway_ins`
  ADD CONSTRAINT `gateway_ins_ibfk_1` FOREIGN KEY (`online_admission_id`) REFERENCES `online_admissions` (`id`) ON DELETE CASCADE;

ALTER TABLE `gateway_ins_response`
  ADD CONSTRAINT `gateway_ins_response_ibfk_1` FOREIGN KEY (`gateway_ins_id`) REFERENCES `gateway_ins` (`id`) ON DELETE CASCADE; 


 
UPDATE `homework` SET `subject_id` = NULL WHERE `homework`.`subject_id` = 0; 
 
UPDATE `homework` SET `evaluated_by` = NULL WHERE `homework`.`evaluated_by` = 0; 
 
ALTER TABLE `homework`
  ADD CONSTRAINT `homework_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homework_ibfk_3` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homework_ibfk_4` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homework_ibfk_5` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homework_ibfk_6` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homework_ibfk_7` FOREIGN KEY (`evaluated_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homework_ibfk_8` FOREIGN KEY (`created_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

ALTER TABLE `homework_evaluation` CHANGE `student_id` `student_id` INT(11) NULL DEFAULT NULL;
 
UPDATE `homework_evaluation` SET `student_id` = NULL WHERE `homework_evaluation`.`student_id` = 0;  

ALTER TABLE `homework_evaluation` CHANGE `date` `date` DATE NOT NULL;

UPDATE `homework_evaluation` SET `date` = NULL WHERE `homework_evaluation`.`date` = '0000-00-00';

ALTER TABLE `homework_evaluation`
  ADD CONSTRAINT `homework_evaluation_ibfk_1` FOREIGN KEY (`homework_id`) REFERENCES `homework` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homework_evaluation_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homework_evaluation_ibfk_3` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE;

ALTER TABLE `hostel_rooms`
  ADD CONSTRAINT `hostel_rooms_ibfk_1` FOREIGN KEY (`hostel_id`) REFERENCES `hostel` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hostel_rooms_ibfk_2` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`) ON DELETE CASCADE;

ALTER TABLE `income`
  ADD CONSTRAINT `income_ibfk_1` FOREIGN KEY (`income_head_id`) REFERENCES `income_head` (`id`) ON DELETE CASCADE; 

ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`item_category_id`) REFERENCES `item_category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_ibfk_2` FOREIGN KEY (`item_store_id`) REFERENCES `item_store` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_ibfk_3` FOREIGN KEY (`item_supplier_id`) REFERENCES `item_supplier` (`id`) ON DELETE CASCADE;

UPDATE `item_issue` SET `issue_by` = NULL WHERE `item_issue`.`issue_by` = 0;  

ALTER TABLE `item_issue` 
  ADD CONSTRAINT `item_issue_ibfk_3` FOREIGN KEY (`issue_to`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_issue_ibfk_4` FOREIGN KEY (`issue_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

ALTER TABLE `lesson_plan_forum`
  ADD CONSTRAINT `lesson_plan_forum_ibfk_1` FOREIGN KEY (`subject_syllabus_id`) REFERENCES `subject_syllabus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lesson_plan_forum_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lesson_plan_forum_ibfk_3` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

ALTER TABLE `offline_fees_payments`
  ADD CONSTRAINT `offline_fees_payments_ibfk_1` FOREIGN KEY (`student_fees_master_id`) REFERENCES `student_fees_master` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `offline_fees_payments_ibfk_2` FOREIGN KEY (`fee_groups_feetype_id`) REFERENCES `fee_groups_feetype` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `offline_fees_payments_ibfk_3` FOREIGN KEY (`student_transport_fee_id`) REFERENCES `student_transport_fees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `offline_fees_payments_ibfk_4` FOREIGN KEY (`approved_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `offline_fees_payments_ibfk_5` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE; 

UPDATE `online_admissions` SET `category_id` = NULL WHERE `online_admissions`.`category_id` = 0;  
UPDATE `online_admissions` SET `hostel_room_id` = NULL WHERE `online_admissions`.`hostel_room_id` = 0;  
UPDATE `online_admissions` SET `school_house_id` = NULL WHERE `online_admissions`.`school_house_id` = 0; 

ALTER TABLE `online_admissions`
  ADD CONSTRAINT `online_admissions_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `online_admissions_ibfk_3` FOREIGN KEY (`hostel_room_id`) REFERENCES `hostel_rooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `online_admissions_ibfk_4` FOREIGN KEY (`school_house_id`) REFERENCES `school_houses` (`id`) ON DELETE CASCADE;

ALTER TABLE `online_admission_custom_field_value`
  ADD CONSTRAINT `online_admission_custom_field_value_ibfk_1` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE;

ALTER TABLE `online_admission_payment`
  ADD CONSTRAINT `online_admission_payment_ibfk_1` FOREIGN KEY (`online_admission_id`) REFERENCES `online_admissions` (`id`) ON DELETE CASCADE;

ALTER TABLE `payslip_allowance`
  ADD CONSTRAINT `payslip_allowance_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payslip_allowance_ibfk_2` FOREIGN KEY (`payslip_id`) REFERENCES `staff_payslip` (`id`) ON DELETE CASCADE;

ALTER TABLE `permission_category`
  ADD CONSTRAINT `permission_category_ibfk_1` FOREIGN KEY (`perm_group_id`) REFERENCES `permission_group` (`id`) ON DELETE CASCADE;

ALTER TABLE `permission_student` CHANGE `group_id` `group_id` INT(11) NULL DEFAULT NULL;
  
UPDATE `permission_student` SET `group_id` = NULL WHERE `permission_student`.`id` = 23; UPDATE `permission_student` SET `group_id` = NULL WHERE `permission_student`.`id` = 16;

INSERT INTO `permission_student` (`id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES
(24, 'Visitor Book', 'visitor_book', 0, 1, 1, NULL, '2022-10-10 11:45:18'),
(25, 'Student Timeline', 'student_timeline', 0, 1, 1, NULL, '2022-10-11 04:50:29');

ALTER TABLE `permission_student`
  ADD CONSTRAINT `permission_student_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `permission_group` (`id`) ON DELETE CASCADE;

ALTER TABLE `questions` 
  ADD CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `questions_ibfk_3` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `questions_ibfk_4` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `questions_ibfk_5` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `questions_ibfk_6` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE;

ALTER TABLE `read_notification`
  ADD CONSTRAINT `read_notification_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `send_notification` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `read_notification_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `read_notification_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

ALTER TABLE `roles_permissions` CHANGE `role_id` `role_id` INT(11) NULL DEFAULT NULL, CHANGE `perm_cat_id` `perm_cat_id` INT(11) NULL DEFAULT NULL;

DELETE roles_permissions.* from roles_permissions WHERE id in (SELECT id FROM (SELECT roles_permissions.id  FROM `roles_permissions` left join permission_category on permission_category.id = roles_permissions.perm_cat_id WHERE permission_category.id IS NULL) x) ;			 
			 
DELETE roles_permissions.* from roles_permissions WHERE id in (select id from(SELECT roles_permissions.id,roles.id as abc  FROM `roles_permissions` left join roles on roles.id = roles_permissions.role_id WHERE roles.id IS NULL) x) ;

ALTER TABLE `roles_permissions`
  ADD CONSTRAINT `roles_permissions_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `roles_permissions_ibfk_2` FOREIGN KEY (`perm_cat_id`) REFERENCES `permission_category` (`id`) ON DELETE CASCADE;

ALTER TABLE `route_pickup_point`
  ADD CONSTRAINT `route_pickup_point_ibfk_1` FOREIGN KEY (`transport_route_id`) REFERENCES `transport_route` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `route_pickup_point_ibfk_2` FOREIGN KEY (`pickup_point_id`) REFERENCES `pickup_point` (`id`) ON DELETE CASCADE;

ALTER TABLE `send_notification`
  ADD CONSTRAINT `send_notification_ibfk_1` FOREIGN KEY (`created_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

ALTER TABLE `share_contents`
  ADD CONSTRAINT `share_contents_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

ALTER TABLE `share_content_for`
  ADD CONSTRAINT `share_content_for_ibfk_1` FOREIGN KEY (`share_content_id`) REFERENCES `share_contents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `share_content_for_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `share_content_for_ibfk_3` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`),
  ADD CONSTRAINT `share_content_for_ibfk_4` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`),
  ADD CONSTRAINT `share_content_for_ibfk_5` FOREIGN KEY (`user_parent_id`) REFERENCES `users` (`id`);

ALTER TABLE `share_upload_contents`
  ADD CONSTRAINT `share_upload_contents_ibfk_1` FOREIGN KEY (`upload_content_id`) REFERENCES `upload_contents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `share_upload_contents_ibfk_2` FOREIGN KEY (`share_content_id`) REFERENCES `share_contents` (`id`) ON DELETE CASCADE;

ALTER TABLE `sidebar_menus`
  ADD CONSTRAINT `sidebar_menus_ibfk_1` FOREIGN KEY (`permission_group_id`) REFERENCES `permission_group` (`id`) ON DELETE SET NULL;

ALTER TABLE `sidebar_sub_menus`
  ADD CONSTRAINT `sidebar_sub_menus_ibfk_1` FOREIGN KEY (`sidebar_menu_id`) REFERENCES `sidebar_menus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sidebar_sub_menus_ibfk_2` FOREIGN KEY (`permission_group_id`) REFERENCES `permission_group` (`id`) ON DELETE SET NULL; 

ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`designation`) REFERENCES `staff_designation` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`department`) REFERENCES `department` (`id`) ON DELETE CASCADE;

UPDATE `staff_leave_request` SET `applied_by` = NULL WHERE `staff_leave_request`.`applied_by` = 0; 

ALTER TABLE `staff_leave_request`
  ADD CONSTRAINT `staff_leave_request_ibfk_1` FOREIGN KEY (`applied_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

UPDATE `student_applyleave` SET `approve_by` = NULL WHERE `student_applyleave`.`approve_by` = 0; 

ALTER TABLE `student_applyleave`
  ADD CONSTRAINT `student_applyleave_ibfk_1` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_applyleave_ibfk_2` FOREIGN KEY (`approve_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

ALTER TABLE `student_attendences`
  ADD CONSTRAINT `student_attendences_ibfk_1` FOREIGN KEY (`attendence_type_id`) REFERENCES `attendence_type` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_attendences_ibfk_2` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE;

ALTER TABLE `student_fees`
  ADD CONSTRAINT `student_fees_ibfk_1` FOREIGN KEY (`feemaster_id`) REFERENCES `feemasters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_fees_ibfk_2` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE; 

ALTER TABLE `student_fees_deposite`
  ADD CONSTRAINT `student_fees_deposite_ibfk_1` FOREIGN KEY (`student_transport_fee_id`) REFERENCES `student_transport_fees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_fees_deposite_ibfk_2` FOREIGN KEY (`student_fees_master_id`) REFERENCES `student_fees_master` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_fees_deposite_ibfk_3` FOREIGN KEY (`fee_groups_feetype_id`) REFERENCES `fee_groups_feetype` (`id`) ON DELETE CASCADE;

ALTER TABLE `student_fees_master`
  ADD CONSTRAINT `student_fees_master_ibfk_1` FOREIGN KEY (`fee_session_group_id`) REFERENCES `fee_session_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_fees_master_ibfk_2` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE;

ALTER TABLE `student_fees_processing`
  ADD CONSTRAINT `student_fees_processing_ibfk_1` FOREIGN KEY (`student_fees_master_id`) REFERENCES `student_fees_master` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_fees_processing_ibfk_2` FOREIGN KEY (`student_transport_fee_id`) REFERENCES `student_transport_fees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_fees_processing_ibfk_3` FOREIGN KEY (`fee_groups_feetype_id`) REFERENCES `fee_groups_feetype` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_fees_processing_ibfk_4` FOREIGN KEY (`gateway_ins_id`) REFERENCES `gateway_ins` (`id`) ON DELETE CASCADE;

UPDATE `student_session` SET `hostel_room_id` = NULL WHERE `student_session`.`hostel_room_id` = 0;

ALTER TABLE `student_session`
  ADD CONSTRAINT `student_session_ibfk_5` FOREIGN KEY (`vehroute_id`) REFERENCES `vehicle_routes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `student_session_ibfk_6` FOREIGN KEY (`route_pickup_point_id`) REFERENCES `route_pickup_point` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `student_session_ibfk_7` FOREIGN KEY (`hostel_room_id`) REFERENCES `hostel_rooms` (`id`) ON DELETE SET NULL;

ALTER TABLE `student_timeline`
  ADD CONSTRAINT `student_timeline_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

ALTER TABLE `student_transport_fees`
  ADD CONSTRAINT `student_transport_fees_ibfk_1` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_transport_fees_ibfk_2` FOREIGN KEY (`route_pickup_point_id`) REFERENCES `route_pickup_point` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_transport_fees_ibfk_3` FOREIGN KEY (`transport_feemaster_id`) REFERENCES `transport_feemaster` (`id`) ON DELETE CASCADE;

ALTER TABLE `submit_assignment`
  ADD CONSTRAINT `submit_assignment_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `submit_assignment_ibfk_2` FOREIGN KEY (`homework_id`) REFERENCES `homework` (`id`) ON DELETE CASCADE; 

ALTER TABLE `transport_feemaster`
  ADD CONSTRAINT `transport_feemaster_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE;

ALTER TABLE `userlog`
  ADD CONSTRAINT `userlog_ibfk_1` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE;

ALTER TABLE `upload_contents`
  ADD CONSTRAINT `upload_contents_ibfk_1` FOREIGN KEY (`upload_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `upload_contents_ibfk_2` FOREIGN KEY (`content_type_id`) REFERENCES `content_types` (`id`) ON DELETE CASCADE;

ALTER TABLE `vehicles` CHANGE `id` `id` INT(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `vehicle_routes`
  ADD CONSTRAINT `vehicle_routes_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `transport_route` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vehicle_routes_ibfk_2` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE; 

ALTER TABLE `video_tutorial`
  ADD CONSTRAINT `video_tutorial_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

ALTER TABLE `video_tutorial_class_sections`
  ADD CONSTRAINT `video_tutorial_class_sections_ibfk_1` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `video_tutorial_class_sections_ibfk_2` FOREIGN KEY (`video_tutorial_id`) REFERENCES `video_tutorial` (`id`) ON DELETE CASCADE;

ALTER TABLE `visitors_book`
  ADD CONSTRAINT `visitors_book_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `visitors_book_ibfk_2` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE;

ALTER TABLE `student_fees_discounts`
  ADD  FOREIGN KEY (`fees_discount_id`) REFERENCES `fees_discounts` (`id`) ON DELETE CASCADE,
  ADD  FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE;

ALTER TABLE `staff_leave_request` DROP FOREIGN KEY `FK_staff_leave_request_leave_types`;

ALTER TABLE `staff_leave_request` ADD FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types`(`id`) ON DELETE CASCADE;

SET FOREIGN_KEY_CHECKS=1;