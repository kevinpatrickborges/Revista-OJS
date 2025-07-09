-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09/05/2025 às 18:15
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ojss`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `access_keys`
--

CREATE TABLE `access_keys` (
  `access_key_id` bigint(20) NOT NULL,
  `context` varchar(40) NOT NULL,
  `key_hash` varchar(40) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `expiry_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Access keys are used to provide pseudo-login functionality for security-minimal tasks. Passkeys can be emailed directly to users, who can use them for a limited time in lieu of standard username and password.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `announcements`
--

CREATE TABLE `announcements` (
  `announcement_id` bigint(20) NOT NULL,
  `assoc_type` smallint(6) DEFAULT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `date_expire` date DEFAULT NULL,
  `date_posted` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Announcements are messages that can be presented to users e.g. on the homepage.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `announcement_settings`
--

CREATE TABLE `announcement_settings` (
  `announcement_setting_id` bigint(20) UNSIGNED NOT NULL,
  `announcement_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about announcements, including localized properties like names and contents.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `announcement_types`
--

CREATE TABLE `announcement_types` (
  `type_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Announcement types allow for announcements to optionally be categorized.';

--
-- Despejando dados para a tabela `announcement_types`
--

INSERT INTO `announcement_types` (`type_id`, `context_id`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `announcement_type_settings`
--

CREATE TABLE `announcement_type_settings` (
  `announcement_type_setting_id` bigint(20) UNSIGNED NOT NULL,
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about announcement types, including localized properties like their names.';

--
-- Despejando dados para a tabela `announcement_type_settings`
--

INSERT INTO `announcement_type_settings` (`announcement_type_setting_id`, `type_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 1, 'pt_BR', 'name', 'Notícia Institucional', 'string'),
(2, 2, 'pt_BR', 'name', 'Informativos da Semana', 'string');

-- --------------------------------------------------------

--
-- Estrutura para tabela `authors`
--

CREATE TABLE `authors` (
  `author_id` bigint(20) NOT NULL,
  `email` varchar(90) NOT NULL,
  `include_in_browse` smallint(6) NOT NULL DEFAULT 1,
  `publication_id` bigint(20) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `user_group_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='The authors of a publication.';

--
-- Despejando dados para a tabela `authors`
--

INSERT INTO `authors` (`author_id`, `email`, `include_in_browse`, `publication_id`, `seq`, `user_group_id`) VALUES
(4, 'arquivoiteprn@gmail.com', 1, 4, 0.00, 14),
(6, 'nugecid@gmail.com', 1, 6, 0.00, 14),
(7, 'kevin.borges.700@ufrn.edu.br', 1, 6, 0.00, 14),
(8, 'revistapericiacientifica@itep.rn.gov.br', 1, 9, 0.00, 14),
(9, 'revistapericiacientifica@itep.rn.gov.br', 1, 10, 0.00, 14);

-- --------------------------------------------------------

--
-- Estrutura para tabela `author_settings`
--

CREATE TABLE `author_settings` (
  `author_setting_id` bigint(20) UNSIGNED NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about authors, including localized properties such as their name and affiliation.';

--
-- Despejando dados para a tabela `author_settings`
--

INSERT INTO `author_settings` (`author_setting_id`, `author_id`, `locale`, `setting_name`, `setting_value`) VALUES
(21, 4, 'pt_BR', 'affiliation', 'ITEP/RN'),
(22, 4, 'pt_BR', 'biography', NULL),
(23, 4, '', 'country', 'BR'),
(24, 4, 'pt_BR', 'familyName', 'Farias'),
(25, 4, 'pt_BR', 'givenName', 'Gesiele '),
(26, 4, 'pt_BR', 'preferredPublicName', 'Gesiele '),
(27, 4, '', 'url', 'http://www.itep.rn.gov.br/'),
(34, 6, 'pt_BR', 'affiliation', ''),
(35, 6, 'pt_BR', 'biography', ''),
(36, 6, '', 'country', 'BR'),
(37, 6, 'pt_BR', 'familyName', 'admin'),
(38, 6, 'pt_BR', 'givenName', 'admin'),
(39, 6, '', 'orcid', ''),
(40, 6, '', 'url', ''),
(41, 7, 'pt_BR', 'affiliation', NULL),
(42, 7, 'pt_BR', 'biography', NULL),
(43, 7, '', 'country', 'BR'),
(44, 7, 'pt_BR', 'familyName', 'Borges'),
(45, 7, 'pt_BR', 'givenName', 'Kevin Patrick'),
(46, 7, 'pt_BR', 'preferredPublicName', 'Kevin Patrick'),
(47, 8, 'pt_BR', 'affiliation', ''),
(48, 8, 'en', 'affiliation', ''),
(49, 8, 'es', 'affiliation', ''),
(50, 8, 'pt_BR', 'biography', ''),
(51, 8, 'en', 'biography', ''),
(52, 8, 'es', 'biography', ''),
(53, 8, '', 'country', 'BR'),
(54, 8, 'pt_BR', 'familyName', 'ITEP'),
(55, 8, 'en', 'familyName', ''),
(56, 8, 'es', 'familyName', ''),
(57, 8, 'pt_BR', 'givenName', 'Nugecid'),
(58, 8, 'en', 'givenName', ''),
(59, 8, 'es', 'givenName', ''),
(60, 8, '', 'orcid', ''),
(61, 8, 'pt_BR', 'preferredPublicName', 'ITEP'),
(62, 8, 'en', 'preferredPublicName', ''),
(63, 8, 'es', 'preferredPublicName', ''),
(64, 8, '', 'url', ''),
(65, 9, 'en', 'affiliation', ''),
(66, 9, 'es', 'affiliation', ''),
(67, 9, 'pt_BR', 'affiliation', ''),
(68, 9, 'en', 'biography', ''),
(69, 9, 'es', 'biography', ''),
(70, 9, 'pt_BR', 'biography', ''),
(71, 9, '', 'country', 'BR'),
(72, 9, 'en', 'familyName', ''),
(73, 9, 'es', 'familyName', ''),
(74, 9, 'pt_BR', 'familyName', 'ITEP'),
(75, 9, 'en', 'givenName', ''),
(76, 9, 'es', 'givenName', ''),
(77, 9, 'pt_BR', 'givenName', 'Nugecid'),
(78, 9, '', 'orcid', ''),
(79, 9, 'en', 'preferredPublicName', ''),
(80, 9, 'es', 'preferredPublicName', ''),
(81, 9, 'pt_BR', 'preferredPublicName', 'ITEP'),
(82, 9, '', 'url', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `categories`
--

CREATE TABLE `categories` (
  `category_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `seq` bigint(20) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Categories permit the organization of submissions into a heirarchical structure.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `category_settings`
--

CREATE TABLE `category_settings` (
  `category_setting_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about categories, including localized properties such as names.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `citations`
--

CREATE TABLE `citations` (
  `citation_id` bigint(20) NOT NULL,
  `publication_id` bigint(20) NOT NULL,
  `raw_citation` text NOT NULL,
  `seq` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A citation made by an associated publication.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `citation_settings`
--

CREATE TABLE `citation_settings` (
  `citation_setting_id` bigint(20) UNSIGNED NOT NULL,
  `citation_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Additional data about citations, including localized content.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `completed_payments`
--

CREATE TABLE `completed_payments` (
  `completed_payment_id` bigint(20) NOT NULL,
  `timestamp` datetime NOT NULL,
  `payment_type` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `currency_code_alpha` varchar(3) DEFAULT NULL,
  `payment_method_plugin_name` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A list of completed (fulfilled) payments relating to a payment type such as a subscription payment.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `controlled_vocabs`
--

CREATE TABLE `controlled_vocabs` (
  `controlled_vocab_id` bigint(20) NOT NULL,
  `symbolic` varchar(64) NOT NULL,
  `assoc_type` bigint(20) NOT NULL DEFAULT 0,
  `assoc_id` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Every word or phrase used in a controlled vocabulary. Controlled vocabularies are used for submission metadata like keywords and subjects, reviewer interests, and wherever a similar dictionary of words or phrases is required. Each entry corresponds to a word or phrase like "cellular reproduction" and a type like "submissionKeyword".';

--
-- Despejando dados para a tabela `controlled_vocabs`
--

INSERT INTO `controlled_vocabs` (`controlled_vocab_id`, `symbolic`, `assoc_type`, `assoc_id`) VALUES
(1, 'interest', 0, 0),
(6, 'submissionAgency', 1048588, 1),
(11, 'submissionAgency', 1048588, 2),
(16, 'submissionAgency', 1048588, 3),
(21, 'submissionAgency', 1048588, 4),
(26, 'submissionAgency', 1048588, 5),
(31, 'submissionAgency', 1048588, 6),
(36, 'submissionAgency', 1048588, 7),
(41, 'submissionAgency', 1048588, 8),
(46, 'submissionAgency', 1048588, 9),
(51, 'submissionAgency', 1048588, 10),
(56, 'submissionAgency', 1048588, 11),
(61, 'submissionAgency', 1048588, 12),
(4, 'submissionDiscipline', 1048588, 1),
(9, 'submissionDiscipline', 1048588, 2),
(14, 'submissionDiscipline', 1048588, 3),
(19, 'submissionDiscipline', 1048588, 4),
(24, 'submissionDiscipline', 1048588, 5),
(29, 'submissionDiscipline', 1048588, 6),
(34, 'submissionDiscipline', 1048588, 7),
(39, 'submissionDiscipline', 1048588, 8),
(44, 'submissionDiscipline', 1048588, 9),
(49, 'submissionDiscipline', 1048588, 10),
(54, 'submissionDiscipline', 1048588, 11),
(59, 'submissionDiscipline', 1048588, 12),
(2, 'submissionKeyword', 1048588, 1),
(7, 'submissionKeyword', 1048588, 2),
(12, 'submissionKeyword', 1048588, 3),
(17, 'submissionKeyword', 1048588, 4),
(22, 'submissionKeyword', 1048588, 5),
(27, 'submissionKeyword', 1048588, 6),
(32, 'submissionKeyword', 1048588, 7),
(37, 'submissionKeyword', 1048588, 8),
(42, 'submissionKeyword', 1048588, 9),
(47, 'submissionKeyword', 1048588, 10),
(52, 'submissionKeyword', 1048588, 11),
(57, 'submissionKeyword', 1048588, 12),
(5, 'submissionLanguage', 1048588, 1),
(10, 'submissionLanguage', 1048588, 2),
(15, 'submissionLanguage', 1048588, 3),
(20, 'submissionLanguage', 1048588, 4),
(25, 'submissionLanguage', 1048588, 5),
(30, 'submissionLanguage', 1048588, 6),
(35, 'submissionLanguage', 1048588, 7),
(40, 'submissionLanguage', 1048588, 8),
(45, 'submissionLanguage', 1048588, 9),
(50, 'submissionLanguage', 1048588, 10),
(55, 'submissionLanguage', 1048588, 11),
(60, 'submissionLanguage', 1048588, 12),
(3, 'submissionSubject', 1048588, 1),
(8, 'submissionSubject', 1048588, 2),
(13, 'submissionSubject', 1048588, 3),
(18, 'submissionSubject', 1048588, 4),
(23, 'submissionSubject', 1048588, 5),
(28, 'submissionSubject', 1048588, 6),
(33, 'submissionSubject', 1048588, 7),
(38, 'submissionSubject', 1048588, 8),
(43, 'submissionSubject', 1048588, 9),
(48, 'submissionSubject', 1048588, 10),
(53, 'submissionSubject', 1048588, 11),
(58, 'submissionSubject', 1048588, 12);

-- --------------------------------------------------------

--
-- Estrutura para tabela `controlled_vocab_entries`
--

CREATE TABLE `controlled_vocab_entries` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  `controlled_vocab_id` bigint(20) NOT NULL,
  `seq` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='The order that a word or phrase used in a controlled vocabulary should appear. For example, the order of keywords in a publication.';

--
-- Despejando dados para a tabela `controlled_vocab_entries`
--

INSERT INTO `controlled_vocab_entries` (`controlled_vocab_entry_id`, `controlled_vocab_id`, `seq`) VALUES
(88, 1, 0.00),
(89, 1, 0.00),
(144, 1, 0.00),
(140, 17, 1.00),
(141, 17, 2.00),
(142, 17, 3.00),
(143, 17, 4.00),
(90, 22, 1.00),
(116, 27, 1.00),
(117, 27, 2.00),
(170, 42, 1.00),
(171, 42, 2.00),
(172, 42, 3.00),
(173, 42, 4.00),
(174, 42, 5.00),
(180, 47, 1.00),
(181, 47, 2.00),
(182, 47, 3.00),
(183, 47, 4.00),
(184, 47, 5.00),
(196, 52, 1.00),
(197, 52, 1.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `controlled_vocab_entry_settings`
--

CREATE TABLE `controlled_vocab_entry_settings` (
  `controlled_vocab_entry_setting_id` bigint(20) UNSIGNED NOT NULL,
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about a controlled vocabulary entry, including localized properties such as the actual word or phrase.';

--
-- Despejando dados para a tabela `controlled_vocab_entry_settings`
--

INSERT INTO `controlled_vocab_entry_settings` (`controlled_vocab_entry_setting_id`, `controlled_vocab_entry_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(88, 88, '', 'interest', 'Biologia', 'string'),
(89, 89, '', 'interest', 'Documentoscopia', 'string'),
(90, 90, 'pt_BR', 'submissionKeyword', 'Teste', 'string'),
(116, 116, 'pt_BR', 'submissionKeyword', 'IA', 'string'),
(117, 117, 'pt_BR', 'submissionKeyword', 'Prontuário Eletrônico', 'string'),
(140, 140, 'pt_BR', 'submissionKeyword', 'ITEP', 'string'),
(141, 141, 'pt_BR', 'submissionKeyword', 'Perito', 'string'),
(142, 142, 'pt_BR', 'submissionKeyword', 'História', 'string'),
(143, 143, 'pt_BR', 'submissionKeyword', 'Perita', 'string'),
(144, 144, '', 'interest', 'Perícia', 'string'),
(170, 170, 'pt_BR', 'submissionKeyword', 'ITEP', 'string'),
(171, 171, 'pt_BR', 'submissionKeyword', 'Perito', 'string'),
(172, 172, 'pt_BR', 'submissionKeyword', 'Perícia', 'string'),
(173, 173, 'pt_BR', 'submissionKeyword', 'RN', 'string'),
(174, 174, 'pt_BR', 'submissionKeyword', 'Perita', 'string'),
(180, 180, 'pt_BR', 'submissionKeyword', 'ITEP', 'string'),
(181, 181, 'pt_BR', 'submissionKeyword', 'Perito', 'string'),
(182, 182, 'pt_BR', 'submissionKeyword', 'Perícia', 'string'),
(183, 183, 'pt_BR', 'submissionKeyword', 'RN', 'string'),
(184, 184, 'pt_BR', 'submissionKeyword', 'Perita', 'string'),
(196, 196, 'en', 'submissionKeyword', 'test', 'string'),
(197, 197, 'pt_BR', 'submissionKeyword', 'teste', 'string');

-- --------------------------------------------------------

--
-- Estrutura para tabela `custom_issue_orders`
--

CREATE TABLE `custom_issue_orders` (
  `custom_issue_order_id` bigint(20) UNSIGNED NOT NULL,
  `issue_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Ordering information for the issue list, when custom issue ordering is specified.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `custom_section_orders`
--

CREATE TABLE `custom_section_orders` (
  `custom_section_order_id` bigint(20) UNSIGNED NOT NULL,
  `issue_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Ordering information for sections within issues, when issue-specific section ordering is specified.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `data_object_tombstones`
--

CREATE TABLE `data_object_tombstones` (
  `tombstone_id` bigint(20) NOT NULL,
  `data_object_id` bigint(20) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Entries for published data that has been removed. Usually used in the OAI endpoint.';

--
-- Despejando dados para a tabela `data_object_tombstones`
--

INSERT INTO `data_object_tombstones` (`tombstone_id`, `data_object_id`, `date_deleted`, `set_spec`, `set_name`, `oai_identifier`) VALUES
(1, 3, '2025-03-12 10:51:10', 'nugecid:ART', 'Artigos', 'oai:ojs2.localhost:article/3'),
(4, 5, '2025-03-25 10:40:34', 'nugecid:ART', 'Artigos', 'oai:ojs2.localhost:article/5'),
(6, 8, '2025-03-25 11:37:02', 'nugecid:ART', 'Artigos', 'oai:ojs2.localhost:article/8'),
(8, 4, '2025-04-01 11:12:24', 'nugecid:ART', 'Artigos', 'oai:ojs2.localhost:article/4');

-- --------------------------------------------------------

--
-- Estrutura para tabela `data_object_tombstone_oai_set_objects`
--

CREATE TABLE `data_object_tombstone_oai_set_objects` (
  `object_id` bigint(20) NOT NULL,
  `tombstone_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Relationships between tombstones and other data that can be collected in OAI sets, e.g. sections.';

--
-- Despejando dados para a tabela `data_object_tombstone_oai_set_objects`
--

INSERT INTO `data_object_tombstone_oai_set_objects` (`object_id`, `tombstone_id`, `assoc_type`, `assoc_id`) VALUES
(1, 1, 256, 1),
(2, 1, 530, 1),
(7, 4, 256, 1),
(8, 4, 530, 1),
(11, 6, 256, 1),
(12, 6, 530, 1),
(15, 8, 256, 1),
(16, 8, 530, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `data_object_tombstone_settings`
--

CREATE TABLE `data_object_tombstone_settings` (
  `tombstone_setting_id` bigint(20) UNSIGNED NOT NULL,
  `tombstone_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about data object tombstones, including localized content.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `dois`
--

CREATE TABLE `dois` (
  `doi_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `doi` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores all DOIs used in the system.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `doi_settings`
--

CREATE TABLE `doi_settings` (
  `doi_setting_id` bigint(20) UNSIGNED NOT NULL,
  `doi_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about DOIs, including the registration agency.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `edit_decisions`
--

CREATE TABLE `edit_decisions` (
  `edit_decision_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) DEFAULT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` smallint(6) DEFAULT NULL,
  `editor_id` bigint(20) NOT NULL,
  `decision` smallint(6) NOT NULL COMMENT 'A numeric constant indicating the decision that was taken. Possible values are listed in the Decision class.',
  `date_decided` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Editorial decisions recorded on a submission, such as decisions to accept or decline the submission, as well as decisions to send for review, send to copyediting, request revisions, and more.';

--
-- Despejando dados para a tabela `edit_decisions`
--

INSERT INTO `edit_decisions` (`edit_decision_id`, `submission_id`, `review_round_id`, `stage_id`, `round`, `editor_id`, `decision`, `date_decided`) VALUES
(18, 4, NULL, 1, NULL, 1, 3, '2025-03-12 10:57:26'),
(19, 4, 3, 3, 1, 1, 2, '2025-03-12 10:57:43'),
(20, 4, NULL, 4, NULL, 1, 7, '2025-03-12 10:57:52'),
(21, 5, NULL, 1, NULL, 1, 17, '2025-03-17 09:05:03'),
(22, 5, NULL, 4, NULL, 1, 7, '2025-03-17 09:05:18'),
(30, 10, NULL, 1, NULL, 1, 17, '2025-04-29 11:52:28'),
(31, 10, NULL, 4, NULL, 1, 7, '2025-04-29 11:52:46');

-- --------------------------------------------------------

--
-- Estrutura para tabela `email_log`
--

CREATE TABLE `email_log` (
  `log_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `sender_id` bigint(20) NOT NULL,
  `date_sent` datetime NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `recipients` text DEFAULT NULL,
  `cc_recipients` text DEFAULT NULL,
  `bcc_recipients` text DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A record of email messages that are sent in relation to an associated entity, such as a submission.';

--
-- Despejando dados para a tabela `email_log`
--

INSERT INTO `email_log` (`log_id`, `assoc_type`, `assoc_id`, `sender_id`, `date_sent`, `event_type`, `from_address`, `recipients`, `cc_recipients`, `bcc_recipients`, `subject`, `body`) VALUES
(19, 1048585, 4, 0, '2025-03-12 10:50:50', 805306370, '\"NUCLEO DE GESTÃO DO CONHECIMENTO, INFORMAÇÃO, DOCUMENTAÇÃO E MEMÓRIA.(NUGECID)\" <revistapericiacientifica@itep.rn.gov.br>', '\"admin admin\" <nugecid@gmail.com>', '', '', 'Você foi designado como editor em uma submissão para NUGECID', '<p>Prezado(a) admin admin,</p><p>A seguinte submissão foi designado a você para acompanhar o processo editorial.</p><p><a href=\"http://localhost/ojs-system/index.php/nugecid/workflow/access/4\">DO VESTÍGIO A PROVA A TRAJETÓRIA DA PERÍCIA CRIMINAL DO RIO GRANDE DO NORTE</a><br />Gesiele </p><p><b>Resumo</b></p><p>O livro <strong>\"Do Vestígio à Prova: A Trajetória da Perícia Criminal no Rio Grande do Norte\"</strong> apresenta a história e evolução da perícia criminal no estado, destacando o papel do Instituto Técnico-Científico de Perícia (ITEP-RN). A obra traça desde os primeiros registros da atividade pericial até sua modernização, abordando aspectos da medicina legal, criminalística e identificação civil. Além disso, evidencia marcos legais, personalidades importantes e avanços tecnológicos que contribuíram para a consolidação da perícia no Rio Grande do Norte.</p><p>Se você achar que a submissão é relevante para o periódico NUGECID, encaminhe para a etapa de avaliação selecionando \"Enviar para Avaliação \" e, em seguida, atribua avaliadores clicando em \"Adicionar Avaliador\".</p><p>Se a submissão não for apropriada para este periódico, recuse a submissão.</p><p>Agradecemos antecipadamente.</p> <p>Atenciosamente,</p><p>NUGECID</p>\r\n<p>http://localhost/ojs-system/index.php/nugecid</p>\r\n\r\n<p> </p>\r\n<p>Esta é uma mensagem automática de <a href=\"http://localhost/ojs-system/index.php/nugecid\"> Nugecid/ITEP</a></p>\r\n<p>E: revistapericiacientifica@itep.rn.gov.br</p>\r\n<p>P: +55 84 3232-6928</p>'),
(20, 1048585, 4, 0, '2025-03-12 10:50:51', 536870914, '\"NUCLEO DE GESTÃO DO CONHECIMENTO, INFORMAÇÃO, DOCUMENTAÇÃO E MEMÓRIA.(NUGECID)\" <revistapericiacientifica@itep.rn.gov.br>', '\"Gesiele \" <arquivoiteprn@gmail.com>', '', '', 'Confirmação de submissão', '<p>Prezado(a) Gesiele ,</p>\n<br />\n<p>Você foi designado coautor em uma submissão ao periódico NUGECID. O remetente, , forneceu os seguintes detalhes:</p><p>DO VESTÍGIO A PROVA A TRAJETÓRIA DA PERÍCIA CRIMINAL DO RIO GRANDE DO NORTE<br /></p><p>Se algum desses detalhes estiver incorreto ou você não deseja ser designado nesta submissão, entre em contato conosco.</p><p>Agradecemos por considerar este periódico para publicar o seu trabalho.</p><br /><p>Atenciosamente,</p><p>NUGECID</p>\r\n<p>http://localhost/ojs-system/index.php/nugecid</p>\r\n\r\n<p> </p>\r\n<p>Esta é uma mensagem automática de <a href=\"http://localhost/ojs-system/index.php/nugecid\"> Nugecid/ITEP</a></p>\r\n<p>E: revistapericiacientifica@itep.rn.gov.br</p>\r\n<p>P: +55 84 3232-6928</p>'),
(21, 1048585, 5, 0, '2025-03-17 09:04:30', 805306370, '\"NUCLEO DE GESTÃO DO CONHECIMENTO, INFORMAÇÃO, DOCUMENTAÇÃO E MEMÓRIA.(NUGECID)\" <revistapericiacientifica@itep.rn.gov.br>', '\"admin admin\" <nugecid@gmail.com>', '', '', 'Você foi designado como editor em uma submissão para NUGECID', '<p>Prezado(a) admin admin,</p><p>A seguinte submissão foi designado a você para acompanhar o processo editorial.</p><p><a href=\"http://localhost/ojs-system/index.php/nugecid/workflow/access/5\"><b><i>Isso é um teste de submissão</i></b></a><br />Teste</p><p><b>Resumo</b></p><p>Teste, teste, teste, teste, teste e teste...</p><p>Se você achar que a submissão é relevante para o periódico NUGECID, encaminhe para a etapa de avaliação selecionando \"Enviar para Avaliação \" e, em seguida, atribua avaliadores clicando em \"Adicionar Avaliador\".</p><p>Se a submissão não for apropriada para este periódico, recuse a submissão.</p><p>Agradecemos antecipadamente.</p> <p>Atenciosamente,</p><p>NUGECID</p>\r\n<p>http://localhost/ojs-system/index.php/nugecid</p>\r\n\r\n<p> </p>\r\n<p>Esta é uma mensagem automática de <a href=\"http://localhost/ojs-system/index.php/nugecid\"> Nugecid/ITEP</a></p>\r\n<p>E: revistapericiacientifica@itep.rn.gov.br</p>\r\n<p>P: +55 84 3232-6928</p>'),
(22, 1048585, 5, 0, '2025-03-17 09:04:30', 536870914, '\"NUCLEO DE GESTÃO DO CONHECIMENTO, INFORMAÇÃO, DOCUMENTAÇÃO E MEMÓRIA.(NUGECID)\" <revistapericiacientifica@itep.rn.gov.br>', '\"Teste\" <Teste@teste.com>', '', '', 'Confirmação de submissão', '<p>Prezado(a) Teste,</p>\n<br />\n<p>Você foi designado coautor em uma submissão ao periódico NUGECID. O remetente, , forneceu os seguintes detalhes:</p><p><b><i>Isso é um teste de submissão</i></b><br /></p><p>Se algum desses detalhes estiver incorreto ou você não deseja ser designado nesta submissão, entre em contato conosco.</p><p>Agradecemos por considerar este periódico para publicar o seu trabalho.</p><br /><p>Atenciosamente,</p><p>NUGECID</p>\r\n<p>http://localhost/ojs-system/index.php/nugecid</p>\r\n\r\n<p> </p>\r\n<p>Esta é uma mensagem automática de <a href=\"http://localhost/ojs-system/index.php/nugecid\"> Nugecid/ITEP</a></p>\r\n<p>E: revistapericiacientifica@itep.rn.gov.br</p>\r\n<p>P: +55 84 3232-6928</p>'),
(23, 1048585, 6, 0, '2025-03-25 11:06:09', 805306370, '\"NUCLEO DE GESTÃO DO CONHECIMENTO, INFORMAÇÃO, DOCUMENTAÇÃO E MEMÓRIA.(NUGECID)\" <revistapericiacientifica@itep.rn.gov.br>', '\"admin admin\" <nugecid@gmail.com>', '', '', 'Você foi designado como editor em uma submissão para NUGECID', '<p>Prezado(a) admin admin,</p><p>A seguinte submissão foi designado a você para acompanhar o processo editorial.</p><p><a href=\"http://10.9.9.195:4126/ojs-system/index.php/nugecid/workflow/access/6\">Uso de IA em Prontuários Eletrônicos</a><br />admin admin, Kevin Patrick</p><p><b>Resumo</b></p><p>A implementação da IA em prontuários eletrônicos oferece benefícios claros, como maior eficiência, precisão e personalização na prática médica, mas enfrenta desafios significativos relacionados a tecnologia, custos e aceitação. Exemplos como a Clínica nas Nuvens e o Cerner Millennium mostram que a IA já está transformando a gestão de informações de saúde, tanto em escala local quanto global. Para maximizar seu potencial, é necessário superar barreiras de interoperabilidade, garantir a segurança dos dados e promover a capacitação dos profissionais, equilibrando tecnologia e humanização no cuidado.</p><p>Se você achar que a submissão é relevante para o periódico NUGECID, encaminhe para a etapa de avaliação selecionando \"Enviar para Avaliação \" e, em seguida, atribua avaliadores clicando em \"Adicionar Avaliador\".</p><p>Se a submissão não for apropriada para este periódico, recuse a submissão.</p><p>Agradecemos antecipadamente.</p> <p>Atenciosamente,</p><p>NUGECID</p>\r\n<p>http://10.9.9.195:4126/ojs-system/index.php/nugecid</p>\r\n\r\n<p> </p>\r\n<p>Esta é uma mensagem automática de <a href=\"http://localhost/ojs-system/index.php/nugecid\"> Nugecid/ITEP</a></p>\r\n<p>E: revistapericiacientifica@itep.rn.gov.br</p>\r\n<p>P: +55 84 3232-6928</p>'),
(24, 1048585, 6, 0, '2025-03-25 11:06:09', 536870914, '\"NUCLEO DE GESTÃO DO CONHECIMENTO, INFORMAÇÃO, DOCUMENTAÇÃO E MEMÓRIA.(NUGECID)\" <revistapericiacientifica@itep.rn.gov.br>', '\"admin admin\" <nugecid@gmail.com>', '', '', 'Obrigado pela sua submissão para NUGECID', '<p>Prezado(a) admin admin,</p><p>Obrigado pela sua submissão para NUGECID. Recebemos sua submissão, Uso de IA em Prontuários Eletrônicos, e um membro de nossa equipe editorial a verá em breve. Você receberá um e-mail quando uma decisão inicial for tomada e poderemos entrar em contato com você para obter mais informações.</p><p>Você pode visualizar sua submissão e acompanhar seu progresso por meio do processo editorial no seguinte local:</p><p>URL de submissão: http://10.9.9.195:4126/ojs-system/index.php/nugecid/authorDashboard/submission/6</p><p>Se você tiver sido desconectado, poderá fazer login novamente com o nome de usuário admin.</p><p>Se tiver alguma dúvida, entre em contato comigo pelo <a href=\"http://10.9.9.195:4126/ojs-system/index.php/nugecid/authorDashboard/submission/6\">painel de submissão</a>.</p><p>Obrigado por considerar NUGECID como um local para o seu trabalho.</p><p>NUGECID</p>\r\n<p>http://10.9.9.195:4126/ojs-system/index.php/nugecid</p>\r\n\r\n<p> </p>\r\n<p>Esta é uma mensagem automática de <a href=\"http://localhost/ojs-system/index.php/nugecid\"> Nugecid/ITEP</a></p>\r\n<p>E: revistapericiacientifica@itep.rn.gov.br</p>\r\n<p>P: +55 84 3232-6928</p>'),
(25, 1048585, 6, 0, '2025-03-25 11:06:09', 536870914, '\"NUCLEO DE GESTÃO DO CONHECIMENTO, INFORMAÇÃO, DOCUMENTAÇÃO E MEMÓRIA.(NUGECID)\" <revistapericiacientifica@itep.rn.gov.br>', '\"Kevin Patrick\" <kevin.borges.700@ufrn.edu.br>', '', '', 'Confirmação de submissão', '<p>Prezado(a) Kevin Patrick,</p>\n<br />\n<p>Você foi designado coautor em uma submissão ao periódico NUGECID. O remetente, admin admin, forneceu os seguintes detalhes:</p><p>Uso de IA em Prontuários Eletrônicos<br /></p><p>Se algum desses detalhes estiver incorreto ou você não deseja ser designado nesta submissão, entre em contato conosco.</p><p>Agradecemos por considerar este periódico para publicar o seu trabalho.</p><br /><p>Atenciosamente,</p><p>NUGECID</p>\r\n<p>http://10.9.9.195:4126/ojs-system/index.php/nugecid</p>\r\n\r\n<p> </p>\r\n<p>Esta é uma mensagem automática de <a href=\"http://localhost/ojs-system/index.php/nugecid\"> Nugecid/ITEP</a></p>\r\n<p>E: revistapericiacientifica@itep.rn.gov.br</p>\r\n<p>P: +55 84 3232-6928</p>'),
(28, 1048585, 10, 0, '2025-04-29 11:51:42', 805306370, '\"NUCLEO DE GESTÃO DO CONHECIMENTO, INFORMAÇÃO, DOCUMENTAÇÃO E MEMÓRIA.(NUGECID)\" <revistapericiacientifica@itep.rn.gov.br>', '\"Kevin\" <nugecid@gmail.com>', '', '', 'Você foi designado como editor em uma submissão para NUGECID', '<p>Prezado(a) Kevin,</p><p>A seguinte submissão foi designado a você para acompanhar o processo editorial.</p><p><a href=\"http://localhost:4126/ojs-system/index.php/nugecid/workflow/access/10\">Teste</a><br /></p><p><b>Resumo</b></p><p>Isso é um teste</p><p>Se você achar que a submissão é relevante para o periódico NUGECID, encaminhe para a etapa de avaliação selecionando \"Enviar para Avaliação \" e, em seguida, atribua avaliadores clicando em \"Adicionar Avaliador\".</p><p>Se a submissão não for apropriada para este periódico, recuse a submissão.</p><p>Agradecemos antecipadamente.</p> <p>Atenciosamente,</p><p>NUGECID</p>\r\n<p>http://localhost:4126/ojs-system/index.php/nugecid</p>\r\n\r\n<p> </p>\r\n<p>Esta é uma mensagem automática de <a href=\"http://localhost/ojs-system/index.php/nugecid\"> Nugecid/ITEP</a></p>\r\n<p>E: revistapericiacientifica@itep.rn.gov.br</p>\r\n<p>P: +55 84 3232-6928</p>');

-- --------------------------------------------------------

--
-- Estrutura para tabela `email_log_users`
--

CREATE TABLE `email_log_users` (
  `email_log_user_id` bigint(20) UNSIGNED NOT NULL,
  `email_log_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A record of users associated with an email log entry.';

--
-- Despejando dados para a tabela `email_log_users`
--

INSERT INTO `email_log_users` (`email_log_user_id`, `email_log_id`, `user_id`) VALUES
(19, 19, 1),
(20, 21, 1),
(21, 22, 4),
(22, 23, 1),
(23, 24, 1),
(26, 28, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `email_templates`
--

CREATE TABLE `email_templates` (
  `email_id` bigint(20) NOT NULL,
  `email_key` varchar(255) NOT NULL COMMENT 'Unique identifier for this email.',
  `context_id` bigint(20) NOT NULL,
  `alternate_to` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Custom email templates created by each context, and overrides of the default templates.';

--
-- Despejando dados para a tabela `email_templates`
--

INSERT INTO `email_templates` (`email_id`, `email_key`, `context_id`, `alternate_to`) VALUES
(1, 'COPYEDIT_REQUEST', 1, 'DISCUSSION_NOTIFICATION_COPYEDITING'),
(2, 'EDITOR_ASSIGN_SUBMISSION', 1, 'DISCUSSION_NOTIFICATION_SUBMISSION'),
(3, 'EDITOR_ASSIGN_REVIEW', 1, 'DISCUSSION_NOTIFICATION_REVIEW'),
(4, 'EDITOR_ASSIGN_PRODUCTION', 1, 'DISCUSSION_NOTIFICATION_PRODUCTION'),
(5, 'LAYOUT_REQUEST', 1, 'DISCUSSION_NOTIFICATION_PRODUCTION'),
(6, 'LAYOUT_COMPLETE', 1, 'DISCUSSION_NOTIFICATION_PRODUCTION'),
(7, 'REVIEWER_REGISTER', 1, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `email_templates_default_data`
--

CREATE TABLE `email_templates_default_data` (
  `email_templates_default_data_id` bigint(20) UNSIGNED NOT NULL,
  `email_key` varchar(255) NOT NULL COMMENT 'Unique identifier for this email.',
  `locale` varchar(14) NOT NULL DEFAULT 'en',
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Default email templates created for every installed locale.';

--
-- Despejando dados para a tabela `email_templates_default_data`
--

INSERT INTO `email_templates_default_data` (`email_templates_default_data_id`, `email_key`, `locale`, `name`, `subject`, `body`) VALUES
(3, 'PASSWORD_RESET_CONFIRM', 'pt_BR', 'Confirmar redefinição de Senha', 'Confirmação de Redefinição de Senha', 'Recebemos uma solicitação para redefinir sua senha para o site {$siteTitle}.<br />\n<br />\nSe você não fez essa solicitação, favor ignorar este e-mail e sua senha não será alterada. Se você deseja redefinir sua senha, clique na URL abaixo.<br />\n<br />\nRedefinir minha senha: {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),
(6, 'USER_REGISTER', 'pt_BR', 'Usuário Criado', 'Cadastro no Periódico', 'Prezado(a) {$recipientName}<br />\n<br />\nAgora você foi cadastrado como um usuário em {$journalName}. Incluímos seu nome de usuário e senha neste e-mail, necessários para todo o trabalho neste periódico por meio de seu site. A qualquer momento, você pode pedir para ser removido da lista de usuários da revista entrando em contato comigo.<br />\n<br />\nUsuário: {$recipientUsername}<br />\nSenha: {$password}<br />\n<br />\nAtenciosamente,<br />\n{$signature}'),
(9, 'USER_VALIDATE_CONTEXT', 'pt_BR', 'Validar e-mail (registro de revista)', 'Valide seu Cadastro', 'Prezado(a) {$recipientName}<br />\n<br />\nVocê criou uma conta no periódico {$journalName}, mas antes de começar a usá-la, você precisa validar sua conta de e-mail. Para fazer isso, basta clicar no link abaixo:<br />\n<br />\n{$activateUrl}<br />\n<br />\nAtenciosamente,<br />\n{$journalSignature}'),
(12, 'USER_VALIDATE_SITE', 'pt_BR', 'Validar e-mail (site)', 'Valide a sua conta', 'Prezado(a) {$recipientName} <br />\n<br />\nVocê criou uma conta com {$siteTitle}, mas antes de começar a usá-la, é necessário validar sua conta de e-mail. Para fazer isso, basta acessar o link abaixo: <br />\n<br />\n{$activateUrl} <br />\n<br />\nAtenciosamente, <br />\n{$siteSignature}'),
(15, 'REVIEWER_REGISTER', 'pt_BR', 'Cadastro de Avaliador', 'Cadastrado como Avaliador em {$journalName}', '<p>Prezado(a),</p><p>Devido à sua experiência, tomamos a liberdade de cadastrar seu nome no banco de dados de avaliadores para {$journalName}. Isso não implica qualquer forma de compromisso de sua parte, mas simplesmente nos permite lhe contatar com uma submissão para uma possível avaliação. Ao ser convidado(a) a avaliar, você terá a oportunidade de ver o título e o resumo do artigo em questão e poderá sempre aceitar ou recusar o convite. Você também pode pedir a qualquer momento para remover seu nome desta lista de avaliadores.</p><p>Estamos fornecendo a você um nome de usuário e senha, que são usados em todas as interações com o periódico por meio de seu site. Você pode, por exemplo, atualizar seu perfil, incluindo seus interesses de avaliação.</p><p>Usuário: {$recipientUsername}<br />Senha: {$password}</p><p>Atenciosamente,</p>{$signature}'),
(18, 'ISSUE_PUBLISH_NOTIFY', 'pt_BR', 'Notificação de edição publicada', 'Nova Edição Publicada: {$issueIdentification} de {$journalName}', '<p>Prezado(a) {$recipientName},</p><p>Temos o prazer de anunciar a publicação da edição <a href=\"{$issueUrl}\">{$issueIdentification}</a> de {$journalName}.  Convidamos você a ler e compartilhar este trabalho com sua comunidade acadêmica.</p><p>Muito obrigado aos nossos autores, avaliadores e editores por suas valiosas contribuições, e aos nossos leitores por seu interesse contínuo.</p><p>Obrigado,</p>{$signature}'),
(21, 'SUBMISSION_ACK', 'pt_BR', 'Confirmação da Submissão', 'Obrigado pela sua submissão para {$journalName}', '<p>Prezado(a) {$recipientName},</p><p>Obrigado pela sua submissão para {$journalName}. Recebemos sua submissão, {$submissionTitle}, e um membro de nossa equipe editorial a verá em breve. Você receberá um e-mail quando uma decisão inicial for tomada e poderemos entrar em contato com você para obter mais informações.</p><p>Você pode visualizar sua submissão e acompanhar seu progresso por meio do processo editorial no seguinte local:</p><p>URL de submissão: {$authorSubmissionUrl}</p><p>Se você tiver sido desconectado, poderá fazer login novamente com o nome de usuário {$recipientUsername}.</p><p>Se tiver alguma dúvida, entre em contato comigo pelo <a href=\"{$authorSubmissionUrl}\">painel de submissão</a>.</p><p>Obrigado por considerar {$journalName} como um local para o seu trabalho.</p>{$journalSignature}'),
(24, 'SUBMISSION_ACK_NOT_USER', 'pt_BR', 'Confirmação de Submissão (Outros Autores)', 'Confirmação de submissão', '<p>Prezado(a) {$recipientName},</p>\n<br />\n<p>Você foi designado coautor em uma submissão ao periódico {$journalName}. O remetente, {$submitterName}, forneceu os seguintes detalhes:</p><p>{$submissionTitle}<br />{$authorsWithAffiliation}</p><p>Se algum desses detalhes estiver incorreto ou você não deseja ser designado nesta submissão, entre em contato conosco.</p><p>Agradecemos por considerar este periódico para publicar o seu trabalho.</p><br /><p>Atenciosamente,</p>{$journalSignature}'),
(27, 'EDITOR_ASSIGN', 'pt_BR', 'Editor Atribuído', 'Você foi designado como editor em uma submissão para {$journalName}', '<p>Prezado(a) {$recipientName},</p><p>A seguinte submissão foi designado a você para acompanhar o processo editorial.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Resumo</b></p>{$submissionAbstract}<p>Se você achar que a submissão é relevante para o periódico {$journalName}, encaminhe para a etapa de avaliação selecionando \"Enviar para Avaliação \" e, em seguida, atribua avaliadores clicando em \"Adicionar Avaliador\".</p><p>Se a submissão não for apropriada para este periódico, recuse a submissão.</p><p>Agradecemos antecipadamente.</p> <p>Atenciosamente,</p>{$journalSignature}'),
(30, 'REVIEW_CANCEL', 'pt_BR', 'Avaliador não atribuído', 'Cancelamento de solicitação de avaliação', '<p>Prezado(a) {$recipientName},</p><p>Recentemente, solicitamos-lhe avaliar uma submissão à {$journalName}. Decidimos cancelar a solicitação de que você avalie esta submissão, {$submissionTitle}.</p><p>Pedimos desculpas por qualquer inconveniência que isso tenha lhe causado e esperamos poder contar com sua assistência no processo de avaliação desta revista no futuro.</p><p>Se tiver alguma dúvida, por gentileza, entre em contato comigo.</p>{$signature}'),
(33, 'REVIEW_REINSTATE', 'pt_BR', 'Avaliador reintegrado', 'Você ainda pode avaliar algo para {$journalName}?', '<p>Prezado(a) {$recipientName},</p><p>Recentemente cancelamos nossa solicitação para que você avaliasse uma submissão, {$submissionTitle}, para {$journalName}. Revertemos essa decisão e esperamos que você ainda possa conduzir a avaliação.</p><p>Se você puder ajudar com a avaliação desta submissão, você pode efetuar <a href=\"{$reviewAssignmentUrl}\"><i>login</i > na revista</a> para visualizar a submissão, carregar arquivos de avaliação, e enviar sua solicitação de avaliação.</p><p>Se você tiver alguma dúvida, entre em contato comigo.</p><p>Atenciosamente,</p>{$signature}'),
(36, 'REVIEW_RESEND_REQUEST', 'pt_BR', 'Reenviar solicitação de avaliação ao avaliador', 'Solicitando sua avaliação novamente para {$journalName}', '<p>Prezado(a) {$recipientName},</p><p>Recentemente, você recusou nossa solicitação de avaliação de uma submissão, {$submissionTitle}, para {$journalName}. Estou escrevendo para saber se você consegue realizar a avaliação.</p><p>Ficaríamos gratos se você pudesse realizar essa avaliação, mas entenderemos se isso não for possível no momento. De qualquer forma, <a href=\"{$reviewAssignmentUrl}\">aceite ou recuse a solicitação</a> até {$responseDueDate}, para podermos encontrar um avaliador alternativo.<p>Se você tiver alguma dúvida, entre em contato comigo.</p><p>Atenciosamente,</p>{$signature}'),
(39, 'REVIEW_REQUEST', 'pt_BR', 'Solicitação de Avaliação', 'A revista {$journalName} solicita avaliação de artigo', '<p>Prezado(a) {$recipientName},</p><p>Acredito que você seria um(a) excelente avaliador(a) de uma submissão  a {$journalName}. O título da submissão e o resumo estão abaixo, e espero que você considere realizar esta importante tarefa para nós.</p><p>Se você puder revisar esta submissão, peço que efetue até {$reviewDueDate}. Você pode visualizar a submissão, carregar arquivos de revisão e enviar sua revisão fazendo <i>login</i> no <i>site</i> da revista e seguindo as etapas no <i>link</i> abaixo.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Resumo</b></p>{$submissionAbstract}<p>Por favor, <a href=\"{$reviewAssignmentUrl}\">aceite ou rejeite</a> esta revisão até <b>{$responseDueDate}</b>.</p><p>Você pode entrar em contato comigo com qualquer dúvida sobre a submissão ou o processo de revisão.</p><p>Obrigado por considerar esta solicitação. Sua ajuda é muito valiosa!</p><p>Atenciosamente,</p>{$signature}'),
(42, 'REVIEW_REQUEST_SUBSEQUENT', 'pt_BR', 'Solicitação de Avaliação Subsequente', 'Solicitação de avaliação de uma submissão revisada', '<p>Prezado(a) {$recipientName},</p><p>Obrigado por revisar o trabalho <a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a>. Os autores consideraram o retorno dos pareceristas e submeteram uma versão revisada do trabalho. Entro em contato para verificar se você poderia conduzir uma segunda rodada de avaliação para essa submissão.</p><p>Se houver disponibilidade, esperamos sua revisão até {$reviewDueDate}. Você pode <a href=\"{$reviewAssignmentUrl}\">seguir as etapas de avaliação</a> para verificar o envio, carregar arquivos de revisão e submeter seus comentários.<p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Resumo</b></p>{$submissionAbstract}<p>Por favor <a href=\"{$reviewAssignmentUrl}\">aceite ou rejeite</a> a revisão até <b>{$responseDueDate}</b>.</p><p>Por favor, sinta-se à vontade para me contatar sobre quaisquer questões sobre a submissão ou o processo de avaliação.</p><p>Obrigado por considerar essa solicitação. Sua contribuição é muito importante.</p><p>Atenciosamente,</p>{$signature}'),
(45, 'REVIEW_RESPONSE_OVERDUE_AUTO', 'pt_BR', 'Lembrete de resposta atrasada (automatizada)', 'Você pode revisar isto para nós?', '<p>Prezado {$recipientName},</p><p>Esta mensagem é apenas um lembrete automático de {$journalName} sobre a solicitação de revisão da submissão \"{$submissionTitle}.\"</p><p>Você está recebendo esse e-mail porque ainda não recebemos uma confirmação sobre a sua disponibilidade para revisar a submissão.</p><p>Por favor nos avise se você poderá ou não revisar o trabalho utilizando o sistema de gerenciamento de submissões para aceitar ou rejeitar a solicitação.</p><p>Se houver possibilidade de revisão, por favor a conclua antes de {$reviewDueDate}. Você pode prosseguir para as etapas de revisão para visualizar os arquivos, carregar documentos e enviar seus comentários.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Resumo</b></p>{$submissionAbstract}<p>Por favor sinta-se à vontade para me contatar sobre questões relativas à submissão ou o processo de revisão.</p><p>Obrigado por considerar essa solicitação. Sua contribuição é de muito valor.</p><p>Atenciosamente,</p>{$journalSignature}'),
(48, 'REVIEW_CONFIRM', 'pt_BR', 'Confirmar avaliação', 'Avaliação aceita: {$reviewerName} aceitou a tarefa de avaliação para #{$submissionId} {$authorsShort} — {$submissionTitle}', 'Prezados editores, <br />\n<br />\neu tenho disponibilidade para dar um parecer para a submissão, &quot;{$submissionTitle}&quot;, para o periódico {$journalName}. Agradeço por lembrar de mim, e pretendo enviar o parecer até {$reviewDueDate}, se não antes.<br />\n<br />\nAtenciosamente,\n<br />\n{$senderName}'),
(51, 'REVIEW_DECLINE', 'pt_BR', 'Recusar revisão', 'Indisponível para realizar avaliação', 'Prezados editores:<br />\n<br />\nTemo não poder dar um parecer à submissão &quot;{$submissionTitle},&quot; para o periódico {$journalName} no momento. Agradeço por lembrar de mim, e fiquem à vontade para me convidar novamente em um outro momento.<br />\n<br />\n{$senderName}'),
(54, 'REVIEW_ACK', 'pt_BR', 'Agradecimento da avaliação', 'Obrigado pela avaliação', '<p>Prezado(a) {$recipientName}:</p>\n<p>Agradeço por enviar o parecer da submissão &quot;{$submissionTitle},&quot; para o periódico {$journalName}. Nós apreciamos sua contribuição para manter a qualidade dos trabalhos que publicamos.</p>\n<p>Tem sido um prazer trabalhar com você como revisor para {$journalName}, e esperamos ter uma oportunidade de trabalhar contigo novamente.</p>\n<p>Atenciosamente,</p>\n<p>{$signature}</p>'),
(57, 'REVIEW_REMIND', 'pt_BR', 'Lembrete de avaliação', 'Um lembrete para concluir sua avaliação', '<p>Prezado(a) {$recipientName},</p><p>Este é apenas um lembrete do nosso pedido de avaliação da submissão, \"{$submissionTitle},\" para {$journalName}. Esperávamos ter recebido sua avaliação até {$reviewDueDate} e teremos o maior prazer em recebê-lo assim que você puder finalizá-la.</p><p>Você pode <a href=\"{$reviewAssignmentUrl}\">efetyar <i>login</i> na revista</a> e seguir as etapas de avaliação para visualizar o envio, fazer carregamento dos arquivos de avaliação e enviar seus comentários de avaliação.</p><p>Se você precisar de uma extensão do prazo, entre em contato comigo. Espero receber seu retorno.</p><p>Desde já, agradeço,</p>{$signature}'),
(60, 'REVIEW_REMIND_AUTO', 'pt_BR', 'Lembrete de avaliação (automatizado)', 'Um lembrete para concluir sua avaliação', '<p>Prezado {$recipientName}:</p><p>Esta mensagem é um lembrete automático de {$journalName} sobre a solicitação de sua avaliação na submissão \"{$submissionTitle}.\"</p><p>Esperávamos ter sua contribuição até {$reviewDueDate}. Agradeceremos recebê-la assim que você finalizá-la.</p><p>Por favor <a href=\"{$reviewAssignmentUrl}\">acesse o periódico</a> e siga as etapas de avaliação para a avaliação, carregamento de arquivos e envio dos seus comentários.</p><p>Se precisar de um adiamento no prazo, por favor me contate. No aguardo da sua resposta.</p><p>Desde já agradeço,</p>{$journalSignature}'),
(63, 'REVIEW_COMPLETE', 'pt_BR', 'Avaliação Concluída', 'Avaliação concluída: {$reviewerName} recomenda {$reviewRecommendation} para #{$submissionId} {$authorsShort} — {$submissionTitle}', '<p>Prezado(a) {$recipientName},</p><p>{$reviewerName} concluiu a seguinte avaliação:</p><p><a href=\"{$submissionUrl}\">#{$submissionId} {$autoresShort} — {$submissionTitle}</a><br /><b>Recomendação:</b> {$reviewRecommendation}<br /><b>Tipo:</b> {$reviewMethod}</p><p>Faça login para <a href=\"{$submissionUrl}\">ver todos os arquivos e comentários</a> fornecidos por este avaliador.</p>'),
(66, 'REVIEW_EDIT', 'pt_BR', 'Avaliação Editada', 'Sua tarefa de avaliação foi alterada para {$journalName}', '<p>Prezado(a) {$recipientName},</p><p>Um editor fez alterações em sua tarefa de avaliação para {$journalName}. Revise os detalhes abaixo e informe-nos se tiver alguma dúvida.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a><br /><b>Tipo: </b> {$reviewMethod}<br /><b>Aceitar ou recusar até:</b> {$responseDueDate}<br /><b>Enviar avaliação até:</b> {$reviewDueDate}</p ><p>Você pode fazer login para <a href=\"{$reviewAssignmentUrl}\">concluir esta avaliação</a> a qualquer momento.</p>'),
(69, 'EDITOR_DECISION_ACCEPT', 'pt_BR', 'Submissão Aceita', 'Sua submissão foi aceita para {$journalName}', '<p>Prezado(a) {$recipientName},</p><p>Temos o prazer de informá-lo(a) que decidimos <strong>\"aceitar a submissão\"</strong> sem avaliação adicional. Após uma análise cuidadosa, descobrimos que sua submissão, {$submissionTitle}, atendeu ou superou nossas expectativas. Estamos entusiasmados em publicar seu artigo em {$journalName} e agradecemos por escolher nosso periódico como local para seu trabalho.</p><p>Sua submissão será enviada em uma futura edição de {$journalName} e você será bem-vindo para incluí-la em sua lista de publicações. Reconhecemos o trabalho árduo de cada submissão bem-sucedida e queremos parabenizá-lo(a) por chegar a esse estágio.</p><p>Sua submissão agora passará pela etapa de \"Edição de Texto\" e \"Editoração\" para prepará-la para publicação.</p><p >Em breve você receberá mais instruções.</p><p>Se você tiver alguma dúvida, entre em contato conosco em seu <a href=\"{$authorSubmissionUrl}\">painel de submissão</a>.</p><p >Atenciosamente,</p>{$signature}'),
(72, 'EDITOR_DECISION_SEND_TO_EXTERNAL', 'pt_BR', 'Enviado para avaliação', 'Sua submissão foi enviada para avaliação', '<p>Prezado(a) {$recipientName},</p><p>Tenho o prazer de informar que um editor revisou sua submissão, {$submissionTitle}, e decidiu enviá-la para revisão por pares. Um editor identificará revisores qualificados que retornarão avaliações sobre sua submissão.</p><p>{$reviewTypeDescription} Você receberá de nós os resultados das avaliações dos revisores e informações sobre as próximas etapas.</p><p>Por favor, observe que enviar a submissão para a revisão por pares não implica que esta será publicada. Consideraremos as recomendações dos revisores antes de decidir aceitar a submissão para publicação. Talvez você seja solicitado a fazer revisões e responder aos comentários dos revisores antes que uma decisão final seja tomada.</p><p>Se você tiver alguma dúvida, por favor entre em contato comigo através do painel de submissão.</p><p>{$signature}</p>'),
(75, 'EDITOR_DECISION_SEND_TO_PRODUCTION', 'pt_BR', 'Enviado para Editoração', 'Próximos passos para publicar sua submissão', '<p>Prezado (a) {$recipientName},</p><p>Estou escrevendo de {$journalName} para informar que a edição de texto da sua submissão, {$submissionTitle}, foi concluída. Sua submissão avançará agora para a fase de editoração, onde as provas finais serão preparadas para publicação. Entraremos em contato com você se precisarmos de mais assistência.</p><p>Se você tiver alguma dúvida, entre em contato comigo pelo <a href=\"{$authorSubmissionUrl}\">painel da submissão</a>.</p ><p>Atenciosamente,</p>{$signature}'),
(78, 'EDITOR_DECISION_REVISIONS', 'pt_BR', 'Revisões Solicitadas', 'Sua submissão foi avaliada e nós o(a) encorajamos a enviar revisões', '<p>Prezado(a) {$recipientName},</p><p>Sua submissão {$submissionTitle} foi avaliado e gostaríamos de incentivá-lo(a) a enviar revisões que abordem os comentários dos avaliadores. Um editor analisará essas revisões e, se elas abordarem as questões de forma adequada, sua submissão poderá ser aceito para publicação.</p><p>Os comentários dos avaliadores estão incluídos no final deste e-mail. Responda a cada ponto dos comentários dos avaliadores e identifique quais alterações você fez. Se você achar que algum dos comentários do avaliador é injustificado ou inapropriado, explique sua perspectiva.</p><p>Ao concluir suas revisões, você pode enviar os documentos revisados junto com sua resposta aos comentários dos avaliadores em < um href=\"{$authorSubmissionUrl}\">painel de submissão</a>. Se você tiver sido desconectado, poderá fazer login novamente com o nome de usuário {$recipientUsername}.</p><p>Se tiver alguma dúvida, entre em contato comigo pelo <a href=\"{$authorSubmissionUrl}\">painel de submissão </a>.</p><p>Aguardamos sua submissão revisada.</p><p>Atenciosamente,</p>{$signature}<hr><p>Os seguintes comentários foram recebidos dos avaliadores.</p>{$allReviewerComments}'),
(81, 'EDITOR_DECISION_RESUBMIT', 'pt_BR', 'Ressubmeter para avaliação', 'Sua submissão foi avaliada - por favor, revise e reenvie', '<p>Prezado {$recipientName},</p><p>Depois de analisar sua submissão, {$submissionTitle}, os avaliadores recomendaram que sua submissão não possa ser aceita para publicação em sua forma atual. Contudo, gostaríamos de encorajá-lo a ressubmeter uma versão revisada que aborde os comentários dos avaliadores. Suas revisões serão consideradas por um editor e poderão ser enviadas para outra rodada de avaliação por pares.</p><p>Observe que ressubmeter seu trabalho não garante que ele será aceito.</p><p>O os comentários dos avaliadores estão incluídos na parte inferior deste e-mail. Por favor, responda a cada ponto e identifique quais mudanças você fez. Se você achar algum dos comentários do avaliador inapropriado, explique sua perspectiva. Se você tiver dúvidas sobre as recomendações em sua avaliação, inclua-as em sua resposta.</p><p>Ao concluir suas revisões, você poderá fazer upload dos documentos revisados junto com sua resposta aos comentários dos avaliadores <a href= \"{$authorSubmissionUrl}\">no painel de submissão</a>. Se você tiver sido desconectado, poderá fazer login novamente com o nome de usuário {$recipientUsername}.</p><p>Se tiver alguma dúvida, entre em contato comigo pelo <a href=\"{$authorSubmissionUrl}\">painel de avaliação </a>.</p><p>Aguardamos sea avaliação revisada.</p><p>Atenciosamente,</p>{$signature}<hr><p>Os seguintes comentários foram recebidos dos avaliadores.</p>{$allReviewerComments}'),
(84, 'EDITOR_DECISION_DECLINE', 'pt_BR', 'Submissão Recusada', 'Sua submissão foi recusada', '{$authors}:<br />\n<br />\nNós chegamos a uma decisão referente a sua submissão para o periódico {$journalName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNossa decisão é de: Rejeitar a Submissão'),
(87, 'EDITOR_DECISION_INITIAL_DECLINE', 'pt_BR', 'Submissão Recusada (Pré-Avaliação)', 'Sua submissão foi recusada', '<p>Prezado(a) {$recipientName},</p><p>Lamento informar que, após analisar sua submissão, {$submissionTitle}, o editor descobriu que ela não atende aos nossos requisitos para publicação em {$journalName}.</p><p>Desejo sucesso se você considerar enviar seu trabalho para outro lugar.</p><p>Atenciosamente,</p>{$signature}'),
(90, 'EDITOR_RECOMMENDATION', 'pt_BR', 'Recomendação feita', 'Recomendação do Editor', '<p> Caro(a) {$editors}, </p> <p> Após considerar os comentários dos avaliadores, gostaria de fazer a seguinte recomendação em relação à submissão {$submitTitle}. </p> <p> Minha recomendação é: {$recommendation}. </p> <p> Visite o <a href=\"{$submissionUrl}\">fluxo de trabalho editorial </a> para agir de acordo com esta recomendação. </p> <p> Sinta-se à vontade para entrar em contato comigo em caso de dúvidas. </p> <p> Atenciosamente, </p> <p> {$senderName} </p>'),
(93, 'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS', 'pt_BR', 'Notificar outros autores', 'Uma atualização sobre sua submissão', '<p>O seguinte e-mail foi enviado para {$submitingAuthorName} de {$journalName} sobre {$submissionTitle}.</p>\n<p>Você está recebendo uma cópia desta notificação porque foi identificado como autor da submissão. Todas as instruções na mensagem abaixo são destinadas ao autor responsável pela submissão, {$subposingAuthorName}, e nenhuma ação é necessária de sua parte neste momento.</p>\n\n{$messageToSubmitatingAutor}'),
(96, 'EDITOR_DECISION_NOTIFY_REVIEWERS', 'pt_BR', 'Notifique os avaliadores da decisão', 'Obrigado pela sua avaliação', '<p>Prezado(a) {$recipientName},</p>\n<p>Obrigado por concluir a avaliação da submissão, {$submissionTitle}, para {$journalName}. Agradecemos seu tempo e experiência em contribuir para a qualidade do trabalho que publicamos. Compartilhamos seus comentários com os autores, juntamente com os comentários de outros avaliadores e a decisão do editor.</p>\n<p>Com base no feedback que recebemos, notificamos os autores do seguinte:</p>\n<p>{$decisionDescription}</p>\n<p>Sua recomendação foi considerada juntamente com as recomendações de outros avaliadores antes de tomar uma decisão. Ocasionalmente, a decisão do editor pode diferir da recomendação feita por um ou mais avaliadores. O editor considera muitos fatores e não toma essas decisões levianamente. Agradecemos a experiência e as sugestões de nossos avaliadores.</p>\n<p>Foi um prazer trabalhar com você como avaliador de {$journalName} e esperamos ter a oportunidade de trabalhar com você novamente no futuro.</p>\n<p>Atenciosamente,</p>\n<p>{$signature}</p>'),
(99, 'EDITOR_DECISION_NEW_ROUND', 'pt_BR', 'Nova rodada de avaliação iniciada', 'Sua submissão foi enviada para outra rodada de avaliação', '<p>Prezado(a) {$recipientName},</p>\n<p>Sua submissão revisada, {$submissionTitle}, foi enviada para uma nova rodada de avaliação por pares.\nVocê receberá notícias nossas com feedback dos avaliadores e informações sobre as próximas etapas.</p>\n<p>Se você tiver alguma dúvida, entre em contato comigo pelo <a href=\"{$authorSubmissionUrl}\">painel da submissão</a>.</p>\n<p>Atenciosamente,</p>\n<p>{$signature}</p>\n'),
(102, 'EDITOR_DECISION_REVERT_DECLINE', 'pt_BR', 'Reintegrar submissão recusada', 'Revertemos a decisão de rejeitar sua submissão', '<p>Prezado(a) {$recipientName},</p>\n<p>A decisão de rejeitar sua submissão, {$submissionTitle}, foi revertida.\nUm editor concluirá a rodada de avaliação e você será notificado quando uma decisão foi tomada.</p>\n<p>Ocasionalmente, uma decisão de rejeitar uma submissão será registrada acidentalmente em nosso sistema e deve ser revertida. Peço desculpas por qualquer confusão que isso possa ter causado.</p>\n<p>Entraremos em contato com você se precisarmos de mais assistência.</p>\n<p>Se você tiver alguma dúvida, entre em contato comigo pelo <a href=\"{$authorSubmissionUrl}\">painel da submissão</a>.</p>\n<p>Atenciosamente,</p>\n<p>{$signature}</p>\n'),
(105, 'EDITOR_DECISION_REVERT_INITIAL_DECLINE', 'pt_BR', 'Reintegrar submissão recusada sem Avaliação', 'Revertemos a decisão de rejeitar sua submissão', '<p>Prezado(a) {$recipientName},</p>\n<p>A decisão de rejeitar sua submissão, {$submissionTitle}, foi revertida.\nUm editor analisará mais detalhadamente a sua submissão antes de decidir se deve rejeitar a submissão ou enviar para avaliação.</p>\n<p>Ocasionalmente, uma decisão de rejeitar uma submissão será registrada acidentalmente em nosso sistema e deve ser revertida. Peço desculpas por qualquer confusão que isso possa ter causado.</p>\n<p>Entraremos em contato com você se precisarmos de mais assistência.</p>\n<p>Se você tiver alguma dúvida, entre em contato comigo pelo <a href=\"{$authorSubmissionUrl}\">painel da submissão</a>.</p>\n<p>Atenciosamente,</p>\n<p>{$signature}</p>\n'),
(108, 'EDITOR_DECISION_SKIP_REVIEW', 'pt_BR', 'Avaliação ignorada', 'Sua submissão foi enviada para edição de texto', '<p>Prezado(a) {$recipientName},</p>\n<p>Tenho o prazer de informar que decidimos aceitar sua submissão sem avaliação por pares. Achamos que sua submissão, {$submissionTitle}, atendeu às nossas expectativas e não exigimos que trabalhos desse tipo passem por avaliação por pares. Estamos felizes em publicar seu artigo em {$journalName} e agradecemos por escolher nossa revista como local para seu trabalho.</p>\nSua submissão está disponível em uma futura edição de {$journalName} e você pode incluí-la em sua lista de publicações. Reconhecemos o trabalho árduo de cada submissão bem-sucedida e queremos parabenizá-lo por seus esforços.</p>\n<p>Sua submissão agora passará por edição texto e formatação para prepará-la para publicação. </p>\n<p>Você receberá mais instruções em breve.</p>\n<p>Se você tiver alguma dúvida, entre em contato comigo em seu <a href=\"{$authorSubmissionUrl}\">painel de submissão</a>.</p>\n<p>Atenciosamente,</p>\n<p>{$signature}</p>\n'),
(111, 'EDITOR_DECISION_BACK_FROM_PRODUCTION', 'pt_BR', 'Submissão enviada de volta para Edição de Texto', 'Sua submissão foi enviada de volta para edição de texto', '<p>Prezado(a) {$recipientName},</p><p>Sua submissão, {$submissionTitle}, foi enviada de volta para o estágio de edição de texto, onde passará por nova edição e formatação para prepará-la para publicação.</p ><p>Ocasionalmente, uma submissão é enviada para a fase de produção antes de estar pronta para as provas finais serem preparadas para publicação. Seu envio continua disponível. Peço desculpas por qualquer confusão.</p><p>Se você tiver alguma dúvida, entre em contato comigo pelo <a href=\"{$authorSubmissionUrl}\">painel de envio</a>.</p><p>Nós entraremos em contato com você se precisarmos de mais ajuda.</p><p>Atenciosamente,</p><p>{$signature}</p>'),
(114, 'EDITOR_DECISION_BACK_FROM_COPYEDITING', 'pt_BR', 'Submissão enviada de volta para edição de texto', 'Sua submissão foi enviada de volta para avaliação', '<p>Prezado (a) {$recipientName},</p><p>Sua submissão, {$submissionTitle}, foi enviada de volta para a fase de avaliação. Ela será submetida a uma avaliação adicional antes de ser aceita para publicação.</p><p>Ocasionalmente, uma decisão de aceitar uma submissão será registrada acidentalmente em nosso sistema e devemos enviá-lo de volta para avaliação. Peço desculpas por qualquer confusão que isso tenha causado. Trabalharemos para concluir qualquer avaliação adicional rapidamente, para que você ter uma decisão final o mais rápido possível.</p><p>Entraremos em contato com você se precisarmos de ajuda.</p><p>Se você tiver alguma dúvida, entre em contato comigo pelo <a href=\"{$authorSubmissionUrl}\">painel da submissão</a>.</p><p>Atenciosamente,</p><p>{$signature}</p>'),
(117, 'EDITOR_DECISION_CANCEL_REVIEW_ROUND', 'pt_BR', 'Rodada de Avaliação Cancelada', 'Uma rodada de avaliação da sua submissão foi cancelada', '<p>Prezado (a) {$recipientName},</p><p>Recentemente, abrimos uma nova rodada de avaliação para sua submissão, {$submissionTitle}. Estamos encerrando esta rodada de avaliação agora.</p><p>Ocasionalmente, uma decisão de abrir uma rodada de avaliação será registrada acidentalmente em nosso sistema e devemos cancelar esta rodada de avaliação. Peço desculpas por qualquer confusão que isso possa ter causado.</p><p>Entraremos em contato com você se precisarmos de mais assistência.</p><p>Se você tiver alguma dúvida, entre em contato comigo pelo seu <a href= \"{$authorSubmissionUrl}\">painel de submissão</a>.</p><p>Atenciosamente,</p><p>{$signature}</p>'),
(120, 'SUBSCRIPTION_NOTIFY', 'pt_BR', 'Notificação de Assinatura', 'Confirmação de assinatura', 'Prezado(a){$recipientName}, <br />\n<br />\nVocê foi registrado como assinante em nossa {$journalName}, com a seguinte assinatura: <br />\n<br />\n{$subscriptionType} <br />\n<br />\nPara acessar o conteúdo disponível apenas para assinantes, basta fazer login no sistema com seu nome de usuário, &quot;{$recipientUsername} &quot;. <br />\n<br />\nDepois de fazer login no sistema, você poderá alterar os detalhes e a senha do seu perfil a qualquer momento. <br />\n<br />\nObserve que se você possui uma assinatura institucional, não é necessário que os usuários da sua instituição efetuem login, pois as solicitações de conteúdo da assinatura serão automaticamente autenticadas pelo sistema. <br />\n<br />\nSe você tiver alguma dúvida, por favor não hesite em contactar-me. <br />\n<br />\n<br />\nAtenciosamente,\n<br />\n{$subscriptionSignature}'),
(123, 'OPEN_ACCESS_NOTIFY', 'pt_BR', 'Notificação de Acesso Aberto', 'Gratuito para ler: {$issueIdentification} de {$journalName} agora é de acesso livre', 'Caros leitores: <br />\n<br />\n{$journalName} acabou de disponibilizar no formato de acesso aberto a seguinte edição. Convidamos você a verificar o sumário abaixo e, em seguida, visitar nosso site ({$journalUrl}) para conferir os artigos e itens de interesse. <br />\n<br />\nObrigado pelo interesse em nosso trabalho, <br />\n<br />\nAtenciosamente,<br />\n{$journalSignature}'),
(126, 'SUBSCRIPTION_BEFORE_EXPIRY', 'pt_BR', 'A assinatura expira em breve', 'Aviso de expiração de assinatura', 'Prezado(a) {$recipientName}: <br />\n<br />\nSua assinatura do {$journalName} está prestes a expirar. <br />\n<br />\n{$subscriptionType} <br />\nData de validade: {$expiryDate} <br />\n<br />\nPara garantir a continuidade do seu acesso a esta revista, acesse o site da revista e renove sua assinatura. Você pode fazer login no sistema com seu nome de usuário, &quot;{$recipientUsername}&quot;. <br />\n<br />\nSe você tiver alguma dúvida, não hesite em contactar-me. <br />\n<br />\nAtenciosamente,\n<br />\n{$subscriptionSignature}'),
(129, 'SUBSCRIPTION_AFTER_EXPIRY', 'pt_BR', 'Assinatura Expirada', 'Expiração de assinatura', 'Prezado(a) {$recipientName}: <br />\n<br />\nSua assinatura do {$journalName} expirou. <br />\n<br />\n{$subscriptionType} <br />\nData de validade: {$expiryDate} <br />\n<br />\nPara renovar sua assinatura, acesse o site da revista. Você pode fazer login no sistema com seu nome de usuário, &quot;{$recipientUsername}&quot;. <br />\n<br />\nSe você tiver alguma dúvida, por favor não hesite em contactar-me. <br />\n<br />\nAtenciosamente,\n<br />\n{$subscriptionSignature}'),
(132, 'SUBSCRIPTION_AFTER_EXPIRY_LAST', 'pt_BR', 'Assinatura expirada por último', 'Expiração de assinatura - Lembrete final', 'Prezado(a) {$recipientName}: <br />\n<br />\nSua assinatura de {$journalName} expirou. <br />\nObserve que este é o lembrete final que lhe será enviado por e-mail. <br />\n<br />\n{$subscriptionType} <br />\nData de validade: {$expiryDate} <br />\n<br />\nPara renovar sua assinatura, acesse o site da revista. Você pode fazer login no sistema com seu nome de usuário, &quot;{$recipientUsername}&quot;. <br />\n<br />\nSe você tiver alguma dúvida, não hesite em contactar-me. <br />\n<br />\nAtenciosamente,\n<br />\n{$subscriptionSignature}'),
(135, 'SUBSCRIPTION_PURCHASE_INDL', 'pt_BR', 'Adquira uma assinatura individual', 'Aquisição de Assinatura: Individual', 'Uma assinatura individual foi comprada on-line para {$journalName} com os seguintes detalhes. <br />\n<br />\nTipo de Assinatura: <br />\n{$subscriptionType} <br />\n<br />\nUsuário: <br />\n{$subscriberDetails} <br />\n<br />\nInformações Assinatura (se informado): <br />\n{$membership} <br />\n<br />\nPara visualizar ou editar esta assinatura, use a seguinte URL. <br />\n<br />\nURL da Assinatura: {$subscriptionUrl} <br />\n'),
(138, 'SUBSCRIPTION_PURCHASE_INSTL', 'pt_BR', 'Adquirir assinatura institucional', 'Aquisição de Assinatura: Institucional', 'Uma assinatura institucional foi comprada on-line para {$journalName} com os seguintes detalhes. Para ativar esta assinatura, use a URL fornecida e defina o status da assinatura como \'Ativo\'. <br />\n<br />\nTipo de Assinatura: <br />\n{$subscriptionType} <br />\n<br />\nInstituição: <br />\n{$institutionName} <br />\n{$institutionMailingAddress} <br />\n<br />\nDomínio (se fornecido): <br />\n{$domain} <br />\n<br />\nIntervalos de IP (se houver): <br />\n{$ipRanges} <br />\n<br />\nPessoa de Contato: <br />\n{$subscriberDetails} <br />\n<br />\nInformações sobre a Assinatura (se houver): <br />\n{$membership} <br />\n<br />\nPara visualizar ou editar esta assinatura, use a seguinte URL. <br />\n<br />\nURL da Assinatura: {$subscriptionUrl} <br />\n'),
(141, 'SUBSCRIPTION_RENEW_INDL', 'pt_BR', 'Renovar assinatura individual', 'Renovação de Assinatura Individual', 'Uma assinatura individual foi renovada online para {$journalName} com os seguintes detalhes. <br />\n<br />\nTipo de Assinatura: <br />\n{$subscriptionType} <br />\n<br />\nUsuário: <br />\n{$subscriberDetails} <br />\n<br />\nInformações sobre a Assinatura (se houver): <br />\n{$membership} <br />\n<br />\nPara visualizar ou editar esta assinatura, use a seguinte URL. <br />\n<br />\nURL de inscrição: {$subscriptionUrl} <br />\n'),
(144, 'SUBSCRIPTION_RENEW_INSTL', 'pt_BR', 'Renovar assinatura institucional', 'Renovação de Assinatura Institucional', 'Uma assinatura institucional foi renovada online para {$journalName} com os seguintes detalhes. <br />\n<br />\nTipo de Assinatura: <br />\n{$subscriptionType} <br />\n<br />\nInstituição: <br />\n{$institutionName} <br />\n{$institutionMailingAddress} <br />\n<br />\nDomínio (se fornecido): <br />\n{$domain} <br />\n<br />\nIntervalos de IP (se houver): <br />\n{$ipRanges} <br />\n<br />\nPessoa de Contato: <br />\n{$subscriberDetails} <br />\n<br />\nInformações sobre membros (se houver): <br />\n{$membership} <br />\n<br />\nPara visualizar ou editar esta assinatura, use a seguinte URL. <br />\n<br />\nURL da Assinatura: {$subscriptionUrl} <br />\n'),
(147, 'REVISED_VERSION_NOTIFY', 'pt_BR', 'Notificação da Versão Revisada', 'Envio de versão atualizada', 'Prezados editores: <br />\n<br />\nUma versão revisada de &quot;{$submissionTitle}&quot; foi carregada pelo autor {$submitterName}. <br />\n<br />\nURL da Submissão: {$submissionUrl} <br />\n<br />\n{$signature}.'),
(150, 'STATISTICS_REPORT_NOTIFICATION', 'pt_BR', 'Notificação do Relatório de Estatísticas', 'Atividade editorial para {$month}, {$year}', '\n{$recipientName}, <br />\n<br />\nSeu relatório do estado atual do sistema do mês de {$month}, {$year} está disponível. Suas estatísticas-chave deste mês seguem abaixo.<br />\n<ul>\n	<li>Novas submissões este mês: {$newSubmissions}</li>\n	<li>Submissões rejeitadas este mês: {$declinedSubmissions}</li>\n	<li>Submissões aceitas este mês: {$acceptedSubmissions}</li>\n	<li>Total de submissões no sistema {$totalSubmissions}</li>\n</ul>\nEfetue login no site do periódico para obter uma visão mais detalhada das <a href=\"{$editorialStatsLink}\">tendências editoriais</a> e <a href=\"{$publicationStatsLink}\">estatísticas de artigos publicados</a>. Uma cópia completa do relatório de tendencias editoriais deste mês segue anexa.<br />\n<br />\nAtenciosamente,<br />\n{$journalSignature}'),
(153, 'ANNOUNCEMENT', 'pt_BR', 'Novo Comunicado', '{$announcementTitle}', '<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisite nosso site para ler o <a href=\"{$announcementUrl}\"> comunicado completo </a>.'),
(156, 'DISCUSSION_NOTIFICATION_SUBMISSION', 'pt_BR', 'Discussão da Submissão', 'Uma mensagem sobre {$journalName}', 'Insira a sua mensagem por gentileza.'),
(159, 'DISCUSSION_NOTIFICATION_REVIEW', 'pt_BR', 'Discussão da Avaliação', 'Uma mensagem sobre {$journalName}', 'Insira a sua mensagem por gentileza.'),
(162, 'DISCUSSION_NOTIFICATION_COPYEDITING', 'pt_BR', 'Discussão da Edição de Texto', 'Uma mensagem sobre {$journalName}', 'Insira a sua mensagem por gentileza.'),
(165, 'DISCUSSION_NOTIFICATION_PRODUCTION', 'pt_BR', 'Discussão da Editoração', 'Uma mensagem sobre {$journalName}', 'Insira a sua mensagem por gentileza.'),
(168, 'COPYEDIT_REQUEST', 'pt_BR', 'Solicitar Edição de Texto', 'A submissão {$submissionId} está pronta para uma tarefa edição ao Editor de Texto para {$contextAcronym}', '{$recipientName}: <br />\n<br />\nPeço que você realize a revisão textual de &quot;{$submissionTitle}&quot; para {$journalName} seguindo estas etapas. <br />\n1. Clique no URL da Submissão abaixo. <br />\n2. Abra todos os arquivos disponíveis em \"Arquivos de Versão Final\" e faça sua revisão textual, adicionando quaisquer discussões em \"Discussão da edição de texto\" conforme necessário. <br />\n3. Salve os arquivos revisados e faça o carregamento no painel \"Texto editado\". <br />\n4. Notifique o Editor de que todos os arquivos foram preparados e que o processo de \"Editoração\" pode começar. <br />\n<br />\nURL de {$journalName}: {$journalUrl} <br />\nURL de Submissão: {$submitUrl} <br />\nNome de usuário: {$recipientUsername}'),
(171, 'EDITOR_ASSIGN_SUBMISSION', 'pt_BR', 'Designar Editor', 'Você foi designado como editor em uma submissão para {$journalName}', '<p>Prezado(a) {$recipientName},</p><p>A seguinte submissão foi designado a você para acompanhar o processo editorial.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Resumo</b></p>{$submissionAbstract}<p>Se você achar que a submissão é relevante para o periódico {$journalName}, encaminhe para a etapa de avaliação selecionando \"Enviar para Avaliação \" e, em seguida, atribua avaliadores clicando em \"Adicionar Avaliador\".</p><p>Se a submissão não for apropriada para este periódico, recuse a submissão.</p><p>Agradecemos antecipadamente.</p> <p>Atenciosamente,</p>{$journalSignature}'),
(174, 'EDITOR_ASSIGN_REVIEW', 'pt_BR', 'Designar Editor', 'Você foi designado como editor em uma submissão para {$journalName}', '<p>Prezado(a) {$recipientName},</p><p>a seguinte submissão foi atribuída a você para que você veja o processo de avaliação por pares.</p><p><a href=\"{$submissionUrl}\"> {$submissionTitle}</a><br />{$authors}</p><p><b>Resumo</b></p>{$submissionAbstract}<p>Faça login em <a href=\" {$submissionUrl}\">visualize a submissão</a> e atribua avaliadores qualificados. Você pode atribuir um avaliador clicando em \"Adicionar Avaliador\".</p><p>Agradecemos antecipadamente.</p><p>Atenciosamente,</p>{$signature}'),
(177, 'EDITOR_ASSIGN_PRODUCTION', 'pt_BR', 'Designar Editor', 'Você foi designado como editor em uma submissão para {$journalName}', '<p>Prezado(a) {$recipientName},</p><p>a submissão a seguir foi atribuída a você para acompanhar a etapa de editoração.</p><p><a href=\"{$submissionUrl}\">{ $submissionTitle}</a><br />{$authors}</p><p><b>Resumo</b></p>{$submissionAbstract}<p>Faça login em <a href=\"{ $submissionUrl}\">visualize a submissão</a>. Assim que os arquivos prontos para editoração estiverem disponíveis, carregue-os na seção <strong>Publicação > Composições</strong>. Em seguida, agende o trabalho para publicação clicando no botão <strong>Agendar Publicação</strong>.</p><p>Agradecemos antecipadamente.</p><p>Atenciosamente,</p>{$signature }'),
(180, 'LAYOUT_REQUEST', 'pt_BR', 'Pronto para Editoração', 'A submissão {$submissionId} está pronta para Editoração em {$contextAcronym}', '<p>Prezado(a) {$recipientName},</p><p>Uma nova submissão está pronta para editoração:</p><p><a href=\"{$submissionUrl}\">{$submissionId} — {$submissionTitle}</a><br />{$journalName}</p><ol><li>Clique no endereço da submissão.</li><li>Baixe os arquivos prontos para editoração e os utilize para criar provas de acordo com os padrões da revista.</li><li>Carregue as provas para a seção de publicação.</li><li>Utilize a discussão da editoração para notificar o editor que as provas estão prontas.</li></ol><p>Se você não puder realizar este trabalho neste momento ou tiver alguma dúvida, entre em contato comigo. Obrigado por sua contribuição para este periódico.</p><p>Atenciosamente,</p>{$signature}'),
(183, 'LAYOUT_COMPLETE', 'pt_BR', 'Composições Completas', 'Composições Concluídas', '<p>Prezado(a) {$recipientName},</p><p>As provas topográficas já foram preparadas para a seguinte submissão e já estão prontas para a revisão final.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$journalName}</p><p>Se você tiver alguma dúvida, favor entrar em contato comigo.</p><p>Atenciosamente</p><p>{$senderName}</p>'),
(186, 'VERSION_CREATED', 'pt_BR', 'Versão Criada', 'Uma nova versão foi criada para {$submissionTitle}', '<p>Prezado(a) {$recipientName}, </p><p>Esta é uma mensagem automática para informar que uma nova versão da sua submissão, {$submissionTitle}, foi criada. Você pode visualizar esta versão no painel da submissão no seguinte link:</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a></p><hr><p> Este é um e-mail automático enviado de <a href=\"{$journalUrl}\">{$journalName}</a>.</p>'),
(189, 'EDITORIAL_REMINDER', 'pt_BR', 'Lembrete Editorial', 'Tarefas editoriais excepcionais para {$journalName}', '<p>Prezado(a) {$recipientName},</p><p>Você está atualmente designado(a) para {$numberOfSubmissions} submissões em <a href=\"{$journalUrl}\">{$journalName}</a>. As seguintes submissões estão <b>aguardando sua resposta</b>.</p>{$outstandingTasks}<p>Veja todas as suas tarefas em seu <a href=\"{$submissionsUrl}\">painel de submissões</a >.</p><p>Se você tiver alguma dúvida sobre suas tarefas, entre em contato com {$contactName} em {$contactEmail}.</p>'),
(192, 'SUBMISSION_SAVED_FOR_LATER', 'pt_BR', 'Submissão salva para mais tarde', 'Retome sua submissão para {$journalName}', '<p>Prezado(a) {$recipientName},</p><p>Os detalhes da sua submissão foram salvos em nosso sistema, mas ainda não foram submetidos para consideração. Você pode retornar para concluir sua submissão a qualquer momento seguindo o link abaixo.</p><p><a href=\"{$submissionWizardUrl}\">{$authorsShort} — {$submissionTitle}</a></p ><hr><p>Este é um e-mail automático de <a href=\"{$journalUrl}\">{$journalName}</a>.</p>'),
(195, 'SUBMISSION_NEEDS_EDITOR', 'pt_BR', 'Editor de Necessidades de Submissão', 'Uma nova submissão precisa que um editor seja designado: {$submissionTitle}', '<p>Prezado(a) {$recipientName},</p><p>A submissão a seguir foi enviada e não há editor designado.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Resumo</b></p>{$submissionAbstract}<p>Por favor, designe um editor que será responsável pela submissão clicando no título acima e designando um editor na seção Participantes.</p><hr><p>Este é um e-mail automático de <a href=\"{$journalUrl}\">{$journalName}</a>. </p>'),
(198, 'PAYMENT_REQUEST_NOTIFICATION', 'pt_BR', 'Pedido de Pagamento', 'Notificação de Solicitação de Pagamento', '<p>Caro(a) {$recipientName},</p><p>Parabéns pela aceitação de sua submissão, {$submissionTitle}, para {$journalName}. Agora que sua submissão foi aceita, gostaríamos de solicitar o pagamento da taxa de publicação.</p><p>Esta taxa cobre os custos de produção de trazer sua submissão para publicação. Para efetuar o pagamento, visite <a href=\"{$queuedPaymentUrl}\">{$queuedPaymentUrl}</a>.</p><p>Se tiver alguma dúvida, consulte nosso <a href=\"{$submissionGuidelinesUrl}\">Diretrizes de Submissão</a></p>'),
(201, 'ORCID_COLLECT_AUTHOR_ID', 'pt_BR', 'orcidCollectAuthorId', 'ORCID da submissão', 'Prezado(a) {$recipientName},<br>\n<br>\nVocê foi listada(o) como um coautor(a) em uma submissão de manuscrito \"{$submissionTitle}\" para {$journalName}.<br/>\nPara confirmar sua autoria, por favor, adicione sua id ORCID a esta submissão, visitando o link fornecido abaixo.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Registre ou conecte seu ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">Mais informações sobre o ORCID em {$journalName}</a><br/>\n<br/>\nSe você tiver quaisquer dúvidas, por favor entre em contato comigo.<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),
(204, 'ORCID_REQUEST_AUTHOR_AUTHORIZATION', 'pt_BR', 'orcidRequestAuthorAuthorization', 'Solicitando acesso ao registro ORCID', 'Prezado(a) {$recipientName}, <br>\n<br>\nVocê foi listado como autor na submissão do manuscrito \"{$submissionTitle}\" para {$journalName}.\n<br>\n<br>\nPermita-nos adicionar seu ID do ORCID a essa submissão e também adicioná-lo ao seu perfil do ORCID na publicação. <br>\nVisite o link para o site oficial do ORCID, faça o login com seu perfil e autorize o acesso seguindo as instruções. <br>\n<a href=\"{$authorOrcidUrl}\"> <img id =\"orcid-id-logo\" src = \"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width = \'16 \' height = \'16 \' alt = \"Ícone ORCID iD\" style = \"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\" /> Registre ou conecte seu ORCID ID </a> <br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\"> Mais sobre o ORCID em {$journalName} </a> <br/>\n<br>\nSe você tiver alguma dúvida, entre em contato comigo. <br>\n<br>\n{$principalContactSignature} <br>\n'),
(207, 'MANUAL_PAYMENT_NOTIFICATION', 'pt_BR', 'Notificação de Pagamento Manual', 'Notificação de pagamento manual', 'É necessário realizar o processamento de um pagamento manual de assinatura da revista {$journalName}, pelo usuário {$senderName} (login &quot;{$senderUsername}&quot;).<br />\n<br />\nO item adquirido é &quot;{$paymentName}&quot;.<br />\nValor em ({$paymentCurrencyCode}): {$paymentAmount}<br />\n<br />\nEsta é uma mensagem automática da ferramenta de Pagamento manual do Open Journal Systems.'),
(208, 'PASSWORD_RESET_CONFIRM', 'de', 'Bestätigung der Passwortzurücksetzung', 'Bestätigung der Passwortzurücksetzung', 'Wir wurden aufgefordert, Ihr Passwort für die Webseite {$siteTitle} neu zu setzen.<br />\n<br />\nFalls die Aufforderung nicht von Ihnen stammt, ignorieren Sie bitte diese E-Mail und Ihr Passwort bleibt unverändert. Falls Sie Ihr Passwort neu setzen möchten, klicken Sie bitte auf die folgende URL:<br />\n<br />\nMein Passwort neu setzen: {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),
(209, 'USER_REGISTER', 'de', 'Benutzer/in angelegt', 'Registrierung bei der Zeitschrift', '{$recipientName}<br />\n<br />\nSie sind nun als neue/r Benutzer/in von {$journalName} registriert. Wir haben Ihren Benutzer/innennamen und Ihr Passwort in dieser Mail aufgeführt, beides wird für alle Arbeiten mit dieser Zeitschrift gebraucht. Sie können sich zu jedem Zeitpunkt als Benutzer/in der Zeitschrift austragen lassen, indem Sie mich kontaktieren.<br />\n<br />\nBenutzer/innenname: {$recipientUsername}<br />\nPasswort: {$password}<br />\n<br />\nVielen Dank <br />\n{$signature}'),
(210, 'USER_VALIDATE_CONTEXT', 'de', 'E-Mail überprüfen (Zeitschrift Registrierung)', 'Account validieren', '{$recipientName}<br />\n<br />\nSie haben ein Benutzer/innenkonto bei {$journalName} angelegt, aber bevor Sie es benutzen können, müssen Sie Ihre E-Mail-Adresse bestätigen. Dazu folgen Sie bitte einfach dem folgenden Link:<br />\n<br />\n{$activateUrl}<br />\n<br />\nVielen Dank<br />\n{$journalSignature}'),
(211, 'USER_VALIDATE_SITE', 'de', 'E-Mail überprüfen (Seite)', 'Account validieren', '{$recipientName}<br />\n<br />\nSie haben ein Benutzer/innenkonto bei {$siteTitle} angelegt, aber bevor Sie es benutzen können, müssen Sie Ihre E-Mail-Adresse bestätigen. Dazu folgen Sie bitte einfach dem folgenden Link:<br />\n<br />\n{$activateUrl}<br />\n<br />\nVielen Dank<br />\n{$siteSignature}');
INSERT INTO `email_templates_default_data` (`email_templates_default_data_id`, `email_key`, `locale`, `name`, `subject`, `body`) VALUES
(212, 'REVIEWER_REGISTER', 'de', 'Gutachter/in registriert', 'Registrierung als Benutzer/in bei {$journalName}', '<p>Guten Tag {$recipientName}, </p><p>angesichts Ihrer Expertise haben wir uns erlaubt, Ihren Namen der Gutachter/innendatenbank von {$journalName} hinzuzufügen. Dies verpflichtet Sie zu nichts, ermöglicht uns aber, Sie um mögliche Gutachten für eine Einreichung zu bitten. Wenn Sie zu einem Gutachten eingeladen werden, werden Sie Titel und Abstract des Beitrags sehen können und werden stets selber entscheiden können, ob Sie der Einladung folgen oder nicht. Sie können zu jedem Zeitpunkt Ihren Namen von der Gutachter/innenliste entfernen lassen.</p><p>Wir senden Ihnen einen Benutzer/innennamen und ein Passwort, die Sie in allen Schritten der Zusammenarbeit mit der Zeitschrift über deren Website benötigen. Vielleicht möchten Sie z.B. Ihr Profil inkl. Ihrer Begutachtungsinteressen aktualisieren.</p><p>Benutzer/innenname: {$recipientUsername}<br />Passwort: {$password}</p><p>Vielen Dank</p>{$signature}'),
(213, 'ISSUE_PUBLISH_NOTIFY', 'de', 'Ausgabe veröffentlicht Benachrichtigung', 'Gerade veröffentlicht: {$issueIdentification} von {$journalName}', '<p>Guten Tag {$recipientName},</p><p> wir freuen uns Ihnen mitteilen zu können, dass eine neue Ausgabe von {$journalName} veröffentlicht wurde: <a href=\"{$issueUrl}\">{$issueIdentification}</a>. Wir laden Sie dazu ein, die Ausgabe zu lesen und mit Anderen Ihrer wissenschaftlichen Community zu teilen.</p><p>Vielen Dank an unsere Autor/innen, Gutachter/innen und Redakteur/innen für ihre wertvollen Beiträge - und natürlich an unsere Leser/innen für das anhaltende Interesse an unserer Arbeit.</p><p>Vielen Dank</p>{$signature}'),
(214, 'SUBMISSION_ACK', 'de', 'Bestätigung der Einreichung', 'Ihre Einreichung für {$journalName}: Eingangsbestätigung', '<p>Sehr geehrte/r {$recipientName},</p><p>vielen Dank für die Einreichung Ihres Manuskripts &quot;{$submissionTitle}&quot; zur Veröffentlichung in {$journalName}. Ein Mitglied unseres Redaktionsteams wird sie sich bald ansehen. Sie erhalten eine E-Mail, wenn eine erste Entscheidung getroffen wurde, und wir können Sie auch für weitere Informationen kontaktieren.</p><p>Das Verwaltungssystem unserer Webzeitschrift erlaubt Ihnen, jederzeit den Lauf Ihres Beitrags im Redaktionsprozess zu beobachten. Sie loggen sich dazu einfach auf unserer Webseite ein:</p><p>URL des Manuskripts: {$submissionUrl}</p><p>Benutzer/innenname: {$recipientUsername}</p><p>Wenn Sie Fragen haben, kontaktieren Sie mich bitte über das <a href=\"{$authorSubmissionUrl}\">Dashboard Ihrer Einreichung</a>.</p><p>Danke für Ihr Interesse an einer Veröffentlichung in unserer Zeitschrift {$journalName} .</p>{$journalSignature}'),
(215, 'SUBMISSION_ACK_NOT_USER', 'de', 'Bestätigung der Einreichung (andere Autor/innen)', 'Eingangsbestätigung', '<p>Sehr geehrte/r {$recipientName},</p><p>Sie wurden als Mitautor/in bei einer Einreichung bei {$KontextName} genannt. Der Verfasser/die Verfasserin, {$Einreichername}, hat die folgenden Angaben gemacht:</p><p>{$submissionTitle}<br>{$authorsWithAffiliation}</p><p>Wenn eine dieser Angaben nicht korrekt ist oder Sie nicht in diesem Beitrag genannt werden möchten, setzen Sie sich bitte mit mir in Verbindung.</p><p>Vielen Dank, dass Sie {$journalName} als Plattform für Ihre Arbeit in Betracht ziehen.</p><p>Mit freundlichen Grüßen,</p>{$journalSignature}'),
(216, 'EDITOR_ASSIGN', 'de', 'Redakteur/in zugewiesen', 'Sie wurden als Redakteur/in von einer Einreichung bei {$journalName} zugewiesen', '<p>Sehr geehrte/r {$recipientName},</p><p>Die folgende Einreichung wurde Ihnen zur redaktionellen Bearbeitung zugewiesen. </p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Wenn Sie der Meinung sind, dass die Einreichung für die Zeitschrift {$journalName} relevant ist, leiten Sie die Einreichung bitte zur Begutachtung weiter, indem Sie \"In die Begutachtung schicken\" wählen und dann Gutachter zuweisen, indem Sie auf \"Gutachter/in hinzufügen\" klicken. </p><p>Wenn die Einreichung nicht für diese Zeitschrift geeignet ist, lehnen Sie die Einreichung bitte ab.</p><p>Danke im Voraus.</p><p>Mit freundlichen Grüßen,</p>{$journalSignature}'),
(217, 'REVIEW_CANCEL', 'de', 'Gutachter/in nicht mehr zugeordnet', 'Anfrage zur Begutachtung zurückgezogen', '<p>Sehr geehrte/r {$recipientName},</p><p>vor kurzem haben wir Sie gebeten, eine Einsendung an die Zeitschrift{$KontextName} zu begutachten. Wir haben uns entschlossen, die Bitte um Begutachtung der Einreichung {$submissionTitle} zu stornieren.</p><p>Wir entschuldigen uns für alle Unannehmlichkeiten, die Ihnen dadurch entstehen, und hoffen, dass wir Sie auch in Zukunft zur Unterstützung des Begutachtungsprozesses dieser Zeitschrift heranziehen können.</p><p>Wenn Sie irgendwelche Fragen haben, wenden Sie sich bitte an mich.</p>{$signature}'),
(218, 'REVIEW_REINSTATE', 'de', 'Gutachter/in wieder eingesetzt', 'Können Sie weiterhin einen Beitrag für {$journalName} begutachten?', '<p>Sehr geehrte/r {$recipientName},</p><p>wir haben vor kurzem unsere Anfrage an Sie, eine Einreichung, {$submissionTitle}, für die Zeitschrift {$journalName} zu begutachten, storniert. Wir haben diese Entscheidung rückgängig gemacht und hoffen, dass Sie immer noch in der Lage sind, die Begutachtung durchzuführen.</p><p>Wenn Sie in der Lage sind, bei der Begutachtung dieser Einreichung zu helfen, können Sie sich <a href=\"{$reviewAssignmentUrl}\">bei der Zeitschrift anmelden</a>, um die Einreichung zu sehen, Begutachtungsdateien hochzuladen und Ihre Begutachtungsanfrage zu übermitteln.</p><p>Wenn Sie irgendwelche Fragen haben, kontaktieren Sie mich bitte.</p><p>Mit freundlichen Grüßen,</p>{$signature}'),
(219, 'REVIEW_RESEND_REQUEST', 'de', 'Gutachtenanfrage erneut an Gutachter/in senden', 'Erneute Anfrage nach Ihrem Gutachten für {$journalName}', '<p>Sehr geehrte/r {$recipientName},</p><p>Kürzlich haben Sie unsere Bitte abgelehnt, eine Einreichung, {$submissionTitle}, für {$journalName} zu prüfen. Ich schreibe Ihnen, um zu erfahren, ob Sie die Prüfung doch noch durchführen können.</p><p>Wir wären Ihnen dankbar, wenn Sie diese Beurteilung vornehmen könnten, haben aber Verständnis dafür, wenn dies zum jetzigen Zeitpunkt nicht möglich ist. In jedem Fall bitten wir Sie, <a href=\"{$reviewAssignmentUrl}\">die Anfrage</a> bis zum {$responseDueDate} anzunehmen oder abzulehnen, damit wir einen alternativen Gutachter oder eine alternative Gutachterin finden können.</p><p>Wenn Sie Fragen haben, wenden Sie sich bitte an mich.</p><p>Mit freundlichen Grüßen,</p>{$signature}'),
(220, 'REVIEW_REQUEST', 'de', 'Gutachtenanfrage', 'Einladung zur Begutachtung', '<p>Sehr geehrte/r {$recipientName},</p><p>Ich glaube, dass Sie ein hervorragender Gutachter für einen Beitrag bei der Zeitschrift {$journalName} sein könnten. Ich hoffe, dass Sie diese wichtige Aufgabe für uns übernehmen werden.</p><p>Wenn Sie in der Lage sind, diesen Beitrag zu begutachten, ist Ihre Begutachtung bis zum {$reviewDueDate} fällig. Sie können die Einreichung einsehen, Begutachtungsdateien hochladen und Ihre Begutachtung einreichen, indem Sie sich auf der Website der Zeitschrift anmelden und den Schritten unter dem unten stehenden Link folgen. </p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Abstract</b></p>{$submissionAbstract}<p>Ich erbitte die <a href=\"{$reviewAssignmentUrl}\">Annahme oder Ablehnung</a> des Gutachtens bis <b>{$responseDueDate}</b>. </p><p>Gerne stehe ich Ihnen zur Verfügung, wenn Sie Fragen zur Einreichung oder zum Begutachtungsverfahren haben.</p><p>Danke, dass Sie diesen Anfrage berücksichtigen. Ihre Hilfe wird sehr geschätzt.</p><p>Mit freundlichen Grüßen,</p>{$signature}'),
(221, 'REVIEW_REQUEST_SUBSEQUENT', 'de', 'Nachfolgende Gutachtenanfrage', 'Anfrage zur Begutachtung einer überarbeiteten Einreichung', '<p>Sehr geehrte/r {$recipientName},</p><p>Danke für Ihr Gutachten zu <a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a>. Die Autor/innen haben das Feedback der Gutachter/innen berücksichtigt und nun eine überarbeitete Version ihrer Arbeit eingereicht. Ich schreibe Ihnen, um Sie zu fragen, ob Sie eine zweite Begutachtungsrunde für diese Einreichung durchführen würden.</p><p>Wenn Sie in der Lage sind, diese Einreichung zu begutachten, ist Ihre Begutachtung bis {$reviewDueDate} fällig. Sie können <a href=\"{$reviewAssignmentUrl}\">den Begutachtungsschritten folgen</a>, um die Einreichung anzusehen, Begutachtungsdateien hochzuladen und Ihre Begutachtungskommentare einzureichen. <p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Abstract</b></p>{$submissionAbstract}<p>Bitte <a href=\"{$reviewAssignmentUrl}\">Annahme oder Ablehnung</a> des Gutachtens bis zum <b>{$responseDueDate}</b>. </p><p>Bei Fragen zur Einreichung oder zum Begutachtungsverfahren können Sie sich gerne an mich wenden.</p><p>Danke, dass Sie diesen Anfrage berücksichtigen. Ihre Hilfe wird sehr geschätzt.</p><p>Mit freundlichen Grüßen,</p>{$signature}'),
(222, 'REVIEW_RESPONSE_OVERDUE_AUTO', 'de', 'Antwort auf eine Gutachtenanfrage fällig (Automatisiert)', 'Können Sie den Beitrag für uns begutachten?', '<p>Sehr geehrte/r {$recipientName},</p><p>Diese E-Mail ist eine automatische Erinnerung der Zeitschrift {$Kontextname} in Bezug auf unsere Aufforderung zur Begutachtung der Einreichung \"{$submissionTitle}\".</p><p>Sie erhalten diese E-Mail, weil wir noch keine Bestätigung von Ihnen erhalten haben, ob Sie in der Lage sind, diese Einreichung zu begutachen oder nicht. </p><p>Bitte teilen Sie uns mit, ob Sie in der Lage sind, diesen Beitrag zu prüfen, indem Sie unsere Software zur Verwaltung der Einreichungen verwenden, um diese Anfrage anzunehmen oder abzulehnen.</p><p>Wenn Sie in der Lage sind, diesen Beitrag zu prüfen, ist Ihr Gutachten bis zum {$reviewDueDate} fällig. Sie können die Begutachtungsschritte befolgen, um die Einreichung einzusehen, Begutachtungsdateien hochzuladen und Ihre Begutachtungskommentare zu übermitteln.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Abstract</b></p>{$submissionAbstract}<p>Bei Fragen zur Einreichung oder zum Begutachtungsprozess können Sie sich gerne an mich wenden.</p><p>Danke, dass Sie diese Anfrage berücksichtigen. Ihre Hilfe ist mir sehr willkommen.</p><p>Mit freundlichen Grüßen,</p>{$journalSignature}'),
(223, 'REVIEW_CONFIRM', 'de', 'Gutachten bestätigt', 'Überprüfung angenommen: {$reviewerName} hat den Überprüfungsauftrag angenommen für #{$submissionId} {$authorsShort} — {$submissionTitle}', '<p>Sehr geehrte/r {$recipientName},</p><p>{$reviewerName} hat die folgende Überprüfung akzeptiert:</p><p><a href=\"{$submissionUrl}\">#{$submissionId} {$authorsShort} — {$submissionTitle}</a><br /><b>Gutachtenmethode:</b> {$reviewMethod}</p><p><b>Gutachten fällig am:</b> {$reviewDueDate}</p><p>Melden Sie sich an, um <a href=\"{$submissionUrl}\">alle Gutachteraufgaben</a> für diese Einreichung zu sehen.</p><br><br>—<br>Dies ist eine automatische Nachricht von <a href=\"{$journalUrl}\">{$journalName}</a>.'),
(224, 'REVIEW_DECLINE', 'de', 'Gutachten abgelehnt', 'Nicht in der Lage zu begutachten', 'Sehr geehrte Redakteure/innen:<br />\n<br />\nIch fürchte, dass ich die Einreichung \"{$submissionTitle}\" für die Zeitschrift {$journalName} zur Zeit nicht begutachten kann. Vielen Dank, dass Sie an mich gedacht haben. Sie können mich gerne ein anderes Mal kontaktieren.<br />\n<br />\n{$Absendername}'),
(225, 'REVIEW_ACK', 'de', 'Gutachten erhalten', 'Eingangsbestätigung für Ihr Gutachten', '<p>Sehr geehrte/r {$recipientName},</p>\n<p>vielen Dank für Ihr Gutachten zum Beitrag &quot;{$submissionTitle}&quot; für die Zeitschrift {$journalName}. Ihre Stellungnahme ist eine wichtige Unterstützung für unsere Bemühungen um die Qualität der von uns veröffentlichten Arbeiten.</p>\n<p>Es war uns eine Freude, mit Ihnen als Gutachter/in für {$journalName} zusammenzuarbeiten, und wir hoffen, dass wir auch in Zukunft die Gelegenheit haben werden, mit Ihnen zusammenzuarbeiten.</p>\n<p>Mit freundlichen Grüßen,</p>\n<p>{$Unterschrift}</p>'),
(226, 'REVIEW_REMIND', 'de', 'Erinnerung an das Gutachten', 'Eine Erinnerung, Ihr Gutachten bitte abzuschließen', '<p>Sehr geehrte/r {$recipientName},</p><p>nur eine freundliche Erinnerung an unsere Bitte um Ihre Begutachtung der Einreichung \"{$submissionTitle}\" für die Zeitschrift {$journalName}. Wir haben erwartet, dass wir diese Begutachtung bis zum {$reviewDueDate} erhalten, und würden uns freuen, sie zu bekommen, sobald Sie in der Lage sind, sie vorzubereiten.</p><p>Sie können sich <a href=\"{$reviewAssignmentUrl}\">bei der Zeitschrift anmelden</a> und den Begutachtungsschritten folgen, um die Einreichung zu sehen, Begutachtungsdateien hochzuladen und Ihre Begutachtungskommentare einzureichen.</p><p>Wenn Sie eine Verlängerung der Frist benötigen, kontaktieren Sie mich bitte. Ich freue mich darauf, von Ihnen zu hören.</p><p>Vielen Dank im Voraus und mit freundlichen Grüßen,</p>{$signature}'),
(227, 'REVIEW_REMIND_AUTO', 'de', 'Erinnerung an das Gutachten (Automatisiert)', 'Eine Erinnerung, Ihr Gutachten bitte abzuschließen', '<p>Sehr geehrte/r {$recipientName}</p><p>Diese E-Mail ist eine automatische Erinnerung von {$journalName} in Bezug auf unsere Bitte um Ihre Begutachtung der Einreichung \"{$submissionTitle}\"</p><p>Wir haben Ihr Gutachten bis zum {$reviewDueDate} erwartet und würden uns freuen, es zu erhalten, sobald Sie es vorbereiten können. </p><p>Bitte <a href=\"{$reviewAssignmentUrl}\">melden Sie sich bei der Zeitschrift an</a> und folgen Sie den Begutachtungsschritten, um die Einreichung einzusehen, die Begutachtungsdateien hochzuladen und Ihre Begutachtungskommentare abzugeben.</p><p>Wenn Sie eine Verlängerung der Frist benötigen, setzen Sie sich bitte mit mir in Verbindung. Ich freue mich darauf, von Ihnen zu hören.</p><p>Vielen Dank im Voraus und mit freundlichen Grüßen,</p>{$journalSignature}'),
(228, 'REVIEW_COMPLETE', 'de', 'Gutachten abgeschlossen', 'Gutachten abgeschlossen: {$reviewerName} empfiehlt {$reviewRecommendation} für #{$submissionId} {$authorsShort} - {$submissionTitle}', '<p>Sehr geehrte/r {$recipientName},</p><p>{$reviewerName} hat die folgende Überprüfung abgeschlossen:</p><p><a href=\"{$submissionUrl}\">#{$submissionId} {$authorsShort} — {$submissionTitle}</a><br /><b>Empfehlung:</b> {$reviewRecommendation}<br /><b>Gutachtenmethode:</b> {$reviewMethod}</p><p>Melden Sie sich an, um <a href=\"{$submissionUrl}\">alle Dateien und Kommentare</a> dieses Gutachters/dieser Gutachterin zu sehen.</p>'),
(229, 'REVIEW_EDIT', 'de', 'Gutachten bearbeitet', 'Ihre Zuweisung für ein Gutachten für {$journalName} wurde geändert', '<p>Sehr geehrte/r {$recipientName},</p><p>Ein Redakteur/eine Redakteurin hat Änderungen an Ihrer Überprüfungsaufgabe für {$journalName} vorgenommen. Bitte überprüfen Sie die folgenden Details und lassen Sie uns wissen, wenn Sie Fragen haben.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a><br /><b>Gutachtenmethode:</b> {$reviewMethod}<br /><b>Annehmen oder Ablehnen bis:</b> {$responseDueDate}<br /><b>Gutachteneinreichung bis:</b> {$reviewDueDate}</p><p>Sie können sich jederzeit anmelden, um <a href=\"{$reviewAssignmentUrl}\">diese Überprüfung abzuschließen</a>.</p>'),
(230, 'EDITOR_DECISION_ACCEPT', 'de', 'Einreichung akzeptiert', 'Ihre Einreichung wurde bei {$journalName} angenommen', '<p>Sehr geehrte/r {$recipientName},</p><p>ich freue mich, Ihnen mitteilen zu können, dass wir beschlossen haben, Ihre Einreichung ohne weitere Überarbeitung zu akzeptieren. Nach sorgfältiger Prüfung haben wir festgestellt, dass Ihr Beitrag {$submissionTitle} unsere Erwartungen erfüllt oder sogar übertrifft. Wir freuen uns, Ihren Beitrag in {$journalName} zu veröffentlichen, und danken Ihnen, dass Sie unsere Zeitschrift als Ort für Ihre Arbeit gewählt haben.</p><p>Ihr Beitrag wird nun in einer zukünftigen Ausgabe von {$journalName} erscheinen, und Sie können ihn gerne in Ihre Liste der Veröffentlichungen aufnehmen. Wir erkennen die harte Arbeit an, die in jeder erfolgreichen Einreichung steckt, und wir möchten Ihnen dazu gratulieren, dass Sie dieses Stadium erreicht haben.</p><p>Ihre Einreichung wird nun redaktionell bearbeitet und formatiert, um sie für die Veröffentlichung vorzubereiten.</p><p>Sie werden in Kürze weitere Anweisungen erhalten.</p><p>Wenn Sie Fragen haben, kontaktieren Sie mich bitte über Ihr <a href=\"{$authorSubmissionUrl}\">Einreichungs-Dashboard</a>.</p><p>Mit freundlichen Grüßen,</p>{$signature}'),
(231, 'EDITOR_DECISION_SEND_TO_EXTERNAL', 'de', 'Zur Begutachtung geschickt', 'Ihr Beitrag wurde zur Überprüfung gesendet', '<p>Sehr geehrte/r {$recipientName},</p><p>Ich freue mich, Ihnen mitzuteilen, dass ein Redakteur/eine Redakteurin Ihre Einreichung {$submissionTitle} begutachtet hat und beschlossen hat, sie zur Begutachtung zu schicken. Ein Redakteur/eine Redakteurin wird qualifizierte Gutachter/Gutachterinnen benennen, die ein Feedback zu Ihrer Einreichung geben werden.</p><p>{$reviewTypeDescription} Sie erhalten von uns eine Rückmeldung von den Gutachter/Gutachterinnen und Informationen über die nächsten Schritte.</p><p>Bitte beachten Sie, dass die Einsendung des Beitrags zur Begutachtung keine Garantie dafür ist, dass er veröffentlicht wird. Wir werden die Empfehlungen der Gutachter/innen berücksichtigen, bevor wir entscheiden, ob der Beitrag zur Veröffentlichung angenommen wird. Es kann sein, dass Sie aufgefordert werden, den Beitrag zu überarbeiten und auf die Kommentare der Gutachter/innen zu antworten, bevor eine endgültige Entscheidung getroffen wird.</p><p>Wenn Sie Fragen haben, wenden Sie sich bitte über das Dashboard Ihres Beitrags an mich.</p><p>{$signature}</p>'),
(232, 'EDITOR_DECISION_SEND_TO_PRODUCTION', 'de', 'In die Produktion geschickt', 'Nächste Schritte zur Veröffentlichung Ihres Beitrags', '<p>Sehr geehrte/r {$recipientName},</p><p>ich schreibe Ihnen von {$journalName}, um Ihnen mitzuteilen, dass die Bearbeitung Ihrer Einreichung {$submissionTitle} abgeschlossen ist. Ihre Einreichung geht nun in die Produktionsphase über, in der die endgültigen Druckfahnen für die Veröffentlichung vorbereitet werden. Wir werden uns mit Ihnen in Verbindung setzen, wenn wir weitere Unterstützung benötigen.</p><p>Wenn Sie Fragen haben, kontaktieren Sie mich bitte über das <a href=\"{$authorSubmissionUrl}\">Dashboard Ihrer Einreichung</a>.</p><p>Mit freundlichen Grüßen,</p>{$signature}'),
(233, 'EDITOR_DECISION_REVISIONS', 'de', 'Überarbeitungen angefordert', 'Ihr Beitrag wurde geprüft. Bitte reichen Sie Überarbeitungen ein', '<p>Sehr geehrte/r {$recipientName},</p><p>Ihre Einreichung {$submissionTitle} wurde begutachtet und wir möchten Sie auffordern, Überarbeitungen einzureichen, die auf die Kommentare der Gutachter/innen eingehen. Ein Redakteur/eine Redakteurin wird diese Überarbeitungen prüfen, und wenn sie die Bedenken hinreichend berücksichtigen, kann Ihr Beitrag zur Veröffentlichung angenommen werden.</p><p>Die Kommentare der Gutachter/innen sind am Ende dieser E-Mail enthalten. Bitte gehen Sie auf jeden Punkt in den Kommentaren der Reviewer ein und geben Sie an, welche Änderungen Sie vorgenommen haben. Wenn Sie einen der Kommentare für ungerechtfertigt oder unangemessen halten, erläutern Sie bitte Ihren Standpunkt.</p><p>Wenn Sie Ihre Überarbeitungen abgeschlossen haben, können Sie die überarbeiteten Dokumente zusammen mit Ihrer Antwort auf die Kommentare der Prüfer im <a href=„{$authorSubmissionUrl}“>Dashboard Ihrer Einreichung</a> hochladen. Wenn Sie abgemeldet waren, können Sie sich erneut mit dem Benutzernamen {$recipientUsername} anmelden.</p><p>Wenn Sie Fragen haben, kontaktieren Sie mich bitte über das <a href=„{$authorSubmissionUrl}“>Dashboard Ihrer Einreichung</a>.</p><p>Wir freuen uns auf Ihre überarbeitete Eingabe.</p><p>Mit freundlichen Grüßen,</p>{$signature}<hr><p>Die folgenden Kommentare wurden von den Gutachter/innen abgegeben.</p>{$allReviewerComments}'),
(234, 'EDITOR_DECISION_RESUBMIT', 'de', 'Erneut für die Begutachtung vorlegen', 'Ihr Beitrag wurde geprüft - bitte überarbeiten Sie ihn und reichen Sie ihn erneut ein', '<p>Sehr geehrte/r {$recipientName},</p><p>Nach Durchsicht Ihrer Einreichung {$submissionTitle} haben die Gutachter/innen empfohlen, dass Ihre Einreichung in der vorliegenden Form nicht zur Veröffentlichung angenommen werden kann. Wir möchten Sie jedoch ermutigen, eine überarbeitete Version einzureichen, die auf die Kommentare der Gutachter/innen eingeht. Ihre überarbeitete Fassung wird von einem Redakteur/einer Redaktion geprüft und möglicherweise zu einer weiteren Begutachtungsrunde weitergeleitet.</p><p>Bitte beachten Sie, dass die erneute Einreichung Ihrer Arbeit keine Garantie dafür ist, dass sie angenommen wird.</p><p>Die Kommentare der Gutachter/innen sind am Ende dieser E-Mail enthalten. Bitte gehen Sie auf jeden Punkt ein und geben Sie an, welche Änderungen Sie vorgenommen haben. Wenn Sie einen der Kommentare für unangemessen halten, erläutern Sie bitte Ihren Standpunkt. Wenn Sie Fragen zu den Empfehlungen im Bericht haben, geben Sie diese bitte in Ihrer Antwort an.</p><p>Wenn Sie Ihre Überarbeitungen abgeschlossen haben, können Sie die überarbeiteten Dokumente zusammen mit Ihrer Antwort auf die Kommentare der Gutachter/innen im <a href=\"{$authorSubmissionUrl}\">Dashboard Ihrer Einreichung</a> hochladen.Wenn Sie abgemeldet waren, können Sie sich erneut mit dem Benutzernamen {$recipientUsername} anmelden.</p><p>Wenn Sie Fragen haben, kontaktieren Sie mich bitte über das <a href=„{$authorSubmissionUrl}“>Dashboard Ihrer Einreichung</a>.</p><p>Wir freuen uns auf Ihre überarbeitete Eingabe.</p><p>Mit freundlichen Grüßen,</p>{$signature}<hr><p>Die folgenden Kommentare wurden von den Gutachter/innen abgegeben.</p>{$allReviewerComments}'),
(235, 'EDITOR_DECISION_DECLINE', 'de', 'Einreichung abgelehnt', 'Entscheidung der Redaktion: Ihre Einreichung wurde abgelehnt', '<p>Sehr geehrte/ {$recipientName},</p><p>Wir freuen uns über Ihre Einreichung, können aber {$submissionTitle} auf Grund der Kommentare der Gutachter/innen nicht zur Veröffentlichung annehmen.</p><p>Die Kommentare der Gutachter/innen sind am Ende dieser E-Mail enthalten.</p><p>Vielen Dank für Ihre Einreichung bei {$journalName}. Obwohl es enttäuschend ist, wenn eine Einreichung abgelehnt wird, hoffe ich, dass Sie die Kommentare der Gutachter/innen als konstruktiv und hilfreich empfinden.</p><p>Es steht Ihnen nun frei, die Arbeit an anderer Stelle einzureichen, wenn Sie dies wünschen.</p><p>Mit freundlichen Grüßen,</p>{$signature}<hr><p>Die folgenden Kommentare wurden von den Gutachter/innen abgegeben.</p>{$allReviewerComments}'),
(236, 'EDITOR_DECISION_INITIAL_DECLINE', 'de', 'Einreichung abgelehnt (Vor dem Gutachten)', 'Entscheidung der Redaktion: Ihre Einreichung wurde abgelehnt', '<p>Sehr geehrte/r {$recipientName},</p><p>es tut mir leid, Ihnen mitzuteilen, dass die Redaktion nach Durchsicht Ihrer Einreichung {$submissionTitle} festgestellt hat, dass sie unsere Anforderungen für eine Veröffentlichung in {$journalName} nicht erfüllt.</p><p>Ich wünsche Ihnen viel Erfolg, wenn Sie erwägen, Ihre Arbeit anderswo einzureichen.</p><p>Mit freundlichen Grüßen,</p>{$signature}'),
(237, 'EDITOR_RECOMMENDATION', 'de', 'Empfehlung gegeben', 'Empfehlung der Redaktion', '<p>Sehr geehrte/r {$recipientName},</p><p>Nach Abwägung des Feedbacks der Gutachter/innen möchte ich folgende Empfehlung für die Einreichung {$submissionTitle} aussprechen .</p><p>Meine Empfehlung lautet: {$recommendation}.</p><p>Bitte besuchen Sie den <a href=\"{$submissionUrl}\">Redaktionsworkflow</a> des Beitrags, um dieser Empfehlung nachzukommen.</p><p>Bitte zögern Sie nicht, mich bei Fragen zu kontaktieren.</p><p>Mit freundlichen Grüßen,</p><p>{$senderName}</p>'),
(238, 'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS', 'de', 'Andere Autor/innen benachrichtigen', 'Ein Update zu Ihrer Einreichung', '<p>Die folgende E-Mail wurde an {$submittingAuthorName} von {$journalName} bezüglich {$submissionTitle} gesendet.</p>\n<p>Sie erhalten eine Kopie dieser Benachrichtigung, da Sie als Autor/in der Einreichung identifiziert sind. Alle Anweisungen in der folgenden Nachricht sind für den einreichenden Autor/die einreichende Autorin {$submittingAuthorName} bestimmt, und von Ihnen wird zu diesem Zeitpunkt keine Aktion verlangt.</p>\n\n{$messageToSubmittingAuthor}'),
(239, 'EDITOR_DECISION_NOTIFY_REVIEWERS', 'de', 'Gutachter/innen über die Entscheidung benachrichtigen', 'Eingangsbestätigung für Ihr Gutachten', '<p>Sehr geehrte/r {$recipientName},</p>\n<p>Vielen Dank, dass Sie den Beitrag {$submissionTitle} für {$journalName} begutachtet haben. Wir wissen Ihre Zeit und Ihr Fachwissen zu schätzen, mit denen Sie zur Qualität der von uns veröffentlichten Arbeiten beitragen. Wir haben Ihre Kommentare mit den Autoren geteilt, zusammen mit den Kommentaren unserer anderen Gutachter und der Entscheidung der Redaktion.</p>\n<p>Auf der Grundlage des erhaltenen Feedbacks haben wir die Autoren über Folgendes informiert:</p>\n<p>{$decisionDescription}</p>\n<p>Ihre Empfehlung wurde zusammen mit den Empfehlungen der anderen Gutachter/innen geprüft, bevor eine Entscheidung getroffen wurde. Gelegentlich kann die Entscheidung des Herausgebers von der Empfehlung eines oder mehrerer Gutachter/innen abweichen. Die Redaktion wägt viele Faktoren ab und nimmt diese Entscheidungen nicht auf die leichte Schulter. Wir sind dankbar für das Fachwissen und die Vorschläge unserer Gutachter/innen.</p>\n<p>Es war uns eine Freude, mit Ihnen als Gutachter/in für {$journalName} zusammenzuarbeiten, und wir hoffen, dass wir auch in Zukunft die Gelegenheit haben werden, mit Ihnen zusammenzuarbeiten.</p>\n<p>Mit freundlichen Grüßen,</p>\n<p>{$Unterschrift}</p>'),
(240, 'EDITOR_DECISION_NEW_ROUND', 'de', 'Neue Gutachtenrunde gestartet', 'Ihr Beitrag wurde für eine weitere Begutachtungsrunde weitergeleitet', '<p>Sehr geehrte/r {$recipientName},</p>\n<p>Ihre überarbeitete Einreichung {$submissionTitle} wurde zu einer neuen Runde der Begutachtung geschickt. \nSie werden von uns eine Rückmeldung von den Gutachter/innen und Informationen über die nächsten Schritte erhalten.</p>\n<p>Wenn Sie Fragen haben, kontaktieren Sie mich bitte über das <a href=\"{$authorSubmissionUrl}\">Dashboard Ihrer Einreichung</a>.</p>\n<p>Mit freundlichen Grüßen,</p>\n<p>{$signature}</p>\n'),
(241, 'EDITOR_DECISION_REVERT_DECLINE', 'de', 'Abgelehnte Einreichung wieder aufnehmen', 'Wir haben die Entscheidung, Ihre Einreichung abzulehnen, rückgängig gemacht', '<p>Sehr geehrte/r {$recipientName},</p>\n<p>Die Entscheidung, Ihre Einreichung {$submissionTitle} abzulehnen, wurde rückgängig gemacht. Ein Redakteur/eine Redakteurin wird die Überprüfungsrunde abschließen und Sie werden benachrichtigt, wenn eine Entscheidung getroffen ist.</p>\n<p>Gelegentlich wird die Entscheidung, eine Einreichung abzulehnen, versehentlich in unserem System gespeichert und muss dann rückgängig gemacht werden. Ich möchte mich für die Verwirrung entschuldigen, die dies verursacht haben könnte.</p>\n<p>Wir werden uns mit Ihnen in Verbindung setzen, wenn wir weitere Unterstützung benötigen.</p>\n<p>Wenn Sie Fragen haben, kontaktieren Sie mich bitte über das <a href=\"{$authorSubmissionUrl}\">Dashboard Ihrer Einreichung</a>.</p>\n<p>Mit freundlichen Grüßen,</p>\n<p>{$signature}</p>\n'),
(242, 'EDITOR_DECISION_REVERT_INITIAL_DECLINE', 'de', 'Ohne Gutachten abgelehnte Einreichung wieder aufnehmen', 'Wir haben die Entscheidung, Ihre Einreichung abzulehnen, rückgängig gemacht', '<p>Sehr geehrte/r {$recipientName},</p><p>Die Entscheidung, Ihre Einreichung {$submissionTitle} abzulehnen, wurde rückgängig gemacht. Ein Redakteur/eine Redakteurin wird sich Ihre Einreichung genauer ansehen, bevor er entscheidet, ob er sie ablehnt oder zur Überprüfung zu schickt.</p><p>Gelegentlich wird die Entscheidung, eine Einreichung abzulehnen, versehentlich in unserem System gespeichert und muss dann rückgängig gemacht werden. Ich möchte mich für die Verwirrung entschuldigen, die dies verursacht haben könnte.</p><p>Wir werden uns mit Ihnen in Verbindung setzen, wenn wir weitere Unterstützung benötigen.</p><p>Wenn Sie Fragen haben, kontaktieren Sie mich bitte über das <a href=\"{$authorSubmissionUrl}\">Dashboard Ihrer Einreichung</a>.</p><p>Mit freundlichen Grüßen,</p><p>{$signature}</p>\n'),
(243, 'EDITOR_DECISION_SKIP_REVIEW', 'de', 'Einreichung angenommen (ohne Begutachtung)', 'Ihre Einreichung wurde in das Lektorat geschickt', '<p>Sehr geehrte/r {$recipientName},</p>\n<p>Ich freue mich, Ihnen mitteilen zu können, dass wir beschlossen haben, Ihre Einreichung ohne Peer Review anzunehmen. Wir sind der Meinung, dass Ihre Einreichung {$submissionTitle} unseren Erwartungen entspricht, und wir verlangen nicht, dass Arbeiten dieser Art einem Peer-Review unterzogen werden. Wir freuen uns, Ihren Beitrag in {$journalName} zu veröffentlichen und danken Ihnen, dass Sie unsere Zeitschrift für Ihre Arbeit gewählt haben.</p>\nIhr Beitrag wird nun in einer zukünftigen Ausgabe von {$journalName} veröffentlicht und Sie können ihn gerne in Ihre Publikationsliste aufnehmen. Wir wissen um die harte Arbeit, die hinter jeder erfolgreichen Einreichung steckt, und möchten Ihnen zu Ihren Bemühungen gratulieren.</p>>\n<p>Ihre Einreichung wird nun redaktionell bearbeitet und formatiert, um sie für die Veröffentlichung vorzubereiten. </p>\n<p>Sie werden in Kürze weitere Anweisungen erhalten.</p>\n<p>Wenn Sie Fragen haben, kontaktieren Sie mich bitte über Ihr <a href=\"{$authorSubmissionUrl}\">Einreichungs-Dashboard</a>.</p>\n<p>Mit freundlichen Grüßen,</p>\n<p>{$signature}</p>\n'),
(244, 'EDITOR_DECISION_BACK_FROM_PRODUCTION', 'de', 'Einreichung wurde ins Lektorat zurückgeschickt', 'Ihr Beitrag wurde an das Lektorat zurückgeschickt', '<p>Sehr geehrte/r {$recipientName},</p><p>Ihre Einsendung {$submissionTitle} wurde an das Lektorat zurückgeschickt, wo sie weiter bearbeitet und formatiert wird, um sie zur Veröffentlichung vorzubereiten.</p><p>Es kann vorkommen, dass eine Einsendung in die Produktionsphase geht, bevor die endgültigen Druckfahnen für die Veröffentlichung vorbereitet sind. Ihre Einsendung ist noch nicht abgeschlossen. Für etwaige Unklarheiten bitte ich um Entschuldigung.</p><p>Wenn Sie Fragen haben, kontaktieren Sie mich bitte über das <a href=\"{$authorSubmissionUrl}\">Dashboard Ihrer Einreichung</a>.</p><p>Wir werden uns mit Ihnen in Verbindung setzen, wenn wir weitere Unterstützung benötigen.</p><p>Mit freundlichen Grüßen,</p><p>{$signature}</p>'),
(245, 'EDITOR_DECISION_BACK_FROM_COPYEDITING', 'de', 'Einreichung vom Lektorat aus zurückgeschickt', 'Ihr Beitrag wurde zur Überprüfung zurückgeschickt', '<p>Sehr geehrte/r {$recipientName},</p><p>ihr Beitrag {$submissionTitle} wurde zur Überprüfung zurückgeschickt. Er wird einer weiteren Überprüfung unterzogen, bevor er zur Veröffentlichung angenommen werden kann.</p><p>Gelegentlich wird eine Entscheidung über die Annahme einer Einreichung versehentlich in unserem System gespeichert und wir müssen sie zur Überprüfung zurückschicken. Ich bitte um Entschuldigung für jegliche Verwirrung, die dies verursacht hat. Wir werden uns bemühen, alle weiteren Überprüfungen schnell abzuschließen, damit Sie so schnell wie möglich eine endgültige Entscheidung erhalten.</p><p>Wir werden uns mit Ihnen in Verbindung setzen, wenn wir weitere Unterstützung benötigen.</p><p>Wenn Sie Fragen haben, kontaktieren Sie mich bitte über das <a href=\"{$authorSubmissionUrl}\">Dashboard Ihrer Einreichung</a>.</p><p>Mit freundlichen Grüßen,</p><p>{$signature}</p>'),
(246, 'EDITOR_DECISION_CANCEL_REVIEW_ROUND', 'de', 'Gutachtenrunde abgebrochen', 'Eine Überprüfungsrunde für Ihren Beitrag wurde abgesagt', '<p>Sehr geehrte/r {$recipientName},</p><p>wir haben kürzlich eine neue Überprüfungsrunde für Ihre Einreichung {$submissionTitle} eröffnet. Wir schließen diese Überprüfungsrunde jetzt ab.</p><p>Es kann vorkommen, dass eine Entscheidung zur Eröffnung einer Überprüfungsrunde versehentlich in unserem System gespeichert wird und wir diese Überprüfungsrunde abbrechen müssen. Ich bitte um Entschuldigung für jegliche Verwirrung, die dies verursacht haben könnte.</p><p>Wir werden uns mit Ihnen in Verbindung setzen, wenn wir weitere Unterstützung benötigen.</p><p>Wenn Sie Fragen haben, kontaktieren Sie mich bitte über das <a href=\"{$authorSubmissionUrl}\">Dashboard Ihrer Einreichung</a>.</p><p>Mit freundlichen Grüßen,</p><p>{$signature}</p>'),
(247, 'SUBSCRIPTION_NOTIFY', 'de', 'Abonnementbenachrichtigung', 'Benachrichtigung zu einem Abonnement', 'Sehr geehrte/r {$recipientName}<br />\n<br />\nSie sind jetzt als Abonnent/in in unserem Online-Zeitschriftenverwaltungssystem für {$journalName} mit dem folgenden Abonnement registriert:<br />\n<br />\n{$subscriptionType}<br />\n<br />\nUm auf Inhalte zuzugreifen, die nur für Abonnent/innen verfügbar sind, melden Sie sich einfach mit Ihrem Benutzernamen \"{$recipientUsername}\" am System an.<br />\n<br />\nSobald Sie sich im System angemeldet haben, können Sie Ihre Profildaten und Ihr Passwort jederzeit ändern.<br />\n<br />\nWenn Sie ein institutionelles Abonnement haben, brauchen sich die Benutzer/innen Ihrer Einrichtung nicht anzumelden, da Anfragen nach Abonnementinhalten automatisch vom System authentifiziert werden.<br />\n<br />\nWenn Sie Fragen haben, können Sie sich gerne an mich wenden.<br />\n<br />\n{$subscriptionSignature}'),
(248, 'OPEN_ACCESS_NOTIFY', 'de', 'Open Access Benachrichtigung', 'Frei zugänglich: {$issueIdentification} der Zeitschrift {$journalName} ist jetzt Open Access', '<p>Sehr geehrte/r {$recipientName},</p><p>wir freuen uns, Ihnen mitteilen zu können, dass <a href=\"{$issueUrl}\">{$issueIdentification}</a> der Zeitschrift {$journalName} jetzt im Open Access verfügbar ist. Ein Abonnement ist nicht mehr erforderlich, um diese Ausgabe zu lesen.</p><p>Wir danken Ihnen für Ihr anhaltendes Interesse an unserer Arbeit.</p>{$journalSignature}'),
(249, 'SUBSCRIPTION_BEFORE_EXPIRY', 'de', 'Abonnement läuft bald aus', 'Benachrichtigung über das Ablaufen eines Abonnements', 'Sehr geehrte/r {$recipientName}<br />\n<br />\nIhr Abonnement für {$journalName} läuft in Kürze ab.<br />\n<br />\n{$subscriptionType}<br />\nVerfallsdatum: {$expiryDate}<br />\n<br />\nUm sicherzustellen, dass Sie weiterhin Zugang zu dieser Zeitschrift haben, gehen Sie bitte auf die Website der Zeitschrift und verlängern Sie Ihr Abonnement. Sie können sich mit Ihrem Benutzernamen \"{$recipientUsername}\" in das System einloggen.<br />\n<br />\nWenn Sie Fragen haben, können Sie mich gerne kontaktieren.<br />\n<br />\n{$subscriptionSignature}'),
(250, 'SUBSCRIPTION_AFTER_EXPIRY', 'de', 'Abonnement abgelaufen', 'Abonnement abgelaufen', 'Sehr geehrte/r {$recipientName}<br />\n<br />\nIhr Abonnement für {$journalName} ist abgelaufen.<br />\n<br />\n{$subscriptionType}<br />\nVerfallsdatum: {$expiryDate}<br />\n<br />\nUm Ihr Abonnement zu erneuern, gehen Sie bitte auf die Website der Zeitschrift. Sie können sich mit Ihrem Benutzernamen \"{$recipientUsername}\" in das System einloggen.<br />\n<br />\nWenn Sie Fragen haben, können Sie mich gerne kontaktieren.<br />\n<br />\n{$subscriptionSignature}'),
(251, 'SUBSCRIPTION_AFTER_EXPIRY_LAST', 'de', 'Zuletzt abgelaufenes Abbonement', 'Abonnement abgelaufen - Letzte Erinnerung', 'Sehr geehrte/r {{$recipientName}<br />\n<br />\nIhr Abonnement für {$journalName} ist abgelaufen.<br />\nBitte beachten Sie, dass dies die letzte Erinnerung ist, die Sie per E-Mail erhalten werden.<br />\n<br />\n{$subscriptionType}<br />\nVerfallsdatum: {$expiryDate}<br />\n<br />\nUm Ihr Abonnement zu verlängern, gehen Sie bitte auf die Website der Zeitschrift. Sie können sich mit Ihrem Benutzernamen \"{$recipientUsername}\" in das System einloggen.<br />\n<br />\nWenn Sie Fragen haben, können Sie mich gerne kontaktieren.<br />\n<br />\n{$subscriptionSignature}'),
(252, 'SUBSCRIPTION_PURCHASE_INDL', 'de', 'Ein individuelles Abonnement kaufen', 'Abonnementkauf: Individuell', 'Ein individuelles Abonnement wurde online für {$journalName} mit den folgenden Details erworben.<br />\n<br />\nAbonnementtyp:<br />\n{$subscriptionType}<br />\n<br />\nBenutzer:<br />\n{$subscriberDetails}<br />\n<br />\nMitgliedschaftsinformationen (falls vorhanden):<br />\n{$membership}<br />\n<br />\nUm dieses Abonnement anzuzeigen oder zu bearbeiten, verwenden Sie bitte die folgende URL.<br />\n<br />\nAbonnement-URL: {$subscriptionUrl}<br />\n'),
(253, 'SUBSCRIPTION_PURCHASE_INSTL', 'de', 'Ein institutionelles Abonnement kaufen', 'Abonnementkauf: Institutionell', 'Ein institutionelles Abonnement wurde online für {$journalName} mit den folgenden Details erworben. Um dieses Abonnement zu aktivieren, verwenden Sie bitte die bereitgestellte Abonnement-URL und setzen Sie den Abonnementstatus auf \'Aktiv\'.<br />\n<br />\nAbonnementtyp:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (falls vorhanden):<br />\n{$domain}<br />\n<br />\nIP-Bereiche (falls angegeben):<br />\n{$ipRanges}<br />\n<br />\nKontaktperson:<br />\n{$subscriberDetails}<br />\n<br />\nMitgliedschaftsinformationen (falls vorhanden):<br />\n{$membership}<br />\n<br />\nUm dieses Abonnement anzuzeigen oder zu bearbeiten, verwenden Sie bitte die folgende URL.<br />\n<br />\nAbonnement-URL: {$subscriptionUrl}<br />\n'),
(254, 'SUBSCRIPTION_RENEW_INDL', 'de', 'Individuelles Abonnement erneuern', 'Abonnementerneuerung: Individuell', 'Ein individuelles Abonnement wurde online für {$journalName} mit den folgenden Details verlängert.<br />\n<br />\nAbonnementtyp:<br />\n{$subscriptionType}<br />\n<br />\nBenutzer:<br />\n{$subscriberDetails}<br />\n<br />\nMitgliedschaftsinformationen (falls vorhanden):<br />\n{$membership}<br />\n<br />\nUm dieses Abonnement anzuzeigen oder zu bearbeiten, verwenden Sie bitte die folgende URL.<br />\n<br />\nAbonnement-URL: {$subscriptionUrl}<br />\n'),
(255, 'SUBSCRIPTION_RENEW_INSTL', 'de', 'Institutionelles Abonnement erneuern', 'Abonnementerneuerung: Institutionell', 'Ein institutionelles Abonnement wurde online für {$journalName} mit den folgenden Angaben verlängert.<br />\n<br />\nAbonnementtyp:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (falls vorhanden):<br />\n{$domain}<br />\n<br />\nIP-Bereiche (falls angegeben):<br />\n{$ipRanges}<br />\n<br />\nKontaktperson:<br />\n{$subscriberDetails}<br />\n<br />\nMitgliedschaftsinformationen (falls vorhanden):<br />\n{$membership}<br />\n<br />\nUm dieses Abonnement anzuzeigen oder zu bearbeiten, verwenden Sie bitte die folgende URL.<br />\n<br />\nAbonnement-URL: {$subscriptionUrl}<br />\n'),
(256, 'REVISED_VERSION_NOTIFY', 'de', 'Benachrichtigung über eine überarbeitete Version', 'Überarbeitete Version hochgeladen', '<p>Liebe/r {$recipientName},</p><p>der Autor/die Autorin hat Überarbeitungen für die Einreichung <b>{$authorsShort} - {$submissionTitle}</b> hochgeladen. <p>Als zugewiesene/r Redakteur/in bitten wir Sie, sich einzuloggen und <a href=\"{$submissionUrl}\">die Überarbeitungen</a> anzusehen und eine Entscheidung zu treffen, ob Sie die Einreichung annehmen, ablehnen oder zur weiteren Überprüfung weiterleiten möchten.</p><br><br>-<br>Dies ist eine automatische Nachricht von <a href=\"{$journalUrl}\">{$journalName}</a>.'),
(257, 'STATISTICS_REPORT_NOTIFICATION', 'de', 'Benachrichtigung über einen Statistikbericht', 'Redaktionelle Aktivitäten für {$month}, {$year}', '\nSehr geehrte/r {$recipientName} <br />\n<br />\nIhr Zeitschriftenbericht für {$month}, {$year} ist jetzt verfügbar. Ihre wichtigsten Statistiken für diesen Monat:<br />\n<ul>\n	<li>Neue Einreichungen diesen Monat: {$newSubmissions}</li>\n	<li>Abgelehnte Einreichungen diesen Monat: {$declinedSubmissions}</li>\n	<li>Angenommene Einsendungen in diesem Monat: {$acceptedSubmissions}</li>\n	<li>Gesamtanzahl der Einreichungen im System: {$totalSubmissions}</li>\n</ul>\nMelden Sie sich bei der Zeitschrift an, um detailliertere <a href=\"{$editorialStatsLink}\">Redaktionstrends</a> und <a href=\"{$publicationStatsLink}\">Statistiken zu veröffentlichten Artikeln</a> anzuzeigen. Eine vollständige Kopie der redaktionellen Trends für diesen Monat ist beigefügt.<br />\n<br />\nMit freundlichen Grüßen,<br />\n{$journalSignature}'),
(258, 'ANNOUNCEMENT', 'de', 'Neue Mitteilung', '{$announcementTitle}', '<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nBesuchen Sie unsere Website, um die <a href=\"{$announcementUrl}\">vollständige Ankündigung</a> zu lesen.'),
(259, 'DISCUSSION_NOTIFICATION_SUBMISSION', 'de', 'Diskussion (Einreichung)', 'Eine Nachricht bezüglich {$journalName}', 'Bitte geben Sie Ihre Nachricht ein.'),
(260, 'DISCUSSION_NOTIFICATION_REVIEW', 'de', 'Diskussion (Begutachtung)', 'Eine Nachricht bezüglich {$journalName}', 'Bitte geben Sie Ihre Nachricht ein.'),
(261, 'DISCUSSION_NOTIFICATION_COPYEDITING', 'de', 'Diskussion (Lektorat)', 'Eine Nachricht bezüglich {$journalName}', 'Bitte geben Sie Ihre Nachricht ein.'),
(262, 'DISCUSSION_NOTIFICATION_PRODUCTION', 'de', 'Diskussion (Produktion)', 'Eine Nachricht bezüglich {$journalName}', 'Bitte geben Sie Ihre Nachricht ein.'),
(263, 'COPYEDIT_REQUEST', 'de', 'Lektorat anfragen', 'Einreichung {$submissionId} ist bereit für die Bearbeitung von {$contextAcronym}', '<p>Sehr geehrte/r {$recipientName},</p><p>Ein neuer Beitrag ist bereit für das Lektorat:</p><p><a href\"{$submissionUrl}\">{$submissionId} — {$submissionTitle}</a><br />{$journalName}</p><p>Bitte befolgen Sie diese Schritte, um diese Aufgabe zu erledigen:</p><ol><li>Klicken Sie auf die URL für die Einreichung unten.</li><li>Öffnen Sie alle Dateien, die unter Entwurfsdateien verfügbar sind, und bearbeiten Sie die Dateien. Benutzen Sie den Bereich Diskussionen zum Lektorat, wenn Sie mit dem/den Redakteur(en) oder Autor(en) Kontakt aufnehmen möchten.</li><li>Speichern Sie die bearbeitete(n) Datei(en) und laden Sie sie in das Bedienfeld Lektorierte Dateien hoch.</li><li>Benutzen Sie die Lektorats-Diskussionen, um den/die Redakteur/in zu benachrichtigen, dass alle Dateien vorbereitet wurden und der Produktionsprozess beginnen kann.</li></ol><p>Wenn Sie diese Arbeit zu diesem Zeitpunkt nicht übernehmen können oder Fragen haben, wenden Sie sich bitte an mich. Vielen Dank für Ihren Beitrag zu {$journalName}.</p><p>Mit freundlichen Grüßen,</p>{$signature}'),
(264, 'EDITOR_ASSIGN_SUBMISSION', 'de', 'Redakteur/in zuweisen', 'Sie wurden als Redakteur/in von einer Einreichung bei {$journalName} zugewiesen', '<p>Sehr geehrte/r {$recipientName},</p><p>Die folgende Einreichung wurde Ihnen zur redaktionellen Bearbeitung zugewiesen. </p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Wenn Sie der Meinung sind, dass die Einreichung für die Zeitschrift {$journalName} relevant ist, leiten Sie die Einreichung bitte zur Begutachtung weiter, indem Sie \"In die Begutachtung schicken\" wählen und dann Gutachter zuweisen, indem Sie auf \"Gutachter/in hinzufügen\" klicken. </p><p>Wenn die Einreichung nicht für diese Zeitschrift geeignet ist, lehnen Sie die Einreichung bitte ab.</p><p>Danke im Voraus.</p><p>Mit freundlichen Grüßen,</p>{$journalSignature}'),
(265, 'EDITOR_ASSIGN_REVIEW', 'de', 'Redakteur/in zuweisen', 'Sie wurden als Redakteur/in von einer Einreichung bei {$journalName} zugewiesen', '<p>Sehr geehrte/r {$recipientName},</p><p>Die folgende Einreichung wurde Ihnen zur Begutachtung zugewiesen.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Bitte melden Sie sich an, um <a href=\"{$submissionUrl}\">die Einreichung einzusehen</a> und qualifizierte Gutachter/innen zuzuweisen. Sie können eine/n Gutachter/in zuweisen, indem Sie auf \"Gutachter/in hinzufügen\" klicken.</p><p>Danke im Voraus.</p><p>Mit freundlichen Grüßen,</p>{$signature}'),
(266, 'EDITOR_ASSIGN_PRODUCTION', 'de', 'Redakteur/in zuweisen', 'Sie wurden als Redakteur/in von einer Einreichung bei {$journalName} zugewiesen', '<p>Sehr geehrte/r {$recipientName},</p><p>Die folgende Einreichung wurde Ihnen für die Produktionsphase zugewiesen.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Bitte melden Sie sich an, um <a href=\"{$submissionUrl}\">die Einreichung einzusehen</a>. Sobald die produktionsfertigen Dateien vorliegen, laden Sie sie unter <strong>Publikation > Fahnen</strong> hoch. Klicken Sie dann auf die Schaltfläche <strong>Zur Veröffentlichung vorsehen</strong>.</p><p>Vielen Dank im Voraus.</p><p>Mit freundlichen Grüßen,</p>{$signature}'),
(267, 'LAYOUT_REQUEST', 'de', 'Für die Produktion bereit', 'Die Einreichung {$submissionId} ist bereit für die Produktion bei {$contextAcronym}', '<p>Liebe/r {$recipientName},</p><p>eine neue Einreichung steht für die Layout-Bearbeitung bereit:</p><p><a href=\"{$submissionUrl}\">{$submissionId} - {$submissionTitle}</a><br />{$journalName}</p><ol><li>Klicken Sie auf die obige Einreichungs-URL.</li><li>Laden Sie die produktionsfertigen Dateien herunter und verwenden Sie sie, um die Druckfahnen gemäß den Standards der Zeitschrift zu erstellen. </li><li>Laden Sie die Druckfahnen in den Publikationsbereich der Einreichung hoch.</li><li>Benutzen Sie die Produktionsdiskussionen, um der Redaktion mitzuteilen, dass die Druckfahnen fertig sind.</li></ol><p>Wenn Sie diese Arbeit zu diesem Zeitpunkt noch nicht erledigen können oder Fragen haben, wenden Sie sich bitte an mich. Vielen Dank für Ihren Beitrag zu dieser Zeitschrift.</p><p>Mit freundlichen Grüßen,</p>{$signature}'),
(268, 'LAYOUT_COMPLETE', 'de', 'Fahnen vollständig', 'Fahnen vollständig', '<p>Sehr geehrte/r {$recipientName},</p><p>die Druckfahnen für die folgende Einreichung wurden nun vorbereitet und sind bereit für die endgültige Überprüfung.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$journalName}</p><p>Wenn Sie Fragen haben, kontaktieren Sie mich bitte.</p><p>Mit freundlichen Grüßen,</p><p>{$signature}</p>'),
(269, 'VERSION_CREATED', 'de', 'Version erstellt', 'Eine neue Version wurde für {$submissionTitle} erstellt', '<p>Sehr geehrte/r {$recipientName}, </p><p>dies ist eine automatische Nachricht, die Sie darüber informiert, dass eine neue Version Ihres Beitrags {$submissionTitle} erstellt wurde. Sie können diese Version in Ihrem Dashboard für die Einreichung unter folgendem Link einsehen:</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a></p><hr><p>Dies ist eine automatische E-Mail, gesendet von <a href=\"{$journalUrl}\">{$journalName}</a>.</p>'),
(270, 'EDITORIAL_REMINDER', 'de', 'Redaktionserinnerung', 'Ausstehende redaktionelle Aufgaben für {$journalName}', '<p>Sehr geehrte/r {$recipientName},</p><p>Sie sind derzeit {$numberOfSubmissions} Einreichung(en) zugewiesen in <a href=\"{$journalUrl}\">{$journalName}</a>. Die folgenden Einsendungen <b>warten auf Ihre Antwort</b></p>{$outstandingTasks}<p>Sehen Sie alle Ihre Aufgaben an in Ihrem <a href=\"{$submissionsUrl}\">Dashboard der Einreichungen</a>.</p><p>Wenn Sie Fragen zu Ihren Aufgaben haben, wenden Sie sich bitte an {$contactName} unter {$contactEmail}.</p>'),
(271, 'SUBMISSION_SAVED_FOR_LATER', 'de', 'Einreichung für später gespeichert', 'Setzen Sie Ihre Einreichung bei {$journalName} fort', '<p>Sehr geehrte/r {$recipientName},</p><p>Die Angaben zu Ihrem Beitrag sind in unserem System gespeichert, aber noch nicht zur Prüfung eingereicht worden. Sie können jederzeit zurückkehren, um Ihre Einreichung zu vervollständigen, indem Sie dem unten stehenden Link folgen.</p><p><a href=\"{$submissionWizardUrl}\">{$authorsShort} — {$submissionTitle}</a></p><hr><p>Dies ist eine automatische E-Mail von <a href=\"{$journalUrl}\">{$journalName}</a>.</p>'),
(272, 'SUBMISSION_NEEDS_EDITOR', 'de', 'Einreichung benötigt Redakteur/in', 'Einer neuen Einreichung muss ein Redakteur/eine Redakteurin zugewiesen werden: {$submissionTitle}', '<p>Sehr geehrte/r {$recipientName},</p><p>Der folgende Beitrag wurde eingereicht und es wurde kein/e Redakteur/in zugewiesen.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Bitte weisen Sie eine/n Redakteur/in zu, der für die Einreichung verantwortlich sein wird, indem Sie auf den Titel oben klicken, und dann eine/n Redakteur/in unter der Rubrik Teilnehmer zuweisen.</p><hr><p>Dies ist eine automatische E-Mail von <a href=\"{$journalUrl}\">{$journalName}</a>.</p>'),
(273, 'PAYMENT_REQUEST_NOTIFICATION', 'de', 'Zahlungsanfrage', 'Benachrichtigung über eine Zahlungsanforderung', '<p>Sehr geehrte/r {$recipientName},</p><p>herzlichen Glückwunsch zur Annahme Ihrer Einreichung {$submissionTitle} bei {$journalName}. Nachdem Ihre Einreichung angenommen wurde, möchten wir Sie nun um die Zahlung der Veröffentlichungsgebühr bitten.</p><p>Diese Gebühr deckt die Produktionskosten für die Veröffentlichung Ihrer Einreichung. Um die Zahlung vorzunehmen, besuchen Sie bitte <a href=\"{$queuedPaymentUrl}\">{$queuedPaymentUrl}</a>.</p><p>Wenn Sie Fragen haben, lesen Sie bitte unsere <a href=\"{$submissionGuidelinesUrl}\">Einreichungsrichtlinien</a>.</p>');
INSERT INTO `email_templates_default_data` (`email_templates_default_data_id`, `email_key`, `locale`, `name`, `subject`, `body`) VALUES
(274, 'ORCID_COLLECT_AUTHOR_ID', 'de', '', 'ORCID Zugriff erbeten', 'Liebe/r {$recipientName},<br/>\n<br/>\nSie sind als Autor/in eines eingereichten Beitrags bei der Zeitschrift {$journalName} benannt worden.<br/>\nUm Ihre Autor/innenschaft zu bestätigen, geben Sie bitte Ihre ORCID iD für diese Einreichung an, indem Sie den unten angegebenen Link aufrufen.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>ORCID iD anlegen oder verknüpfen</a><br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Mehr Informationen zu ORCID</a><br/>\n<br/>\nWenn Sie Fragen dazu haben, antworten Sie einfach auf diese E-Mail.<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),
(275, 'ORCID_REQUEST_AUTHOR_AUTHORIZATION', 'de', '', 'ORCID Zugriff erbeten', 'Liebe/r {$recipientName},<br>\n<br>\nSie sind als Autor/in des eingereichten Beitrags \"{$submissionTitle}\" bei der Zeitschrift {$journalName} benannt worden.<br>\n<br>\nBitte gestatten Sie uns Ihre ORCID iD, falls vorhanden, zu diesem Beitrag hinzuzufügen, sowie ihr ORCID-Profil bei Veröffentlichung des Beitrags zu aktualisieren.<br>\nDazu folgen Sie dem unten stehenden Link zur offiziellen ORCID-Seite, melden sich mit Ihren Daten an und authorisieren den Zugriff, indem\nSie den Anweisungen auf der Seite folgen.<br>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>ORCID id anlegen oder verknüpfen</a><br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">Mehr Informationen zu ORCID</a><br />\n<br>\nWenn Sie Fragen dazu haben, antworten Sie einfach auf diese E-Mail.<br>\n<br>\n{$principalContactSignature}<br>\n'),
(276, 'MANUAL_PAYMENT_NOTIFICATION', 'de', 'Manuelle Zahlungsbenachrichtigung', 'Benachrichtigung über manuelle Zahlung', 'Eine manuelle Zahlung ist für die Zeitschrift {$journalName} und den/die Benutzer/in {$senderName} (Benutzer/innen-Name &quot;{$senderUsername}&quot;) angekündigt worden.<br />\n<br />\nGezahlt werden soll für &quot;{$paymentName}&quot;.<br />\nDie Kosten betragen {$paymentAmount} ({$paymentCurrencyCode}).<br />\n<br />\nDiese E-Mail wurde vom OJS-Plugin Manuelle Gebührenzahlung erzeugt.'),
(277, 'PASSWORD_RESET_CONFIRM', 'it', '', 'Conferma di modifica della password', 'Abbiamo ricevuto una richiesta di modifica della password per {$siteTitle}.<br />\n<br />\nSe non ha inviato Lei la richiesta, ignori semplicemente questo messaggio e la password non sarà modificata. Se invece desidera generare una nuova password, clicchi sul link sottostante:<br />\n<br />\nReset della password: {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),
(278, 'USER_REGISTER', 'it', '', 'Registrazione nuovo utente', 'Gentile {$recipientName}<br />\n<br />\nGrazie per aver effettuato la registrazione a {$journalName}. Riportiamo qui di seguito le Sue credenziali, necessarie per l\'accesso all\'area riservata del sito web della rivista. Potrà richiedere in qualsiasi momento di essere rimosso dall\'elenco degli utenti della rivista contattandoci via e-mail.<br />\n<br />\nNome utente: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nGrazie,<br />\n{$signature}'),
(279, 'USER_VALIDATE_CONTEXT', 'it', 'Confermare e-mail (registrazione di una rivista)', 'Convalida dell\'account', 'Gentile {$recipientName}<br />\n<br />\nÈ stato creato un account per {$journalName}, ma prima di poter interagire sul sito web, è necessario validare il Suo indirizzo e-mail. Per fare ciò, clicchi semplicemente sul link sottostante:<br />\n<br />\n{$activateUrl}<br />\n<br />\nGrazie,<br />\n{$journalSignature}'),
(280, 'USER_VALIDATE_SITE', 'it', 'Convalidare l\'e-mail (sito)', 'Conferma dell\'account', 'Gentile {$recipientName}<br />\n<br />\nÈ necessario confermare l\'indirizzo email associato al Suo nuovo account per la rivista {$siteTitle} cliccando sul link sottostante:<br />\n<br />\n{$activateUrl}<br />\n<br />\nGrazie e cordiali saluti,<br />\n{$siteSignature}'),
(281, 'REVIEWER_REGISTER', 'it', '', 'Registrazione come revisore per {$journalName}', '<p>Gentile {$recipientName},</p><p>Considerati i Suoi ambiti di competenza, vorremmo cortesemente registrare il Suo nominativo nell\'elenco dei valutatori per {$journalName}. Ciò non implica nessun tipo di impegno da parte Sua, ma semplicemente ci consentirà di contattarLa, tramite il nostro sito web, per sottoporLe richieste di valutazione di proposte editoriali. In caso di richieste di valutazione, riceverà in primo luogo il titolo e il riassunto dei contributi e potrà, contestualmente, accettare o declinare l\'invito alla revisione.</p><p>Troverà dunque qui di seguito il Suo nome utente e la Sua password, utili per tutte le interazioni con la rivista attraverso il sito web. Qualora fosse disponibile, le saremmo grati se volesse verificare le informazioni inserite e completare il profilo, compilando i campi suggeriti, tra cui anche le Sue aree tematiche di interesse.</p><p>Nome utente: {$recipientUsername}<br />Password: {$password}</p><p>Grazie,</p>{$signature}'),
(282, 'ISSUE_PUBLISH_NOTIFY', 'it', 'Notifica di numero pubblicato', 'Nuova pubblicazione: {$issueIdentification} per {$journalName}', '<p>Gentile {$recipientName},</p><p>Siamo lieti di comunicarLe che è stato pubblicato il nuovo <a href=\"{$issueUrl}\">{$issueIdentification}</a> di {$journalName}.  La invitiamo gentilmente a consultare la pubblicazione e a condividerla con la Sua comunità di riferimento.</p><p>Siamo particolarmente grati agli autori, ai valutatori e ai curatori per i loro preziosi contributi, e ai nostri lettori per l\'interesse nei confronti della nostra rivista.</p><p>Con i più cordiali saluti,</p>{$signature}'),
(283, 'SUBMISSION_ACK', 'it', '', 'Grazie per avere inviato il suo contributo a {$journalName}', 'Gentile {$recipientName},<br />\n<br />\nGrazie per aver inviato il suo contributo &quot;{$submissionTitle}&quot; alla testata  {$journalName}. Potrà il processo di revisione del suo manoscritto attraverso portale utilizzando la sua login al sito:<br />\n<br />\nURL della proposta: {$submissionUrl}<br />\nUsername: {$recipientUsername}<br />\n<br />\nPer qualsiasi domanda non esiti a contattarmi.<br />\nLa ringrazio per la preferenza espressa nei confronti di {$journalName}.<br />\n<br />\n{$journalSignature}'),
(284, 'SUBMISSION_ACK_NOT_USER', 'it', '', 'Conferma di ricezione della proposta', '<p>Gentilissimo {$recipientName}</p>\n<p>{$submitterName} ha aggiunto il suo nominativo in qualità di co-author del manoscritto \"{$submissionTitle}\" inviato per la pubblicazione alla rivista {$journalName}. </p>\n<p>questi sono i dettagli forniti: {$authorsWithAffiliation}</p>\n<p>Se non fossero corretti la prego di contattarci. Siamo a disposizione per qualsiasi chiarimento e la ringraziamo per la sua collaborazione.</p>\n<p>{$journalSignature}</p>'),
(285, 'EDITOR_ASSIGN', 'it', '', 'Assegnazione di una proposta editoriale {$journalName}', '<p>Gentile {$recipientName},</p><p>La seguente proposta Le è stata assegnata per il processo editoriale:</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>ualora dovesse ritenere a proposta sia rilevante per {$journalName}, potrà inoltrarla alla fase di revisione selezionando \"Invia alla revisione\" e, successivamente, potrà assegnare i revisori utilizzando il tasto \"Aggiungi revisore\".</p><p>Se la proposta non dovesse essere a Suo giudizio appropriata per questa rivista, La preghiamo di rifiutarla.</p><p>Grazie in anticipo.</p><p>Cordiali saluti,</p>{$journalSignature}'),
(286, 'REVIEW_CANCEL', 'it', 'Revisore non assegnato', 'Cancellazione della richiesta di revisione', '<p>Gentile {$recipientName},</p><p>Di recente Le abbiamo chiesto di esaminare una proposta per {$journalName}. Abbiamo tuttavia deciso di annullare tale la richiesta di revisione per il contributo {$submissionTitle}.</p><p>Ci scusiamo per l\'inconveniente e speriamo di poterLa contattare in futuro per nuove occasioni di collaborazione.</p><p>Per ogni quesito o necessità, non esiti a contattarci. Grazie e cordiali saluti,</p>{$signature}'),
(287, 'REVIEW_REINSTATE', 'it', 'Revisore reintegrato', 'È ancora disponibile per la revisione per {$journalName}?', '<p>Gentile {$recipientName},</p><p>La contattiamo perché avevamo di recente annullato la nostra richiesta di revisione per la proposta {$submissionTitle}, per {$journalName}. Tuttavia, abbiamo ora riveduto tale decisione e speriamo vivamente che Lei possa ancora effettuare la revisione.</p><p>Qualora possa contribuire alla revisione di questa proposta editoriale, potrà <a href=\"{$reviewAssignmentUrl}\">effettuare l\'accesso</a> per visualizzare la proposta, per caricare i file di revisione e per inviare le richieste.</p><p>Per ogni quesito, non esiti a contattarci.</p><p>Cordiali saluti,</p>{$signature}'),
(288, 'REVIEW_RESEND_REQUEST', 'it', '', '', ''),
(289, 'REVIEW_REQUEST', 'it', '', 'Proposta di revisione', '<p>Gentile {$recipientName},</p><p>Ritengo che Lei sarebbe un eccellente revisore per una proposta editoriale che è stata sottoposta a {$journalName}. Il titolo e l\'abstract della proposta sono riportati qui di seguito; spero che potrà prendere in considerazione l\'idea di svolgere questo importante compito per noi.</p><p>In caso di Sua disponibilità, la scadenza per la revisione è fissata al {$reviewDueDate}. È possibile visualizzare la proposta, caricare i file di revisione e inviare la propria revisione accedendo al sito della rivista e seguendo i passaggi indicati nel link sottostante.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Abstract</b></p>{$submissionAbstract}<p>Per cortesia <a href=\"{$reviewAssignmentUrl}\">accetti o declini</a> la proposta di revisione entro il <b>{$responseDueDate}</b>.</p><p>Non esiti a contattarci per qualsiasi domanda sull\'invio o sul processo di revisione.</p><p>Grazie per aver preso in considerazione questa richiesta e per la preziosa collaborazione.</p><p>Cordiali saluti,</p>{$signature}'),
(290, 'REVIEW_REQUEST_SUBSEQUENT', 'it', '', 'Richiesta di ulteriore revisione per una proposta già valutata', '<p>Gentile {$recipientName},</p><p>Grazie per la Sua cortese valutazione di <a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a>. A seguito delle considerazioni formulate, sono stati ricevuti riscontri e una nuova versione della proposta editoriale. Saremmo dunque grati se potesse effettuare una nuova e ulteriore valutazione per questa proposta editoriale.</p><p>In caso di disponibilità, Le saremmo grati se potesse comunicare la Sua valutazione entro il {$reviewDueDate}. Le ricordiamo che potrà accedere al <a href=\"{$reviewAssignmentUrl}\">processo editoriale</a>per visualizzare la proposta, caricare nuovi file di revisione, e sottoporre i Suoi eventuali commenti.<p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Abstract</b></p>{$submissionAbstract}<p>La preghiamo dunque di <a href=\"{$reviewAssignmentUrl}\">accettare o declinare</a> la revisione entro il <b>{$responseDueDate}</b>.</p><p>Per ogni esigenza o necessità, non esiti a contattarci.</p><p>Grazie infinite, e con i più cordiali saluti,</p>{$signature}'),
(291, 'REVIEW_RESPONSE_OVERDUE_AUTO', 'it', '', 'Può effettuare una revisione per la nostra rivista?', '<p>Gentile {$recipientName},</p><p>Questa e-mail è un promemoria automatico da parte di {$journalName} in merito alla richiesta di revisione del contributo \"{$submissionTitle}.\"</p><p>Riceve questa e-mail perché non abbiamo ancora raccolto una conferma da parte Sua che indichi se potrà essere in grado o meno di effettuare la revisione proposta .</p><p>La preghiamo di comunicarci la Sua eventuale disponibilità circa la possibilità di accettare o di rifiutare tale proposta utilizzando la nostra piattaforma editoriale.</p><p>Qualora fosse in grado di effettuare la revisione, la scadenza è fissata al {$reviewDueDate}. È possibile seguire le fasi di revisione per visualizzare il contributo, per caricare i file di revisione e per inviare i propri commenti di revisione.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Abstract</b></p>{$submissionAbstract}<p>Per ogni necessità, non esiti a contattarci.</p><p>Grazie per la preziosa collaborazione.</p><p>Con i più cordiali saluti,</p>{$journalSignature}'),
(292, 'REVIEW_CONFIRM', 'it', '', 'Accettazione incarico di revisione', 'Gentile Editor,<br />\n<br />\nAccetto l\'incarico di revisionare &quot;{$submissionTitle},&quot; per {$journalName}.<br />\nPenso di completare la revisione per la data che mi avete comunicato, {$reviewDueDate}, se non prima.<br />\n<br />\n{$senderName}'),
(293, 'REVIEW_DECLINE', 'it', '', 'Rifiuto dell\'incarico di revisione', 'Gentili Editor,<br />\n<br />\nSono spiacente di comunicarVi che non posso attualmente accogliere la proposta di valutazione della proposta &quot;{$submissionTitle}&quot; per {$journalName}. Nella speranza di future occasioni di collaborazione, porgo cordiali saluti,<br />\n<br />\n{$senderName}'),
(294, 'REVIEW_ACK', 'it', '', 'Ringraziamenti per la revisione', 'Gentile {$recipientName}:<br />\n<br />\nGrazie per aver completato la revisione del manoscritto &quot;{$submissionTitle},&quot; per {$journalName}. Apprezziamo il tuo contributo nel mantenere alta la qualità della rivista.'),
(295, 'REVIEW_REMIND', 'it', '', 'Promemoria per il completamento di una revisione', '<p>Gentile {$recipientName},</p><p>Ci permettiamo di sottoporre gentilmente alla Sua attenzione un promemoria relativo alla richiesta di revisione della proposta editoriale, \"{$submissionTitle},\" for {$journalName}. Avremmo necessità di ricevere la sua revisione entro il {$reviewDueDate} e saremmo lieti di conoscere la Sua opinione non appena potrà comunicarcela.</p><p>Le ricordiamo che può <a href=\"{$reviewAssignmentUrl}\">effettuare l\'accesso</a> e seguire la procedura di revisione per visualizzare la proposta, per caricare i file di revisione e per inviare i commenti di revisione.</p><p>Qualora necessitasse di una proroga, non esiti a contattarci</p><p>Grazie in anticipo per la preziosa collaborazione, e con i più cordiali saluti,</p>{$signature}'),
(296, 'REVIEW_REMIND_AUTO', 'it', '', 'Promemoria per il completamento di una revisione', '<p>Gentile {$recipientName},</p><p>Questa e-mail è un promemoria automatico da parte di {$journalName} per la richiesta di revisione della proposta editoriale, \"{$submissionTitle}\".</p><p> Avremmo necessità di ricevere la sua revisione entro il {$reviewDueDate} e saremmo lieti di conoscere la Sua opinione non appena potrà comunicarcela.</p><p>Le ricordiamo che può <a href=\"{$reviewAssignmentUrl}\">effettuare l\'accesso</a> e seguire la procedura di revisione per visualizzare la proposta, per caricare i file di revisione e per inviare i commenti di revisione.</p><p>Qualora necessitasse di una proroga, non esiti a contattarci</p><p>Grazie in anticipo per la preziosa collaborazione, e con i più cordiali saluti,</p>{$journalSignature}'),
(297, 'REVIEW_COMPLETE', 'it', '', '', ''),
(298, 'REVIEW_EDIT', 'it', '', '', ''),
(299, 'EDITOR_DECISION_ACCEPT', 'it', '', 'La Sua proposta è stata accettata per la pubblicazione su {$journalName}', '<p>Gentile {$recipientName},</p><p>Siamo lieti di comunicarLe che la Sua proposta editoriale è stata ritenuta idonea alla pubblicazione senza necessità di ulteriori revisioni. Dopo attenta valutazione, abbiamo infatti rinvenuto che la Sua proposta, {$submissionTitle}, soddisfi pienamente le nostre aspettative. Siamo pertanto entusiasti di poter pubblicare il Suo lavoro su {$journalName} e La ringraziamo per aver scelto la nostra rivista come sede di pubblicazione.</p><p>Il contributo sarà dunque pubblicato in un futuro numero di {$journalName} e La preghiamo di considerare tale e-mail come conferma. Siamo consapevoli dell\'impegnativo lavoro necessario ai fini di ogni proposta editoriale di successo e pertanto desideriamo complimentarci per aver ottenuto tale risultato .</p><p>Il Suo contributo sarà ora sottoposto a un processo di copy-editing e sarà formattato ai fini della pubblicazione.</p><p>Riceverà entro breve, a tal proposito, ulteriori indicazioni.</p><p>In caso di necessità o quesiti, non esiti a contattarci tramite la Sua area di<a href=\"{$authorSubmissionUrl}\">gestione delle proposte</a>.</p><p>Con i più cordiali saluti,</p>{$signature}'),
(300, 'EDITOR_DECISION_SEND_TO_EXTERNAL', 'it', '', 'Decisione dell\'editor', 'Gentilissimo {$authors}:<br />\n<br />\nAbbiamo preso una decisione circa la tua proposta a {$journalName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nLa nostra decisione: invio a un revisore esterno<br />\n<br />\nSubmission URL: {$submissionUrl}'),
(301, 'EDITOR_DECISION_SEND_TO_PRODUCTION', 'it', '', 'Decisione dell\'editor', 'Gentilissimo {$authors}:<br />\n<br />\nLa lavorazione editoriale della sua proposta, &quot;{$submissionTitle},&quot; è completa.  Ora viene preparata per l\'uscita sulla rivista.<br />\n<br />\nURL proposta: {$submissionUrl}'),
(302, 'EDITOR_DECISION_REVISIONS', 'it', '', 'Decisione dell\'editor', '&lt;![CDATA[{$authors}:<br />\n<br />\nAbbiamo raggiunto una decisione sulla Sua proposta a {$journalName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nLa nostra decisione: è necessaria ciclo di peer-review'),
(303, 'EDITOR_DECISION_RESUBMIT', 'it', '', 'Decisione dell\'editor', '{$authors}:<br />\n<br />\nAbbiamo raggiunto una decisione riguardo alla Sua submission a {$journalName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nLa decisione è: mandarla di nuovo in revisione'),
(304, 'EDITOR_DECISION_DECLINE', 'it', '', 'Decisione dell\'editor', '{$authors}:<br />\n<br />\nAbbiamo raggiunto una decisione riguardo alla Sua submission a {$journalName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nLa decisione è di non accettare la proposta'),
(305, 'EDITOR_DECISION_INITIAL_DECLINE', 'it', '', 'Decisione dell\'editor', '\n			Gentilissimo {$authors}:<br />\n<br />\nAbbiamo preso una decisione in merito al suo manoscritto dal titolo &quot;{$submissionTitle}&quot; inviato a {$journalName} .<br />\n<br />\nCi rincresce informarla che non ci è possibile accettare il suo contributo'),
(306, 'EDITOR_RECOMMENDATION', 'it', '', 'Raccomandazione dell\'editor', '{$editors}:<br />\n<br />\nLa raccomandazione riguardo la proposta &quot;{$submissionTitle}&quot;, giunta per  {$journalName}, è: {$recommendation}'),
(307, 'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS', 'it', '', '', ''),
(308, 'EDITOR_DECISION_NOTIFY_REVIEWERS', 'it', '', '', ''),
(309, 'EDITOR_DECISION_NEW_ROUND', 'it', '', '', ''),
(310, 'EDITOR_DECISION_REVERT_DECLINE', 'it', '', '', ''),
(311, 'EDITOR_DECISION_REVERT_INITIAL_DECLINE', 'it', '', '', ''),
(312, 'EDITOR_DECISION_SKIP_REVIEW', 'it', '', 'Il Suo contributo è stato assegnato per la fase di copy-editing', '<p>Gentile {$recipientName},</p>\n<p>Abbiamo il piacere di informarLa che il Suo contributo {$submissionTitle} è stato accettato senza necessità del processo di revisione fra pari. Siamo pertanto lieti di poter pubblicare il Suo contributo in {$journalName} e La ringraziamo per avere scelto la nostra rivista.</p>\n<p>Il contributo sarà dunque pubblicato in un futuro numero di {$journalName} e La preghiamo di considerare tale e-mail già valida come conferma in tal senso. Siamo consapevoli dell\'impegnativo lavoro necessario ai fini di ogni proposta editoriale di successo e pertanto desideriamo complimentarci per aver ottenuto tale risultato .</p><p>Il Suo contributo sarà entro breve assegnato per il lavoro di copy-editing e di formazione ai fini della pubblicazione.</p><p>Riceverà entro breve, a tal proposito, ulteriori indicazioni.</p><p>In caso di necessità o quesiti, non esiti a contattarci tramite la Sua area di<a href=\"{$authorSubmissionUrl}\">gestione delle proposte</a>.</p><p>Con i più cordiali saluti,</p>{$signature}\n'),
(313, 'EDITOR_DECISION_BACK_FROM_PRODUCTION', 'it', '', '', ''),
(314, 'EDITOR_DECISION_BACK_FROM_COPYEDITING', 'it', '', '', ''),
(315, 'EDITOR_DECISION_CANCEL_REVIEW_ROUND', 'it', '', '', ''),
(316, 'SUBSCRIPTION_NOTIFY', 'it', 'Notifica di sottoscrizione', 'Notifica di sottoscrizione', 'Gentile {$recipientName}:<br />\n<br />\nLa Sua registrazione a {$journalName} è stata attivata con le seguenti caratteristiche:<br />\n<br />\n{$subscriptionType}<br />\n<br />\nPer accedere al contenuto riservato agli abbonati, effettui semplicemente l\'accesso al sistema con il Suo username, &quot;{$recipientUsername}&quot;.<br />\n<br />\nUna volta effettuato l\'accesso potrà modificare in ogni momento i dettagli del profilo e la password.<br />\n<br />\nGli utenti istituzionali vengono riconosciuti automaticamente dal sistema.<br />\n<br />\nPer qualsiasi domanda non esiti a contattarci.<br />\n<br />\nCordiali saluti, <br />{$subscriptionSignature}'),
(317, 'OPEN_ACCESS_NOTIFY', 'it', 'Notifica di accesso aperto', 'Nuovo fascicolo ad accesso aperto: {$issueIdentification} di {$journalName}', '<p>Gentile {$recipientName},</p><p>Siamo lieti di informarLa che <a href=\"{$issueUrl}\">{$issueIdentification}</a> di {$journalName} è ora disponibile in modalità ad accesso aperto.  Non è più richiesto alcun abbonamento per poter accedere a tale rivista.</p><p>Grazie per la sua cortese attenzione, e con i più cordiali saluti,</p>{$journalSignature}'),
(318, 'SUBSCRIPTION_BEFORE_EXPIRY', 'it', 'L\'abbonamento scade tra poco', 'Avviso di scadenza dell\'abbonamento', 'Gentile {$recipientName}:<br />\n<br />\nIl suo abbonamento a {$journalName} sta per scadere.<br />\n<br />\n{$subscriptionType}<br />\nData di scadenza: {$expiryDate}<br />\n<br />\nPer continuare ad accedere a questa rivista, si rechi sul sito e rinnovi l\'abbonamento. Per l\'accesso utilizzi la sua username, &quot;{$recipientUsername}&quot;.<br />\n<br />\nPer qualsiasi domanda e ulteriore informazione, non esiti a contattarci.<br />\n<br />\n{$subscriptionSignature}'),
(319, 'SUBSCRIPTION_AFTER_EXPIRY', 'it', 'Abbonamento scaduto', 'Abbonamento scaduto', 'Gentile {$recipientName}:<br />\n<br />\nIl suo abbonamento a {$journalName} è scaduto.<br />\n<br />\n{$subscriptionType}<br />\nData di scadenza: {$expiryDate}<br />\n<br />\nPer rinnovare l\'abbonamento, si rechi sul nostro sito. Per l\'accesso utilizzi la sua username, &quot;{$recipientUsername}&quot;.<br />\n<br />\nPer qualsiasi domanda e ulteriore informazione, non esiti a contattarmi.<br />\n<br />\n{$subscriptionSignature}'),
(320, 'SUBSCRIPTION_AFTER_EXPIRY_LAST', 'it', 'Abbonamento scaduto l\'ultima volta', 'Abbonamento scaduto (ultimo avviso)', 'Gentile {$recipientName}:<br />\n<br />\nIl Suo abbonamento a {$journalName} è scaduto.<br />\nQuesto è l\'ultimo promemoria che Le sarà inviato via e-mail.<br />\n<br />\n{$subscriptionType}<br />\nData di scadenza: {$expiryDate}<br />\n<br />\nPer rinnovare l\'abbonamento visiti il sito della rivista. Per l\'accesso utilizzi il suo username &quot;{$recipientUsername}&quot;.<br />\n<br />\nPer qualsiasi domanda e ulteriore informazione, non esiti a contattarci.<br />\n<br />\n{$subscriptionSignature}'),
(321, 'SUBSCRIPTION_PURCHASE_INDL', 'it', 'Acquisto di un abbonamento individuale', 'Acquisto di un abbonamento individuale', 'Un abbonamento individuale è stato acquistato per {$journalName} con i seguenti dettagli.<br />\n<br />\nTipologia di abbonamento:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$subscriberDetails}<br />\n<br />\nInformazioni sulla sottoscrizione (se sono state fornite):<br />\n{$membership}<br />\n<br />\nPer visualizzare o modificare questo abbonamento, utilizzare il seguente URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n'),
(322, 'SUBSCRIPTION_PURCHASE_INSTL', 'it', 'Acquisto di un abbonamento istituzionale', 'Acquisto di un abbonamento istituzionale', 'È stato acquistato un abbonamento istituzionale a {$journalName} con i dettagli indicati sotto. Per attivare l\'abbonamento, utilizzare il link fornito sotto e selezionare lo status \'Attivo\' per tale abbonamento.<br />\n<br />\nTipologia di abbonamento::<br />\n{$subscriptionType}<br />\n<br />\nInstituzione:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDominio (se indicato):<br />\n{$domain}<br />\n<br />\nIndirizzi IP (se indicati):<br />\n{$ipRanges}<br />\n<br />\nPersona di contatto:<br />\n{$subscriberDetails}<br />\n<br />\nTipologia di membership (se indicata):<br />\n{$membership}<br />\n<br />\nPer vedere o modificare i dettagli, andare alla pagina:<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n'),
(323, 'SUBSCRIPTION_RENEW_INDL', 'it', 'Rinnovo dell\'abbonamento individuale', 'Rinnovo dell\'abbonamento individuale', 'È stato rinnovato un abbonamento individuale a {$journalName} con i seguenti dettagli.<br />\n<br />\nTipologia di abbonamento:<br />\n{$subscriptionType}<br />\n<br />\nUtente:<br />\n{$subscriberDetails}<br />\n<br />\nMembership (se indicata):<br />\n{$membership}<br />\n<br />\nPer vedere o modificare i dettagli dell\'abbonamento, andare alla seguente pagina:<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n'),
(324, 'SUBSCRIPTION_RENEW_INSTL', 'it', 'Rinnovo dell\'abbonamento istituzionale', 'Rinnovo dell\'abbonamento istituzionale', 'È stato rinnovato online un abbonamento istituzionale a {$journalName} con i seguenti dettagli.<br />\n<br />\nTipologia di abbonamento:<br />\n{$subscriptionType}<br />\n<br />\nInstituzione:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDominio (se fornito):<br />\n{$domain}<br />\n<br />\nIndirizzi IP (se indicati):<br />\n{$ipRanges}<br />\n<br />\nPersona di contatto:<br />\n{$subscriberDetails}<br />\n<br />\nMembership (se indicata):<br />\n{$membership}<br />\n<br />\nPer vedere o modificare i dettagli, andare alla seguente pagina:<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n'),
(325, 'REVISED_VERSION_NOTIFY', 'it', '', 'Caricamento della versione revisionata', '<p>Gentile {$recipientName},</p><p>L\'autore ha caricato la revisione della sua proposta editoriale, <b>{$authorsShort} — {$submissionTitle}</b>. <p>In quanto editor assegnato, Le saremmo grati se potesse effettuare il login, <a href=\"{$submissionUrl}\">visualizzare le revisioni</a> e infine decidere sull\'accettazione, sul rifiuto, o sull\'eventuale invio della proposta a ulteriori richieste di revisioni.</p><br><br>—<br>Questo è un messaggio automatico da <a href=\"{$journalUrl}\">{$journalName}</a>.'),
(326, 'STATISTICS_REPORT_NOTIFICATION', 'it', '', 'Attività editoriali per {$month}, {$year}', '\nGentile {$recipientName}, <br />\n<br />\nIl riepilogo della sua rivista per il mese di {$month}, {$year} è ora disponibile. Di seguito sono indicate le statistiche principali:<br />\n<ul>\n	<li>nuove proposte ricevute: {$newSubmissions}</li>\n	<li>proposte rifiutate: {$declinedSubmissions}</li>\n	<li>proposte accettate: {$acceptedSubmissions}</li>\n	<li>contributi totali presenti nel sistema: {$totalSubmissions}</li>\n</ul>\nAcceda al sito web per consultare maggiori dettagli relativi alle <a href=\"{$editorialStatsLink}\">statistiche editoriali</a> e <a href=\"{$publicationStatsLink}\">ai dati relativi ai contributi pubblicati</a>. Una copia completa del riepilogo mensile è inviata in allegato.<br />\n<br />\nCordiali saluti,<br />\n{$journalSignature}'),
(327, 'ANNOUNCEMENT', 'it', '', '{$announcementTitle}', '<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisiti il nostro sito per leggere <a href=\"{$announcementUrl}\">l\'informazione completa</a>.'),
(328, 'DISCUSSION_NOTIFICATION_SUBMISSION', 'it', '', 'Nuovo messaggio da: {$journalName}', 'Inserisci qui il testo del tuo messaggio.'),
(329, 'DISCUSSION_NOTIFICATION_REVIEW', 'it', '', 'Nuovo messaggio da: {$journalName}', 'Inserisci qui il testo del tuo messaggio.'),
(330, 'DISCUSSION_NOTIFICATION_COPYEDITING', 'it', '', 'Nuovo messaggio da: {$journalName}', 'Inserisci qui il testo del tuo messaggio.'),
(331, 'DISCUSSION_NOTIFICATION_PRODUCTION', 'it', '', 'Nuovo messaggio da: {$journalName}', 'Inserisci qui il testo del tuo messaggio.'),
(332, 'COPYEDIT_REQUEST', 'it', '', 'Assegnazione di copyediting', '{$recipientName}:<br />\n<br />\nTi chiedo di prendere in carico il copyediting del manoscritto &quot;{$submissionTitle}&quot; inviato alla testata {$journalName}.<br />\nIl documento si trova su sito web della rivista, insieme alle istruzioni per il copyediting.<br />\nSe non puoi prendere in carico il lavoro in questo periodo o hai qualche domanda, ti prego di contattarmi.<br />\n<br />\n{$journalName} URL: {$journalUrl}<br />\nURL Manoscritto: {$submissionUrl}<br />\nUsername: {$recipientUsername}<br />'),
(333, 'EDITOR_ASSIGN_SUBMISSION', 'it', '', 'Assegnazione di una proposta editoriale {$journalName}', '<p>Gentile {$recipientName},</p><p>La seguente proposta Le è stata assegnata per il processo editoriale:</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>ualora dovesse ritenere a proposta sia rilevante per {$journalName}, potrà inoltrarla alla fase di revisione selezionando \"Invia alla revisione\" e, successivamente, potrà assegnare i revisori utilizzando il tasto \"Aggiungi revisore\".</p><p>Se la proposta non dovesse essere a Suo giudizio appropriata per questa rivista, La preghiamo di rifiutarla.</p><p>Grazie in anticipo.</p><p>Cordiali saluti,</p>{$journalSignature}'),
(334, 'EDITOR_ASSIGN_REVIEW', 'it', '', 'Assegnazione di una proposta editoriale {$journalName}', '<p>Gentile {$recipientName},</p><p>La seguente proposta Le è stata assegnata per una supervisione del processo di revisione tra pari.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Effettui gentilmente il login per <a href=\"{$submissionUrl}\">visualizzare la proposta</a> e per assegnare revisori qualificati. È possibile assegnare un revisore facendo clic su \"Aggiungi revisore\".</p><p>Grazie in anticipo.</p><p>Cordiali saluti,</p>{$signature}'),
(335, 'EDITOR_ASSIGN_PRODUCTION', 'it', '', 'Assegnazione di una proposta editoriale {$journalName}', '<p>Gentile {$recipientName},</p><p>La seguente proposta editoriale Le è stata assegnata per la fase di produzione</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Effettui gentilmente l\'accesso per <a href=\"{$submissionUrl}\">visualizzare la proposta</a>. Quando i file pronti per la produzione saranno disponibili, li carichi cortesemente nella sezione <strong>Pubblicazione > Gabbie</strong>. Quindi segnali il lavoro pronto la pubblicazione facendo clic sul pulsante <strong>Programma per la pubblicazione</strong>.</p><p>Grazie in anticipo.</p><p>Cordiali saluti,</p>{$signature}'),
(336, 'LAYOUT_REQUEST', 'it', '', 'La proposta {$submissionId} è stata accettata da {$contextAcronym} ed è pronta per le bozze', '<p>Gentile {$recipientName},</p><p>Un nuovo contributo è pronto per l\'impaginazione:</p><p><a href=\"{$submissionUrl}\">{$submissionId} — {$submissionTitle}</a><br />{$journalName}</p><ol><li>Clicchi gentilmente sul link sopra riportato.</li><li>Scarichi i file di produzione e li usi per creare i file impaginati in accordo con gli standard della rivista.</li><li>Carichi i file nella sezione di Pubblicazione della proposta editoriale.</li><li>Usi la funzione di \"Discussione\" per poter notificare agli editor della rivista che i file sono pronti.</li></ol><p>Qualora non potesse assumere tale lavoro, o in caso di ulteriori esigenze, non esiti a contattarci. Grazie per la preziosa collaborazione</p><p>Cordiali saluti,</p>{$signature}'),
(337, 'LAYOUT_COMPLETE', 'it', 'Gabbia completa', 'Bozze complete', '<p>Gentile {$recipientName},</p><p>La presente per comunicarLe che Le bozze del seguente contributo sono state preparate e sono ora pronte per la revisione finale.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$journalName}</p><p>Per ogni quesito o necessità, non esiti a contattarci.</p><p>Cordiali saluti,</p><p>{$signature}</p>'),
(338, 'VERSION_CREATED', 'it', '', '', ''),
(339, 'EDITORIAL_REMINDER', 'it', '', '', ''),
(340, 'SUBMISSION_SAVED_FOR_LATER', 'it', '', '', ''),
(341, 'SUBMISSION_NEEDS_EDITOR', 'it', '', '', ''),
(342, 'PAYMENT_REQUEST_NOTIFICATION', 'it', 'Richiesta di pagamento', 'Notifica di richiesta di pagamento', '<p>Gentile {$recipientName},</p><p>Congratulazioni per l\'accettazione della Sua proposta, {$submissionTitle}, a {$journalName}. Ora che la proposta è stata accettata, vorremmo domandare se potesse procedere al pagamento delle tariffe di pubblicazione. </p><p>Questa tariffa copre i costi di produzione necessari per il raggiungimento della pubblicazione. Al fine di poter effettuare il pagamento, visiti la seguente pagina <a href=\"{$queuedPaymentUrl}\">{$queuedPaymentUrl}</a>.</p><p>Per ulteriori informazioni, visiti le nostre <a href=\"{$submissionGuidelinesUrl}\">linee guide per le proposte editoriali</a>.</p>'),
(343, 'ORCID_COLLECT_AUTHOR_ID', 'it', '', 'Le chiediamo di inserire l\'ORCID', 'Gentile {$recipientName},<br/>\n<br/>Il suo nominativo è stato inserito come co-autore di un manoscritto inviato per la pubblicazione a {$journalName}.<br/>\nPer confermare la sua partecipazione quale autore, le chiediamo di aggiungere il suo ORCID iD alla sottomissione utilizzando il link sottostante. <br/>\n<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">Maggiori informazioni in merito ad ORCID sono disponibili al sito {$journalName}</a><br/>\n<br/>\nPer qualsiasi ulteriore chiarimento, la prego di contattarci.<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),
(344, 'ORCID_REQUEST_AUTHOR_AUTHORIZATION', 'it', '', 'Richiesta di accesso al record ORCID', 'Gentile {$recipientName},<br>\n<br>\nIl suo nominativo è stato aggiunto come co-autore nel manoscritto \"{$submissionTitle}\" sottoposto per la pubblicazione a {$journalName}.\n<br>\n<br>\nLe chiediamo il permesso di aggiungere il suo ORCID iD a questa sottomissione e di poter aggiungere questa sottomissione al suo profilo ORCID.<br>\nLe chiediamo di andare al suo profilo ufficiale ORCID e di autorizzare l\'accesso seguendo le indicazioni che verranno fornite. <br>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Collega il tuo ORCID iD o registrati adesso</a><br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">Maggiori informazioni su ORCID sono disponibili a questo indirizzo: {$journalName}</a><br/>\n<br>\nSe ha qualsiasi domanda o dubbio, la prego di contattarci.<br>\n<br>\n{$principalContactSignature}<br>\n'),
(345, 'MANUAL_PAYMENT_NOTIFICATION', 'it', 'Notifica di pagamento', 'Notifica di pagamento manuale', 'È necessario registrare un pagamento manuale per {$journalName}, utente {$senderName} (username &quot;{$senderUsername}&quot;).<br />\n<br />\nIl pagamento riguarda &quot;{$paymentName}&quot;.<br />\nIl costo è {$paymentAmount} ({$paymentCurrencyCode}).<br />\n<br />\nQuesta email è generata automaticamente dal plugin di pagamento manuale per Open Journal Systems.'),
(346, 'PASSWORD_RESET_CONFIRM', 'ja', '', 'パスワードリセットの確認', '{$siteTitle}のウェブサイトにログインするパスワードのリセット依頼を受け取りました。<br />\n<br />\nリセット依頼をした覚えがない場合は、申し訳ありませんが、このメールを無視し、パスワードは変更しないでください。パスワードのリセットを希望される場合は、下記のURLをクリックしてください。<br />\n<br />\nパスワードのリセット: {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),
(347, 'USER_REGISTER', 'ja', '', '新規ユーザーの登録', '{$recipientName}様<br />\n<br />\n雑誌『{$journalName}』への登録ありがとうございました。ユーザー名とパスワードは、この雑誌のすべての処理で必要となりますので、大切に保管してください。どの時点でも、私に連絡することで、雑誌のユーザーリストからの削除を依頼することができます。<br />\n<br />\nユーザー名: {$recipientUsername}<br />\nパスワード: {$password}<br />\n<br />\nよろしくお願いいたします。<br />\n{$signature}'),
(348, 'USER_VALIDATE_CONTEXT', 'ja', '電子メールの検証（ジャーナル登録）', 'アカウントの確認', '{$recipientName}様<br />\n<br />\n雑誌『{$journalName}』用のアカウントを作成しました。このアカウントを有効にするには、メールアドレスの確認が必要です。以下のリンクをクリックして確認してください。<br />\n<br />\n{$activateUrl}<br />\n<br />\nありがとうございました。<br />\n{$journalSignature}'),
(349, 'USER_VALIDATE_SITE', 'ja', 'メールの検証（サイト）', 'アカウントの確認', '{$recipientName}様<br />\n<br />\n{$siteTitle}でアカウントを作成しました。このアカウントを有効にするには、メールアドレスの確認が必要です。以下のリンクをクリックして確認してください。<br />\n<br />\n{$activateUrl}<br />\n<br />\nありがとうございました。<br />\n{$siteSignature}'),
(350, 'REVIEWER_REGISTER', 'ja', '', 'ユーザー名『{$journalName}』で査読者として登録されました', '<p>突然のメールをお許しください。</p><p>貴殿の専門性に鑑み、失礼ですが私どもの雑誌『{$journalName}』の査読者データベースにあなたの氏名を登録させていただきました。これによりあなたに何らかの義務が発生することはありません。ただ、できたら査読をお願いできるようにしておきたかっただけです。査読をお願いする場合は、対象となる論文のタイトルと要旨を見る機会を持っていただきます。もちろん、査読の依頼に応じるか否かの判断は常に貴殿に委ねられます。また、任意の時点で、この査読者リストから貴殿の氏名を削除することもできます。</p><p>以下に、貴殿のユーザー名とパスワードをご報告いたします。これを使用することにより、雑誌のウェブサイトであらゆる処理（例えば、査読対象分野の変更など、貴殿のプロフィールの更新）を行うことができます。</p><p>ユーザー名: {$recipientUsername}<br />パスワード: {$password}</p><p>ご協力よろしくお願いいたします。</p>{$signature}'),
(351, 'ISSUE_PUBLISH_NOTIFY', 'ja', '', '最新号の発行案内：{$journalName}の{$issueIdentification}', '<p>{$recipientName} 様</p><p>このたび、『{$journalName}』の <a href=\"{$issueUrl}\">{$issueIdentification}</a> が出版されましたのでお知らせいたします。この研究発表をお読みいただき、学術コミュニティと共有していただければ幸いです。</p><p>貴重なご貢献をいただいた著者、査読者、編集者の皆様、そして、引き続き関心をお寄せくださる読者の皆様に深く感謝申し上げます。</p><p>ありがとうございます。</p>{$signature}'),
(352, 'SUBMISSION_ACK', 'ja', '', '{$journalName}への投稿のお礼', '<p>{$recipientName}様</p><p>雑誌『{$journalName}』に原稿「{$submissionTitle}」をご投稿いただき、ありがとうございました。編集部がすぐに拝見します。最初の決定が下りましたらメールをお送りし、さらに詳しい情報をご連絡させていただくことがあります。</p><p>本誌が使用しているオンライン雑誌管理システムでは、雑誌のウェブサイトにログインすることにより、編集過程の進捗状況を確認することができます。</p><p>原稿のURL: {$authorSubmissionUrl}</p><p>ログアウトした場合は、{$recipientUsername}というユーザー名で再度ログインできます。 </p><p>何かご不明な点がございましたら、<a href=\"{$authorSubmissionUrl}\">投稿ダッシュボード</a>からご連絡ください。</p><p>研究成果の発表の場として、本誌をご検討いただき、誠にありがとうございました。</p>{$journalSignature}'),
(353, 'SUBMISSION_ACK_NOT_USER', 'ja', '', '投稿のお礼', '<p>{$recipientName} 様</p><p>貴方は、『{$journalName}』への投稿の共著者として登録されていました。投稿者 {$submitterName} は、下記の詳細を提供しました:</p><p>{$submissionTitle\'\',{$authorsWithAffiliation}</p><p>これらの詳細のいずれかが間違っている場合、またはこの投稿に名前を載せたくない場合は、私に連絡してください。</p><p>貴方の研究の場として『{$journalName}』をご検討いただきありがとうございます。</p><p>よろしくお願いいたします。</p>{$journalSignature}'),
(354, 'EDITOR_ASSIGN', 'ja', '', '『{$journalName}』への投稿の編集者任命のお知らせ', '<p>{$recipientName} 様、</p><p>下記の投稿は、編集プロセスを確認するために貴方が担当者として指定されました。</p><p><a href=\"{$submissionUrl}\">「{$submissionTitle}」</a><br />{$authors}</p><p><b>要約</b></p>{$submissionAbstract}<p>I投稿が『{$journalName}』に関連している場合は、「査読に送る」を選択して投稿を査読段階に転送し、「査読者の追加」をクリックして査読者を指定してください。</p><p>投稿がこの雑誌に適していない場合は、投稿を不採用してください。</p><p>感謝します。</p><p>よろしくお願いいたします。</p>{$journalSignature}'),
(355, 'REVIEW_CANCEL', 'ja', '査読者未任命', '査読依頼取消のお願い', '<p>{$recipientName} 様</p><p>先日、『{$journalName}』への投稿を査読していただくようお願いしました。投稿「{$submissionTitle}」の査読依頼はキャンセルすることにしました。</p><p>ご不便をおかけして申し訳ございませんが、今後この雑誌の査読にご協力いただける場合は、ぜひご連絡させてください。</p><p>ご質問がある場合は、ご連絡ください。</p>{$signature}'),
(356, 'REVIEW_REINSTATE', 'ja', '査読者復活', '『{$journalName}』のためにまだ査読していただけませんか？', '<p>{$recipientName} 様</p><p>先日、『{$journalName}』の投稿「{$submissionTitle}」の査読依頼をキャンセルしました。この決定は取り消しましたので、引き続き査読を実施していただければ幸いです。</p><p>この投稿の査読にご協力いただける場合は、<a href=\"{$reviewAssignmentUrl}\">雑誌にログイン</a>して投稿を表示し、査読ファイルをアップロードして、査読コメントを送信してください。</p><p>ご質問がある場合は、ご連絡ください。</p><p>よろしくお願いいたします。</p>{$signature}'),
(357, 'REVIEW_RESEND_REQUEST', 'ja', '', '『{$journalName} 』のための査読を再度お願いします', '<p>{$recipientName} 様</p><p>先日、『{$journalName}』の提出物「{$submissionTitle}」の査読依頼を却下されました。このたびは、貴方が査読を実施できるかどうか確認するためにこのメールをお送りしています。</p><p>この査読を実施していただける場合は大変ありがたいのですが、現時点では不可能な場合も承知しております。いずれにせよ、{$responseDueDate} までに <a href=\"{$reviewAssignmentUrl}\">リクエストを承認または却下</a>していただき、代わりの査読者を見つけられるようにしてください。</p><p>ご質問がある場合は、私にご連絡ください。</p><p>よろしくお願いいたします。</p>{$signature}'),
(358, 'REVIEW_REQUEST', 'ja', '', '論文査読のお願い', '<p>{$recipientName}様</p><p>雑誌『{$journalName}』への投稿原稿の査読をお願いいたしたくメールを差し上げました。投稿物のタイトルと要旨を以下に添付しました。貴殿がこの重要な仕事を引き受けてくださることを希望いたしております。</p><p>この投稿を査読できる場合、査読の提出期限は {$reviewDueDate} です。投稿を表示し、査読ファイルをアップロードし、査読を送信するには、雑誌のウェブサイトにログインして、以下のリンクの手順に従います。</p><p><a href=\"{$reviewAssignmentUrl}\">「{$submissionTitle}」</a></p><p><b>要約</b></p>{$submissionAbstract}<p>査読を <a href=\"{$reviewAssignmentUrl}\">承認または拒否</a> してください (<b>{$responseDueDate}</b>)。</p><p>投稿または査読の流れに関する質問がある場合は、私に連絡してください。</p><p>この依頼を検討していただき、ありがとうございます。ご協力いただければ幸いです。</p><p>よろしくお願いいたします。</p>{$signature}'),
(359, 'REVIEW_REQUEST_SUBSEQUENT', 'ja', '', '修正された投稿の査読依頼', '<p>{$recipientName} 様、</p><p><a href=\"{$reviewAssignmentUrl}\">「{$submissionTitle}」</a> を査読していただき、ありがとうございます。著者は査読者のフィードバックを考慮し、改訂版を提出しました。この投稿に対して 2 回目の査読を実施していただけるかどうかお伺いしたく、このメールをお送りします。</p><p>この投稿を査読していただける場合は、査読の期限は {$reviewDueDate} です。 <a href=\"{$reviewAssignmentUrl}\">査読手順</a>に従うと、投稿内容の確認、査読ファイルのアップロード、査読コメントの送信ができます。<p><p><a href=\"{$reviewAssignmentUrl}\">「{$submissionTitle}」</a></p><p><b>概要</b></p>{$submissionAbstract}<p>査読は <b>{$responseDueDate}</b> までに <a href=\"{$reviewAssignmentUrl}\">承認または拒否</a>してください。</p><p>投稿内容や査読 プロセスに関するご質問は、お気軽にお問い合わせください。</p><p>この依頼をご検討いただきありがとうございます。ご協力いただければ幸いです。</p><p>よろしくお願いいたします。</p>{$signature}'),
(360, 'REVIEW_RESPONSE_OVERDUE_AUTO', 'ja', '', 'リマインダー：論文査読のお願い', '<p>{$recipientName} 様</p><p>このメールは、投稿「{$submissionTitle}」の査読依頼に関する『{$journalName}』からの自動リマインダーです。</p><p>このメールは、投稿の査読を引き受けることができるかどうかの確認をまだ受け取っていないため、お送りしています。</p><p>投稿管理ソフトウェアを使用してこの依頼を承認または拒否し、このレビューを引き受けることができるかどうかをお知らせください。</p><p>投稿を査読できる場合、査読の期限は {$reviewDueDate} です。査読手順に従って、投稿内容の確認、査読ファイルのアップロード、査読コメントの送信を行うことができます。</p><p><a href=\"{$reviewAssignmentUrl}\">「{$submissionTitle}」</a></p><p><b>概要</b></p>{$submissionAbstract}<p>投稿内容や査読の流れに関するご質問は、お気軽にお問い合わせください。</p><p>この依頼をご検討いただきありがとうございます。ご協力いただければ幸いです。</p><p>よろしくお願いいたします。</p>{$journalSignature}'),
(361, 'REVIEW_CONFIRM', 'ja', '', '査読依頼の受諾: {$reviewerName} が #{$submissionId} {$authorsShort} — 「{$submissionTitle} 」の査読割当を承認しました', '<p>{$recipientName} 様、</p><p>{$reviewerName} さんが下記の査読を承認しました:</p><p><a href=\"{$submissionUrl}\">#{$submissionId} {$authorsShort} — 「{$submissionTitle}」</a><br /><b>タイプ:</b> {$reviewMethod}</p><p><b>査読期限:</b> {$reviewDueDate}</p><p>この投稿の <a href=\"{$submissionUrl}\">すべての査読者の割当を表示</a>するには、ログインしてください。</p><br><br>—<br>これは <a href=\"{$journalUrl}\">『{$journalName}』</a> からの自動メッセージです。'),
(362, 'REVIEW_DECLINE', 'ja', '', '査読依頼の謝絶', '編集部 御中:<br />\n<br />\n申し訳ありませんが、今回は、雑誌『{$journalName}』への投稿原稿「{$submissionTitle}」の査読をお受けすることはできません。査読者に選んでいただきありがとうございました。また、機会がございましたら、ご連絡ください。<br />\n<br />\n{$senderName}'),
(363, 'REVIEW_ACK', 'ja', '', '論文査読のお礼', '<p>{$recipientName}様:</p>\n<p>雑誌『{$journalName}』への投稿原稿「{$submissionTitle}」の査読をしていただき、ありがとうございました。本誌が発行する論文の品質向上に対する貴殿の貢献に対し感謝いたします。</p>\n<p>{$journalName} の査読者としてあなたと協力ができて光栄でした。今後もまた機会があることを願っています。</p>\n<p>よろしくお願いいたします。</p>\n<p>{$signature}</p>'),
(364, 'REVIEW_REMIND', 'ja', '', '査読を完了するためのリマインダー', '<p>{$recipientName} 様</p><p>『{$journalName}』の投稿「{$submissionTitle}」の査読依頼に関して念の為リマインドさせていただきます。この査読は {$reviewDueDate} までに完了する予定でしたが、準備が整い次第、喜んで査読を受け取りたいと思います。</p><p><a href=\"{$reviewAssignmentUrl}\">雑誌にログイン</a>し、査読手順に従って投稿内容を確認し、査読ファイルをアップロードして、査読コメントを送信してください。</p><p>締め切りの延長が必要な場合は、ご連絡ください。ご連絡をお待ちしております。</p><p>よろしくお願いいたします。</p>{$signature}'),
(365, 'REVIEW_REMIND_AUTO', 'ja', '', '査読を完了するためのリマインダー', '<p>{$recipientName} 様</p><p>『{$journalName}』の投稿「{$submissionTitle}」の査読依頼に関しての自動リマインドです。この査読は {$reviewDueDate} までに完了する予定でしたが、準備が整い次第、喜んで査読を受け取りたいと思います。</p><p><a href=\"{$reviewAssignmentUrl}\">雑誌にログイン</a>し、査読手順に従って投稿内容を確認し、査読ファイルをアップロードして、査読コメントを送信してください。</p><p>締め切りの延長が必要な場合は、ご連絡ください。ご連絡をお待ちしております。</p><p>よろしくお願いいたします。</p>{$journalSignature}'),
(366, 'REVIEW_COMPLETE', 'ja', '', '査読完了: {$reviewerName} さんが #{$submissionId} {$authorsShort} — 「{$submissionTitle} 」に対して {$reviewRecommendation} を推奨しています', '<p>{$recipientName} 様、</p><p>{$reviewerName} さんが下記の査読を完了しました:</p><p><a href=\"{$submissionUrl}\">#{$submissionId} {$authorsShort} — 「{$submissionTitle}」</a><br /><b>推奨事項:</b> {$reviewRecommendation}<br /><b>タイプ:</b> {$reviewMethod}</p><p>この査読者が提供した <a href=\"{$submissionUrl}\">すべてのファイルとコメントを表示</a>するには、ログインしてください。</p>'),
(367, 'REVIEW_EDIT', 'ja', '', '『{$journalName}』のための査読割当が変更されました', '<p>{$recipientName} 様、</p><p>編集者が『{$journalName}』のための査読割当に変更を加えました。以下の詳細を確認し、質問がある場合はお知らせください。</p><p><a href=\"{$reviewAssignmentUrl}\">「{$submissionTitle}」</a><br /><b>タイプ:</b> {$reviewMethod}<br /><b>承認または拒否期限:</b> {$responseDueDate}<br /><b>査読の送信期限:</b> {$reviewDueDate}</p><p>いつでもログインして <a href=\"{$reviewAssignmentUrl}\">この査読を完了</a>できます。</p>'),
(368, 'EDITOR_DECISION_ACCEPT', 'ja', '', '投稿は『{$journalName}』に採用されました', '<p>{$recipientName} 様</p><p>このたびは、ご投稿をこれ以上修正せずに採用することに決定しましたのでお知らせいたします。慎重に検討した結果、ご投稿いただいた「{$submissionTitle}」は、本誌の期待を満たすか、それを上回るものであると判断いたしました。『{$journalName}』に貴方の論文を掲載できることを嬉しく思います。また、貴方の論文を掲載する場として本誌を選んでくださったことに感謝いたします。</p><p>ご投稿いただいた論文は、『{$journalName}』の今後の巻号に掲載される予定です。ぜひ、貴方の業績リストに加えてください。私たちは、すべての投稿が成功するまでに費やされる多大な努力を認識しており、この段階に到達されたことをお祝い申し上げます。</p><p>ご投稿いただいた論文は、今後、出版に向けて原稿整理とフォーマット処理が行われます。</p><p>まもなく、詳細な手順をお送りします。</p><p>ご質問がある場合は、<a href=\"{$authorSubmissionUrl}\">投稿ダッシュボード</a>からご連絡ください。</p><p>よろしくお願いいたします。</p>{$signature}'),
(369, 'EDITOR_DECISION_SEND_TO_EXTERNAL', 'ja', '', '投稿が査読に送られました', '<p>{$recipientName} 様</p><p>編集者が貴方の投稿「{$submissionTitle}」をレビューし、査読に送ることを決定したことをお知らせします。編集者は、貴方の投稿に対するフィードバックを提供する適格な査読者を特定します。</p><p>{$reviewTypeDescription} 査読者からのフィードバックと次の手順に関する情報は、後日ご連絡いたします。</p><p>投稿を査読に送っても、必ず公開されるわけではありませんのでご注意ください。投稿の公開を承認する前に、査読者の推奨事項を考慮します。最終決定を下す前に、修正や査読者のコメントへの対応を求められる場合があります。</p><p>質問がある場合は、投稿ダッシュボードからご連絡ください。</p><p>{$signature}</p>'),
(370, 'EDITOR_DECISION_SEND_TO_PRODUCTION', 'ja', '', '投稿物を公開するための次のステップ', '<p>{$recipientName} 様</p><p>私は『{$journalName}』から、貴方の投稿「{$submissionTitle}」の編集が完了したことをお知らせするためにこのメールをお送りします。貴方の投稿はこれから制作段階に進み、出版に向けて最終校正が準備されます。さらにサポートが必要な場合はご連絡いたします。</p><p>ご質問がある場合は、<a href=\"{$authorSubmissionUrl}\">投稿ダッシュボード</a>からご連絡ください。</p><p>よろしくお願いいたします。</p>{$signature}'),
(371, 'EDITOR_DECISION_REVISIONS', 'ja', '', '投稿は査読済み・修正版提出のお勧め', '<p>{$recipientName} 様、</p><p>提出された投稿「{$submissionTitle}」は査読されました。査読者のコメントに対応した修正版を提出していただくようお願いいたします。編集者が修正版をレビューし、懸念事項が適切に解決されていれば、投稿された論文は出版される可能性があります。</p><p>査読者のコメントはこのメールの下部に記載されています。査読者のコメントの各ポイントに対応し、どのような変更を加えたかを明記してください。査読者のコメントが不当または不適切であると思われる場合は、その見解を説明してください。</p><p>修正が完了したら、<a href=\"{$authorSubmissionUrl}\">投稿ダッシュボード</a>で、修正した文書と査読者のコメントへの対応説明文をアップロードできます。ログアウトしている場合は、ユーザー名 {$recipientUsername} で再度ログインできます。</p><p>ご質問がある場合は、<a href=\"{$authorSubmissionUrl}\">投稿ダッシュボード</a>からご連絡ください。</p><p>修正された投稿物をお待ちしております。</p><p>よろしくお願いいたします。</p>{$signature} <hr><p>査読者から以下のコメントを受け取りました。</p>{$allReviewerComments}'),
(372, 'EDITOR_DECISION_RESUBMIT', 'ja', '', '投稿は査読済み・修正して再提出してください', '<p>{$recipientName} 様、</p><p>貴方の投稿「{$submissionTitle}」を査読した結果、査読者は、現在の形式では投稿を出版に受け入れることはできないと勧告しました。ただし、査読者のコメントに対応した改訂版を提出することをお勧めします。修正版は編集者によってレビューされ、別の査読者に送られる場合があります。</p><p>論文を再提出しても、受け入れられる保証はありません。</p><p>査読者のコメントはこのメールの下部に記載されています。各ポイントに対応し、どのような変更を加えたかを明記してください。査読者のコメントが不適切と思われる場合は、その見解を説明してください。査読の推奨事項について質問がある場合は、対応説明文にその点を含めてください。</p><p>修正が完了したら、査読者のコメントへの対応とともに、修正した論文を <a href=\"{$authorSubmissionUrl}\">投稿ダッシュボード</a>にアップロードできます。ログアウトしている場合は、ユーザー名 {$recipientUsername} で再度ログインできます。</p><p>ご質問がある場合は、<a href=\"{$authorSubmissionUrl}\">投稿ダッシュボード</a>からご連絡ください。</p><p>修正された投稿物をお待ちしております。</p><p>よろしくお願いいたします。</p>{$signature}<hr><p>査読者から以下のコメントを受け取りました。</p>{$allReviewerComments}'),
(373, 'EDITOR_DECISION_DECLINE', 'ja', '', '投稿は不採用されました', '<p>{$recipientName} 様</p><p>ご投稿をいただき、ありがとうございます。しかし、査読者のコメントにより、「{$submissionTitle}」の公開は認められません。</p><p>査読者のコメントはこのメールの下部に記載されています。</p><p>『{$journalName}』にご投稿いただきありがとうございます。ご投稿が不採用されたのは残念ですが、査読者のコメントが建設的で役立つものであったことを願っております。</p><p>ご希望であれば、他の場所にご投稿いただくこともできます。</p><p>よろしくお願いいたします。</p>{$signature}<hr><p>査読者から以下のコメントを受け取りました。</p>{$allReviewerComments}'),
(374, 'EDITOR_DECISION_INITIAL_DECLINE', 'ja', '', '投稿は不採用されました', '<p>{$recipientName} 様</p><p>申し訳ありませんが、ご提出いただいた投稿「{$submissionTitle}」を査読した結果、編集者が『{$journalName}』での出版要件を満たしていないことが判明しました。</p><p>他の場所での論文の提出をご検討の場合は、成功をお祈りいたします。</p><p>よろしくお願いいたします。</p>{$signature}'),
(375, 'EDITOR_RECOMMENDATION', 'ja', '', '編集者の査読結果', '<p>{$recipientName} 様</p><p>査読者のフィードバックを考慮し、投稿「{$submissionTitle}」に関して次の推奨事項を提示したいと思います。</p><p>推奨事項は次のとおりです: {$recommendation}。</p><p>この推奨事項に従うには、投稿物の <a href=\"{$submissionUrl}\">編集ワークフロー</a> にアクセスしてください。</p><p>ご質問がございましたら、お気軽にお問い合わせください。</p><p>よろしくお願いいたします。</p><p>{$senderName}</p>'),
(376, 'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS', 'ja', '', '投稿に関する最新情報', '<p>下記のメールは、「{$submissionTitle}」に関して『{$journalName}』から {$submittingAuthorName} に送信されました。</p>\n<p>貴方はこの投稿の著者として識別されているため、この通知のコピーを受け取っています。以下のメッセージ内の指示は、投稿者 {$submittingAuthorName} に向けたものであり、現時点では貴方に必要な操作はありません。</p>\n\n{$messageToSubmittingAuthor}'),
(377, 'EDITOR_DECISION_NOTIFY_REVIEWERS', 'ja', '', '論文査読のお礼', '<p>{$recipientName}様:</p>\n<p>雑誌『{$journalName}』への投稿原稿「{$submissionTitle}」の査読をしていただき、ありがとうございました。本誌が発行する論文の品質向上に対する貴殿の貢献に対し感謝いたします。あなたのコメントは、他の査読者のコメントや編集者の決定とともに著者と共有しました。</p>\n<p>受け取ったフィードバックに基づいて、著者に次のことを通知しました:</p>\n<p>{$decisionDescription}</p>\n<p>あなたの推奨事項は、決定を下す前に他の査読者の推奨事項と併せて検討されました。編集者の決定は、1 人以上の査読者の推奨事項と異なる場合があります。編集者は多くの要素を考慮し、これらの決定を軽々しく下すことはありません。査読者の専門知識と提案に感謝します。</p>\n<p>{$journalName} の査読者としてあなたと協力ができて光栄でした。今後もまた機会があることを願っています。</p>\n<p>よろしくお願いいたします。</p>\n<p>{$signature}</p>');
INSERT INTO `email_templates_default_data` (`email_templates_default_data_id`, `email_key`, `locale`, `name`, `subject`, `body`) VALUES
(378, 'EDITOR_DECISION_NEW_ROUND', 'ja', '新規査読ラウンド開始済み', '投稿は、再度の査読に送られました', '<p>{$recipientName} 様</p>\n<p>修正された投稿「{$submissionTitle}」は、新たな査読に送られました。\n査読者からのフィードバックと次のステップに関する情報をお知らせします。</p>\n<p>ご質問がある場合は、<a href=\"{$authorSubmissionUrl}\">投稿ダッシュボード</a>からご連絡ください。</p>\n<p>よろしくお願いいたします。</p>\n<p>{$signature}</p>\n'),
(379, 'EDITOR_DECISION_REVERT_DECLINE', 'ja', '', '投稿を不採用するという決定を覆しました', '<p>{$recipientName} 様</p>\n<p>投稿「{$submissionTitle}」を不採用する決定が取り消されました。\n編集者が査読ラウンドうを完了し、決定が下されたら通知されます。</p>\n<p>時折、投稿を不採用する決定が誤ってシステムに記録され、\n元に戻す必要がある場合があります。これにより混乱が生じた場合はお詫び申し上げます。</p>\n<p>さらにサポートが必要な場合はご連絡いたします。</p>\n<p>ご質問がある場合は、<a href=\"{$authorSubmissionUrl}\">投稿ダッシュボード</a>からご連絡ください。</p>\n<p>よろしくお願いいたします。</p>\n<p>{$signature}</p>\n'),
(380, 'EDITOR_DECISION_REVERT_INITIAL_DECLINE', 'ja', '', '投稿を不採用するという決定を覆しました', '<p>{$recipientName} 様</p>\n<p>投稿「{$submissionTitle}」を不採用する決定が取り消されました。\n編集者は、投稿をさらに検討した上で、投稿を不採用するか、査読に送るかを決定します。</p>\n<p>時折、投稿を不採用する決定が誤ってシステムに記録され、元に戻す必要がある場合があります。これにより混乱が生じた場合はお詫び申し上げます。</p>\n<p>さらにサポートが必要な場合はご連絡いたします。</p>\n<p>ご質問がある場合は、<a href=\"{$authorSubmissionUrl}\">投稿ダッシュボード</a>からご連絡ください。</p>\n<p>よろしくお願いいたします。</p>\n<p>{$signature}</p>\n'),
(381, 'EDITOR_DECISION_SKIP_REVIEW', 'ja', '', '投稿は原稿整理に送られました', '<p>{$recipientName} 様</p>\n<p>このたび、貴方の投稿を査読なしで採用することに決定しましたのでお知らせいたします。貴方の投稿「{$submissionTitle}」は本誌の期待に沿うものであり、この種の研究には査読は必要ありません。貴方の論文を『{$journalName}』に掲載できることを嬉しく思います。また、貴方の論文の発表の場として本誌を選んでくださったことに感謝いたします。</p>\n貴方の投稿は、『{$journalName}』の今後の巻号に掲載される予定です。ぜひ業績リストに加えてください。私たちは、すべての成功した投稿に注がれる多大な努力を認識しており、貴方の努力を称賛したいと思います。</p>\n<p>貴方の投稿は、出版に向けて原稿整理とフォーマット処理が行われます。 </p>\n<p>まもなく詳細な手順をお送りします。</p>\n<p>ご質問がある場合は、<a href=\"{$authorSubmissionUrl}\">投稿ダッシュボード</a>からご連絡ください。</p>\n<p>よろしくお願いいたします。</p>\n<p>{$signature}</p>\n'),
(382, 'EDITOR_DECISION_BACK_FROM_PRODUCTION', 'ja', '', '投稿は原稿整理に送り返されました', '<p>{$recipientName} 様</p><p>ご提出いただいた投稿「{$submissionTitle}」は原稿整理段階に戻されました。ここでさらに原稿整理とフォーマットが行われ、出版の準備が整います。</p><p>場合によっては、最終的な校正刷りの準備が整う前に、制作段階に送られることがあります。ご提出いただいた原稿はまだ出版準備中です。ご迷惑をおかけして申し訳ございません。</p><p>ご質問がある場合は、<a href=\"{$authorSubmissionUrl}\">投稿ダッシュボード</a>からご連絡ください。</p><p>さらにサポートが必要な場合はご連絡いたします。</p><p>よろしくお願いいたします。</p><p>{$signature}</p>'),
(383, 'EDITOR_DECISION_BACK_FROM_COPYEDITING', 'ja', '', '投稿は査読に返送されました', '<p>{$recipientName} 様</p><p>ご提出いただいた投稿「{$submissionTitle}」は、査読段階に戻されました。公開に承認される前に、さらに査読が行われます。</p><p>場合によっては、提出された投稿を承認する決定が誤ってシステムに記録され、査読に送り返さなければならないことがあります。この件で混乱が生じたことをお詫び申し上げます。できるだけ早く最終決定を下していただけるよう、さらなる査読を迅速に完了できるよう努めてまいります。</p><p>さらにサポートが必要な場合は、ご連絡いたします。</p><p>ご質問がある場合は、<a href=\"{$authorSubmissionUrl}\">投稿ダッシュボード</a>からご連絡ください。</p><p>よろしくお願いいたします。</p><p>{$signature}</p>'),
(384, 'EDITOR_DECISION_CANCEL_REVIEW_ROUND', 'ja', '', '投稿の査読ラウンドはキャンセルされました', '<p>{$recipientName} 様</p><p>先日、貴方の投稿「{$submissionTitle}」の新しい査読ラウンドを開始しました。現在、この査読 ラウンドを終了しています。</p><p>査読ラウンドを開始するという決定が誤ってシステムに記録され、この査読ラウンドをキャンセルしなければならない場合があります。これにより混乱が生じた場合はお詫び申し上げます。</p><p>さらにサポートが必要な場合はご連絡いたします。</p><p>ご質問がある場合は、<a href=\"{$authorSubmissionUrl}\">投稿ダッシュボード</a>からご連絡ください。</p><p>よろしくお願いいたします。</p><p>{$signature}</p>'),
(385, 'SUBSCRIPTION_NOTIFY', 'ja', '', '購読に関する通知', '{$recipientName}様:<br />\n<br />\n貴殿は雑誌『{$journalName}』のオンラインジャーナル管理システムに、以下の条件の購読者として登録されました。<br />\n<br />\n{$subscriptionType}<br />\n<br />\n購読者のみが利用できるコンテンツにアクセスするには、ユーザー名「{$recipientUsername}」でシステムにログインしていただくだけです。<br />\n<br />\nユーザー情報とパスワードをいつでも変更することができます<br />\n<br />\n機関購読者の場合は、機関構成員の方はログインする必要はありませんので、ご注意ください。購読コンテンツへのアクセスの際に、システムにより自動的に認証が行われます。<br />\n<br />\n何かご不明な点がございましたら、ご連絡ください。<br />\n<br />\n{$subscriptionSignature}'),
(386, 'OPEN_ACCESS_NOTIFY', 'ja', '', 'オープンアクセスのお知らせ: 『{$journalName}』の{$issueIdentification} は無料でお読みいただけます', '<p>{$recipientName} 様、</p><p>『{$journalName}』の <a href=\"{$issueUrl}\">{$issueIdentification}</a> がオープン アクセスでご利用いただけるようになりましたのでお知らせいたします。この巻号を読むのに購読は不要になりました。</p><p>引き続き弊社の取り組みにご関心をお寄せいただき、ありがとうございます。</p>{$journalSignature}'),
(387, 'SUBSCRIPTION_BEFORE_EXPIRY', 'ja', '', '購読期間終了のお知らせ', '{$recipientName}様:<br />\n<br />\nいつもご利用ありがとうございます。まもなく、雑誌『{$journalName}』の購読期間が終了します<br />\n<br />\n{$subscriptionType}<br />\n購読期限日: {$expiryDate}<br />\n<br />\n本誌へのアクセスを継続するために、雑誌のウェブサイトで再購読の手続きをするようお願いいたします。システムにはユーザー名「{$recipientUsername}」でログインすることができます。<br />\n<br />\n何かご不明な点がございましたら、ご連絡ください。よろしくお願いいたします。<br />\n<br />\n{$subscriptionSignature}'),
(388, 'SUBSCRIPTION_AFTER_EXPIRY', 'ja', '', '購読期間終了', '{$recipientName}様:<br />\n<br />\nいつもご利用ありがとうございます。雑誌『{$journalName}』の購読期間が終了しました。<br />\n<br />\n{$subscriptionType}<br />\n購読期限日: {$expiryDate}<br />\n<br />\n雑誌のウェブサイトで更新の手続きをするようお願いいたします。システムにはユーザー名「{$recipientUsername}」でログインすることができます。<br />\n<br />\n何かご不明な点がございましたら、ご連絡ください。よろしくお願いいたします。<br />\n<br />\n{$subscriptionSignature}'),
(389, 'SUBSCRIPTION_AFTER_EXPIRY_LAST', 'ja', '', '購読期間終了（最終案内）', '{$recipientName}様:<br />\n<br />\nいつもご利用ありがとうございます。雑誌『{$journalName}』の購読期間が終了しました。<br />\n本メールは、最終のご案内であることにご注意ください。<br />\n<br />\n{$subscriptionType}<br />\n購読期限日: {$expiryDate}<br />\n<br />\n雑誌のウェブサイトで更新の手続きをするようお願いいたします。システムにはユーザー名「{$recipientUsername}」でログインすることができます。<br />\n<br />\n何かご不明な点がございましたら、ご連絡ください。よろしくお願いいたします。<br />\n<br />\n{$subscriptionSignature}'),
(390, 'SUBSCRIPTION_PURCHASE_INDL', 'ja', '', '購読申込: 個人', 'オンラインで『{$journalName}』に対する個人購読が申し込まれました。詳細は下記の通りです。<br />\n<br />\n購読種別:<br />\n{$subscriptionType}<br />\n<br />\nユーザー:<br />\n{$subscriberDetails}<br />\n<br />\n会員情報 (ある場合):<br />\n{$membership}<br />\n<br />\nこの購読を閲覧あるいは編集するには，下記のURLにアクセスしてください。<br />\n<br />\n購読URL: {$subscriptionUrl}<br />\n'),
(391, 'SUBSCRIPTION_PURCHASE_INSTL', 'ja', '', '購読申込: 機関', 'オンラインで {$journalName} に対する機関購読申し込みがされました。詳細は下記の通りです。この購読を有効にするためには，下記の購読リンクから購読状態を「有効」に設定してください。<br />\n<br />\n購読種別:<br />\n{$subscriptionType}<br />\n<br />\n機関名:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nドメイン名 (ある場合):<br />\n{$domain}<br />\n<br />\nIPアドレス範囲 (ある場合):<br />\n{$ipRanges}<br />\n<br />\n連絡担当者:<br />\n{$subscriberDetails}<br />\n<br />\n会員情報 (ある場合):<br />\n{$membership}<br />\n<br />\nこの購読を閲覧および編集するためには，下記のURLにアクセスしてください。<br />\n<br />\n購読URL: {$subscriptionUrl}<br />\n'),
(392, 'SUBSCRIPTION_RENEW_INDL', 'ja', '', '購読更新: 個人', 'オンラインで {$journalName} に対する個人購読の更新申込がされました。詳細は下記の通りです。<br />\n<br />\n購読種別::<br />\n{$subscriptionType}<br />\n<br />\nユーザー:<br />\n{$subscriberDetails}<br />\n<br />\n会員情報 (ある場合):<br />\n{$membership}<br />\n<br />\nこの購読を閲覧および編集するためには，下記のURLにアクセスしてください。<br />\n<br />\n購読URL: {$subscriptionUrl}<br />\n'),
(393, 'SUBSCRIPTION_RENEW_INSTL', 'ja', '', '購読更新: 機関', 'オンラインで {$journalName} に対する機関購読の更新申込がおこなわれました。詳細は下記の通りです。<br />\n<br />\n購読種別:<br />\n{$subscriptionType}<br />\n<br />\n機関名:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nドメイン名 (ある場合):<br />\n{$domain}<br />\n<br />\nIPアドレス範囲 (ある場合):<br />\n{$ipRanges}<br />\n<br />\n連絡担当者:<br />\n{$subscriberDetails}<br />\n<br />\n会員情報 (ある場合):<br />\n{$membership}<br />\n<br />\nこの購読を閲覧および編集するためには，下記のURLにアクセスしてください。<br />\n<br />\n購読URL: {$subscriptionUrl}<br />\n'),
(394, 'REVISED_VERSION_NOTIFY', 'ja', '', '改訂版アップロード', '<p>{$recipientName} 様、</p><p>著者が投稿 <b>{$authorsShort} — 「{$submissionTitle}」</b> の改訂版をアップロードしました。<p>担当編集者として、ログインして <a href=\"{$submissionUrl}\">改訂版を表示</a>し、投稿を承認、拒否、またはさらに査読に送信することを決定してください。</p><br><br>—<br>これは <a href=\"{$journalUrl}\">『{$journalName}』</a> からの自動メッセージです。'),
(395, 'STATISTICS_REPORT_NOTIFICATION', 'ja', '', '{$month}月{$year}年の編集活動', '\n{$recipientName}様 <br />\n<br />\nあなたの雑誌の{$month}月{$year}年のヘルスレポートが公開されました。今月の主な統計情報は以下の通りです。<br />\n<ul>\n	<li>今月の新規投稿: {$newSubmissions}</li>\n	<li>今月の拒否投稿: {$declinedSubmissions}</li>\n	<li>今月の受理投稿: {$acceptedSubmissions}</li>\n	<li>システム内の総投稿数: {$totalSubmissions}</li>\n</ul>\n雑誌ににログインすると、<a href=\"{$editorialStatsLink}\">編集トレンド</a>と<a href=\"{$publicationStatsLink}\">掲載論文の統計</a>の詳細を見ることができます。今月の編集トレンドの全文が添付されています。<br />\n<br />\nよろしくお願いします。<br />\n{$journalSignature}'),
(396, 'ANNOUNCEMENT', 'ja', '', '{$announcementTitle}', '<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\n詳しいお知らせを読むためにウェブサイト<a href=\"{$announcementUrl}\">をご覧ください。</a>.'),
(397, 'DISCUSSION_NOTIFICATION_SUBMISSION', 'ja', '', '{$journalName}に関するメッセージ', 'メッセージを入力してください。'),
(398, 'DISCUSSION_NOTIFICATION_REVIEW', 'ja', '', '{$journalName}に関するメッセージ', 'メッセージを入力してください。'),
(399, 'DISCUSSION_NOTIFICATION_COPYEDITING', 'ja', '', '{$journalName}に関するメッセージ', 'メッセージを入力してください。'),
(400, 'DISCUSSION_NOTIFICATION_PRODUCTION', 'ja', '', '{$journalName}に関するメッセージ', 'メッセージを入力してください。'),
(401, 'COPYEDIT_REQUEST', 'ja', '', '投稿{$submissionId} は {$contextAcronym} 用に原稿整理される準備ができています', '<p>{$recipientName} 様、</p><p>新しい投稿が原稿整理の準備が整いました:</p><p><a href\"{$submissionUrl}\">{$submissionId} — 「{$submissionTitle}」</a><br />{$journalName}</p><p>このタスクを完了するには、次の手順に従ってください:</p><ol><li>以下の投稿 URL をクリックしてください。</li><li>下書きファイルの下にあるファイルを開き、ファイルを編集してください。編集者または著者に連絡する必要がある場合は、原稿整理ディスカッションを使用してください。</li><li>原稿整理されたファイルを保存し、原稿整理済みパネルにアップロードしてください。</li><li>原稿整理ディスカッションを使用して、すべてのファイルが準備され、制作プロセスを開始できることを編集者に通知してください。</li></ol><p>現時点でこの作業を実行できない場合、または質問がある場合は、私に連絡してください。 『{$journalName}』へのご貢献に感謝いたします。</p><p>よろしくお願いいたします。</p>{$signature}'),
(402, 'EDITOR_ASSIGN_SUBMISSION', 'ja', '', '『{$journalName}』への投稿の編集者任命のお知らせ', '<p>{$recipientName} 様、</p><p>下記の投稿は、編集プロセスを確認するために貴方が担当者として指定されました。</p><p><a href=\"{$submissionUrl}\">「{$submissionTitle}」</a><br />{$authors}</p><p><b>要約</b></p>{$submissionAbstract}<p>I投稿が『{$journalName}』に関連している場合は、「査読に送る」を選択して投稿を査読段階に転送し、「査読者の追加」をクリックして査読者を指定してください。</p><p>投稿がこの雑誌に適していない場合は、投稿を不採用してください。</p><p>感謝します。</p><p>よろしくお願いいたします。</p>{$journalSignature}'),
(403, 'EDITOR_ASSIGN_REVIEW', 'ja', '', '『{$journalName}』への投稿の編集者任命のお知らせ', '<p>{$recipientName} 様、</p><p>下記の投稿は、査読プロセスを確認するために貴方が担当者として指定されました。</p><p><a href=\"{$submissionUrl}\">「{$submissionTitle}」</a><br />{$authors}</p><p><b>概要</b></p>{$submissionAbstract}<p>ログインして <a href=\"{$submissionUrl}\">投稿を表示</a>し、資格のある査読者を割り当ててください。[査読者の追加] をクリックすると、査読者を指定することができます。</p><p>感謝します。</p><p>よろしくお願いいたします。</p>{$signature}'),
(404, 'EDITOR_ASSIGN_PRODUCTION', 'ja', '', '『{$journalName}』への投稿の編集者任命のお知らせ', '<p>{$recipientName} 様、</p><p>下記の投稿は、制作段階まで確認するために貴方が担当者として指定されました。</p><p><a href=\"{$submissionUrl}\">「{$submissionTitle}」</a><br />{$authors}</p><p><b>概要</b></p>{$submissionAbstract}<p>ログインして <a href=\"{$submissionUrl}\">投稿を表示</a>してください。制作準備が整ったファイルが用意できたら、<strong>公開 > ゲラ</strong> セクションでアップロードしてください。次に、<strong>公開のスケジュール</strong> ボタンをクリックして、投稿の公開をスケジュールしてください。</p><p>感謝します。</p><p>よろしくお願いいたします。</p>{$signature}'),
(405, 'LAYOUT_REQUEST', 'ja', '', '投稿{$submissionId}は{$contextAcronym}での制作準備が整いました', '<p>{$recipientName} 様</p><p>新しい投稿のレイアウト編集の準備ができました:</p><p><a href=\"{$submissionUrl}\">{$submissionId} — 「{$submissionTitle}」</a><br />『{$journalName}』</p><ol><li>上記の投稿 URL をクリックしてください。</li><li>制作準備完了ファイルをダウンロードし、それを使用して雑誌の基準に従ってゲラを作成してください。</li><li>投稿の公開セクションにゲラをアップロードしてください。</li><li>制作ディスカッションを使用して、ゲラの準備が整ったことを編集者に通知してください。</li></ol><p>現時点でこの作業を実行できない場合、または質問がある場合は、私に連絡してください。この雑誌へのご寄稿に感謝いたします。</p><p>よろしくお願いいたします。</p>{$signature}'),
(406, 'LAYOUT_COMPLETE', 'ja', '', 'ゲラ作成の完了', '<p>{$recipientName} 様、</p><p>下記の投稿のゲラが準備され、最終確認の準備が整いました。</p><p><a href=\"{$submissionUrl}\">「{$submissionTitle}」</a><br />『{$journalName}』</p><p>ご質問がある場合は、ご連絡ください。</p><p>よろしくお願いいたします。</p><p>{$signature}</p>'),
(407, 'VERSION_CREATED', 'ja', '', '「{$submissionTitle}」の新しいバージョンが作成されました', '<p>{$recipientName} 様、</p><p>これは、投稿「{$submissionTitle}」の新しいバージョンが作成されたことをお知らせする自動メッセージです。このバージョンは、次のリンクにある投稿ダッシュボードから表示できます:</p><p><a href=\"{$submissionUrl}\">「{$submissionTitle}」</a></p><hr><p>これは、<a href=\"{$journalUrl}\">『{$journalName}』</a> から送信された自動メールです。</p>'),
(408, 'EDITORIAL_REMINDER', 'ja', '', '『{$journalName}』の未完了の編集タスク', '<p>{$recipientName} 様、</p><p>現在、<a href=\"{$journalUrl}\">『{$journalName}』</a> の {$numberOfSubmissions} 件の投稿物が割り当てられています。下記の投稿物は <b>貴方の対応を待っています</b>。</p>{$outstandingTasks}<p>すべての割当は、<a href=\"{$submissionsUrl}\">投稿ダッシュボード</a>で確認できます。</p><p>割当についてご質問がある場合は、{$contactName}（{$contactEmail}）までお問い合わせください。</p>'),
(409, 'SUBMISSION_SAVED_FOR_LATER', 'ja', '', '『{$journalName}』への投稿を再開する', '<p>{$recipientName} 様</p><p>ご提出いただいた内容はシステムに保存されていますが、まだ査読に送られていません。以下のリンクをたどることで、いつでも戻って投稿を完了することができます。</p><p><a href=\"{$submissionWizardUrl}\">{$authorsShort} — 「{$submissionTitle}」</a></p><hr><p>これは <a href=\"{$journalUrl}\">『{$journalName}』</a> からの自動送信メールです。</p>'),
(410, 'SUBMISSION_NEEDS_EDITOR', 'ja', '', '新規投稿には担当編集者が必要: 「{$submissionTitle}」', '<p>{$recipientName} 様、</p><p>下記の投稿は送信されましたが、編集者が割り当てられていません。</p><p><a href=\"{$submissionUrl}\">「{$submissionTitle}」</a><br />{$authors}</p><p><b>概要</b></p>{$submissionAbstract}<p>上記のタイトルをクリックし、[参加者] セクションで編集者を割り当てることで、投稿の責任者となる編集者を割り当ててください。</p><hr><p>これは <a href=\"{$journalUrl}\">『{$journalName}』</a> からの自動送信メールです。</p>'),
(411, 'PAYMENT_REQUEST_NOTIFICATION', 'ja', '', '支払要求通知', '<p>{$recipientName} 様</p><p>『{$journalName}』への投稿「{$submissionTitle}」が採用されましたことをお祝い申し上げます。投稿が採用されましたので、出版料のお支払いをお願いしたいと思います。</p><p>この料金は、投稿を出版するまでの制作費に充てられます。お支払いは、<a href=\"{$queuedPaymentUrl}\">{$queuedPaymentUrl}</a> にアクセスしてください。</p><p>ご不明な点がございましたら、<a href=\"{$submissionGuidelinesUrl}\">投稿ガイドライン</a>をご覧ください。</p>'),
(412, 'ORCID_COLLECT_AUTHOR_ID', 'ja', '', '投稿 ORCID', '{$recipientName}様 いつもお世話になっております。<br/>\n<br/>\nあなたは{$journalName}に投稿された原稿の著者として記載されています。<br/>。\nあなたが著者であることを確認するために、以下のリンクにアクセスして、この投稿にあなたのORCID IDを追加していただけないでしょうか。<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>ORCID iDを登録または接続する</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">ORCIDについての詳しい情報は {$journalName}をご覧ください。</a><br/>\n<br/>\nご不明な点がございましたら、お気軽にお問い合わせいただければと思います。<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),
(413, 'ORCID_REQUEST_AUTHOR_AUTHORIZATION', 'ja', '', 'ORCIDレコードへのアクセスを要求する', '{$recipientName}様 いつもお世話になっております。<br>\n<br>\n{$recipientName}様は、{$journalName}に投稿された原稿「{$submissionTitle}」の著者として登録されております。\n<br>\n<br>\nこの投稿にあなたのORCID IDを追加して、出版時に投稿をあなたのORCIDプロファイルに追加することを許可していただけないでしょうか。<br>\nORCIDの公式サイトへのリンクにアクセスして、あなたのプロフィールでログインし、その先の指示に従ってアクセスを承認していただければと思います。<br>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>ORCID iDを登録または接続する</a><br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">ORCIDについての詳細は{$journalName}</a><br/>をご覧ください。<br/>\n<br>\nご不明な点がございましたら、お気軽にお問い合わせいただければと思います。<br>\n<br>\n{$principalContactSignature}<br>\n'),
(414, 'PASSWORD_RESET_CONFIRM', 'pt_PT', 'Confirmar Redefinição de Senha', 'Confirmar atualização de senha', 'Recebemos um pedido para atualizar a sua senha de acesso à revista {$siteTitle}.<br />\n<br />\nCaso não tenha feito este pedido, ignore este e-mail e a sua senha não será alterada. Se deseja atualizar a sua senha, clique no seguinte link.<br/>\n<br />\nAtualizar senha: {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),
(415, 'USER_REGISTER', 'pt_PT', 'Registo de Utilizador', 'Novo utilizador registado', '{$recipientName}<br />\n<br />\nEncontra-se registado como utilizador da revista {$journalName}. Guarde o nome de utilizador e a senha, pois serão necessários para todos os contactos mantidos com a revista. Caso pretenda ser removido do portal, entre em contacto connosco.<br />\n<br />\nNome de utilizador: {$recipientUsername}<br />\nSenha: {$password}<br />\n<br />\nAgradecendo desde já a atenção dispensada,<br />\n{$signature}'),
(416, 'USER_VALIDATE_CONTEXT', 'pt_PT', 'Valide E-mail (registo na revista)', 'Valide a sua Conta', '{$recipientName},<br />\n<br />\nO seu registo foi criado na revista {$journalName}, porém é necessário validar o endereço de e-mail para finalizar o processo. Para validar o seu registo, aceda ao URL a seguir:<br />\n<br />\n{$activateUrl}<br />\n<br />\nAgradecendo desde já a sua atenção,<br />\n{$journalSignature}'),
(417, 'USER_VALIDATE_SITE', 'pt_PT', 'Validar E-mail (Site)', 'Valide a sua Conta', '{$recipientName}<br />\n<br />\nCriou uma conta em {$siteTitle}, mas antes de começar a utilizá-la, é necessário validar a sua conta de e-mail. Para isso, clique no seguinte link:<br />\n<br />\n{$activateUrl}<br />\n<br />\nObrigado,<br />\n{$siteSignature}'),
(418, 'REVIEWER_REGISTER', 'pt_PT', 'Registo de Revisor', 'Registo como Revisor na revista {$journalName}', '<p>Caro {$recipientName},</p><p>Tendo em consideração o conhecimento excecional na sua área de investigação, tomamos a liberdade de registá-lo na base de dados de revisores da nossa revista, {$journalName}. Esta ação não implica nenhum compromisso da sua parte, mas simplesmente nos permite abordá-lo para uma possível revisão. Ao ser convidado para efetuar uma revisão, terá acesso ao título e resumo do artigo em questão, e pode sempre aceitar ou recusar o convite. A qualquer momento pode pedir-nos para remover o seu nome da lista de revisores.</p><p>Os seus dados de acesso, nome de utilizador e senha, utilizados para interagir com o website desta revista, estão incluídos nesta mensagem. Pode por exemplo atualizar o seu perfil, incluindo os seus interesses de revisão.</p><p>Nome de utilizador: {$recipientUsername}<br />Senha: {$password}</p><p>Agradecendo desde já a atenção dispensada,</p>{$signature}'),
(419, 'ISSUE_PUBLISH_NOTIFY', 'pt_PT', 'Notificação de Edição Publicada', 'Novo volume publicado: {$issueIdentification}', '<p>Caro {$recipientName},</p><p>É com prazer que anunciamos a publicação <a href=\"{$issueUrl}\">{$issueIdentification}</a> de {$journalName}. Convidamos à leitura e partilha deste trabalho nas suas redes.</p><p>Obrigado aos autores, revisores e editores por todos os contributos, e aos leitores pelo continuado interesse.</p><p>Obrigado,</p>{$signature}'),
(420, 'SUBMISSION_ACK', 'pt_PT', 'Agradecimento da Submissão', 'Obrigado pela submissão a {$journalName}', '{$recipientName},<br />\n<br />\nAgradecemos a submissão do seu manuscrito &quot;{$submissionTitle}&quot; à revista {$journalName}. Através do sistema de gestão editorial online que estamos a utilizar, conseguirá acompanhar o progresso no processo editorial, bastando entrar no sistema disponível em:<br />\n<br />\nURL do Manuscrito: {$submissionUrl}<br />\nNome de utilizador: {$recipientUsername}<br />\n<br />\nEm caso de dúvidas,  entre em contacto connosco.\nAgradecemos mais uma vez considerar a nossa revista como meio de transmitir ao público o seu trabalho científico.<br />\n<br />\n{$journalSignature}'),
(421, 'SUBMISSION_ACK_NOT_USER', 'pt_PT', 'Confirmação de Submissão (Outros Autores)', 'Confirmação da submissão', '<p>Caro {$recipientName},</p><p>Foi nomeado como coautor da submissão à {$journalName}. A pessoa que submeteu, {$submitterName} forneceu os seguintes detalhes:</p><p>{$submissionTitle}<br>{$authorsWithAffiliation}</p><p> Se alguma destas informações estiver incorreta, ou desejar ser designado para esta submissão, entre em contacto connosco.</p><p>Agradecemos a escolhada da nossa revista para publicar o seu trabalho.</p><br /><p>Atentamente,</p>{$journalSignature}'),
(422, 'EDITOR_ASSIGN', 'pt_PT', 'Editor Atribuído', 'Foi designado como editor para uma submissão de {$journalName}', '<p>Caro{$recipientName},</p><p>A seguinte submissão foi-lhe atribuída para acompanhar o processo editorial.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Se considerar que a submissão é relevante para {$journalName}, reencaminhe-a para a etapa de revisão selecionando \"Enviar para Revisão\" e depois designando revisores ao clicar em \"Adicionar Revisor\"</p><p>Se a submissão não for apropriada para esta revista, rejeite a submissão.</p><p>Agradecendo desde já a sua atenção.</p><p>Atentamente,</p>{$journalSignature}'),
(423, 'REVIEW_CANCEL', 'pt_PT', 'Revisor Desassociado', 'Pedido de revisão cancelado', '<p>Caro {$recipientName}:</p><p>Recentemente, enviámos-lhe um pedido de revisão de uma submissão a {$journalName}. Decidimos cancelar o pedido de revisão da submissão , {$submissionTitle}.</p><p>. Lamentamos qualquer inconveniente causado e esperamos poder contar com a sua colaboração numa oportunidade futura.</p><p>Em caso de dúvidas, entre em contacto connosco.</p>{$signature}'),
(424, 'REVIEW_REINSTATE', 'pt_PT', 'Revisor Reintegrado', 'Ainda está disponível para rever trabalhos para {$journalName}?', '<p>Caro(a) {$recipientName}, </p><p>Recentemente cancelámos um pedido de revisão da submissão {$submissionTitle}, para {$journalName}. Gostaríamos de convidá-lo(a) novamente para a revisão.</p><p>Se estiver disponível para a revisão, pode<a href=\"{$reviewAssignmentUrl}\">entrar na revista</a>para ver a submissão, carregar ficheiros de revisão, e submeter a sua revisão.</p><p>Se tiver alguma dúvida, por favor, entre em contacto.</p><p> Atenciosamente, </p>{$signature}'),
(425, 'REVIEW_RESEND_REQUEST', 'pt_PT', 'Reenviar pedido de revisão ao revisor', 'A solicitar novamente a sua avaliação para {$journalName}', ''),
(426, 'REVIEW_REQUEST', 'pt_PT', 'Pedido de Revisão', 'Convite para revisão de artigo', '<p>Caro(a) {$recipientName},</p><p>Acreditamos que o seu conhecimento será fundamental para realizar a revisão de um manuscrito submetido à {$journalName}. O título e resumo da submissão encontram-se abaixo, esperamos que considere assumir esta importante tarefa para o nosso trabalho.</p><p>Se estiver disponível, a revisão deve ser efetuada até {$reviewDueDate}. Pode visualizar o manuscrito, carregar ficheiros de revisão e submeter os seus comentários através do website da revista seguindo os passos abaixo.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Resumo</b></p>{$submissionAbstract}<p>Por favor<a href=\"{$reviewAssignmentUrl}\">aceite ou rejeitee</a> a revisão até <b>{$responseDueDate}</b>.</p><p>Se tiver alguma dúvida ou questão sobre a submissão ou o processo de revisão, não hesite em contactar-nos.</p><p>Agradecemos desde já se considerar aceitar esta revisão. O seu trabalho é muito valioso para a nossa revista.</p><p>Atenciosamente,</p>{$signature}'),
(427, 'REVIEW_REQUEST_SUBSEQUENT', 'pt_PT', 'Pedido de Revisão Subsequente', 'Pedido de revisão de uma submissão revista', '<p>Caro(a) {$recipientName},</p><p>Obrigado pela sua revisão de <a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a>. Os autores consideraram o feedback dos revisores e submeteram uma versão revista do trabalho. Perguntamos se pode proceder a uma segunda ronda de revisão deste trabalho.</p><p>Se estiver disponível para rever esta submissão, o prazo da revisão é {$reviewDueDate}. Pode rever <a href=\"{$reviewAssignmentUrl}\">os passos de submissão</a> para visualizar a submissão, carregar ficheiros de revisão e submeter os seus comentários.<p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Resumo</b></p>{$submissionAbstract}<p>Por favor, aceite ou recuse este pedido de revisão até {$responseDueDate}.</p><p>Não hesite em contactar-nos para qualquer questão relativa à submissão ou ao processo de revisão.</p><p>Obrigado desde já por considerar este pedido, o seu contributo é muito importante para a nossa revista.</p><p>Atenciosamente,</p> {$signature}'),
(428, 'REVIEW_RESPONSE_OVERDUE_AUTO', 'pt_PT', 'Lembrete de resposta atrasada (automatizada)', 'Está disponível para rever um trabalho para a revista?', '<p>Caro(a) {$recipientName},</p><p>Este email é um lembrete automático de {$journalName} en relação ao nosso pedido de revisão do trabalho \"{$submissionTitle}.\"</p><p>Como não recebemos ainda a confirmação se pode ou não rever o trabalho, gostariamos de ter o seu feedback em relação a este assunto.</p><p>Aceda à sua área pessoal na revista para indicar se aceita ou não este pedido de revisão.</p><p>Se estiver disponível para rever a submissão, o prazo é até {$reviewDueDate}. Pode seguir os passos da revisão para consultar o manuscrito, carregar ficheiros de revisão e submeter os seus comentários.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Abstract</b></p>{$submissionAbstract}<p>Pode contactar-nos se tiver alguma dúvida acerca da submissão ou do processo de revisão.</p><p>Agradecemos desde já se considerar aceitar esta revisão.</p><p>Cumprimentos,</p>{$journalSignature}'),
(429, 'REVIEW_CONFIRM', 'pt_PT', 'Confirmar revisão', 'Revisão aceite: {$reviewerName} aceitou rever a submissão #{$submissionId} {$authorsShort} — {$submissionTitle}', 'Cara(o) Editor:<br />\n<br />\nEstou disponível e interessado em rever a submissão &quot;{$submissionTitle}&quot; a {$journalName}. Agradeço a consideração e estimo concluir a revisão até à data definida, {$reviewDueDate}, ou antes do prazo.<br />\n<br />\n{$senderName}'),
(430, 'REVIEW_DECLINE', 'pt_PT', 'Rejeitar revisão', 'Indisponível para realizar a revisão', 'Cara(o) Editor:<br />\n<br />\nLamento informar que não estou disponível de momento para realizar a revisão da sumissão &quot;{$submissionTitle}&quot; à revista {$journalName}. Agradeço a consideração e espero poder ser convidado e estar disponível noutra oportunidade.<br />\n<br />\n{$senderName}'),
(431, 'REVIEW_ACK', 'pt_PT', 'Agradecimento da avaliação', 'Obrigado pela revisão', '{$recipientName}:<br />\n<br />\nAgradecemos ter concluído a revisão da submissão &quot;{$submissionTitle}&quot; à revista {$journalName}. A sua contribuição é fundamental para a qualidade dos trabalhos publicados.'),
(432, 'REVIEW_REMIND', 'pt_PT', 'Lembrete de Revisão', 'Lembrete para conclusão de revisão', '<p>Caro(a) {$recipientName},</p><p>Esta mensagem é apenas um lembrete relativamente ao pedido de revisão da submissão, \"{$submissionTitle},\" para a revista {$journalName}. Esperávamos receber a sua revisão até {$reviewDueDate} e aguardamos a receção assim que for possível.Pode</p><p>Pode <a href=\"{$reviewAssignmentUrl}\">entrar na revista</a>e seguir os passos de revisão para consultar a submissão, carregar ficheiros de revisão e submeter os seus comentários.</p><p>Se necessitar de uma extensão ao prazo de revisão não hesite em contactar-nos.</p><p>Agradecemos o seu contributo. Atenciosamente,</p>{$signature}'),
(433, 'REVIEW_REMIND_AUTO', 'pt_PT', 'Lembrete de Revisão (automático)', 'Lembrete para conclusão de revisão', '<p>Caro(a){$recipientName}:</p><p>Este email é um lembrete automático da revista {$journalName} em relação ao nossso pedido de revisão da submissão \"{$submissionTitle}.\"</p><p>Esperávamos receber a sua revisão até {$reviewDueDate} e teremos todo o prazer em receber a revisão assim que esteja disponível.</p><p><a href=\"{$reviewAssignmentUrl}\">Inicie sessão na revista</a> e siga os passos de revisão para consultar a submissão, carregar ficheiros de revisão e submeter os seus comentários.</p><p>Se necessitar de uma extensão ao prazo estabelecido não hesite em contactar-nos.</p><p>Cumprimentos,</p>{$journalSignature}'),
(434, 'REVIEW_COMPLETE', 'pt_PT', 'Avaliação Concluída', 'Avaliação concluída: {$reviewerName} recomenda {$reviewRecommendation} para #{$submissionId} {$authorsShort} — {$submissionTitle}', ''),
(435, 'REVIEW_EDIT', 'pt_PT', 'Avaliação Editada', 'A tarefa de avaliação foi alterada em {$journalName}', ''),
(436, 'EDITOR_DECISION_ACCEPT', 'pt_PT', 'Submissão Aceite', 'A sua submissão foi aceite em {$journalName}', '<p>Caro(a) {$recipientName},</p><p>Temos o prazer de informá-lo(a) que decidimos <strong>\"aceitar a submissão\"</strong> sem avaliação adicional. Após uma análise cuidadosa, descobrimos que sua submissão, {$submissionTitle}, atendeu ou superou as nossas expectativas. Estamos entusiasmados em publicar seu trabalho em {$journalName} e agradecemos por escolher a nossa revista para publicar o seu trabalho.</p><p>A sua submissão será publicada numa futura edição da {$journalName} e será bem-vindo para incluí-la na sua lista de publicações. Reconhecemos o trabalho árduo de cada submissão bem-sucedida e queremos parabenizá-lo(a) por isso.</p><p>A sua submissão passará agora pela etapa de \"Edição de Texto\" e \"Produção\" para ser publicada.</p><p >Em breve, receberá mais instruções.</p><p>Se tiver alguma dúvida, entre em contato conosco através do seu <a href=\"{$authorSubmissionUrl}\">painel de submissão</a>.</p><p >Atenciosamente,</p>{$signature}'),
(437, 'EDITOR_DECISION_SEND_TO_EXTERNAL', 'pt_PT', 'Enviar para Revisão', 'A sua submissão foi enviada para revisão', '{$authors}:<br />\n<br />\nFoi tomada uma decisão sobre o artigo submetido a {$journalName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nA decisão é: Enviar para Revisão<br />\n<br />\nURL da submissão: {$submissionUrl}'),
(438, 'EDITOR_DECISION_SEND_TO_PRODUCTION', 'pt_PT', 'Enviado para Produção', 'Próximos passos para publicar a sua submissão', '{$authors}:<br />\n<br />\nA edição da sua submissão, &quot;{$submissionTitle},&quot; está concluída.  O artigo foi enviado para a produção.<br />\n<br />\nURL da submissão : {$submissionUrl}'),
(439, 'EDITOR_DECISION_REVISIONS', 'pt_PT', 'Revisões Solicitadas', 'A sua submissão foi revista e encorajamo-lo(a) a inserir revisões', '{$authors}:<br />\n<br />\nFoi tomada uma decisão sobre o artigo submetido à {$journalName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nA decisão é: Revisões Requeridas'),
(440, 'EDITOR_DECISION_RESUBMIT', 'pt_PT', 'Submeter novamente para revisão', 'A sua submissão foi revista - por favor reveja e volte a submeter', '{$authors}:<br />\n<br />\nFoi tomada uma decisão sobre o artigo enviado à revista {$journalName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nA decisão é: Submeter Novamente Para Revisão'),
(441, 'EDITOR_DECISION_DECLINE', 'pt_PT', 'Submissão Rejeitada', 'A sua submissão foi recusada', '{$authors}:<br />\n<br />\nFoi tomada uma decisão sobre o artigo submetido à revista {$journalName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nA decisão é: Rejeitar'),
(442, 'EDITOR_DECISION_INITIAL_DECLINE', 'pt_PT', 'Submissão Rejeitada (Pré-Revisão)', 'A sua submissão foi recusada', '\n			{$authors}:<br />\n<br />\nEm relação à sua submissão à revista {$journalName}, &quot;{$submissionTitle}&quot; foi tomada uma decisão.<br />\n<br />\nA decisão é: Rejeitar a Submissão'),
(443, 'EDITOR_RECOMMENDATION', 'pt_PT', 'Recomendação feita', 'Recomendação Editorial', 'Caro {$editors}:<br />\n<br />\nApós considerar os comentários dos revisores, envio a minha recomendação relativamente à submissão {$submissionTitle}.</p><p>A minha recomendação é:<br />{$recommendation}.</p><p>Visite o <a href=\"{$submissionUrl}\">fluxo editorial</a> da submissão para agir de acordo com a recomendação.</p><p>Encontro-me ao dispor para responder a qualquer pergunta.</p><p>Cumprimentos,</p><p>{$senderName}</p>'),
(444, 'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS', 'pt_PT', 'Notificar os Outros Autores', 'Uma atualização sobre sua submissão', ''),
(445, 'EDITOR_DECISION_NOTIFY_REVIEWERS', 'pt_PT', 'Agradecimento ao Revisor', 'Obrigado pela sua revisão', ''),
(446, 'EDITOR_DECISION_NEW_ROUND', 'pt_PT', 'Nova Ronda de Revisão iniciada', 'Sua submissão foi enviada para outra ronda de revisão', ''),
(447, 'EDITOR_DECISION_REVERT_DECLINE', 'pt_PT', 'Reintegrar Submissão Rejeitada', 'Revertemos a decisão de rejeitar a submissão', ''),
(448, 'EDITOR_DECISION_REVERT_INITIAL_DECLINE', 'pt_PT', 'Reintegrar Submissão Rejeitada sem Revisão', 'Revertemos a decisão de rejeitar a submissão', ''),
(449, 'EDITOR_DECISION_SKIP_REVIEW', 'pt_PT', 'Revisão ignorada', 'A sua submissão foi enviada para edição de texto', '<p>Caro(a) {$recipientName},</p>\n<p>Temos o prazer de informar que decidimos aceitar sua submissão sem avaliação por pares. Achamos que sua submissão, {$submissionTitle}, atendeu às nossas expectativas e não exigimos estes trabalhos passem por avaliação por pares. Estamos felizes em publicar seu artigo em {$journalName} e agradecemos por escolher nossa revista para publicar o seu trabalho.</p>\nA submissão ficará disponível numa futura edição {$journalName} e pode incluí-la em sua lista de publicações. Reconhecemos o trabalho árduo de cada submissão bem sucedida e queremos parabenizá-lo pelo seu esforço.</p>\n<p>A sua submissão passará agora pela edição texto e formatação para ser publicada.</p>\n<p>Receberá mais instruções em breve.</p>\n<p>Se tiver alguma dúvida, entre em contato através do <a href=\"{$authorSubmissionUrl}\">painel de submissão</a>.</p>\n<p>Atenciosamente,</p>\n<p>{$signature}</p>\n'),
(450, 'EDITOR_DECISION_BACK_FROM_PRODUCTION', 'pt_PT', 'Submissão enviada de volta para Edição de Texto', 'A submissão foi enviada de volta para edição de texto', ''),
(451, 'EDITOR_DECISION_BACK_FROM_COPYEDITING', 'pt_PT', 'Submissão enviada de novo para edição de texto', 'A submissão foi enviada novamente para avaliação', ''),
(452, 'EDITOR_DECISION_CANCEL_REVIEW_ROUND', 'pt_PT', 'Ronda de Revisão Cancelada', 'Uma ronda de avaliação da sua submissão foi cancelada', ''),
(453, 'SUBSCRIPTION_NOTIFY', 'pt_PT', 'Notificação de Subscrição', 'Confirmação de subscrição', 'Cara(o) {$recipientName},<br />\n<br />\nVocê está registado como assinante da revista {$journalName}, que possui um sistema de gestão online, com os seguintes dados:<br />\n<br />\n{$subscriptionType}<br />\n<br />\nPara aceder ao conteúdo exclusivo a assinantes basta entrar no portal com o seu nome de utilizador &quot;{$recipientUsername}&quot;.<br />\n<br />\nUma vez ligado ao portal é possível modificar os dados do seu perfil e a sua senha a qualquer momento.<br />\n<br />\nEm caso de subscrição institucional, não há necessidade de utilizadores que acedam a partir da instituição se ligarem ao sistema, já que o acesso ao conteúdo para assinantes é autenticado automaticamente pelo sistema.<br />\n<br />\nEm caso de dúvidas, entre em contacto connosco.<br />\n<br />\n{$subscriptionSignature}'),
(454, 'OPEN_ACCESS_NOTIFY', 'pt_PT', 'Notificação de Acesso Aberto', 'Nova edição de Acesso Aberto', '<p>Caro(a) {$recipientName},</p><p>Informamos que o número <a href=\"{$issueUrl}\">{$issueIdentification}</a> de {$journalName} está agora disponível em acesso aberto. Já não necessita de uma subscrição para ler este número.</p><p>Agradecemos o interesse pelas nossas publicações.</p>{$journalSignature}'),
(455, 'SUBSCRIPTION_BEFORE_EXPIRY', 'pt_PT', 'A subscrição expira em breve', 'Aviso de expiração de subscrição', '{$recipientName},<br />\n<br />\nA sua subscrição a {$journalName} está prestes a expirar.<br />\n<br />\n{$subscriptionType}<br />\nData de expiração: {$expiryDate}<br />\n<br />\nPara garantir a continuidade de acesso à revista, aceda ao sistema com o seu nome de utilizador &quot;{$recipientUsername}&quot; e renove a sua subscrição.<br />\n<br />\nEm caso de dúvidas, entre em contacto connosco.<br />\n<br />\n{$subscriptionSignature}'),
(456, 'SUBSCRIPTION_AFTER_EXPIRY', 'pt_PT', 'Subscrição Expirada', 'Subscrição Expirada', 'Caro(a) {$recipientName}: <br />\n<br />\nA sua assinatura em {$journalName} expirou. <br />\n<br />\n{$subscriptionType} <br />\nData de validade: {$expiryDate} <br />\n<br />\nPara renovar a sua assinatura, aceda ao website da revista. Pode fazer login no sistema com seu nome de utilizador, &quot;{$recipientUsername}&quot;. <br />\n<br />\nSe tiver alguma dúvida, por favor não hesite em contactar-nos. <br />\n<br />\nAtenciosamente,\n<br />\n{$subscriptionSignature}'),
(457, 'SUBSCRIPTION_AFTER_EXPIRY_LAST', 'pt_PT', 'Subscrição Expirada Apelido', 'Expiração de subscrição - Lembrete final', '{$recipientName},<br />\n<br />\nA sua subscrição da revista {$journalName} expirou.<br />\nEste é o lembrete final a ser enviado pelo portal.<br />\n<br />\n{$subscriptionType}<br />\nData de expiração: {$expiryDate}<br />\n<br />\nPara renovar a sua subscrição, aceda ao portal da revista, com o seu nome de utilizador &quot;{$recipientUsername}&quot;.<br />\n<br />\nEm caso de dúvidas, entre em contacto connosco.<br />\n<br />\n{$subscriptionSignature}'),
(458, 'SUBSCRIPTION_PURCHASE_INDL', 'pt_PT', 'Subscreva uma assinatura individual', 'Aquisição de Subscrição: Individual', 'Uma subscrição individual foi adquirida online para a revista {$journalName}, cujos dados são detalhados a seguir.<br />\n<br />\nTipo de Subscrição:<br />\n{$subscriptionType}<br />\n<br />\nUtilizador:<br />\n{$subscriberDetails}<br />\n<br />\nInformação sobre o membro (caso indicado):<br />\n{$membership}<br />\n<br />\nPara visualizar ou editar esta subscrição, aceda ao URL a seguir.<br />\n<br />\nURL da Subscrição: {$subscriptionUrl}<br />\n'),
(459, 'SUBSCRIPTION_PURCHASE_INSTL', 'pt_PT', 'Adquira uma assinatura institucional', 'Aquisição de Subscrição: Institucional', 'Uma subscrição institucional foi adquirida online para {$journalName} com as informações detalhadas a seguir. Para ativar esta subscrição, clique no URL da Subscrição fornecida e define a situação para \'Ativo\'.<br />\n<br />\nTipo de Subscrição:<br />\n{$subscriptionType}<br />\n<br />\nInstituição:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomínio (caso informado):<br />\n{$domain}<br />\n<br />\nFaixas de IP (caso informado):<br />\n{$ipRanges}<br />\n<br />\nContacto:<br />\n{$subscriberDetails}<br />\n<br />\nInformações de membro (caso informado):<br />\n{$membership}<br />\n<br />\nPara visualizar ou editar esta subscrição, aceda ao URL a seguir.<br />\n<br />\nURL da Subscrição: {$subscriptionUrl}<br />\n'),
(460, 'SUBSCRIPTION_RENEW_INDL', 'pt_PT', 'Renovar Assinatura Individual', 'Renovação de Subscrição: Individual', 'Uma subscrição individual foi renovada online para a revista {$journalName} com as informações a seguir.<br />\n<br />\nTipo de Subscrição:<br />\n{$subscriptionType}<br />\n<br />\nUtilizador:<br />\n{$subscriberDetails}<br />\n<br />\nInformação de Membro (caso indicado):<br />\n{$membership}<br />\n<br />\nPara visualizar ou editar esta subscrição, aceda ao URL a seguir.<br />\n<br />\nURL: {$subscriptionUrl}<br />\n'),
(461, 'SUBSCRIPTION_RENEW_INSTL', 'pt_PT', 'Renovar Assinatura Institucional', 'Renovação de Subscrição: Institucional', 'Uma subscrição institucional foi renovada online para a revista {$journalName} com os dados a seguir.<br />\n<br />\nTipo de subscrição:<br />\n{$subscriptionType}<br />\n<br />\nInstituição:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomínio (caso informado):<br />\n{$domain}<br />\n<br />\nFaixas de IP (caso indicado):<br />\n{$ipRanges}<br />\n<br />\nContacto:<br />\n{$subscriberDetails}<br />\n<br />\nRegisto em Entidade de Classe (caso indicado):<br />\n{$membership}<br />\n<br />\nPara visualizar ou editar esta subscrição, aceda à URL a seguir.<br />\n<br />\nURL: {$subscriptionUrl}<br />\n'),
(462, 'REVISED_VERSION_NOTIFY', 'pt_PT', 'Notificação da Versão Revista', 'Versão revista enviada', '<p>Caro {$recipientName},</p><p>O autor submeteu um ficheiro com alterações à submissão, <b>{$authorsShort} — {$submissionTitle}</b>.<p>Como editor designado ,efetue login e <a href=\"{$submissionUrl}\">consulte as alterações</a> e decida se pretende aceitar, recusar ou enviar novamente a submissão para revisão.</p><br><br>—<br>Esta é uma mensagem automática de <a href=\"{$journalUrl}\">{$journalName}</a>.'),
(463, 'STATISTICS_REPORT_NOTIFICATION', 'pt_PT', 'Notificação do Relatório de Estatísticas', 'Atividade Editorial para {$month}, {$year}', '\n{$recipientName}, <br />\n<br />\nO relatório da revista para {$month}, {$year} já se encontra disponível. Os principais indicadores para estes mês são: <br />\n<ul>\n	<li>Novas submissões feitas este mês: {$newSubmissions}</li>\n	<li>Submissões rejeitadas este mês: {$declinedSubmissions}</li>\n	<li>Submissões aceites este mês: {$acceptedSubmissions}</li>\n	<li>Total de submissões no sistema: {$totalSubmissions}</li>\n</ul>\nInicie sessão na revista para aceder a mais detalhes dos <a href=\"{$editorialStatsLink}\">indicadores editoriais</a> e <a href=\"{$publicationStatsLink}\">estatísticas de trabalhos publicados</a>. Segue em anexo uma cópia dos indicadores editoriais deste mês.<br />\n<br />\nCumprimentos,<br />\n{$journalSignature}'),
(464, 'ANNOUNCEMENT', 'pt_PT', 'Novo Comunicado', '{$announcementTitle}', '<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisite o nosso site para ler a <a href=\"{$announcementUrl}\">notícia completa</a>.'),
(465, 'DISCUSSION_NOTIFICATION_SUBMISSION', 'pt_PT', 'Discussão da Submissão', 'Uma mensagem de {$journalName}', 'Escreva a sua mensagem.'),
(466, 'DISCUSSION_NOTIFICATION_REVIEW', 'pt_PT', 'Discussão da Revisão', 'Uma mensagem de {$journalName}', 'Escreva a sua mensagem.'),
(467, 'DISCUSSION_NOTIFICATION_COPYEDITING', 'pt_PT', 'Discussão da Edição de Texto', 'Uma mensagem de {$journalName}', 'Escreva a sua mensagem.'),
(468, 'DISCUSSION_NOTIFICATION_PRODUCTION', 'pt_PT', 'Discussão da Produção', 'Uma mensagem de {$journalName}', 'Escreva a sua mensagem.'),
(469, 'COPYEDIT_REQUEST', 'pt_PT', 'Solicitar Edição de Texto', 'A submissão {$submissionId} está pronta para edição de texto para {$contextAcronym}', '{$recipientName},<br />\n<br />\nSolicito a revisão do texto do manuscrito &quot;{$submissionTitle}&quot;, submetido à revista {$journalName}, conforme os seguintes passos:<br />\n1. Clique no URL da submissão, indicado mais adiante nesta mensagem.<br />\n2. Abra quaisquer ficheiros disponíveis nos Ficheiros de Rascunho e reveja o texto; pode adicionar Discussões de Edição de texto conforme for necessário.<br />\n3. Guarde o(s) ficheiro(s) revisto(s) e envie o ficheiro para o Painel de Edição de Texto.<br />\n4. Notifique o Editor que todos os ficheiros estão pronto, e o processo de Produção pode ser iniciado.<br />\n<br />\nURL da {$journalName}: {$journalUrl}<br />\nURL da Submissão: {$submissionUrl}<br />\nNome de utilizador: {$recipientUsername}'),
(470, 'EDITOR_ASSIGN_SUBMISSION', 'pt_PT', 'Designar Editor', 'Foi designado como editor para uma submissão de {$journalName}', '<p>Caro{$recipientName},</p><p>A seguinte submissão foi-lhe atribuída para acompanhar o processo editorial.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Se considerar que a submissão é relevante para {$journalName}, reencaminhe-a para a etapa de revisão selecionando \"Enviar para Revisão\" e depois designando revisores ao clicar em \"Adicionar Revisor\"</p><p>Se a submissão não for apropriada para esta revista, rejeite a submissão.</p><p>Agradecendo desde já a sua atenção.</p><p>Atentamente,</p>{$journalSignature}'),
(471, 'EDITOR_ASSIGN_REVIEW', 'pt_PT', 'Designar Editor', 'Foi designado como editor para uma submissão de {$journalName}', '<p>Caro(a) {$recipientName},</p><p>a seguinte submissão foi-lhe atribuída para que proceda à gestão da avaliação por pares.</p><p><a href=\"{$submissionUrl}\"> {$submissionTitle}</a><br />{$authors}</p><p><b>Resumo</b></p>{$submissionAbstract}<p>Faça login em <a href=\" {$submissionUrl}\">,visualize a submissão</a> e atribua revisores qualificados. Pode atribuir um revisor clicando em \"Adicionar Revisor\".</p><p>Agradecemos antecipadamente.</p><p>Atenciosamente,</p>{$signature}'),
(472, 'EDITOR_ASSIGN_PRODUCTION', 'pt_PT', 'Designar Editor', 'Foi designado como editor para uma submissão de {$journalName}', '<p>Caro(a) {$recipientName},</p><p>a submissão foi-lhe atribuída para acompanhar a etapa de edição de cópia.</p><p><a href=\"{$submissionUrl}\">{ $submissionTitle}</a><br />{$authors}</p><p><b>Resumo</b></p>{$submissionAbstract}<p>Faça login para <a href=\"{ $submissionUrl}\">visualizar a submissão</a>. Assim que os ficheiros estejam prontos para publicação, carregue-os na seção <strong>Publicação > Composições</strong>. De seguida, agende o trabalho para publicação através do botão <strong>Agendar Publicação</strong>.</p><p>Agradecemos antecipadamente.</p><p>Atenciosamente,</p>{$signature }'),
(473, 'LAYOUT_REQUEST', 'pt_PT', 'Pronto para Produção', 'A submissão {$submissionId} está pronta para produção em {$contextAcronym}', '<p>Caro(a) {$recipientName},</p><p>Uma nova submissão está disponível para edição de layout:</p><p><a href=\"{$submissionUrl}\">{$submissionId} {$submissionTitle}</a><br />{$journalName}</p><ol><li>1. Clique no URL da submissão acima.</li><li>2. Descarregue os ficheiros disponíveis para criar os ficheiros de produção de acordo com as normas e templates da revista.</li><li>3. Carregue os ficheiros gerados na secção de Publicação da submissão.</li><li>4. Use a Discussão da Produção para notificar o editor de que as provas estão disponíveis.</li></ol><p>Se não puder desenvolver esta tarefa no tempo previsto ou tiver alguma dúvida não hesite em contactar-nos. Obrigado pelo seu contributo.</p><p>Cumprimentos,</p>{$signature}'),
(474, 'LAYOUT_COMPLETE', 'pt_PT', 'Número Completo', 'Composições concluídas', '<p>Caro(a) {$recipientName},</p><p>As provas tipográficas já foram preparadas para a seguinte submissão e estão prontas para revisão final.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$journalName}</p><p>Se tiver alguma dúvida, não hesite em contactar-nos.</p><p>Cumprimentos,</p><p>{$signature}</p>'),
(475, 'VERSION_CREATED', 'pt_PT', 'Versão Criada', 'Foi criada uma nova versão para {$submissionTitle}', ''),
(476, 'EDITORIAL_REMINDER', 'pt_PT', 'Lembrete Editorial', 'Tarefas editoriais excepcionais para {$journalName}', ''),
(477, 'SUBMISSION_SAVED_FOR_LATER', 'pt_PT', 'Submissão salva para mais tarde', 'Retome a sua submissão em {$journalName}', ''),
(478, 'SUBMISSION_NEEDS_EDITOR', 'pt_PT', 'Submissão necessita de um Editor', 'Esta nova submissão precisa que lhe seja designado um editor: {$submissionTitle}', ''),
(479, 'PAYMENT_REQUEST_NOTIFICATION', 'pt_PT', 'Pedido de pagamento', 'Notificação de Pedido de Pagamento', '<p>Caro(a) {$recipientName},</p><p>Parabéns pela aceitação de sua submissão, {$submissionTitle} para {$journalName}. Agora que sua submissão foi aceite, gostaríamos de solicitar o pagamento da taxa de publicação.</p><p>Esta taxa cobre os custos de produção de transformar a sua submissão numa publicação. Para efetuar o pagamento, visite <a href=\"{$queuedPaymentUrl}\">{$queuedPaymentUrl}</a>.</p><p>Se tiver alguma dúvida, consulte as <a href=\"{$submissionGuidelinesUrl}\"> Diretrizes de Submissão</a></p>'),
(480, 'ORCID_COLLECT_AUTHOR_ID', 'pt_PT', 'orcidCollectAuthorId', 'Submissão ao ORCID', 'Caro(a) {$recipientName},<br/>\n<br/>\nO seu nome foi indicado como autor de um manuscrito submetido à revista {$journalName}. <br/>\n<br/>\nPara confirmar a sua autoria, por favor adicione o seu identificador ORCID à submissão visitando a página indicada abaixo.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/sites/default/files/images/orcid_wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Registe ou entre no seu ORCID</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Mais informação sobre o ORCID em {$journalName}</a><br/>\n<br/>\nNão hesite em contactar-nos para qualquer  questão.<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),
(481, 'ORCID_REQUEST_AUTHOR_AUTHORIZATION', 'pt_PT', 'orcidRequestAuthorAuthorization', 'Pedido de Associação de Identificador ORCID', 'Caro(a) {$recipientName},<br>\n<br>\nFoi adicionado como autor do manuscrito da submissão \"{$submissionTitle}\" feita a {$journalName}.\n<br>\n<br>\nPor favor, conceda-nos permissão para adicionar o seu ORCID a esta submissão e também para adicionar a submissão ao seu perfil do ORCID como publicação. <br>\nConsulte o site oficial do ORCID, entre na sua conta e autorize o acesso seguindo as instruções que lhe fornecemos.<br>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/sites/default/files/images/orcid_wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Registar ou Entrar no seu ORCID iD</a><br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">Saiba mais sobre o ORCID em {$journalName}</a><br/>\n<br>\nSe tiver alguma questão adicional, entre em contacto connosco.<br>\n<br>\n{$principalContactSignature}<br>\n'),
(482, 'MANUAL_PAYMENT_NOTIFICATION', 'pt_PT', 'Notificação de Pagamento Manual', 'Notificação de pagamento manual', 'É necessário realizar o processamento de um pagamento manual de assinatura da revista {$journalName} do utilizador {$senderName} (username &quot;{$senderUsername}&quot;).<br />\n<br />\nO item adquirido é &quot;{$paymentName}&quot;.<br />\nO custo é {$paymentAmount} ({$paymentCurrencyCode}).<br />\n<br />\nEsta mensagem foi gerada pelo Plugin de Pagamento Manual do OJS.'),
(483, 'PASSWORD_RESET_CONFIRM', 'zh_CN', '', '密码重置确认', '我们收到您的请求，将重新设定您在{$siteTitle}网站的密码。<br />\n<br />\n如果您没有提出这个请求，请忽略这封电子邮件，同时您的密码将会保持不变。如果您希望要重置您的密码，请按下面的链接。<br />\n<br />\n重置我的密码： {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),
(484, 'USER_REGISTER', 'zh_CN', '', '新用户注册', '{$recipientName}<br />\n<br />\n谢谢您注册成为《{$journalName}》的一个用户。请保管好这份用户名称和密码，它对于使用本站的所有功能来说是非常必要的。<br />\n<br />\n用户名称：{$recipientUsername}<br />\n密码：{$password}<br />\n<br />\n谢谢您<br />\n{$signature}'),
(485, 'USER_VALIDATE_CONTEXT', 'zh_CN', '', '验证您的账户', '{$recipientName}<br />\n<br />\n您已经在《{$journalName}》创建了账户, 在开始使用前，您需要验证您的电子邮件账号。要做到这一点，只需按照下面的链接：<br />\n<br />\n{$activateUrl}<br />\n<br />\n谢谢您,<br />\n{$journalSignature}'),
(486, 'USER_VALIDATE_SITE', 'zh_CN', '', '', '');
INSERT INTO `email_templates_default_data` (`email_templates_default_data_id`, `email_key`, `locale`, `name`, `subject`, `body`) VALUES
(487, 'REVIEWER_REGISTER', 'zh_CN', '', '在《{$journalName}》注册为审稿人', '基于您的经验, 我们已经注册您的名字到期刊《{$journalName}》的审稿人数据库. 这并不意味着您那方面的任何形式的承诺，只代表我们可以通知您相关投稿的审阅. 在被邀请审稿时，您可以看到稿件的标题和摘要，您可以作出是否对稿件进行审阅的决定。您也可以在任何时候请求从审稿人列表中移除您的名字.<br />\n<br />\n我们将提供给您用户名和密码，用于您所有在本期刊网站的活动。例如，您可以更新您的账户信息，或者更改您的审稿方向.<br />\n<br />\n用户名： {$recipientUsername}<br />\n密码： {$password}<br />\n<br />\n谢谢您，<br />\n{$signature}'),
(488, 'ISSUE_PUBLISH_NOTIFY', 'zh_CN', '', '新一期期刊已出版', '亲爱的读者您好：<br />\n<br />\n《{$journalName}》已经出版了最新一期的期刊，请见{$journalUrl}。我们诚挚地邀请您阅览这里的目录，并接着访问我们的网站以阅读各种文章以及有趣的项目。<br />\n<br />\n感谢您持续地关注我们的作品，<br />\n{$signature}'),
(489, 'SUBMISSION_ACK', 'zh_CN', '', '投稿致谢函', '{$recipientName}:<br />\n<br />\n感谢您将稿件 〈{$submissionTitle}〉 投稿至《{$journalName}》。透过我们所使用的期刊管理系统，您将能够登入期刊网站来追踪稿件的编辑进度：<br />\n<br />\n稿件网址：{$submissionUrl}<br />\n用户名称：{$recipientUsername}<br />\n<br />\n如果您有任何问题，请与我们联络。再次感谢您考虑本期刊出版您的作品。<br />\n<br />\n{$journalSignature}'),
(490, 'SUBMISSION_ACK_NOT_USER', 'zh_CN', '', '投稿致谢函', '您好,<br />\n<br />\n{$submitterName} 已将稿件 &quot;{$submissionTitle}&quot; 投稿给 {$journalName}. <br />\n<br />\n如果您有任何问题，请立即与我们联系。 感谢您考虑在本杂志出版您的作品。<br />\n<br />\n{$journalSignature}'),
(491, 'EDITOR_ASSIGN', 'zh_CN', '', '指派编辑任务', '{$recipientName}:<br />\n<br />\n我们已经将投稿到《{$journalName}》的稿件〈{$submissionTitle}〉指派给您进行编辑工作，请在您的「区段编辑」介面中进行编辑工作。<br />\n<br />\n稿件网址：{$submissionUrl}<br />\n用户名称：{$recipientUsername}<br />\n<br />\n谢谢您。'),
(492, 'REVIEW_CANCEL', 'zh_CN', '', '请取消审查工作', '{$recipientName}:<br />\n<br />\n出于种种考量，我们目前已经取消了邀请您进行投稿《{$journalName}》之稿件〈{$submissionTitle}〉的审查工作。造成您的不便，我们感到十分抱歉，同时我们希望在未来仍能够请您协助审查这份期刊的稿件。<br />\n<br />\n如果您有任何问题，请与我们联络。'),
(493, 'REVIEW_REINSTATE', 'zh_CN', '', '恢复审核的请求', '{$recipientName}:<br/>\n<br/>\n我们真心希望您能够替我们评阅 &quot;{$submissionTitle},&quot; ， {$journalName}，帮助我们审查期刊的论文稿件。<br/>\n<br/>\n如果您有任何问题，请同我们联系。'),
(494, 'REVIEW_RESEND_REQUEST', 'zh_CN', '', '', ''),
(495, 'REVIEW_REQUEST', 'zh_CN', '', '邀请您审查稿件', '{$recipientName}您好：<br />\n<br />\n《{$journalName}》的编辑团队相信您是投稿到本期刊之稿件&quot;{$submissionTitle}&quot;的最佳审查人选。该份稿件的摘要如下，而我们希望您会考虑进行这份对我们来说相当重要的一个工作。<br />\n<br />\n无论您是否接受审查工作与否，都请在{$responseDueDate}之前登入这个期刊网站，同时检阅这份稿件并且记录您的审查意见和编辑建议。网站为：{$journalUrl}<br />\n<br />\n请注意审查工作的期限为：{$reviewDueDate}。<br />\n<br />\n如果您没有您在这个期刊网站的用户帐号和密码。您可以使用这个链接去重新设定您的密码（该密码会和您的用户帐号名称一起电邮给您）：{$passwordLostUrl}<br />\n<br />\n稿件网址：{$reviewAssignmentUrl}<br />\n<br />\n非常感谢您考虑我们的邀请。<br />\n<br />\n{$signature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n<br />\n{$submissionAbstract}'),
(496, 'REVIEW_REQUEST_SUBSEQUENT', 'zh_CN', '', '文章审稿请求', '{$recipientName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$journalName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$journalUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordLostUrl}<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$signature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}'),
(497, 'REVIEW_RESPONSE_OVERDUE_AUTO', 'zh_CN', '', '邀请您审查稿件', '{$recipientName}您好：<br />\n<br />\n《{$journalName}》的编辑团队相信您是投稿到本期刊之稿件〈{$submissionTitle}〉的最佳审查人选。该份稿件的摘要如下，而我们希望您会考虑进行这份对我们来说相当重要的一个工作。<br />\n<br />\n无论您是否接受审查工作与否，都请在{$responseDueDate}之前登入这个期刊网站，同时检阅这份稿件并且记录您的审查意见和编辑建议。网站为：{$journalUrl}<br />\n<br />\n请注意审查工作的期限为：{$reviewDueDate}。<br />\n<br />\n如果您没有您在这个期刊网站的用户帐号和密码。您可以使用这个链接去重新设定您的密码（该密码会和您的用户帐号名称一起电邮给您）：{$passwordLostUrl}<br />\n<br />\n稿件网址：{$reviewAssignmentUrl}<br />\n<br />\n非常感谢您考虑我们的邀请。<br />\n<br />\n{$journalSignature}<br />\n<br />\n<br />\n<br />\n〈{$submissionTitle}〉<br />\n<br />\n<br />\n{$submissionAbstract}'),
(498, 'REVIEW_CONFIRM', 'zh_CN', '', '可以进行审查工作', '{$recipientName}:<br />\n<br />\n我可以并且愿意为《{$journalName}》审查稿件〈{$submissionTitle}〉。谢谢您考虑我当审查人，而我计划在审查截止日{$reviewDueDate}前完成审查。<br />\n<br />\n{$senderName}'),
(499, 'REVIEW_DECLINE', 'zh_CN', '', '无法进行审查工作', '{$recipientName}:<br />\n<br />\n我恐怕在这个时候无法为《{$journalName}》进行稿件〈{$submissionTitle}〉的审查工作。谢谢您考虑我担任审查人，有机会我仍乐意接受审查工作。<br />\n<br />\n{$senderName}'),
(500, 'REVIEW_ACK', 'zh_CN', '', '文章审查感谢函', '{$recipientName}:<br />\n<br />\n感谢您为《{$journalName}》完成了稿件〈{$submissionTitle}〉的审查工作。我们非常感激您对我们出版文章之品质的重要贡献。'),
(501, 'REVIEW_REMIND', 'zh_CN', '', '稿件审查提醒函', '{$recipientName}:<br />\n<br />\n这封信只是礼貌地提醒您，我们已邀请您为《{$journalName}》审查稿件〈{$submissionTitle}〉。我们希望您<br />\n能在 {$reviewDueDate}前完成这份审查工作，并请您在备妥审查意见书之后尽快寄给我们。<br />\n<br />\n如果您没有您在这个期刊网站的用户帐号和密码。您可以使用这个链接去重新设定您的密码（该密码会和您的用户帐号名称一起电邮给您）：{$passwordLostUrl}<br />\n<br />\n稿件网址：{$reviewAssignmentUrl}<br />\n<br />\n请确认您能够完成这个对本期刊作品而言非常重要的审稿任务。我们期盼得到您的回复。<br />\n<br />\n{$signature}'),
(502, 'REVIEW_REMIND_AUTO', 'zh_CN', '', '自动发出的稿件审查提醒函', '{$recipientName}:<br />\n<br />\n这封信只是礼貌地提醒您，我们已邀请您为《{$journalName}》审查稿件〈{$submissionTitle}〉。我们希望您<br />\n能在 {$reviewDueDate}前完成这份审查工作，并请您在备妥审查意见书之后尽快寄给我们。<br />\n<br />\n如果您没有您在这个期刊网站的用户帐号和密码。您可以使用这个链接去重新设定您的密码（该密码会和您的用户帐号名称一起电邮给您）：{$passwordLostUrl}<br />\n<br />\n稿件网址：{$reviewAssignmentUrl}<br />\n<br />\n请确认您能够完成这个对本期刊作品而言非常重要的贡献。我们期盼听到您的回复。<br />\n<br />\n{$journalSignature}'),
(503, 'REVIEW_COMPLETE', 'zh_CN', '', '', ''),
(504, 'REVIEW_EDIT', 'zh_CN', '', '', ''),
(505, 'EDITOR_DECISION_ACCEPT', 'zh_CN', '', '编辑决定', '{$authors}:<br />\n我们对于您在《{$journalName}》提交的〈{$submissionTitle}〉达成一项决定。<br />\n<br />\n我们的决定是：接收该稿件'),
(506, 'EDITOR_DECISION_SEND_TO_EXTERNAL', 'zh_CN', '', '编辑决策', '{$authors}:<br />\n<br />\n我们已经收到您的稿件： {$journalName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\n我们决定：将您的稿件送去评审<br />\n<br />\n稿件的地址：{$submissionUrl}'),
(507, 'EDITOR_DECISION_SEND_TO_PRODUCTION', 'zh_CN', '', '总编决定', '{$authors}:<br />\n<br />\n您的稿件 &quot;{$submissionTitle}&quot; 修改结束。我们将要安排出版。<br />\n<br />\n稿件地址： {$submissionUrl}'),
(508, 'EDITOR_DECISION_REVISIONS', 'zh_CN', '', '编辑决定', '{$authors}:<br />\n<br />\n我们对于您在《{$journalName}》提交的〈{$submissionTitle}〉达成一项决定。<br />\n<br />\n我们的决定是：'),
(509, 'EDITOR_DECISION_RESUBMIT', 'zh_CN', '', '编辑决定', '{$authors}:<br />\n<br />\n我们对于您在《{$journalName}》提交的〈{$submissionTitle}〉达成一项决定。<br />\n<br />\n我们的决定是：'),
(510, 'EDITOR_DECISION_DECLINE', 'zh_CN', '', '编辑决定', '{$authors}:<br />\n<br />\n我们对于您在《{$journalName}》提交的〈{$submissionTitle}〉达成一项决定。<br />\n<br />\n我们的决定是：'),
(511, 'EDITOR_DECISION_INITIAL_DECLINE', 'zh_CN', '', '总编决定', '\n			{$authors}:<br />\n<br />\n我们对于稿件 {$journalName}, &quot;{$submissionTitle}&quot; 形成了一个最终共识。<br />\n<br />\n我们的决定是：拒绝稿件'),
(512, 'EDITOR_RECOMMENDATION', 'zh_CN', '', '总编建议', '{$editors}:<br />\n<br />\n关于稿件 {$journalName}, &quot;{$submissionTitle}&quot; 的建议是： {$recommendation}'),
(513, 'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS', 'zh_CN', '', '', ''),
(514, 'EDITOR_DECISION_NOTIFY_REVIEWERS', 'zh_CN', '', '', ''),
(515, 'EDITOR_DECISION_NEW_ROUND', 'zh_CN', '', '', ''),
(516, 'EDITOR_DECISION_REVERT_DECLINE', 'zh_CN', '', '', ''),
(517, 'EDITOR_DECISION_REVERT_INITIAL_DECLINE', 'zh_CN', '', '', ''),
(518, 'EDITOR_DECISION_SKIP_REVIEW', 'zh_CN', '', '', ''),
(519, 'EDITOR_DECISION_BACK_FROM_PRODUCTION', 'zh_CN', '', '', ''),
(520, 'EDITOR_DECISION_BACK_FROM_COPYEDITING', 'zh_CN', '', '', ''),
(521, 'EDITOR_DECISION_CANCEL_REVIEW_ROUND', 'zh_CN', '', '', ''),
(522, 'SUBSCRIPTION_NOTIFY', 'zh_CN', '', '期刊订阅通知信', '{$recipientName}:<br />\n<br />\n您目前以下列的订阅信息，注册登记成为我们线上期刊网站《{$journalName}》的一个订户：<br />\n<br />\n{$subscriptionType}<br />\n<br />\n要访问只有订户才能阅读的文章内容，只要简单地以您的用户帐号名称登入系统即可：「{$recipientUsername}」。<br />\n<br />\n一旦您登入本系统，您就能够在任何时候变更您的帐号相关设定以及密码。<br />\n<br />\n请注意，如果您是以机关单位进行订阅，贵单位的用户就不需要进行登入，因为文章内容的订阅动作将会自动地由系统进行授权。<br />\n<br />\n如果您有任何的疑问，请直接联络我们。<br />\n<br />\n谢谢您<br />\n<br />\n{$subscriptionSignature}'),
(523, 'OPEN_ACCESS_NOTIFY', 'zh_CN', '', '本期内容已经开放访问', '亲爱的读者您好：<br />\n<br />\n《{$journalName}》已经以开放访问的格式公开本期期刊内容。我们邀请您浏览这里所附的目录，并且接着访问我们的网站 ({$journalUrl}) ，阅读文章以及您感兴趣的项目。<br />\n<br />\n感谢您持续地关注本期刊<br />\n<br />\n{$journalSignature}'),
(524, 'SUBSCRIPTION_BEFORE_EXPIRY', 'zh_CN', '', '订阅到期通知', '{$recipientName}:<br />\n<br />\n您订阅《{$journalName}》的期限将要到期。<br />\n<br />\n{$subscriptionType}<br />\n到期日：{$expiryDate}<br />\n<br />\n为确保您能够持续阅读本期刊，请至期刊网站并且续订本期刊。您可以使用您的帐号名称「{$recipientUsername}」登入系统。<br />\n<br />\n如果您有任何的疑问，请直接联络我们。<br />\n<br />\n{$subscriptionSignature}'),
(525, 'SUBSCRIPTION_AFTER_EXPIRY', 'zh_CN', '', '订阅时间已经过期', '{$recipientName}:<br />\n<br />\n您订阅《{$journalName}》的期限已经过期。<br />\n<br />\n{$subscriptionType}<br />\n到期日：{$expiryDate}<br />\n<br />\n要续订本期刊，请前往本期刊网站。您可以使用您的帐号名称「{$recipientUsername}」登入系统。<br />\n<br />\n如果您有任何的疑问，请直接联络我们。<br />\n<br />\n{$subscriptionSignature}'),
(526, 'SUBSCRIPTION_AFTER_EXPIRY_LAST', 'zh_CN', '', '订阅时间已经过期—最后提醒', '{$recipientName}:<br />\n<br />\n您订阅《{$journalName}》的期限已经过期。<br />\n请注意，这是最后一封寄发给您的提醒信函。<br />\n<br />\n{$subscriptionType}<br />\n到期日：{$expiryDate}<br />\n<br />\n要续订本期刊，请前往本期刊网站。您可以使用您的帐号「{$recipientUsername}」登入系统。<br />\n<br />\n如果您有任何疑问，请直接联系我们。<br />\n<br />\n{$subscriptionSignature}'),
(527, 'SUBSCRIPTION_PURCHASE_INDL', 'zh_CN', '', '订阅购买:个人', '一个《{$journalName} 》的个人订阅已经被在线购买，详细如下：<br />\n<br />\n订阅类型:<br />\n{$subscriptionType}<br />\n<br />\n用户:<br />\n{$subscriberDetails}<br />\n<br />\n会员信息 (可选):<br />\n{$membership}<br />\n<br />\n审阅或者编辑这个订阅，请使用如下链接.<br />\n<br />\n订阅URL: {$subscriptionUrl}<br />\n'),
(528, 'SUBSCRIPTION_PURCHASE_INSTL', 'zh_CN', '', '订阅购买: 团体', '一个《{$journalName} 》的团体订阅已经被在线购买，详细如下：<br />\n		激活这个订阅, 请使用提供的订阅URL，并且设置订阅状态为\'激活（Active）\'.<br />\n<br />\n订阅类型:<br />\n{$subscriptionType}<br />\n<br />\n团体信息:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\n域名(可选):<br />\n{$domain}<br />\n<br />\nIP范围(可选):<br />\n{$ipRanges}<br />\n<br />\n联系人:<br />\n{$subscriberDetails}<br />\n<br />\n会员信息 (if provided):<br />\n{$membership}<br />\n<br />\n请使用下面的链接查看和编辑这个订阅：<br />\n<br />\n订阅URL: {$subscriptionUrl}<br />\n'),
(529, 'SUBSCRIPTION_RENEW_INDL', 'zh_CN', '', '订阅续订: 个人', '《{$journalName}》的一个个人订阅已经被续订了，详细信息如下：<br />\n<br />\n订阅类型:<br />\n{$subscriptionType}<br />\n<br />\n用户:<br />\n{$subscriberDetails}<br />\n<br />\n会员信息 (if provided):<br />\n{$membership}<br />\n<br />\n请使用如下链接查看和编辑这个订阅.<br />\n<br />\n订阅链接URL: {$subscriptionUrl}<br />\n'),
(530, 'SUBSCRIPTION_RENEW_INSTL', 'zh_CN', '', '订阅续订: 团体', '《{$journalName}》的一个团体订阅已经在线续订了，详细信息如下：<br />\n<br />\n订阅类型:<br />\n{$subscriptionType}<br />\n<br />\n团体信息:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\n域名 (可选):<br />\n{$domain}<br />\n<br />\nIP范围(可选):<br />\n{$ipRanges}<br />\n<br />\n联系人:<br />\n{$subscriberDetails}<br />\n<br />\n会员信息(可选):<br />\n{$membership}<br />\n<br />\n使用如下链接审查和编辑这个订阅.<br />\n<br />\n订阅URL: {$subscriptionUrl}<br />\n'),
(531, 'REVISED_VERSION_NOTIFY', 'zh_CN', '', '修订版上传', '{$recipientName}:<br />\n<br />\nA revised version of &quot;{$submissionTitle}&quot; has been uploaded by the author {$submitterName}.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\n<br />\n{$signature}'),
(532, 'STATISTICS_REPORT_NOTIFICATION', 'zh_CN', '', '编辑持续达 {$year} 年 {$month} 个月', '\n{$recipientName}, <br />\n<br />\n您的期刊长达 {$month}, {$year} 的运行报告已经生成。当月统计数据如下。<br />\n<ul>\n	<li>本月投稿： {$newSubmissions}</li>\n	<li>本月拒绝稿件： {$declinedSubmissions}</li>\n	<li>本月采纳稿件： {$acceptedSubmissions}</li>\n	<li>系统共接收稿件： {$totalSubmissions}</li>\n</ul>\n登录查看期刊更多信息： <a href=\"{$editorialStatsLink}\">编辑趋势</a> 和 <a href=\"{$publicationStatsLink}\">发表文章统计</a>。本月编辑趋势见附件。<br />\n<br />\n谨启<br />\n{$journalSignature}'),
(533, 'ANNOUNCEMENT', 'zh_CN', '', '{$announcementTitle}', '<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\n访问我们的网站查看<a href=\"{$announcementUrl}\">公告全文</a>。.'),
(534, 'DISCUSSION_NOTIFICATION_SUBMISSION', 'zh_CN', '', '关于{$journalName} 的信息', '请输入您的信息。'),
(535, 'DISCUSSION_NOTIFICATION_REVIEW', 'zh_CN', '', '关于{$journalName} 的信息', '请输入您的信息。'),
(536, 'DISCUSSION_NOTIFICATION_COPYEDITING', 'zh_CN', '', '关于{$journalName} 的信息', '请输入您的信息。'),
(537, 'DISCUSSION_NOTIFICATION_PRODUCTION', 'zh_CN', '', '关于{$journalName} 的信息', '请输入您的信息。'),
(538, 'COPYEDIT_REQUEST', 'zh_CN', '', '编辑要求', '{$recipientName}您好：<br />\n<br />\n我想请您为《{$journalName}》担任稿件〈{$submissionTitle}〉的校样编辑。您可以在网站上找到这份稿件，以及校样编辑的工作指引。<br />\n<br />\n稿件网址：{$submissionUrl}\"<br />\n用户名称：{$recipientUsername}<br />\n<br />\n如果您目前无法进行这份工作，或者对这项工作有任何的疑问，请直接回信与我联络。非常感谢您同意为这份期刊进行这份重要的工作。'),
(539, 'EDITOR_ASSIGN_SUBMISSION', 'zh_CN', '', '指派编辑任务', '{$recipientName}:<br />\n<br />\n我们已经将投稿到《{$journalName}》的稿件〈{$submissionTitle}〉指派给您进行编辑工作，请在您的「区段编辑」介面中进行编辑工作。<br />\n<br />\n稿件网址：{$submissionUrl}<br />\n用户名称：{$recipientUsername}<br />\n<br />\n谢谢您。'),
(540, 'EDITOR_ASSIGN_REVIEW', 'zh_CN', '', '指派编辑任务', ''),
(541, 'EDITOR_ASSIGN_PRODUCTION', 'zh_CN', '', '指派编辑任务', ''),
(542, 'LAYOUT_REQUEST', 'zh_CN', '', '请进行排版工作', '{$recipientName}:<br />\n<br />\n投递到 {$journalName}的稿件 &quot;{$submissionTitle}&quot; 现在按照如下步骤进行排版：<br />\n1. 点击下面的投稿URL.<br />\n2. 登录到期刊，并且使用排版版本文件根据期刊标准来创建样稿.<br />\n3. 发送完成稿件给编辑.<br />\n<br />\n{$journalName} URL: {$journalUrl}<br />\n稿件URL: {$submissionUrl}<br />\n用户名: {$recipientUsername}<br />\n<br />\n如果您这次不能完成这项工作或者有任何质询，请联系我们，感谢您对本刊的贡献.'),
(543, 'LAYOUT_COMPLETE', 'zh_CN', '', '已完成制版', '{$recipientName}:<br />\n<br />\n目前已经为投稿《{$journalName}》的稿件〈{$submissionTitle}〉完成制版工作，可以进行校对工作了。<br />\n<br />\n如果您有任何问题，请与我们联络。<br />\n<br />\n{$senderName}'),
(544, 'VERSION_CREATED', 'zh_CN', '', '', ''),
(545, 'EDITORIAL_REMINDER', 'zh_CN', '', '', ''),
(546, 'SUBMISSION_SAVED_FOR_LATER', 'zh_CN', '', '', ''),
(547, 'SUBMISSION_NEEDS_EDITOR', 'zh_CN', '', '', ''),
(548, 'PAYMENT_REQUEST_NOTIFICATION', 'zh_CN', '', '', ''),
(549, 'MANUAL_PAYMENT_NOTIFICATION', 'zh_CN', '', '人工支付通知', '人工支付需要被{$journalName}期刊的{$senderName}来处理（用户名&quot;{$senderUsername}&quot;）。<br />\n<br />\n被支付的项目：&quot;{$paymentName}&quot;。<br />\n费用：{$paymentAmount} ({$paymentCurrencyCode})。<br />\n<br />\n此邮件是由开放期刊系统的人工支付插件生成的。'),
(682, 'PASSWORD_RESET_CONFIRM', 'en', 'Password Reset Confirm', 'Password Reset Confirmation', 'We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),
(683, 'USER_REGISTER', 'en', 'User Created', 'Journal Registration', '{$recipientName}<br />\n<br />\nYou have now been registered as a user with {$journalName}. We have included your username and password in this email, which are needed for all work with this journal through its website. At any point, you can ask to be removed from the journal\'s list of users by contacting me.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}'),
(684, 'USER_VALIDATE_CONTEXT', 'en', 'Validate Email (Journal Registration)', 'Validate Your Account', '{$recipientName}<br />\n<br />\nYou have created an account with {$journalName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$journalSignature}'),
(685, 'USER_VALIDATE_SITE', 'en', 'Validate Email (Site)', 'Validate Your Account', '{$recipientName}<br />\n<br />\nYou have created an account with {$siteTitle}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$siteSignature}'),
(686, 'REVIEWER_REGISTER', 'en', 'Reviewer Register', 'Registration as Reviewer with {$journalName}', '<p>Dear {$recipientName},</p><p>In light of your expertise, we have registered your name in the reviewer database for {$journalName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you\'ll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.</p><p>We are providing you with a username and password, which is used in all interactions with the journal through its website. You may wish, for example, to update your profile, including your reviewing interests.</p><p>Username: {$recipientUsername}<br />Password: {$password}</p><p>Thank you,</p>{$signature}'),
(687, 'ISSUE_PUBLISH_NOTIFY', 'en', 'Issue Published Notify', 'Just published: {$issueIdentification} of {$journalName}', '<p>Dear {$recipientName},</p><p>We are pleased to announce the publication of <a href=\"{$issueUrl}\">{$issueIdentification}</a> of {$journalName}.  We invite you to read and share this work with your scholarly community.</p><p>Many thanks to our authors, reviewers, and editors for their valuable contributions, and to our readers for your continued interest.</p><p>Thank you,</p>{$signature}'),
(688, 'SUBMISSION_ACK', 'en', 'Submission Confirmation', 'Thank you for your submission to {$journalName}', '<p>Dear {$recipientName},</p><p>Thank you for your submission to {$journalName}. We have received your submission, {$submissionTitle}, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: {$authorSubmissionUrl}</p><p>If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Thank you for considering {$journalName} as a venue for your work.</p>{$journalSignature}'),
(689, 'SUBMISSION_ACK_NOT_USER', 'en', 'Submission Confirmation (Other Authors)', 'Submission confirmation', '<p>Dear {$recipientName},</p><p>You have been named as a co-author on a submission to {$journalName}. The submitter, {$submitterName}, provided the following details:</p><p>{$submissionTitle}<br>{$authorsWithAffiliation}</p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering {$journalName} as a venue for your work.</p><p>Kind regards,</p>{$journalSignature}'),
(690, 'EDITOR_ASSIGN', 'en', 'Editor Assigned', 'You have been assigned as an editor on a submission to {$journalName}', '<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>If you find the submission to be relevant for {$journalName}, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$journalSignature}'),
(691, 'REVIEW_CANCEL', 'en', 'Reviewer Unassign', 'Request for Review Cancelled', '<p>Dear {$recipientName},</p><p>Recently, we asked you to review a submission to {$journalName}. We have decided to cancel the request for you to reivew the submission, {$submissionTitle}.</p><p>We apologize any inconvenience this may cause you and hope that we will be able to call on you to assist with this journal\'s review process in the future.</p><p>If you have any questions, please contact me.</p>{$signature}'),
(692, 'REVIEW_REINSTATE', 'en', 'Reviewer Reinstate', 'Can you still review something for {$journalName}?', '<p>Dear {$recipientName},</p><p>We recently cancelled our request for you to review a submission, {$submissionTitle}, for {$journalName}. We\'ve reversed that decision and we hope that you are still able to conduct the review.</p><p>If you are able to assist with this submission\'s review, you can <a href=\"{$reviewAssignmentUrl}\">login to the journal</a> to view the submission, upload review files, and submit your review request.</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p>{$signature}'),
(693, 'REVIEW_RESEND_REQUEST', 'en', 'Resend Review Request to Reviewer', 'Requesting your review again for {$journalName}', '<p>Dear {$recipientName},</p><p>Recently, you declined our request to review a submission, {$submissionTitle}, for {$journalName}. I\'m writing to see if you are able to conduct the review after all.</p><p>We would be grateful if you\'re able to perform this review, but we understand if that is not possible at this time. Either way, please <a href=\"{$reviewAssignmentUrl}\">accept or decline the request</a> by {$responseDueDate}, so that we can find an alternate reviewer.</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p>{$signature}'),
(694, 'REVIEW_REQUEST', 'en', 'Review Request', 'Invitation to review', '<p>Dear {$recipientName},</p><p>I believe that you would serve as an excellent reviewer for a submission  to {$journalName}. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p><p>If you are able to review this submission, your review is due by {$reviewDueDate}. You can view the submission, upload review files, and submit your review by logging into the journal site and following the steps at the link below.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please <a href=\"{$reviewAssignmentUrl}\">accept or decline</a> the review by <b>{$responseDueDate}</b>.</p><p>You may contact me with any questions about the submission or the review process.</p><p>Thank you for considering this request. Your help is much appreciated.</p><p>Kind regards,</p>{$signature}'),
(695, 'REVIEW_REQUEST_SUBSEQUENT', 'en', 'Review Request Subsequent', 'Request to review a revised submission', '<p>Dear {$recipientName},</p><p>Thank you for your review of <a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a>. The authors have considered the reviewers\' feedback and have now submitted a revised version of their work. I\'m writing to ask if you would conduct a second round of peer review for this submission.</p><p>If you are able to review this submission, your review is due by {$reviewDueDate}. You can <a href=\"{$reviewAssignmentUrl}\">follow the review steps</a> to view the submission, upload review files, and submit your review comments.<p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please <a href=\"{$reviewAssignmentUrl}\">accept or decline</a> the review by <b>{$responseDueDate}</b>.</p><p>Please feel free to contact me with any questions about the submission or the review process.</p><p>Thank you for considering this request. Your help is much appreciated.</p><p>Kind regards,</p>{$signature}'),
(696, 'REVIEW_RESPONSE_OVERDUE_AUTO', 'en', 'Review Response Overdue (Automated)', 'Will you be able to review this for us?', '<p>Dear {$recipientName},</p><p>This email is an automated reminder from {$journalName} in regards to our request for your review of the submission, \"{$submissionTitle}.\"</p><p>You are receiving this email because we have not yet received a confirmation from you indicating whether or not you are able to undertake the review of this submission.</p><p>Please let us know whether or not you are able to undertake this review by using our submission management software to accept or decline this request.</p><p>If you are able to review this submission, your review is due by {$reviewDueDate}. You can follow the review steps to view the submission, upload review files, and submit your review comments.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please feel free to contact me with any questions about the submission or the review process.</p><p>Thank you for considering this request. Your help is much appreciated.</p><p>Kind regards,</p>{$journalSignature}'),
(697, 'REVIEW_CONFIRM', 'en', 'Review Confirm', 'Review accepted: {$reviewerName} accepted review assignment for #{$submissionId} {$authorsShort} — {$submissionTitle}', '<p>Dear {$recipientName},</p><p>{$reviewerName} has accepted the following review:</p><p><a href=\"{$submissionUrl}\">#{$submissionId} {$authorsShort} — {$submissionTitle}</a><br /><b>Type:</b> {$reviewMethod}</p><p><b>Review Due:</b> {$reviewDueDate}</p><p>Login to <a href=\"{$submissionUrl}\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"{$journalUrl}\">{$journalName}</a>.'),
(698, 'REVIEW_DECLINE', 'en', 'Review Decline', 'Unable to Review', 'Editors:<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$journalName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$senderName}'),
(699, 'REVIEW_ACK', 'en', 'Review Acknowledgement', 'Thank you for your review', '<p>Dear {$recipientName},</p>\n<p>Thank you for completing your review of the submission, {$submissionTitle}, for {$journalName}. We appreciate your time and expertise in contributing to the quality of the work that we publish.</p>\n<p>It has been a pleasure to work with you as a reviewer for {$journalName}, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>'),
(700, 'REVIEW_REMIND', 'en', 'Review Reminder', 'A reminder to please complete your review', '<p>Dear {$recipientName},</p><p>Just a gentle reminder of our request for your review of the submission, \"{$submissionTitle},\" for {$journalName}. We were expecting to have this review by {$reviewDueDate} and we would be pleased to receive it as soon as you are able to prepare it.</p><p>You can <a href=\"{$reviewAssignmentUrl}\">login to the journal</a> and follow the review steps to view the submission, upload review files, and submit your review comments.</p><p>If you need an extension of the deadline, please contact me. I look forward to hearing from you.</p><p>Thank you in advance and kind regards,</p>{$signature}'),
(701, 'REVIEW_REMIND_AUTO', 'en', 'Review Reminder (Automated)', 'A reminder to please complete your review', '<p>Dear {$recipientName}:</p><p>This email is an automated reminder from {$journalName} in regards to our request for your review of the submission, \"{$submissionTitle}.\"</p><p>We were expecting to have this review by {$reviewDueDate} and we would be pleased to receive it as soon as you are able to prepare it.</p><p>Please <a href=\"{$reviewAssignmentUrl}\">login to the journal</a> and follow the review steps to view the submission, upload review files, and submit your review comments.</p><p>If you need an extension of the deadline, please contact me. I look forward to hearing from you.</p><p>Thank you in advance and kind regards,</p>{$journalSignature}'),
(702, 'REVIEW_COMPLETE', 'en', 'Review Completed', 'Review complete: {$reviewerName} recommends {$reviewRecommendation} for #{$submissionId} {$authorsShort} — {$submissionTitle}', '<p>Dear {$recipientName},</p><p>{$reviewerName} completed the following review:</p><p><a href=\"{$submissionUrl}\">#{$submissionId} {$authorsShort} — {$submissionTitle}</a><br /><b>Recommendation:</b> {$reviewRecommendation}<br /><b>Type:</b> {$reviewMethod}</p><p>Login to <a href=\"{$submissionUrl}\">view all files and comments</a> provided by this reviewer.</p>'),
(703, 'REVIEW_EDIT', 'en', 'Review Edited', 'Your review assignment has been changed for {$journalName}', '<p>Dear {$recipientName},</p><p>An editor has made changes to your review assignment for {$journalName}. Please review the details below and let us know if you have any questions.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a><br /><b>Type:</b> {$reviewMethod}<br /><b>Accept or Decline By:</b> {$responseDueDate}<br /><b>Submit Review By:</b> {$reviewDueDate}</p><p>You can login to <a href=\"{$reviewAssignmentUrl}\">complete this review</a> at any time.</p>'),
(704, 'EDITOR_DECISION_ACCEPT', 'en', 'Submission Accepted', 'Your submission has been accepted to {$journalName}', '<p>Dear {$recipientName},</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, {$submissionTitle}, to meet or exceed our expectations. We are excited to publish your piece in {$journalName} and we thank you for choosing our journal as a venue for your work.</p><p>Your submission is now forthcoming in a future issue of {$journalName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}'),
(705, 'EDITOR_DECISION_SEND_TO_EXTERNAL', 'en', 'Sent to Review', 'Your submission has been sent for review', '<p>Dear {$recipientName},</p><p>I am pleased to inform you that an editor has reviewed your submission, {$submissionTitle}, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>{$reviewTypeDescription} You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p>{$signature}</p>'),
(706, 'EDITOR_DECISION_SEND_TO_PRODUCTION', 'en', 'Sent to Production', 'Next steps for publishing your submission', '<p>Dear {$recipientName},</p><p>I am writing from {$journalName} to let you know that the editing of your submission, {$submissionTitle}, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}'),
(707, 'EDITOR_DECISION_REVISIONS', 'en', 'Revisions Requested', 'Your submission has been reviewed and we encourage you to submit revisions', '<p>Dear {$recipientName},</p><p>Your submission {$submissionTitle} has been reviewed and we would like to encourage you to submit revisions that address the reviewers\' comments. An editor will review these revisions and if they address the concerns adequately, your submission may be accepted for publication.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point in the reviewers\' comments and identify what changes you have made. If you find any of the reviewer\'s comments to be unjustified or inappropriate, please explain your perspective.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments at your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),
(708, 'EDITOR_DECISION_RESUBMIT', 'en', 'Resubmit for Review', 'Your submission has been reviewed - please revise and resubmit', '<p>Dear {$recipientName},</p><p>After reviewing your submission, {$submissionTitle}, the reviewers have recommended that your submission cannot be accepted for publication in its current form. However, we would like to encourage you to submit a revised version that addresses the reviewers\' comments. Your revisions will be reviewed by an editor and may be sent out for another round of peer review.</p><p>Please note that resubmitting your work does not guarantee that it will be accepted.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point and identify what changes you have made. If you find any of the reviewer\'s comments inappropriate, please explain your perspective. If you have questions about the recommendations in your review, please include these in your response.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments <a href=\"{$authorSubmissionUrl}\">at your submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),
(709, 'EDITOR_DECISION_DECLINE', 'en', 'Submission Declined', 'Your submission has been declined', '<p>Dear {$recipientName},</p><p>While we appreciate receiving your submission, we are unable to accept {$submissionTitle} for publication on the basis of the comments from reviewers.</p><p>The reviewers\' comments are included at the bottom of this email.</p><p>Thank you for submitting to {$journalName}. Although it is disappointing to have a submission declined, I hope you find the reviewers\' comments to be constructive and helpful.</p><p>You are now free to submit the work elsewhere if you choose to do so.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),
(710, 'EDITOR_DECISION_INITIAL_DECLINE', 'en', 'Submission Declined (Pre-Review)', 'Your submission has been declined', '<p>Dear {$recipientName},</p><p>I’m sorry to inform you that, after reviewing your submission, {$submissionTitle}, the editor has found that it does not meet our requirements for publication in {$journalName}.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p>{$signature}'),
(711, 'EDITOR_RECOMMENDATION', 'en', 'Recommendation Made', 'Editor Recommendation', '<p>Dear {$recipientName},</p><p>After considering the reviewers\' feedback, I would like to make the following recommendation regarding the submission {$submissionTitle}.</p><p>My recommendation is: {$recommendation}.</p><p>Please visit the submission\'s <a href=\"{$submissionUrl}\">editorial workflow</a> to act on this recommendation.</p><p>Please feel free to contact me with any questions.</p><p>Kind regards,</p><p>{$senderName}</p>'),
(712, 'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS', 'en', 'Notify Other Authors', 'An update regarding your submission', '<p>The following email was sent to {$submittingAuthorName} from {$journalName} regarding {$submissionTitle}.</p>\n<p>You are receiving a copy of this notification because you are identified as an author of the submission. Any instructions in the message below are intended for the submitting author, {$submittingAuthorName}, and no action is required of you at this time.</p>\n\n{$messageToSubmittingAuthor}'),
(713, 'EDITOR_DECISION_NOTIFY_REVIEWERS', 'en', 'Notify Reviewers of Decision', 'Thank you for your review', '<p>Dear {$recipientName},</p>\n<p>Thank you for completing your review of the submission, {$submissionTitle}, for {$journalName}. We appreciate your time and expertise in contributing to the quality of the work that we publish. We have shared your comments with the authors, along with our other reviewers\' comments and the editor\'s decision.</p>\n<p>Based on the feedback we received, we have notified the authors of the following:</p>\n<p>{$decisionDescription}</p>\n<p>Your recommendation was considered alongside the recommendations of other reviewers before coming to a decision. Occasionally the editor\'s decision may differ from the recommendation made by one or more reviewers. The editor considers many factors, and does not take these decisions lightly. We are grateful for our reviewers\' expertise and suggestions.</p>\n<p>It has been a pleasure to work with you as a reviewer for {$journalName}, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>'),
(714, 'EDITOR_DECISION_NEW_ROUND', 'en', 'New Review Round Initiated', 'Your submission has been sent for another round of review', '<p>Dear {$recipientName},</p>\n<p>Your revised submission, {$submissionTitle}, has been sent for a new round of peer review. \nYou will hear from us with feedback from the reviewers and information about the next steps.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),
(715, 'EDITOR_DECISION_REVERT_DECLINE', 'en', 'Reinstate Declined Submission', 'We have reversed the decision to decline your submission', '<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nAn editor will complete the round of review and you will be notified when a \ndecision is made.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),
(716, 'EDITOR_DECISION_REVERT_INITIAL_DECLINE', 'en', 'Reinstate Submission Declined Without Review', 'We have reversed the decision to decline your submission', '<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nAn editor will look further at your submission before deciding whether to decline \nthe submission or send it for review.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),
(717, 'EDITOR_DECISION_SKIP_REVIEW', 'en', 'Submission Accepted (Without Review)', 'Your submission has been sent for copyediting', '<p>Dear {$recipientName},</p>\n<p>I am pleased to inform you that we have decided to accept your submission without peer review. We found your submission, {$submissionTitle}, to meet our expectations, and we do not require that work of this type undergo peer review. We are excited to publish your piece in {$journalName} and we thank you for choosing our journal as a venue for your work.</p>\nYour submission is now forthcoming in a future issue of {$journalName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on your efforts.</p>\n<p>Your submission will now undergo copy editing and formatting to prepare it for publication. </p>\n<p>You will shortly receive further instructions.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),
(718, 'EDITOR_DECISION_BACK_FROM_PRODUCTION', 'en', 'Submission Sent Back to Copyediting', 'Your submission has been sent back to copyediting', '<p>Dear {$recipientName},</p><p>Your submission, {$submissionTitle}, has been sent back to the copyediting stage, where it will undergo further copyediting and formatting to prepare it for publication.</p><p>Occasionally, a submission is sent to the production stage before it is ready for the final galleys to be prepared for publication. Your submission is still forthcoming. I apologize for any confusion.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We will contact you if we need any further assistance.</p><p>Kind regards,</p><p>{$signature}</p>'),
(719, 'EDITOR_DECISION_BACK_FROM_COPYEDITING', 'en', 'Submission Sent Back from Copyediting', 'Your submission has been sent back to review', '<p>Dear {$recipientName},</p><p>Your submission, {$submissionTitle}, has been sent back to the review stage. It will undergo further review before it can be accepted for publication.</p><p>Occasionally, a decision to accept a submission will be recorded accidentally in our system and we must send it back to review. I apologize for any confusion this has caused. We will work to complete any further review quickly so that you have a final decision as soon as possible.</p><p>We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p><p>{$signature}</p>'),
(720, 'EDITOR_DECISION_CANCEL_REVIEW_ROUND', 'en', 'Review Round Cancelled', 'A review round for your submission has been cancelled', '<p>Dear {$recipientName},</p><p>We recently opened a new review round for your submission, {$submissionTitle}. We are closing this review round now.</p><p>Occasionally, a decision to open a round of review will be recorded accidentally in our system and we must cancel this review round. I apologize for any confusion this may have caused.</p><p>We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p><p>{$signature}</p>'),
(721, 'SUBSCRIPTION_NOTIFY', 'en', 'Subscription Notify', 'Subscription Notification', '{$recipientName}:<br />\n<br />\nYou have now been registered as a subscriber in our online journal management system for {$journalName}, with the following subscription:<br />\n<br />\n{$subscriptionType}<br />\n<br />\nTo access content that is available only to subscribers, simply log in to the system with your username, &quot;{$recipientUsername}&quot;.<br />\n<br />\nOnce you have logged in to the system you can change your profile details and password at any point.<br />\n<br />\nPlease note that if you have an institutional subscription, there is no need for users at your institution to log in, since requests for subscription content will be automatically authenticated by the system.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionSignature}'),
(722, 'OPEN_ACCESS_NOTIFY', 'en', 'Open Access Notify', 'Free to read: {$issueIdentification} of {$journalName} is now open access', '<p>Dear {$recipientName},</p><p>We are pleased to inform you that <a href=\"{$issueUrl}\">{$issueIdentification}</a> of {$journalName} is now available under open access.  A subscription is no longer required to read this issue.</p><p>Thank you for your continuing interest in our work.</p>{$journalSignature}'),
(723, 'SUBSCRIPTION_BEFORE_EXPIRY', 'en', 'Subscription Expires Soon', 'Notice of Subscription Expiry', '{$recipientName}:<br />\n<br />\nYour {$journalName} subscription is about to expire.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo ensure the continuity of your access to this journal, please go to the journal website and renew your subscription. You are able to log in to the system with your username, &quot;{$recipientUsername}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionSignature}'),
(724, 'SUBSCRIPTION_AFTER_EXPIRY', 'en', 'Subscription Expired', 'Subscription Expired', '{$recipientName}:<br />\n<br />\nYour {$journalName} subscription has expired.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$recipientUsername}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionSignature}'),
(725, 'SUBSCRIPTION_AFTER_EXPIRY_LAST', 'en', 'Subscription Expired Last', 'Subscription Expired - Final Reminder', '{$recipientName}:<br />\n<br />\nYour {$journalName} subscription has expired.<br />\nPlease note that this is the final reminder that will be emailed to you.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$recipientUsername}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionSignature}'),
(726, 'SUBSCRIPTION_PURCHASE_INDL', 'en', 'Purchase Individual Subscription', 'Subscription Purchase: Individual', 'An individual subscription has been purchased online for {$journalName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$subscriberDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n'),
(727, 'SUBSCRIPTION_PURCHASE_INSTL', 'en', 'Purchase Institutional Subscription', 'Subscription Purchase: Institutional', 'An institutional subscription has been purchased online for {$journalName} with the following details. To activate this subscription, please use the provided Subscription URL and set the subscription status to \'Active\'.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$subscriberDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n'),
(728, 'SUBSCRIPTION_RENEW_INDL', 'en', 'Renew Individual Subscription', 'Subscription Renewal: Individual', 'An individual subscription has been renewed online for {$journalName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$subscriberDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n'),
(729, 'SUBSCRIPTION_RENEW_INSTL', 'en', 'Renew Institutional Subscription', 'Subscription Renewal: Institutional', 'An institutional subscription has been renewed online for {$journalName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$subscriberDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n'),
(730, 'REVISED_VERSION_NOTIFY', 'en', 'Revised Version Notification', 'Revised Version Uploaded', '<p>Dear {$recipientName},</p><p>The author has uploaded revisions for the submission, <b>{$authorsShort} — {$submissionTitle}</b>. <p>As an assigned editor, we ask that you login and <a href=\"{$submissionUrl}\">view the revisions</a> and make a decision to accept, decline or send the submission for further review.</p><br><br>—<br>This is an automated message from <a href=\"{$journalUrl}\">{$journalName}</a>.');
INSERT INTO `email_templates_default_data` (`email_templates_default_data_id`, `email_key`, `locale`, `name`, `subject`, `body`) VALUES
(731, 'STATISTICS_REPORT_NOTIFICATION', 'en', 'Statistics Report Notification', 'Editorial activity for {$month}, {$year}', '\n{$recipientName}, <br />\n<br />\nYour journal health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the journal to view more detailed <a href=\"{$editorialStatsLink}\">editorial trends</a> and <a href=\"{$publicationStatsLink}\">published article stats</a>. A full copy of this month\'s editorial trends is attached.<br />\n<br />\nSincerely,<br />\n{$journalSignature}'),
(732, 'ANNOUNCEMENT', 'en', 'New Announcement', '{$announcementTitle}', '<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisit our website to read the <a href=\"{$announcementUrl}\">full announcement</a>.'),
(733, 'DISCUSSION_NOTIFICATION_SUBMISSION', 'en', 'Discussion (Submission)', 'A message regarding {$journalName}', 'Please enter your message.'),
(734, 'DISCUSSION_NOTIFICATION_REVIEW', 'en', 'Discussion (Review)', 'A message regarding {$journalName}', 'Please enter your message.'),
(735, 'DISCUSSION_NOTIFICATION_COPYEDITING', 'en', 'Discussion (Copyediting)', 'A message regarding {$journalName}', 'Please enter your message.'),
(736, 'DISCUSSION_NOTIFICATION_PRODUCTION', 'en', 'Discussion (Production)', 'A message regarding {$journalName}', 'Please enter your message.'),
(737, 'COPYEDIT_REQUEST', 'en', 'Request Copyedit', 'Submission {$submissionId} is ready to be copyedited for {$contextAcronym}', '<p>Dear {$recipientName},</p><p>A new submission is ready to be copyedited:</p><p><a href\"{$submissionUrl}\">{$submissionId} — {$submissionTitle}</a><br />{$journalName}</p><p>Please follow these steps to complete this task:</p><ol><li>Click on the Submission URL below.</li><li>Open any files available under Draft Files and edit the files. Use the Copyediting Discussions area if you need to contact the editor(s) or author(s).</li><li>Save the copyedited file(s) and upload them to the Copyedited panel.</li><li>Use the Copyediting Discussions to notify the editor(s) that all files have been prepared, and that the Production process may begin.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to {$journalName}.</p><p>Kind regards,</p>{$signature}'),
(738, 'EDITOR_ASSIGN_SUBMISSION', 'en', 'Assign Editor', 'You have been assigned as an editor on a submission to {$journalName}', '<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>If you find the submission to be relevant for {$journalName}, please forward the submission to the review stage by selecting \"Send to Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this journal, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$journalSignature}'),
(739, 'EDITOR_ASSIGN_REVIEW', 'en', 'Assign Editor', 'You have been assigned as an editor on a submission to {$journalName}', '<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the peer review process.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please login to <a href=\"{$submissionUrl}\">view the submission</a> and assign qualified reviewers. You can assign a reviewer by clicking \"Add Reviewer\".</p><p>Thank you in advance.</p><p>Kind regards,</p>{$signature}'),
(740, 'EDITOR_ASSIGN_PRODUCTION', 'en', 'Assign Editor', 'You have been assigned as an editor on a submission to {$journalName}', '<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the production stage.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please login to <a href=\"{$submissionUrl}\">view the submission</a>. Once production-ready files are available, upload them under the <strong>Publication > Galleys</strong> section. Then schedule the work for publication by clicking the <strong>Schedule for Publication</strong> button.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$signature}'),
(741, 'LAYOUT_REQUEST', 'en', 'Ready for Production', 'Submission {$submissionId} is ready for production at {$contextAcronym}', '<p>Dear {$recipientName},</p><p>A new submission is ready for layout editing:</p><p><a href=\"{$submissionUrl}\">{$submissionId} — {$submissionTitle}</a><br />{$journalName}</p><ol><li>Click on the Submission URL above.</li><li>Download the Production Ready files and use them to create the galleys according to the journal\'s standards.</li><li>Upload the galleys to the Publication section of the submission.</li><li>Use the  Production Discussions to notify the editor that the galleys are ready.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.</p><p>Kind regards,</p>{$signature}'),
(742, 'LAYOUT_COMPLETE', 'en', 'Galleys Complete', 'Galleys Complete', '<p>Dear {$recipientName},</p><p>Galleys have now been prepared for the following submission and are ready for final review.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$journalName}</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p><p>{$signature}</p>'),
(743, 'VERSION_CREATED', 'en', 'Version Created', 'A new version was created for {$submissionTitle}', '<p>Dear {$recipientName}, </p><p>This is an automated message to inform you that a new version of your submission, {$submissionTitle}, was created. You can view this version from your submission dashboard at the following link:</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a></p><hr><p>This is an automatic email sent from <a href=\"{$journalUrl}\">{$journalName}</a>.</p>'),
(744, 'EDITORIAL_REMINDER', 'en', 'Editorial Reminder', 'Outstanding editorial tasks for {$journalName}', '<p>Dear {$recipientName},</p><p>You are currently assigned to {$numberOfSubmissions} submissions in <a href=\"{$journalUrl}\">{$journalName}</a>. The following submissions are <b>waiting for your response</b>.</p>{$outstandingTasks}<p>View all of your assignments in your <a href=\"{$submissionsUrl}\">submission dashboard</a>.</p><p>If you have any questions about your assignments, please contact {$contactName} at {$contactEmail}.</p>'),
(745, 'SUBMISSION_SAVED_FOR_LATER', 'en', 'Submission Saved for Later', 'Resume your submission to {$journalName}', '<p>Dear {$recipientName},</p><p>Your submission details have been saved in our system, but it has not yet been submitted for consideration. You can return to complete your submission at any time by following the link below.</p><p><a href=\"{$submissionWizardUrl}\">{$authorsShort} — {$submissionTitle}</a></p><hr><p>This is an automated email from <a href=\"{$journalUrl}\">{$journalName}</a>.</p>'),
(746, 'SUBMISSION_NEEDS_EDITOR', 'en', 'Submission Needs Editor', 'A new submission needs an editor to be assigned: {$submissionTitle}', '<p>Dear {$recipientName},</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"{$journalUrl}\">{$journalName}</a>.</p>'),
(747, 'PAYMENT_REQUEST_NOTIFICATION', 'en', 'Payment Request', 'Payment Request Notification', '<p>Dear {$recipientName},</p><p>Congratulations on the acceptance of your submission, {$submissionTitle}, to {$journalName}. Now that your submission has been accepted, we would like to request payment of the publication fee.</p><p>This fee covers the production costs of bringing your submission to publication. To make the payment, please visit <a href=\"{$queuedPaymentUrl}\">{$queuedPaymentUrl}</a>.</p><p>If you have any questions, please see our <a href=\"{$submissionGuidelinesUrl}\">Submission Guidelines</a></p>'),
(751, 'ORCID_COLLECT_AUTHOR_ID', 'en', 'orcidCollectAuthorId', 'Submission ORCID', 'Dear {$recipientName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$journalName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">More information about ORCID at {$journalName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),
(752, 'ORCID_REQUEST_AUTHOR_AUTHORIZATION', 'en', 'orcidRequestAuthorAuthorization', 'Requesting ORCID record access', 'Dear {$recipientName},<br>\n<br>\nYou have been listed as an author on the manuscript submission \"{$submissionTitle}\" to {$journalName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$journalName}</a><br/>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n'),
(753, 'MANUAL_PAYMENT_NOTIFICATION', 'en', 'Manual Payment Notify', 'Manual Payment Notification', 'A manual payment needs to be processed for the journal {$journalName} and the user {senderName} (username &quot;{$senderUsername}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$paymentName}&quot;.<br />\nThe cost is {$paymentAmount} ({$paymentCurrencyCode}).<br />\n<br />\nThis email was generated by Open Journal Systems\' Manual Payment plugin.'),
(755, 'PASSWORD_RESET_CONFIRM', 'es', 'Confirmación de restablecimiento de contraseña', 'Confirmación de cambio de contraseña', 'Hemos recibido una petición para cambiar su contraseña en {$siteTitle}.<br />\n<br />\nSi no hizo usted esta petición ignore este correo-e y su contraseña no cambiará. Si desea cambiar su contraseña pinche en el enlace que le mostramos a continuación.<br />\n<br />\nCambiar mi contraseña: {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),
(756, 'USER_REGISTER', 'es', 'Usuario/a creado', 'Nuevo registro de usuaria/o', '{$recipientName}<br />\n<br />\nSe ha registrado con éxito como usuario/a en {$journalName}. En este correo se incluyen su nombre de usuario/a y contraseña, datos necesarios para realizar cualquier tarea relacionada con la revista a través de la página web. En cualquier momento puede solicitar que se le elimine de la lista de usuarios/as de la revista contactándome.<br />\n<br />\nNombre de usuario/a: {$recipientUsername}<br />\nContraseña: {$password}<br />\n<br />\nGracias,<br />\n{$signature}'),
(757, 'USER_VALIDATE_CONTEXT', 'es', 'Validar correo electrónico (registro en la revista)', 'Valide su cuenta', 'Estimado/a {$recipientName}<br />\n<br />\nHa creado una cuenta de usuario/a en {$journalName}, pero antes de poder utilizarla debe validar su correo electrónico. Para ello, simplemente haga clic en el siguiente enlace:<br />\n<br />\n{$activateUrl}<br />\n<br />\nGracias,<br />\n{$journalSignature}'),
(758, 'USER_VALIDATE_SITE', 'es', 'Validar correo electrónico (Sitio)', 'Valide su cuenta', '{$recipientName}<br />\n<br />\nHa creado una cuenta en {$siteTitle}, pero antes de poder utilizarla, debe validar su email. Para hacerlo, simplemente haga clic en el siguiente enlace:<br />\n<br />\n{$activateUrl}<br />\n<br />\nGracias,<br />\n{$siteSignature}'),
(759, 'REVIEWER_REGISTER', 'es', 'Registro de revisor/a', 'Registro como Revisor en {$journalName}', '<p>Estimado/a {$recipientName},</p><p>En vista de su experiencia, hemos registrado su nombre en la base de datos de revisores/as de {$journalName}. Esto no implica ningún compromiso por su parte, simplemente nos permite contactarle para una posible revisión de un trabajo. Cuando reciba una invitación para revisar podrá ver el título y el resumen del artículo en cuestión, y siempre tendrá la posibilidad de aceptar o rechazar la invitación. También puede pedirnos en cualquier momento que lo eliminemos de la lista de revisores/as.</p><p>Le enviamos el nombre de usuario/a y la contraseña, que le servirán para realizar cualquier tarea de la revista a través de su página web. Por ejemplo, puede actualizar su perfil e incluir sus intereses de revisión.</p><p>Nombre de usuario/a: {$recipientUsername}<br />Contraseña: {$password}</p><p>Gracias,</p>{$signature}'),
(760, 'ISSUE_PUBLISH_NOTIFY', 'es', 'Notificación de número publicado', 'Nuevo número publicado: {$issueIdentification} en {$journalName}', '<p>Estimado/a {$recipientName},</p><p>Nos complace anunciar la publicación de <a href=\"{$issueUrl}\">{$issueIdentification}</a> de {$journalName}. Le invitamos a leer y compartir este trabajo con su comunidad académica.</p><p>Agradecemos a nuestros autores/as, revisores/as y editores/as sus valiosas contribuciones, y a nuestros lectores/as su interés.</p><p>Gracias,</p>{$signature}'),
(761, 'SUBMISSION_ACK', 'es', 'Confirmación de envío', 'Gracias por su envío a {$journalName}', '<p>Estimado/a {$recipientName}:</p><p>Gracias por su envío a {$journalName}. Hemos recibido su original, {$submissionTitle}, y un miembro de nuestro equipo editorial lo revisará pronto. Le enviaremos un correo electrónico cuando se tome una decisión inicial, y podríamos contactarlo para darle más información.</p></p> Puede ver el envío y seguir su progreso a través del proceso editorial en el enlace siguiente:</p><p>URL del envío: {$authorSubmissionUrl}</p><p>Si se ha cerrado la sesión, puede volver a iniciarla con su nombre de usuario/a {$recipientUsername}.</p><p>Si tiene cualquier duda contacte con nosotros desde el <a href=\"{$authorSubmissionUrl}\">panel de control del envío</a>.</p><p>Gracias por tener en cuenta {$journalName} como hogar para su trabajo.</p>{$journalSignature}'),
(762, 'SUBMISSION_ACK_NOT_USER', 'es', 'Confirmación del envío (otros autores/as)', 'Acuse de recibo del envío', 'Hola,<br />\n<br />\n{$submitterName} ha enviado el manuscrito &quot;{$submissionTitle}&quot; a {$journalName}. <br />\n<br />\nSi tiene cualquier pregunta no dude en contactarme. Le agradecemos que haya elegido esta revista para dar a conocer su obra.<br />\n<br />\n{$journalSignature}'),
(763, 'EDITOR_ASSIGN', 'es', 'Editor/a asignado', 'Ha sido asignado como editor/a de un envío para {$journalName}', '<p>Estimado/a {$recipientName},</p><p>Se le ha asignado el siguiente envío para que coordine su proceso editorial.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Resumen</b></p>{$submissionAbstract}<p>Si le parece que el envío es relevante para {$journalName}, envíelo a la fase de revisión seleccionando \"Enviar a revisión\" y luego asigne revisores/as haciendo clic en \"Añadir revisor/a\".</p><p>Si el envío no es apropiado para esta revista, rechácelo.</p><p>Gracias de antemano.</p><p>Atentamente,</p>{$journalSignature}'),
(764, 'REVIEW_CANCEL', 'es', 'Desasignar revisor/a', 'Petición de revisión cancelada', '<p>Estimado/a {$recipientName},</p><p>Recientemente, le pedimos que revisara una presentación para {$journalName}. Hemos decidido cancelar la solicitud para que revise el artículo, {$submissionTitle}.</p><p>Lamentamos cualquier inconveniente que esto pueda causarle y esperamos poder contar con su ayuda en el futuro para el proceso de revisión de esta revista.</p><p>Si tiene alguna pregunta, por favor contácteme.</p>{$signature}'),
(765, 'REVIEW_REINSTATE', 'es', 'Restaurar revisor/a', '¿Aún puede hacer revisiones para {$journalName}?', '<p>Estimado {$recipientName},</p><p>Recientemente cancelamos nuestra solicitud para que revisara una presentación, {$submissionTitle}, para {$journalName}. Hemos revertido esa decisión y esperamos que todavía pueda llevar a cabo la revisión.</p><p>Si puede ayudar con la revisión de este artículo, puede <a href=\"{$reviewAssignmentUrl}\">iniciar sesión en la revista</a> para ver la presentación, cargar archivos de revisión y enviar su solicitud de revisión.</p><p>Si tiene alguna pregunta, por favor contácteme.</p><p>Atentamente,</p>{$signature}'),
(766, 'REVIEW_RESEND_REQUEST', 'es', 'Reenviar la solicitud de revisión al revisor/a', 'Solicitando de nuevo su revisión para {$journalName}', ''),
(767, 'REVIEW_REQUEST', 'es', 'Solicitud de revisión', 'Invitación de revisión', '<p>Estimado/a {$recipientName},</p><p>Creemos que sería un excelente revisor/a para el envío a {$journalName}. El título y el resumen del envío se encuentran a continuación, espero que considere asumir esta tarea tan importante para nosotros.</p><p>Si puede revisar este envío, debería devolvernos su revisión antes del {$reviewDueDate}. Puede ver el envío, cargar los archivos de revisión y enviarnos su revisión iniciando sesión en el sitio de la revista y siguiendo los pasos del siguiente enlace.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Resumen</b></p>{$submissionAbstract}<p>Por favor, <a href=\"{$reviewAssignmentUrl}\">acepte o rechace</a> la revisión antes del <b>{$responseDueDate}</b>.</p><p>Puede ponerse en contacto con nosotros si tiene alguna pregunta sobre el envío o el proceso de revisión.</p><p>Gracias por considerar esta solicitud. Apreciamos mucho su ayuda.</p><p>Atentamente,</p>{$signature}'),
(768, 'REVIEW_REQUEST_SUBSEQUENT', 'es', 'Solicitud de revisión posterior', 'Solicitud para revisar un envío ya revisado', '<p>Estimado/a {$recipientName},</p><p>Le agradecemos su revisión de <a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a>. Los autores/as han tenido en cuenta los comentarios de los revisores/as y han enviado una versión revisada de su trabajo. Le escribo para preguntarle si podría realizar una segunda ronda de revisión por pares de este envío.</p><p>Si está disponible para revisar este envío, debería devolvernos su revisión antes del {$reviewDueDate}. Puede <a href=\"{$reviewAssignmentUrl}\">seguir los pasos de revisión</a> para ver el envío, cargar archivos de revisión y enviar sus comentarios de revisión.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Resumen</b></p>{$submissionAbstract}<p>Por favor, <a href=\"{$reviewAssignmentUrl}\">acepte o rechace</a> la revisión antes del <b>{$responseDueDate}</b>.</p><p>No dude en ponerse en contacto con nosotros si tiene alguna pregunta sobre el envío o el proceso de revisión.</p><p>Gracias por considerar esta solicitud. Apreciamos mucho su ayuda.</p><p>Atentamente,</p>{$signature}'),
(769, 'REVIEW_RESPONSE_OVERDUE_AUTO', 'es', 'Respuesta de revisión vencida (automática)', '¿Podrá llevar a cabo la revisión?', '<p>Estimado/a {$recipientName},</p><p>Este correo electrónico es un recordatorio automático de {$journalName} en relación con la solicitud de revisión del envío, \"{$submissionTitle}.\"</p><p>El motivo de este mensaje es que aún no hemos recibido la confirmación de si podrá llevar a cabo la revisión de este envío.</p><p>Por favor, háganos saber su decisión mediante nuestro software de gestión de envíos aceptando o rechazando dicha solicitud.</p><p>Si está dispuesto a aceptar el encargo, su revisión debería estar lista el {$reviewDueDate}. Puede seguir los pasos de revisión para visualizar el envío, cargar archivos de revisión y enviar sus comentarios.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Resumen</b></p>{$submissionAbstract}<p>No dude en ponerse en contacto con nosotros si tiene cualquier pregunta acerca del envío o del proceso de revisión.</p><p>Gracias por tomar en consideración esta petición. Su ayuda es muy valiosa.</p><p>Saludos cordiales,</p>{$journalSignature}'),
(770, 'REVIEW_CONFIRM', 'es', 'Confirmación de la revisión', 'Revisión aceptada: {$reviewerName} aceptó la asignación de revisión de #{$submissionId} {$authorsShort} — {$submissionTitle}', 'Editores/as:<br />\n<br />\nTengo la capacidad y deseo revisar el envío &quot;{$submissionTitle},&quot; para {$journalName}. Gracias por acordarse de mí, es mi intención tener la revisión completa en el plazo indicado: {$reviewDueDate}, a ser posible antes.<br />\n<br />\n{$senderName}'),
(771, 'REVIEW_DECLINE', 'es', 'Rechazo de la revisión', 'Rechazo la revisión', 'Editores/as:<br />\n<br />\nMe temo que en este momento no voy a poder revisar el envío &quot;{$submissionTitle},&quot; para {$journalName}. Gracias por pensar en mí, espero que vuelvan a contar conmigo en futuras ocasiones.<br />\n<br />\n{$senderName}'),
(772, 'REVIEW_ACK', 'es', 'Agradecimiento por la revisión', 'Gracias por su revisión', '<p>Estimado/a {$recipientName},</p>\n<p>Gracias por completar la revisión del envío, {$submissionTitle}, para {$journalName}. Le agradecemos su tiempo y su pericia, que contribuyen a la calidad de las obras que publicamos.</p>\n<p>Ha sido un placer trabajar con usted como revisor/a para {$journalName}, y esperamos tener la oportunidad de seguir haciéndolo en el futuro.</p>\n<p>Saludos cordiales,</p>\n<p>{$signature}</p>'),
(773, 'REVIEW_REMIND', 'es', 'Recordatorio de la revisión', 'Recordatorio para que complete la revisión', '<p>Estimado/a {$recipientName},</p><p>Esto es solo un amable recordatorio de nuestra solicitud de revisión del artículo \"{$submissionTitle}\" para {$journalName}. Esperábamos recibir la revisión el {$reviewDueDate}, por lo que nos complacería recibirla tan pronto como sea posible.</p><p>Puede <a href=\"{$reviewAssignmentUrl}\">iniciar sesión en la revista</a> y seguir los pasos de revisión para ver el artículo, cargar archivos de revisión y enviar sus comentarios.</p><p>Si necesita una prórroga en la fecha límite, póngase en contacto con nosotros. Espero tener noticias suyas pronto.</p><p>Muchas gracias y cordiales saludos,</p>{$signature}'),
(774, 'REVIEW_REMIND_AUTO', 'es', 'Recordatorio de revisión (automático)', 'Recordatorio para que complete su revisión', '<p>Estimado/a {$recipientName}:</p><p>Este correo electrónico es un recordatorio automático de {$journalName} en relación con nuestra solicitud de revisión del envío \"{$submissionTitle}\".</p><p>Esperábamos disponer de esta revisión el {$reviewDueDate} y nos complacería recibirla tan pronto como sea posible.</p><p>Por favor, <a href=\"{$reviewAssignmentUrl}\">inicie sesión en la revista</a> y siga los pasos de revisión para ver el artículo, cargar archivos de revisión y enviar sus comentarios de revisión.</p><p>Si necesita una extensión de la fecha límite, póngase en contacto con nosotros. Espero tener noticias suyas pronto.</p><p>Muchas gracias y saludos cordiales,</p>{$journalSignature}'),
(775, 'REVIEW_COMPLETE', 'es', 'Revisión finalizada', 'Revisión completada: {$reviewerName} recomienda {$reviewRecommendation} para #{$submissionId} {$authorsShort} — {$submissionTitle}', ''),
(776, 'REVIEW_EDIT', 'es', 'Revisión editada', 'Se ha modificado su asignación de revisión para {$journalName}', ''),
(777, 'EDITOR_DECISION_ACCEPT', 'es', 'Envío aceptado', 'Su envío a {$journalName} ha sido aceptado', '<p>Estimado/a {$recipientName},</p><p>Nos complace informarle de que hemos decidido aceptar su envío sin necesidad de realizar más revisiones. Tras una minuciosa revisión le confirmamos que su artículo \"{$submissionTitle}\" cumple o supera nuestras expectativas. Estamos entusiasmados por publicar su trabajo en {$journalName} y le agradecemos que haya elegido nuestra revista como hogar de su obra.</p><p>Su envío se publicará en un número futuro de {$journalName}, le invitamos a incluirlo en su lista de publicaciones. Reconocemos el arduo trabajo que conlleva cada envío exitoso, así que queremos felicitarlo por haber alcanzado esta fase.</p><p>Ahora su envío será sometido a edición y formateo para prepararlo para su publicación.</p><p>Pronto recibirá más instrucciones.</p><p>Si tiene alguna pregunta, póngase en contacto con nosotros a través del <a href=\"{$authorSubmissionUrl}\">panel de envío</a>.</p><p>Atentamente,</p>{$signature}'),
(778, 'EDITOR_DECISION_SEND_TO_EXTERNAL', 'es', 'Enviar a revisión', 'Su envío se ha enviado a revisión', '<p>Estimado/a {$recipientName},</p><p>Me complace anunciarle que un editor/a ha revisado su envío, {$submissionTitle}, y ha decidido remitirlo a evaluación por pares. El editor/a identificará a revisores/as cualificados que aportarán comentarios sobre su envío.</p><p>{$reviewTypeDescription} Le enviaremos dichos comentarios y la información acerca de los próximos pasos.</p><p>Tenga en cuenta que el hecho de enviar su artículo a evaluación por pares no garantiza que se acabe publicando. Consideraremos las recomendaciones de los revisores/as antes de decidir si aceptamos el envío para publicarse. Podríamos solicitarle que haga revisiones y responda a los comentarios de los revisores/as antes de tomar la decisión final.</p><p>Si tiene cualquier duda puede contactar con nosotros desde su panel de control del envío.</p><p>{$signature}</p>'),
(779, 'EDITOR_DECISION_SEND_TO_PRODUCTION', 'es', 'Enviar a producción', 'Próximos pasos para publicar su envío', '<p>Estimado/a {$recipientName},</p><p>Le escribo de {$journalName} para informarle de que la edición de su envío, {$submissionTitle}, ha finalizado. Ahora su envío avanzará a la fase de producción, donde prepararemos las galeradas finales para su publicación. Nos pondremos en contacto con usted si necesitamos más ayuda.</p><p>Si tiene cualquier duda contacte con nosotros desde su <a href=\"{$authorSubmissionUrl}\">panel de control del envío</a>.</p><p>Saludos cordiales,</p>{$signature}'),
(780, 'EDITOR_DECISION_REVISIONS', 'es', 'Revisiones solicitadas', 'Su envío se ha revisado y le animamos a que tramite sus revisiones', '<p>Estimado/a {$recipientName},</p><p>Su envío {$submissionTitle} ha sido revisado y nos gustaría animarlo a que nos remita las revisiones que respondan a los comentarios de los revisores/as. Un editor/a examinará dichas revisiones y, si resuelven adecuadamente los problemas, su envío podrá ser aceptado para publicarse.</p><p>Los comentarios de los revisores/as se incluyen al final de este correo electrónico. Responda a cada uno de los punto de los comentarios de los revisores/as e identifique los cambios que haya hecho. Si considera que alguno de los comentarios de los revisores/as no está justificado o es inapropiado, explíquenos su punto de vista.</p><p>Cuando haya completado las revisiones puede cargar los documentos revisados, junto con la respuesta a los comentarios de los revisores/as, en su <a href=\"{$authorSubmissionUrl}\">panel de control del envío</a>. Si ha cerrado la sesión puede volver a iniciarla con su nombre de usuario/a {$recipientUsername}.</p><p>Si tiene cualquier pregunta no dude en contactarnos desde su <a href=\"{$authorSubmissionUrl}\">panel de control del envío</a>.</p><p>Quedamos a la espera de recibir su envío revisado.</p><p>Saludos cordiales,</p>{$signature}<hr><p>Se recibieron los siguientes comentarios de los revisores/as.</p>{$allReviewerComments}'),
(781, 'EDITOR_DECISION_RESUBMIT', 'es', 'Reenviar para revisión', 'Se ha revisado su envío. Por favor, revíselo y vuelva a enviarlo', '<p>Estimado/a {$recipientName},</p><p>Tras revisar su envío, {$submissionTitle}, los revisores/as han recomendado que no puede ser aceptado para publicarse en su estado actual. No obstante, nos gustaría animarle a que nos envíe una versión revisada que tenga en cuenta los comentarios de los revisores/as. Los cambios serán revisados por el editor/a y el artículo podría ser enviado a una nueva ronda de evaluación por pares.</p><p>Tenga en cuenta que el hecho de volver a enviar su artículo no garantiza que sea aceptado.</p><p>Los comentarios de los revisores/as se incluyen al final de este correo electrónico. Por favor, responda a cada punto e identifique los cambios que haga. Si considera inapropiado algún comentario de los revisores/as, explíquenos su punto de vista. Si tiene dudas acerca de las recomendaciones en su revisión, inclúyalas en su respuesta.</p><p>Cuando haya completado las revisiones puede cargar los documentos revisados, junto con la respuesta a los comentarios de los revisores/as, en su <a href=\"{$authorSubmissionUrl}\">panel de control del envío</a>. Si ha cerrado la sesión puede volver a iniciarla con su nombre de usuario/a {$recipientUsername}.</p><p>Si tiene cualquier pregunta no dude en contactarnos desde su <a href=\"{$authorSubmissionUrl}\">panel de control del envío</a>.</p><p>Quedamos a la espera de recibir su envío revisado.</p><p>Saludos cordiales,</p>{$signature}<hr><p>Se recibieron los siguientes comentarios de los revisores/as.</p>{$allReviewerComments}'),
(782, 'EDITOR_DECISION_DECLINE', 'es', 'Envío rechazado', 'Se ha rechazado su envío', '<p>Estimado/a{$recipientName},</p><p>Aunque valoramos mucho la recepción de su envío, de acuerdo con los comentarios de los revisores/as no podemos aceptar {$submissionTitle} para publicarse.</p><p>Dichos comentarios se incluyen al final de este correo electrónico.</p><p>Gracias por su envío a {$journalName}. A pesar de que es decepcionante que se rechace el envío, esperamos que los comentarios de los revisores/as le resulten constructivos y útiles.</p><p>Ahora es libre de presentar el trabajo en otro sitio si así lo desea.</p><p>Saludos cordiales,</p>{$signature}<hr><p>Se recibieron los siguientes comentarios de los revisores.</p>{$allReviewerComments}'),
(783, 'EDITOR_DECISION_INITIAL_DECLINE', 'es', 'Envío rechazado (antes de revisión)', 'Su envío ha sido rechazado', '<p>Estimado/a {$recipientName},</p><p>Lamento informarlo de que, tras la revisión de su artículo, {$submissionTitle}, el editor/a ha considerado que no cumple los requisitos de publicación en {$journalName}.</p><p>Le deseo mucha suerte si decide enviarlo a otro sitio.</p><p>Saludos cordiales,</p>{$signature}'),
(784, 'EDITOR_RECOMMENDATION', 'es', 'Recomendación hecha', 'Recomendación del editor/a', '<p>Estimado/a{$recipientName},</p><p>Tras considerar los comentarios de los revisores/as, me gustaría emitir la siguiente recomendación en relación con su envío {$submissionTitle}.</p><p>Mi recomendación es: {$recommendation}.</p><p>Visite el <a href=\"{$submissionUrl}\">flujo editorial</a> del envío para actuar sobre esta recomendación.</p><p>Si tiene alguna pregunta, no dude en ponerse en contacto conmigo.</p><p>Saludos cordiales,</p><p>{$senderName}</p>'),
(785, 'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS', 'es', 'Notificar a los otros autores/as', 'Actualización acerca de su envío', '<p>El siguiente correo electrónico fue enviado a {$submittingAuthorName} desde {$journalName} en relación con {$submissionTitle}.</p>\n<p>El motivo por el que recibe una copia de esta notificación es porque está identificado como autor/a de este envío. Las instrucciones que figuran en el siguiente mensaje se dirigen al autor/a principal del envío, {$submittingAuthorName}, por lo que no se requiere ninguna acción suya en este momento.</p>\n\n{$messageToSubmittingAuthor}'),
(786, 'EDITOR_DECISION_NOTIFY_REVIEWERS', 'es', 'Notificar a los revisores/as de la decisión', 'Gracias por su revisión', '<p>Estimado/a {$recipientName},</p>\n<p>Gracias por completar la revisión del envío, {$submissionTitle}, para {$journalName}. Le agradecemos su tiempo y su pericia, que contribuyen a la calidad de las obras que publicamos. Hemos compartido sus comentarios con los autores/as, junto con los comentarios de los otros revisores/as y la decisión editorial.</p>\n<p>A partir de los comentarios recibidos, hemos notificado a los autores/as lo siguiente:</p>\n<p>{$decisionDescription}</p>\n<p>Su recomendación, junto con la de otros revisores/as, se ha considerado antes de llegar a una decisión final. A veces, la decisión del editor/a puede diferir de la recomendación hecha por uno o más revisores/as. El editor/a tiene en cuenta muchos factores y no se toma estas decisiones a la ligera. Estamos muy agradecidos por la pericia y las sugerencias de nuestros revisores/as.</p>\n<p>Ha sido un placer trabajar con usted como revisor/a para {$journalName}, y esperamos tener la oportunidad de seguir haciéndolo en el futuro.</p>\n<p>Saludos cordiales,</p>\n<p>{$signature}</p>'),
(787, 'EDITOR_DECISION_NEW_ROUND', 'es', 'Se inició una ronda de revisión nueva', 'Su envío se ha tramitado a otra ronda de revisión', '<p>Estimado/a {$recipientName},</p>\n<p>Su manuscrito revisado, {$submissionTitle}, se ha enviado a una ronda de evaluación por pares nueva.\nLe comunicaremos los comentarios de los revisores/as y la información sobre los próximos pasos.</p>\n<p>Si tiene cualquier pregunta puede contactar con nosotros desde el <a href=\"{$authorSubmissionUrl}\">panel de control del envío</a>.</p>\n<p>Saludos cordiales,</p>\n<p>{$signature}</p>\n'),
(788, 'EDITOR_DECISION_REVERT_DECLINE', 'es', 'Restaurar envío rechazado', 'Hemos revertido la decisión de rechazar su envío', '<p>Estimado/a {$recipientName},</p>\n<p>La decisión de rechazar su envío, {$submissionTitle}, se ha revertido.\nUn editor/a completará la ronda de revisión y, cuando se haya tomado una decisión, \nse le notificará.</p>\n<p>A veces se registra accidentalmente en nuestro sistema la decisión de rechazar un envío\ny esta acción debe ser revertida. Le pedimos disculpas por la confusión que esto le haya podido causar.</p>\n<p>Nos pondremos en contacto con usted si necesitamos más ayuda.</p>\n<p>Si tiene cualquier pregunta puede contactarnos desde el <a href=\"{$authorSubmissionUrl}\">panel de control del envío</a>.</p>\n<p>Saludos cordiales,</p>\n<p>{$signature}</p>\n'),
(789, 'EDITOR_DECISION_REVERT_INITIAL_DECLINE', 'es', 'Restaurar el envío rechazado sin revisión', 'Hemos revertido la decisión de rechazar su envío', '<p>Estimado/a {$recipientName},</p>\n<p>La decisión de rechazar su envío, {$submissionTitle}, se ha revertido. \nUn editor/a estudiará su propuesta antes de decidir si la rechaza \no la envía a revisión.</p>\n<p>A veces se registra accidentalmente en nuestro sistema la decisión de rechazar un envío\ny esta acción debe ser revertida. Le pedimos disculpas por la confusión que esto le haya podido causar.</p>\n<p>Nos pondremos en contacto con usted si necesitamos más ayuda.</p>\n<p>Si tiene cualquier pregunta puede contactarnos desde el <a href=\"{$authorSubmissionUrl}\">panel de control del envío</a>.</p>\n<p>Saludos cordiales,</p>\n<p>{$signature}</p>\n'),
(790, 'EDITOR_DECISION_SKIP_REVIEW', 'es', 'Envío aceptado (sin revisión)', 'Su artículo se ha enviado a edición', '<p>Estimado/a {$recipientName},</p>\n<p>Me complace informarle de que hemos decidido aceptar su envío sin pasar por la fase de revisión por pares. Le confirmamos que su envío \"{$submissionTitle}\" cumple con nuestras expectativas, por lo que no necesitamos que este tipo de trabajo pase por la fase de revisión por pares. Estamos emocionados por publicar su trabajo en {$journalName} y le agradecemos que haya elegido nuestra revista como hogar de su trabajo.</p>\n<p>Su envío se publicará en un número futuro de {$journalName}, así que le invitamos a incluirlo en su lista de publicaciones. Reconocemos el arduo trabajo que implica cada envío exitoso y queremos felicitarle por sus esfuerzos.</p>\n<p>Ahora su envío pasará a edición y formateo para su posterior publicación. </p>\n<p>En breve recibirá más instrucciones.</p>\n<p>Si tiene alguna pregunta, póngase en contacto con nosotros a través de su <a href=\"{$authorSubmissionUrl}\">panel de envíos</a>.</p>\n<p>Atentamente,</p>\n<p>{$signature}</p>\n'),
(791, 'EDITOR_DECISION_BACK_FROM_PRODUCTION', 'es', 'Se ha retornado el envío a Edición', 'Su envío se ha devuelto a edición', '<p>Estimado/a {$recipientName},</p><p>Su envío, {$submissionTitle}, se ha devuelto a la fase de edición, donde se someterá a una nueva corrección y formateo para prepararlo para su publicación.</p><p>A veces, un envío pasa a la fase de producción antes de estar listo para preparar las galeradas finales que se utilizarán para su publicación. Su envío aún está en preparación. Lamentamos cualquier confusión que le hayamos causado.</p><p>Si tiene cualquier duda puede contactarnos desde su <a href=\"{$authorSubmissionUrl}\">panel de control del envío</a>.</p><p>Nos pondremos en contacto con usted si necesitamos más ayuda.</p><p>Saludos cordiales,</p><p>{$signature}</p>'),
(792, 'EDITOR_DECISION_BACK_FROM_COPYEDITING', 'es', 'Envío retornado desde Edición', 'Su envío se ha devuelto a revisión', '<p>Estimado/a {$recipientName},</p><p>Su envío, {$submissionTitle}, se ha devuelto a la fase de revisión, donde se someterá a una nueva revisión antes de ser aceptado para su publicación.</p><p>A veces, la decisión de aceptar un envío puede registrarse accidentalmente en el sistema y por ello debemos enviarlo de nuevo a revisión. Lamentamos cualquier confusión que le hayamos causado. Nos encargaremos de completar rápidamente cualquier otra revisión para darle la decisión final lo antes posible.</p><p>Nos pondremos en contacto con usted si necesitamos más ayuda.</p><p>Si tiene cualquier duda puede contactarnos desde su <a href=\"{$authorSubmissionUrl}\">panel de control del envío</a>.</p><p>Saludos cordiales,</p><p>{$signature}</p>'),
(793, 'EDITOR_DECISION_CANCEL_REVIEW_ROUND', 'es', 'Ronda de revisión cancelada', 'Se ha cancelado una ronda de revisión de su envío', '<p>Estimado/a {$recipientName},</p><p>Hace poco iniciamos una ronda de revisión nueva para su envío, {$submissionTitle}. Ahora la vamos a cerrar.</p><p>A veces, la decisión de iniciar una ronda de revisión nueva puede registrarse accidentalmente en el sistema y por ello debemos cancelarla. Lamentamos cualquier confusión que le hayamos causado.</p><p>Nos pondremos en contacto con usted si necesitamos más ayuda.</p><p>Si tiene cualquier duda puede contactarnos desde su <a href=\"{$authorSubmissionUrl}\">panel de control del envío</a>.</p><p>Saludos cordiales,</p><p>{$signature}</p>'),
(794, 'SUBSCRIPTION_NOTIFY', 'es', 'Notificación de suscripción', 'Notificación de suscripción', '{$recipientName}:<br />\n<br />\nAcaba de registrarse como suscriptor/a en nuestro sistema de gestión de revistas online para la revista {$journalName}, a continuación le mostramos los datos de su suscripción:<br />\n<br />\n{$subscriptionType}<br />\n<br />\nPara acceder al contenido exclusivo para suscriptores/as, simplemente tiene que identificarse con su nombre de usuaria/o, &quot;{$recipientUsername}&quot;.<br />\n<br />\nUna vez se haya identificado en el sistema puede cambiar los detalles de su perfil y su contraseña en cualquier momento.<br />\n<br />\nTenga en cuenta que si se trata de una suscripción institucional no es necesario que los/as usuarios/as de su institución se identifiquen, ya que las peticiones de contenido bajo suscripción serán autentificadas automáticamente por el sistema.<br />\n<br />\nSi tiene cualquier pregunta no dude en contactar con nosotros/as.<br />\n<br />\n{$subscriptionSignature}'),
(795, 'OPEN_ACCESS_NOTIFY', 'es', 'Notificación de acceso abierto', 'Acceso libre: {$issueIdentification} de {$journalName} ahora está disponible en acceso abierto', '<p>Estimado/a {$recipientName},</p><p>Nos complace informarle de que <a href=\"{$issueUrl}\">{$issueIdentification}</a> de {$journalName} ya está disponible en acceso abierto. Por lo tanto, ya no es necesaria una suscripción para leer este número.</p><p>Gracias por mantener el interés en nuestro trabajo.</p>{$journalSignature}'),
(796, 'SUBSCRIPTION_BEFORE_EXPIRY', 'es', 'La suscripción caduca pronto', 'Notificación de expiración de suscripción', '{$recipientName}:<br />\n<br />\n	Su suscripción a {$journalName} está a punto de caducar.<br />\n<br />\n	{$subscriptionType}<br />\n	Fecha de caducidad: {$expiryDate}<br />\n<br />\n	Para asegurarse de que continúa teniendo acceso a la revista, acceda a la página web de la revista y renueve su suscripción. Puede iniciar sesión en el sistema con su nombre de usuario/a, &quot;{$recipientUsername}&quot;.<br />\n<br />\n	Si tiene cualquier pregunta no dude en contactarme.<br />\n<br />\n	{$subscriptionSignature}'),
(797, 'SUBSCRIPTION_AFTER_EXPIRY', 'es', 'Suscripción caducada', 'Subscripción expirada', '{$recipientName}:<br />\n<br />\n	Su suscripción a {$journalName} ha caducado.<br />\n<br />\n	{$subscriptionType}<br />\n	Fecha de caducidad: {$expiryDate}<br />\n<br />\n	Para renovar su suscripción acceda a la página web de la revista. Puede iniciar sesión en el sistema con su nombre de usuario/a, &quot;{$recipientUsername}&quot;.<br />\n<br />\n	Si tiene cualquier pregunta no dude en contactarme.<br />\n<br />\n	{$subscriptionSignature}'),
(798, 'SUBSCRIPTION_AFTER_EXPIRY_LAST', 'es', 'Última suscripción caducada', 'Suscripción expirada - Último recordatorio', '{$recipientName}:<br />\n<br />\n	Su suscripción a {$journalName} ha caducado.<br />\n	Tenga en cuenta que este es el último correo que recibirá para recordárselo.<br />\n<br />\n	{$subscriptionType}<br />\n	Fecha de caducidad: {$expiryDate}<br />\n<br />\n	Para renovar su suscripción acceda a la página web de la revista. Puede iniciar sesión en el sistema con su nombre de usuario/a, &quot;{$recipientUsername}&quot;.<br />\n<br />\n	Si tiene cualquier pregunta no dude en contactarme.<br />\n<br />\n	{$subscriptionSignature}'),
(799, 'SUBSCRIPTION_PURCHASE_INDL', 'es', 'Adquirir suscripción individual', 'Compra de suscripción: Individual', 'Se ha adquirido en línea una suscripción individual para {$journalName} con los detalles siguientes:<br />\n<br />\nTipo de suscripción:<br />\n{$subscriptionType}<br />\n<br />\nUsuario/a:<br />\n{$subscriberDetails}<br />\n<br />\nInformación de membresía (si se proporciona):<br />\n{$membership}<br />\n<br />\nPara ver o editar esta suscripción, use la siguiente URL.<br />\n<br />\nURL de la suscripción: {$subscriptionUrl}<br />\n'),
(800, 'SUBSCRIPTION_PURCHASE_INSTL', 'es', 'Adquirir suscripción institucional', 'Compra de suscripción: Institucional', 'Se ha adquirido en línea una suscripción institucional para {$journalName} con los siguientes detalles. Para activar la suscripción, use el enlace proporcionado y configure el estado de la suscripción como \'Activo\'.<br />\n<br />\nTipo de suscripción:<br />\n{$subscriptionType}<br />\n<br />\nInstitución:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDominio (si se proporciona):<br />\n{$domain}<br />\n<br />\nRangos de IP (si se proporcionan):<br />\n{$ipRanges}<br />\n<br />\nPersona de contacto:<br />\n{$subscriberDetails}<br />\n<br />\nInformación de membresía (si se proporciona):<br />\n{$membership}<br />\n<br />\nPara ver o editar esta suscripción, use el siguiente enlace.<br />\n<br />\nEnlace de la suscripción: {$subscriptionUrl}<br />\n'),
(801, 'SUBSCRIPTION_RENEW_INDL', 'es', 'Renovar suscripción individual', 'Renovación de suscripción: Individual', 'Una suscripción individual ha sido renovada en línea para {$journalName} con los siguientes detalles.<br />\n<br />\nTipo de suscripción:<br />\n{$subscriptionType}<br />\n<br />\nUsuario/a:<br />\n{$subscriberDetails}<br />\n<br />\nInformación de membresía (si se proporciona):<br />\n{$membership}<br />\n<br />\nPara ver o editar esta suscripción use la siguiente URL:<br />\n<br />\nURL para gestionar la suscripción: {$subscriptionUrl}<br />\n'),
(802, 'SUBSCRIPTION_RENEW_INSTL', 'es', 'Renovar suscripción institucional', 'Renovación de suscripción: Institucional', 'Se ha renovado en línea una suscripción institucional para {$journalName} con los detalles siguientes.<br />\n<br />\nTipo de suscripción:<br />\n{$subscriptionType}<br />\n<br />\nInstitución:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDominio (si se proporciona):<br />\n{$domain}<br />\n<br />\nRangos IP (si se proporcionan):<br />\n{$ipRanges}<br />\n<br />\nPersona de contacto:<br />\n{$subscriberDetails}<br />\n<br />\nInformación de membresía (si se proporciona):<br />\n{$membership}<br />\n<br />\nPara ver o editar esta suscripción use la siguiente URL:<br />\n<br />\nURL para gestionar la suscripción: {$subscriptionUrl}<br />\n'),
(803, 'REVISED_VERSION_NOTIFY', 'es', 'Notificación de versión revisada', 'Versión revisada cargada', '<p>Estimado/a {$recipientName},</p><p>El autor/a ha cargado revisiones para el envío, <b>{$authorsShort} — {$submissionTitle}</b>.</p><p>Como editor/a asignado, le solicitamos que inicie sesión, <a href=\"{$submissionUrl}\">visualice las revisiones</a> y tome la decisión de aceptar, rechazar o remitir el envío a otra revisión.</p><br><br>—<br>Este es un mensaje automatizado de <a href=\"{$journalUrl}\">{$journalName}</a>.'),
(804, 'STATISTICS_REPORT_NOTIFICATION', 'es', 'Notificación de informe de estadísticas', 'Actividad editorial por {$month}, {$year}', '\n{$recipientName}, <br />\n<br />\nEl informe de estado de su revista de {$month}, {$year} ya está disponible. Las estadísticas clave de este mes son las siguientes.<br />\n<ul>\n	<li>Nuevos envíos este mes: {$newSubmissions}</li>\n	<li>Envíos rechazados este mes: {$declinedSubmissions}</li>\n	<li>Envíos aceptados este mes: {$acceptedSubmissions}</li>\n	<li>Envíos totales en el sistema: {$totalSubmissions}</li>\n</ul>\nInicie sesión en la revista para obtener más detalles sobre las <a href=\"{$editorialStatsLink}\">tendencias editoriales</a> y las <a href=\"{$publicationStatsLink}\">estadísticas de artículos publicados</a>. Se adjunta una copia completa del informe correspondiente a este mes .<br />\n<br />\nSaludos cordiales,<br />\n{$journalSignature}'),
(805, 'ANNOUNCEMENT', 'es', 'Nuevo aviso', '{$announcementTitle}', '<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisite nuestro site para leer el <a href=\"{$announcementUrl}\">anuncio completo</a>.'),
(806, 'DISCUSSION_NOTIFICATION_SUBMISSION', 'es', 'Discusión (envío)', 'Mensaje sobre {$journalName}', 'Introduzca su mensaje.'),
(807, 'DISCUSSION_NOTIFICATION_REVIEW', 'es', 'Discusión (revisión)', 'Mensaje sobre {$journalName}', 'Introduzca su mensaje.'),
(808, 'DISCUSSION_NOTIFICATION_COPYEDITING', 'es', 'Discusión (edición)', 'Mensaje sobre {$journalName}', 'Introduzca su mensaje.'),
(809, 'DISCUSSION_NOTIFICATION_PRODUCTION', 'es', 'Discusión (producción)', 'Mensaje sobre {$journalName}', 'Introduzca su mensaje.'),
(810, 'COPYEDIT_REQUEST', 'es', 'Solicitar corrección', 'El envío {$submissionId} está listo para ser corregido para {$contextAcronym}', '<p>Estimado/a{$recipientName},</p><p>Hay un envío nuevo listo para ser corregido:</p><p><a href\"{$submissionUrl}\">{$submissionId} — {$submissionTitle}</a><br />{$journalName}</p><p>Siga estos pasos para completar la tarea:</p><ol><li>Haga clic en la URL del envío que encontrará más abajo.</li><li>Abra todos los archivos disponibles en \"Borradores finales\" y haga la corrección. Utilice las \"Discusiones de corrección\" si necesita contactar con editores/as o autores/as.</li><li>Guarde los archivos corregidos y cárguelos en el panel \"Corregido\".</li><li>Utilice las \"Discusiones de corrección\" para notificar a los editores/as que los documentos están preparados y que el proceso de producción podría empezar.</li></ol><p>Si no puede llevar a cabo esta tarea en este momento, o si tiene cualquier duda, contacte conmigo por favor. Gracias por su contribución a {$journalName}.</p><p>Saludos cordiales,</p>{$signature}'),
(811, 'EDITOR_ASSIGN_SUBMISSION', 'es', 'Asignar editor/a', 'Ha sido asignado como editor/a de un envío para {$journalName}', '<p>Estimado/a {$recipientName},</p><p>Se le ha asignado el siguiente envío para que coordine su proceso editorial.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Resumen</b></p>{$submissionAbstract}<p>Si le parece que el envío es relevante para {$journalName}, envíelo a la fase de revisión seleccionando \"Enviar a revisión\" y luego asigne revisores/as haciendo clic en \"Añadir revisor/a\".</p><p>Si el envío no es apropiado para esta revista, rechácelo.</p><p>Gracias de antemano.</p><p>Atentamente,</p>{$journalSignature}'),
(812, 'EDITOR_ASSIGN_REVIEW', 'es', 'Asignar editor/a', 'Ha sido asignado como editor/a de un envío para {$journalName}', '<p>Estimado/a {$recipientName},</p><p>Se le ha asignado el siguiente envío para que lo supervise durante el proceso de revisión por pares.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Resumen</b></p>{$submissionAbstract}<p>Inicie sesión para <a href=\"{$submissionUrl}\">ver el envío</a> y asignar revisores/as cualificados. Puede asignar un revisor/a haciendo clic en \"Añadir revisor/a\".</p><p>Gracias de antemano.</p><p>Atentamente,</p>{$signature}');
INSERT INTO `email_templates_default_data` (`email_templates_default_data_id`, `email_key`, `locale`, `name`, `subject`, `body`) VALUES
(813, 'EDITOR_ASSIGN_PRODUCTION', 'es', 'Asignar editor/a', 'Ha sido asignado como editor/a de un envío para {$journalName}', '<p>Estimado/a {$recipientName},</p><p>Se le ha asignado el siguiente envío para que coordine su fase de producción.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Resumen</b></p>{$submissionAbstract}<p>Inicie sesión para <a href=\"{$submissionUrl}\">ver el envío</a>. Cuando estén disponibles los archivos de producción cárguelos en la sección <strong>Publicación > Galeradas</strong>. Después programe el trabajo para su publicación haciendo clic en el botón <strong>Programar para publicación</strong>.</p><p>Gracias de antemano.</p><p>Atentamente,</p>{$signature}'),
(814, 'LAYOUT_REQUEST', 'es', 'Listo para producción', 'El envío {$submissionId} está listo para producción en {$contextAcronym}', '<p>Estimado/a {$recipientName},</p><p>Un nuevo envío está listo para la maquetación:</p><p><a href=\"{$submissionUrl}\">{$submissionId} — {$submissionTitle}</a><br />{$journalName}</p><ol><li>Haga clic en la URL anterior.</li><li>Descargue los archivos de producción y utilícelos para crear las galeradas de acuerdo con los estándares de la revista.</li><li>Cargue las galeradas en la sección de publicación del envío.</li><li>Use las discusiones de producción para notificar al editor/a que las galeradas están listas.</li></ol><p>Si no puede llevar a cabo este trabajo en este momento o tiene alguna pregunta, póngase en contacto con nosotros. Gracias por su contribución a esta revista.</p><p>Atentamente,</p>{$signature}'),
(815, 'LAYOUT_COMPLETE', 'es', 'Galeradas completas', 'Galeradas completadas', '<p>Estimado/a {$recipientName},</p><p>Le informamos que las galeradas del siguiente envío ya han sido preparadas y están listas para su revisión final.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$journalName}</p><p>Si tiene alguna pregunta, póngase en contacto con nosotros.</p><p>Atentamente,</p><p>{$signature}</p>'),
(816, 'VERSION_CREATED', 'es', 'Versión creada', 'Se ha creado una versión nueva de {$submissionTitle}', ''),
(817, 'EDITORIAL_REMINDER', 'es', 'Recordatorio editorial', 'Tareas editoriales pendientes de {$journalName}', '<p>Estimado/a {$recipientName},</p><p>Actualmente tiene asignado(s) {$numberOfSubmissions} envío(s) en <a href=\"{$journalUrl}\">{$journalName}</a>. Los envíos siguientes están <b>esperando su respuesta</b>.</p>{$outstandingTasks}<p>Puede ver todas sus tareas en su <a href=\"{$submissionsUrl}\">panel de control del envío</a>.</p><p>Si tiene cualquier duda acerca de sus asignaciones contacte con {$contactName} en {$contactEmail}.</p>'),
(818, 'SUBMISSION_SAVED_FOR_LATER', 'es', 'Se guardó el envío para más adelante', 'Continuar su envío a {$journalName}', ''),
(819, 'SUBMISSION_NEEDS_EDITOR', 'es', 'El envío necesita un editor/a', 'Un envío nuevo necesita que le asignen un editor/a: {$submissionTitle}', ''),
(820, 'PAYMENT_REQUEST_NOTIFICATION', 'es', 'Solicitud de pago', 'Notificación de solicitud de pago', '<p>Estimado/a {$recipientName},</p><p>Le felicitamos por la aceptación de su envío, {$submissionTitle}, en {$journalName}. Ahora que ha sido aceptado, nos gustaría solicitarle el pago de la tasa de publicación.</p><p>Esta tasa cubre los costes de producción para su publicación. Para realizar el pago, visite <a href=\"{$queuedPaymentUrl}\">{$queuedPaymentUrl}</a>.</p><p>Si tiene alguna pregunta consulte nuestras <a href=\"{$submissionGuidelinesUrl}\">directrices de envío</a>.</p>'),
(821, 'ORCID_COLLECT_AUTHOR_ID', 'es', 'orcidCollectAuthorId', 'ORCID de envío', 'Estimado/a {$recipientName},\n<br/>\nSe le ha añadido como coautor/a de un artículo para {$journalName}. <br/>\nPara confirmar su autoría, añada su identificador ORCID a este envío mediante el siguiente enlace.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Registrar o conectar su identificador ORCID</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">Puede encontrar más información sobre ORCID en {$journalName}</a><br/>\n<br/>\nSi tiene cualquier pregunta no dude en contactarme.<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),
(822, 'ORCID_REQUEST_AUTHOR_AUTHORIZATION', 'es', 'orcidRequestAuthorAuthorization', 'Solicitando acceso de registro ORCID', 'Estimado/a {$recipientName},<br>\n<br>\nUsted ha sido incluido como autor en la presentación del manuscrito \"{$submissionTitle}\" a {$journalName}.\n<br>\n<br>\nPermítanos agregar su identificación ORCID a este envío y también agregar el mismo a su perfil ORCID en la publicación.<br>\nVisite el enlace al sitio web oficial de ORCID, inicie sesión con su perfil y autorice el acceso siguiendo las instrucciones.<br>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Registre o conecte su ORCID iD</a><br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">Más acerca de ORCID en{$journalName}</a><br/>\n<br>\nSi tiene alguna pregunta, por favor póngase en contacto conmigo.<br>\n<br>\n{$principalContactSignature}<br>\n'),
(823, 'MANUAL_PAYMENT_NOTIFICATION', 'es', 'Notificación de pago manual', 'Notificación de pago manual', 'Se necesita procesar un pago manual para la revista {$journalName} y el usuario/a {$senderName} (username &quot;{$senderUsername}&quot;).<br />\n<br />\nEl elemento pagado es &quot;{$paymentName}&quot;.<br />\nEl precio es {$paymentAmount} ({$paymentCurrencyCode}).<br />\n<br />\nEste correo ha sido generado por el módulo de pago manual de Open Journal Systems.');

-- --------------------------------------------------------

--
-- Estrutura para tabela `email_templates_settings`
--

CREATE TABLE `email_templates_settings` (
  `email_template_setting_id` bigint(20) UNSIGNED NOT NULL,
  `email_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about custom email templates, including localized properties such as the subject and body.';

--
-- Despejando dados para a tabela `email_templates_settings`
--

INSERT INTO `email_templates_settings` (`email_template_setting_id`, `email_id`, `locale`, `setting_name`, `setting_value`) VALUES
(1, 7, 'pt_BR', 'body', '<p>Prezado(a),</p>\n<p>Devido à sua experiência, tomamos a liberdade de cadastrar seu nome no banco de dados de avaliadores para {$journalName}. Isso não implica qualquer forma de compromisso de sua parte, mas simplesmente nos permite lhe contatar com uma submissão para uma possível avaliação. Ao ser convidado(a) a avaliar, você terá a oportunidade de ver o título e o resumo do artigo em questão e poderá sempre aceitar ou recusar o convite. Você também pode pedir a qualquer momento para remover seu nome desta lista de avaliadores.</p>\n<p>Estamos fornecendo a você um nome de usuário e senha, que são usados em todas as interações com o periódico por meio de seu site. Você pode, por exemplo, atualizar seu perfil, incluindo seus interesses de avaliação.</p>\n<p>Usuário: {$recipientUsername}<br />Senha: {$password}</p>\n<p>Atenciosamente,</p>\n<p>{$signature}</p>'),
(2, 7, 'pt_BR', 'name', 'Cadastro de Avaliador'),
(3, 7, 'pt_BR', 'subject', 'Cadastrado como Avaliador em Revista Científica do ITEP/RN');

-- --------------------------------------------------------

--
-- Estrutura para tabela `event_log`
--

CREATE TABLE `event_log` (
  `log_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL COMMENT 'NULL if it''s system or automated event',
  `date_logged` datetime NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_translated` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A log of all events related to an object like a submission.';

--
-- Despejando dados para a tabela `event_log`
--

INSERT INTO `event_log` (`log_id`, `assoc_type`, `assoc_id`, `user_id`, `date_logged`, `event_type`, `message`, `is_translated`) VALUES
(4, 515, 1, 2, '2025-03-07 13:40:15', 1342177281, 'submission.event.fileUploaded', 0),
(6, 515, 1, 2, '2025-03-07 13:40:23', 1342177296, 'submission.event.fileEdited', 0),
(12, 515, 2, 2, '2025-03-07 13:44:49', 1342177281, 'submission.event.fileUploaded', 0),
(14, 515, 2, 2, '2025-03-07 13:44:57', 1342177296, 'submission.event.fileEdited', 0),
(15, 515, 2, 2, '2025-03-07 13:45:13', 1342177296, 'submission.event.fileEdited', 0),
(18, 515, 3, 1, '2025-03-07 13:46:42', 1342177281, 'submission.event.fileUploaded', 0),
(21, 515, 4, 1, '2025-03-07 13:48:16', 1342177281, 'submission.event.fileUploaded', 0),
(26, 515, 5, 1, '2025-03-07 13:50:53', 1342177281, 'submission.event.fileUploaded', 0),
(28, 515, 5, 1, '2025-03-07 13:50:58', 1342177296, 'submission.event.fileEdited', 0),
(30, 515, 2, 1, '2025-03-07 13:54:15', 1342177288, 'submission.event.revisionUploaded', 0),
(31, 515, 2, 1, '2025-03-07 13:54:19', 1342177296, 'submission.event.fileEdited', 0),
(32, 515, 2, 1, '2025-03-07 13:54:33', 1342177288, 'submission.event.revisionUploaded', 0),
(33, 515, 2, 1, '2025-03-07 13:54:35', 1342177296, 'submission.event.fileEdited', 0),
(36, 515, 3, 1, '2025-03-10 08:37:31', 16777216, 'informationCenter.history.notePosted', 0),
(37, 515, 3, 1, '2025-03-10 08:38:10', 1342177296, 'submission.event.fileEdited', 0),
(38, 515, 6, 1, '2025-03-10 08:38:34', 1342177281, 'submission.event.fileUploaded', 0),
(40, 515, 6, 1, '2025-03-10 08:38:38', 1342177296, 'submission.event.fileEdited', 0),
(45, 515, 7, 1, '2025-03-10 09:11:11', 1342177281, 'submission.event.fileUploaded', 0),
(47, 515, 7, 1, '2025-03-10 09:11:13', 1342177296, 'submission.event.fileEdited', 0),
(50, 515, 8, 1, '2025-03-10 09:14:50', 1342177281, 'submission.event.fileUploaded', 0),
(71, 515, 1, 1, '2025-03-10 09:24:36', 1342177282, 'submission.event.fileDeleted', 0),
(72, 515, 6, 1, '2025-03-10 09:24:50', 1342177282, 'submission.event.fileDeleted', 0),
(73, 515, 3, 1, '2025-03-10 09:24:50', 1342177282, 'submission.event.fileDeleted', 0),
(74, 515, 2, 1, '2025-03-10 09:24:50', 1342177282, 'submission.event.fileDeleted', 0),
(75, 515, 5, 1, '2025-03-10 09:24:53', 1342177282, 'submission.event.fileDeleted', 0),
(78, 515, 9, 1, '2025-03-10 09:34:57', 1342177281, 'submission.event.fileUploaded', 0),
(80, 515, 9, 1, '2025-03-10 09:35:06', 1342177296, 'submission.event.fileEdited', 0),
(81, 515, 10, 1, '2025-03-10 09:35:36', 1342177281, 'submission.event.fileUploaded', 0),
(83, 515, 10, 1, '2025-03-10 09:35:41', 1342177296, 'submission.event.fileEdited', 0),
(86, 1048585, 4, 1, '2025-03-11 13:37:08', 268435458, 'submission.event.general.metadataUpdated', 0),
(87, 1048585, 4, 1, '2025-03-11 13:38:11', 268435458, 'submission.event.general.metadataUpdated', 0),
(88, 1048585, 4, 1, '2025-03-11 13:39:17', 268435458, 'submission.event.general.metadataUpdated', 0),
(89, 515, 11, 1, '2025-03-12 10:47:26', 1342177281, 'submission.event.fileUploaded', 0),
(90, 1048585, 4, 1, '2025-03-12 10:47:34', 1342177288, 'submission.event.fileRevised', 0),
(91, 515, 11, 1, '2025-03-12 10:47:55', 1342177296, 'submission.event.fileEdited', 0),
(92, 1048585, 4, 1, '2025-03-12 10:50:50', 268435457, 'submission.event.submissionSubmitted', 0),
(98, 1048585, 4, 1, '2025-03-12 10:57:26', 805306371, 'editor.submission.decision.sendExternalReview.log', 0),
(99, 515, 12, 1, '2025-03-12 10:57:27', 1342177281, 'submission.event.fileUploaded', 0),
(100, 1048585, 4, 1, '2025-03-12 10:57:29', 1342177288, 'submission.event.fileRevised', 0),
(101, 1048585, 4, 1, '2025-03-12 10:57:43', 805306371, 'editor.submission.decision.accept.log', 0),
(102, 1048585, 4, 1, '2025-03-12 10:57:52', 805306371, 'editor.submission.decision.sendToProduction.log', 0),
(103, 1048585, 4, 1, '2025-03-12 10:58:13', 268435458, 'submission.event.general.metadataUpdated', 0),
(104, 1048585, 4, 1, '2025-03-12 10:58:15', 268435462, 'publication.event.published', 0),
(105, 1048585, 4, 1, '2025-03-12 10:59:01', 268435463, 'publication.event.unpublished', 0),
(106, 1048585, 4, 1, '2025-03-12 10:59:48', 268435458, 'submission.event.general.metadataUpdated', 0),
(107, 1048585, 4, 1, '2025-03-12 11:00:05', 268435458, 'submission.event.general.metadataUpdated', 0),
(108, 1048585, 4, 1, '2025-03-12 11:00:10', 268435462, 'publication.event.published', 0),
(109, 1048585, 4, 1, '2025-03-12 11:01:02', 268435463, 'publication.event.unpublished', 0),
(110, 1048585, 4, 1, '2025-03-12 11:19:25', 268435458, 'submission.event.general.metadataUpdated', 0),
(111, 1048585, 4, 1, '2025-03-12 11:19:58', 268435458, 'submission.event.general.metadataUpdated', 0),
(112, 1048585, 4, 1, '2025-03-12 11:20:00', 268435462, 'publication.event.published', 0),
(113, 515, 10, 1, '2025-03-12 11:21:04', 1342177282, 'submission.event.fileDeleted', 0),
(114, 515, 9, 1, '2025-03-12 11:21:04', 1342177282, 'submission.event.fileDeleted', 0),
(115, 515, 8, 1, '2025-03-12 11:21:04', 1342177282, 'submission.event.fileDeleted', 0),
(116, 515, 7, 1, '2025-03-12 11:21:04', 1342177282, 'submission.event.fileDeleted', 0),
(117, 515, 13, 1, '2025-03-12 11:21:38', 1342177281, 'submission.event.fileUploaded', 0),
(118, 1048585, 4, 1, '2025-03-12 11:21:38', 1342177288, 'submission.event.fileRevised', 0),
(119, 515, 13, 1, '2025-03-12 11:21:45', 1342177296, 'submission.event.fileEdited', 0),
(120, 515, 14, 1, '2025-03-14 15:29:26', 1342177281, 'submission.event.fileUploaded', 0),
(121, 1048585, 4, 1, '2025-03-14 15:29:26', 1342177288, 'submission.event.fileRevised', 0),
(122, 515, 14, 1, '2025-03-14 15:29:32', 1342177296, 'submission.event.fileEdited', 0),
(123, 1048585, 5, 1, '2025-03-17 08:54:23', 268435458, 'submission.event.general.metadataUpdated', 0),
(124, 1048585, 5, 1, '2025-03-17 08:58:36', 268435458, 'submission.event.general.metadataUpdated', 0),
(125, 1048585, 5, 1, '2025-03-17 08:58:50', 268435458, 'submission.event.general.metadataUpdated', 0),
(126, 515, 15, 1, '2025-03-17 08:58:56', 1342177281, 'submission.event.fileUploaded', 0),
(127, 1048585, 5, 1, '2025-03-17 08:58:56', 1342177288, 'submission.event.fileRevised', 0),
(128, 515, 15, 1, '2025-03-17 08:58:58', 1342177296, 'submission.event.fileEdited', 0),
(129, 515, 15, 1, '2025-03-17 08:59:04', 1342177296, 'submission.event.fileEdited', 0),
(130, 1048585, 5, 1, '2025-03-17 09:04:30', 268435457, 'submission.event.submissionSubmitted', 0),
(131, 1048585, 5, 1, '2025-03-17 09:05:03', 805306371, 'editor.submission.decision.skipReview.log', 0),
(132, 515, 16, 1, '2025-03-17 09:05:03', 1342177281, 'submission.event.fileUploaded', 0),
(133, 1048585, 5, 1, '2025-03-17 09:05:03', 1342177288, 'submission.event.fileRevised', 0),
(134, 1048585, 5, 1, '2025-03-17 09:05:18', 805306371, 'editor.submission.decision.sendToProduction.log', 0),
(135, 515, 17, 1, '2025-03-17 09:05:19', 1342177281, 'submission.event.fileUploaded', 0),
(136, 1048585, 5, 1, '2025-03-17 09:05:19', 1342177288, 'submission.event.fileRevised', 0),
(137, 1048585, 5, 1, '2025-03-17 09:05:43', 268435459, 'submission.event.participantAdded', 0),
(138, 1048585, 5, 1, '2025-03-17 09:06:31', 268435458, 'submission.event.general.metadataUpdated', 0),
(139, 1048585, 5, 1, '2025-03-17 09:06:39', 268435458, 'submission.event.general.metadataUpdated', 0),
(140, 1048585, 5, 1, '2025-03-17 09:06:44', 268435462, 'publication.event.published', 0),
(141, 1048585, 5, 1, '2025-03-25 10:40:34', 268435458, 'submission.event.general.metadataUpdated', 0),
(142, 1048585, 4, 1, '2025-03-25 10:41:15', 268435458, 'submission.event.general.metadataUpdated', 0),
(143, 1048585, 6, 1, '2025-03-25 10:56:39', 268435458, 'submission.event.general.metadataUpdated', 0),
(144, 1048585, 6, 1, '2025-03-25 10:56:39', 268435458, 'submission.event.general.metadataUpdated', 0),
(145, 1048585, 6, 1, '2025-03-25 10:57:42', 268435458, 'submission.event.general.metadataUpdated', 0),
(146, 515, 18, 1, '2025-03-25 10:57:53', 1342177281, 'submission.event.fileUploaded', 0),
(147, 1048585, 6, 1, '2025-03-25 10:57:53', 1342177288, 'submission.event.fileRevised', 0),
(148, 515, 18, 1, '2025-03-25 10:58:47', 1342177296, 'submission.event.fileEdited', 0),
(149, 1048585, 6, 1, '2025-03-25 11:05:33', 268435458, 'submission.event.general.metadataUpdated', 0),
(150, 1048585, 6, 1, '2025-03-25 11:05:36', 268435458, 'submission.event.general.metadataUpdated', 0),
(151, 515, 18, 1, '2025-03-25 11:05:57', 1342177296, 'submission.event.fileEdited', 0),
(152, 1048585, 6, 1, '2025-03-25 11:06:09', 268435457, 'submission.event.submissionSubmitted', 0),
(153, 515, 18, 1, '2025-03-25 11:06:27', 1342177296, 'submission.event.fileEdited', 0),
(154, 1048585, 6, 1, '2025-03-25 11:07:33', 268435458, 'submission.event.general.metadataUpdated', 0),
(155, 515, 18, 1, '2025-03-25 11:13:01', 1342177296, 'submission.event.fileEdited', 0),
(158, 515, 19, 1, '2025-03-25 11:16:23', 1342177281, 'submission.event.fileUploaded', 0),
(160, 515, 19, 1, '2025-03-25 11:16:25', 1342177296, 'submission.event.fileEdited', 0),
(163, 515, 19, 1, '2025-03-25 11:17:24', 1342177282, 'submission.event.fileDeleted', 0),
(164, 515, 13, 1, '2025-03-25 11:18:22', 1342177282, 'submission.event.fileDeleted', 0),
(167, 515, 20, 1, '2025-03-25 11:19:23', 1342177281, 'submission.event.fileUploaded', 0),
(169, 515, 20, 1, '2025-03-25 11:19:26', 1342177296, 'submission.event.fileEdited', 0),
(172, 515, 21, 1, '2025-03-25 11:21:18', 1342177281, 'submission.event.fileUploaded', 0),
(179, 1048585, 6, 1, '2025-03-25 11:29:37', 268435458, 'submission.event.general.metadataUpdated', 0),
(181, 1048585, 4, 1, '2025-03-25 11:31:54', 268435458, 'submission.event.general.metadataUpdated', 0),
(182, 1048585, 4, 1, '2025-03-25 11:31:57', 268435462, 'publication.event.published', 0),
(183, 515, 22, 1, '2025-03-25 11:35:07', 1342177281, 'submission.event.fileUploaded', 0),
(185, 515, 22, 1, '2025-03-25 11:35:11', 1342177296, 'submission.event.fileEdited', 0),
(187, 1048585, 4, 1, '2025-03-25 11:37:17', 268435463, 'publication.event.unpublished', 0),
(188, 515, 23, 1, '2025-03-25 11:37:52', 1342177281, 'submission.event.fileUploaded', 0),
(189, 1048585, 4, 1, '2025-03-25 11:37:52', 1342177288, 'submission.event.fileRevised', 0),
(190, 515, 23, 1, '2025-03-25 11:37:55', 1342177296, 'submission.event.fileEdited', 0),
(191, 515, 24, 1, '2025-03-25 11:38:58', 1342177281, 'submission.event.fileUploaded', 0),
(192, 1048585, 4, 1, '2025-03-25 11:38:58', 1342177288, 'submission.event.fileRevised', 0),
(193, 1048585, 4, 1, '2025-03-25 11:39:53', 268435462, 'publication.event.published', 0),
(197, 515, 22, 1, '2025-03-31 10:48:10', 1342177282, 'submission.event.fileDeleted', 0),
(198, 515, 21, 1, '2025-03-31 10:48:10', 1342177282, 'submission.event.fileDeleted', 0),
(199, 515, 20, 1, '2025-03-31 10:48:11', 1342177282, 'submission.event.fileDeleted', 0),
(200, 515, 14, 1, '2025-04-01 11:11:33', 1342177282, 'submission.event.fileDeleted', 0),
(201, 515, 23, 1, '2025-04-01 11:11:40', 1342177282, 'submission.event.fileDeleted', 0),
(202, 515, 12, 1, '2025-04-01 11:11:46', 1342177282, 'submission.event.fileDeleted', 0),
(203, 515, 11, 1, '2025-04-01 11:11:52', 1342177282, 'submission.event.fileDeleted', 0),
(204, 1048585, 4, 1, '2025-04-01 11:12:24', 268435458, 'submission.event.general.metadataUpdated', 0),
(205, 1048585, 9, 1, '2025-04-09 11:49:18', 268435458, 'submission.event.general.metadataUpdated', 0),
(206, 1048585, 9, 1, '2025-04-09 12:02:20', 268435458, 'submission.event.general.metadataUpdated', 0),
(207, 1048585, 9, 1, '2025-04-09 12:05:20', 268435458, 'submission.event.general.metadataUpdated', 0),
(208, 1048585, 9, 1, '2025-04-09 12:05:33', 268435458, 'submission.event.general.metadataUpdated', 0),
(209, 515, 25, 1, '2025-04-09 12:06:19', 1342177281, 'submission.event.fileUploaded', 0),
(210, 1048585, 9, 1, '2025-04-09 12:06:19', 1342177288, 'submission.event.fileRevised', 0),
(211, 515, 25, 1, '2025-04-09 12:06:27', 1342177296, 'submission.event.fileEdited', 0),
(212, 515, 26, 1, '2025-04-09 12:28:45', 1342177281, 'submission.event.fileUploaded', 0),
(213, 1048585, 9, 1, '2025-04-09 12:28:45', 1342177288, 'submission.event.fileRevised', 0),
(214, 1048585, 9, 1, '2025-04-09 12:32:03', 268435458, 'submission.event.general.metadataUpdated', 0),
(215, 1048585, 9, 1, '2025-04-09 12:32:03', 268435458, 'submission.event.general.metadataUpdated', 0),
(216, 515, 27, 1, '2025-04-09 12:32:03', 1342177281, 'submission.event.fileUploaded', 0),
(217, 1048585, 9, 1, '2025-04-09 12:32:03', 1342177288, 'submission.event.fileRevised', 0),
(218, 1048585, 9, 1, '2025-04-09 12:33:09', 268435458, 'submission.event.general.metadataUpdated', 0),
(219, 1048585, 9, 1, '2025-04-09 12:48:17', 268435458, 'submission.event.general.metadataUpdated', 0),
(220, 1048585, 9, 1, '2025-04-09 12:48:32', 268435458, 'submission.event.general.metadataUpdated', 0),
(221, 1048585, 9, 1, '2025-04-09 12:48:48', 268435458, 'submission.event.general.metadataUpdated', 0),
(222, 1048585, 9, 1, '2025-04-09 12:48:51', 268435462, 'publication.event.scheduled', 0),
(223, 1048585, 9, 1, '2025-04-09 12:49:09', 268435462, 'publication.event.published', 0),
(224, 1048585, 9, 1, '2025-04-09 13:39:06', 268435458, 'submission.event.general.metadataUpdated', 0),
(225, 1048585, 9, 1, '2025-04-09 13:39:06', 268435464, 'publication.event.versionCreated', 0),
(226, 515, 28, 1, '2025-04-29 11:25:15', 1342177281, 'submission.event.fileUploaded', 0),
(227, 1048585, 9, 1, '2025-04-29 11:25:15', 1342177288, 'submission.event.fileRevised', 0),
(228, 515, 28, 1, '2025-04-29 11:25:21', 1342177296, 'submission.event.fileEdited', 0),
(229, 515, 29, 1, '2025-04-29 11:48:02', 1342177281, 'submission.event.fileUploaded', 0),
(230, 1048585, 9, 1, '2025-04-29 11:48:02', 1342177288, 'submission.event.fileRevised', 0),
(231, 515, 29, 1, '2025-04-29 11:48:05', 1342177296, 'submission.event.fileEdited', 0),
(232, 1048585, 10, 1, '2025-04-29 11:49:30', 268435458, 'submission.event.general.metadataUpdated', 0),
(233, 1048585, 10, 1, '2025-04-29 11:50:34', 268435458, 'submission.event.general.metadataUpdated', 0),
(234, 1048585, 10, 1, '2025-04-29 11:50:57', 268435458, 'submission.event.general.metadataUpdated', 0),
(235, 515, 30, 1, '2025-04-29 11:51:10', 1342177281, 'submission.event.fileUploaded', 0),
(236, 1048585, 10, 1, '2025-04-29 11:51:10', 1342177288, 'submission.event.fileRevised', 0),
(237, 515, 30, 1, '2025-04-29 11:51:12', 1342177296, 'submission.event.fileEdited', 0),
(238, 1048585, 10, 1, '2025-04-29 11:51:42', 268435457, 'submission.event.submissionSubmitted', 0),
(239, 1048585, 10, 1, '2025-04-29 11:51:57', 268435465, 'submission.event.copyrightAgreed', 0),
(240, 1048585, 10, 1, '2025-04-29 11:52:28', 805306371, 'editor.submission.decision.skipReview.log', 0),
(241, 515, 31, 1, '2025-04-29 11:52:28', 1342177281, 'submission.event.fileUploaded', 0),
(242, 1048585, 10, 1, '2025-04-29 11:52:29', 1342177288, 'submission.event.fileRevised', 0),
(243, 1048585, 10, 1, '2025-04-29 11:52:46', 805306371, 'editor.submission.decision.sendToProduction.log', 0),
(244, 515, 32, 1, '2025-04-29 11:52:47', 1342177281, 'submission.event.fileUploaded', 0),
(245, 1048585, 10, 1, '2025-04-29 11:52:47', 1342177288, 'submission.event.fileRevised', 0),
(246, 515, 33, 1, '2025-04-29 11:53:26', 1342177281, 'submission.event.fileUploaded', 0),
(247, 1048585, 10, 1, '2025-04-29 11:53:26', 1342177288, 'submission.event.fileRevised', 0),
(248, 515, 33, 1, '2025-04-29 11:53:32', 1342177296, 'submission.event.fileEdited', 0),
(249, 515, 34, 1, '2025-04-29 11:53:59', 1342177281, 'submission.event.fileUploaded', 0),
(250, 1048585, 10, 1, '2025-04-29 11:53:59', 1342177288, 'submission.event.fileRevised', 0),
(251, 515, 35, 1, '2025-04-29 11:54:27', 1342177281, 'submission.event.fileUploaded', 0),
(252, 1048585, 10, 1, '2025-04-29 11:54:27', 1342177288, 'submission.event.fileRevised', 0),
(253, 515, 35, 1, '2025-04-29 11:54:30', 1342177296, 'submission.event.fileEdited', 0),
(254, 515, 34, 1, '2025-04-29 11:54:40', 1342177296, 'submission.event.fileEdited', 0),
(255, 1048585, 10, 1, '2025-04-29 11:54:48', 268435458, 'submission.event.general.metadataUpdated', 0),
(256, 1048585, 10, 1, '2025-04-29 11:54:50', 268435462, 'publication.event.published', 0),
(257, 1048585, 10, 1, '2025-04-29 11:56:20', 268435463, 'publication.event.unpublished', 0),
(258, 1048585, 10, 1, '2025-04-29 11:56:24', 268435458, 'submission.event.general.metadataUpdated', 0),
(259, 1048585, 10, 1, '2025-04-29 11:56:29', 268435462, 'publication.event.published', 0),
(260, 1048585, 11, 1, '2025-04-30 12:32:59', 268435458, 'submission.event.general.metadataUpdated', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `event_log_settings`
--

CREATE TABLE `event_log_settings` (
  `event_log_setting_id` bigint(20) UNSIGNED NOT NULL,
  `log_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Data about an event log entry. This data is commonly used to display information about an event to a user.';

--
-- Despejando dados para a tabela `event_log_settings`
--

INSERT INTO `event_log_settings` (`event_log_setting_id`, `log_id`, `locale`, `setting_name`, `setting_value`) VALUES
(1, 4, '', 'fileId', '1'),
(2, 4, 'pt_BR', 'filename', 'estudo dirigido 6.pdf'),
(3, 4, '', 'fileStage', '2'),
(4, 4, '', 'submissionFileId', '1'),
(5, 4, '', 'submissionId', '1'),
(6, 4, '', 'username', 'gesiele'),
(13, 6, '', 'fileId', '1'),
(14, 6, 'pt_BR', 'filename', 'estudo dirigido 6.pdf'),
(15, 6, '', 'fileStage', '2'),
(16, 6, '', 'submissionFileId', '1'),
(17, 6, '', 'submissionId', '1'),
(18, 6, '', 'username', 'gesiele'),
(19, 12, '', 'fileId', '2'),
(20, 12, 'pt_BR', 'filename', 'estudo dirigido 6.pdf'),
(21, 12, '', 'fileStage', '2'),
(22, 12, '', 'submissionFileId', '2'),
(23, 12, '', 'submissionId', '2'),
(24, 12, '', 'username', 'gesiele'),
(31, 14, '', 'fileId', '2'),
(32, 14, 'pt_BR', 'filename', 'estudo dirigido 6.pdf'),
(33, 14, '', 'fileStage', '2'),
(34, 14, '', 'submissionFileId', '2'),
(35, 14, '', 'submissionId', '2'),
(36, 14, '', 'username', 'gesiele'),
(37, 15, '', 'fileId', '2'),
(38, 15, 'pt_BR', 'filename', 'estudo dirigido 6.pdf'),
(39, 15, '', 'fileStage', '2'),
(40, 15, '', 'submissionFileId', '2'),
(41, 15, '', 'submissionId', '2'),
(42, 15, '', 'username', 'gesiele'),
(43, 18, '', 'fileId', '2'),
(44, 18, 'pt_BR', 'filename', 'estudo dirigido 6.pdf'),
(45, 18, '', 'fileStage', '4'),
(46, 18, '', 'sourceSubmissionFileId', '2'),
(47, 18, '', 'submissionFileId', '3'),
(48, 18, '', 'submissionId', '2'),
(49, 18, '', 'username', 'admin'),
(57, 21, '', 'fileId', '1'),
(58, 21, 'pt_BR', 'filename', 'estudo dirigido 6.pdf'),
(59, 21, '', 'fileStage', '6'),
(60, 21, '', 'sourceSubmissionFileId', '1'),
(61, 21, '', 'submissionFileId', '4'),
(62, 21, '', 'submissionId', '1'),
(63, 21, '', 'username', 'admin'),
(71, 26, '', 'fileId', '3'),
(72, 26, 'pt_BR', 'filename', 'estudo dirigido 6.pdf'),
(73, 26, '', 'fileStage', '11'),
(74, 26, '', 'submissionFileId', '5'),
(75, 26, '', 'submissionId', '1'),
(76, 26, '', 'username', 'admin'),
(83, 28, '', 'fileId', '3'),
(84, 28, 'pt_BR', 'filename', 'estudo dirigido 6.pdf'),
(85, 28, '', 'fileStage', '11'),
(86, 28, '', 'submissionFileId', '5'),
(87, 28, '', 'submissionId', '1'),
(88, 28, '', 'username', 'admin'),
(89, 30, '', 'fileId', '2'),
(90, 30, 'pt_BR', 'filename', 'estudo dirigido 6.pdf'),
(91, 30, '', 'fileStage', '2'),
(92, 30, '', 'submissionFileId', '2'),
(93, 30, '', 'submissionId', '2'),
(94, 30, '', 'username', 'admin'),
(95, 31, '', 'fileId', '4'),
(96, 31, 'pt_BR', 'filename', 'estudo dirigido 6.pdf'),
(97, 31, '', 'fileStage', '2'),
(98, 31, '', 'submissionFileId', '2'),
(99, 31, '', 'submissionId', '2'),
(100, 31, '', 'username', 'admin'),
(101, 32, '', 'fileId', '4'),
(102, 32, 'pt_BR', 'filename', 'estudo dirigido 6.pdf'),
(103, 32, '', 'fileStage', '2'),
(104, 32, '', 'submissionFileId', '2'),
(105, 32, '', 'submissionId', '2'),
(106, 32, '', 'username', 'admin'),
(107, 33, '', 'fileId', '5'),
(108, 33, 'pt_BR', 'filename', 'estudo dirigido 6.pdf'),
(109, 33, '', 'fileStage', '2'),
(110, 33, '', 'submissionFileId', '2'),
(111, 33, '', 'submissionId', '2'),
(112, 33, '', 'username', 'admin'),
(113, 37, '', 'fileId', '2'),
(114, 37, 'pt_BR', 'filename', 'estudo dirigido 6.pdf'),
(115, 37, '', 'fileStage', '4'),
(116, 37, '', 'sourceSubmissionFileId', '2'),
(117, 37, '', 'submissionFileId', '3'),
(118, 37, '', 'submissionId', '2'),
(119, 37, '', 'username', 'admin'),
(120, 38, '', 'fileId', '6'),
(121, 38, 'pt_BR', 'filename', 'DOC000000000348826.pdf'),
(122, 38, '', 'fileStage', '11'),
(123, 38, '', 'submissionFileId', '6'),
(124, 38, '', 'submissionId', '2'),
(125, 38, '', 'username', 'admin'),
(132, 40, '', 'fileId', '6'),
(133, 40, 'pt_BR', 'filename', 'DOC000000000348826.pdf'),
(134, 40, '', 'fileStage', '11'),
(135, 40, '', 'submissionFileId', '6'),
(136, 40, '', 'submissionId', '2'),
(137, 40, '', 'username', 'admin'),
(138, 45, '', 'fileId', '7'),
(139, 45, 'pt_BR', 'filename', 'DOC000000000348826.pdf'),
(140, 45, '', 'fileStage', '2'),
(141, 45, '', 'submissionFileId', '7'),
(142, 45, '', 'submissionId', '3'),
(143, 45, '', 'username', 'admin'),
(150, 47, '', 'fileId', '7'),
(151, 47, 'pt_BR', 'filename', 'DOC000000000348826.pdf'),
(152, 47, '', 'fileStage', '2'),
(153, 47, '', 'submissionFileId', '7'),
(154, 47, '', 'submissionId', '3'),
(155, 47, '', 'username', 'admin'),
(156, 50, '', 'fileId', '7'),
(157, 50, 'pt_BR', 'filename', 'DOC000000000348826.pdf'),
(158, 50, '', 'fileStage', '4'),
(159, 50, '', 'sourceSubmissionFileId', '7'),
(160, 50, '', 'submissionFileId', '8'),
(161, 50, '', 'submissionId', '3'),
(162, 50, '', 'username', 'admin'),
(170, 71, '', 'fileId', '1'),
(171, 71, 'pt_BR', 'filename', 'estudo dirigido 6.pdf'),
(172, 71, '', 'fileStage', '2'),
(173, 71, '', 'submissionFileId', '1'),
(174, 71, '', 'submissionId', '1'),
(175, 71, '', 'username', 'admin'),
(176, 72, '', 'fileId', '6'),
(177, 72, 'pt_BR', 'filename', 'DOC000000000348826.pdf'),
(178, 72, '', 'fileStage', '11'),
(179, 72, '', 'submissionFileId', '6'),
(180, 72, '', 'submissionId', '2'),
(181, 72, '', 'username', 'admin'),
(182, 73, '', 'fileId', '2'),
(183, 73, 'pt_BR', 'filename', 'estudo dirigido 6.pdf'),
(184, 73, '', 'fileStage', '4'),
(185, 73, '', 'sourceSubmissionFileId', '2'),
(186, 73, '', 'submissionFileId', '3'),
(187, 73, '', 'submissionId', '2'),
(188, 73, '', 'username', 'admin'),
(189, 74, '', 'fileId', '5'),
(190, 74, 'pt_BR', 'filename', 'estudo dirigido 6.pdf'),
(191, 74, '', 'fileStage', '2'),
(192, 74, '', 'submissionFileId', '2'),
(193, 74, '', 'submissionId', '2'),
(194, 74, '', 'username', 'admin'),
(195, 75, '', 'fileId', '3'),
(196, 75, 'pt_BR', 'filename', 'estudo dirigido 6.pdf'),
(197, 75, '', 'fileStage', '11'),
(198, 75, '', 'submissionFileId', '5'),
(199, 75, '', 'submissionId', '1'),
(200, 75, '', 'username', 'admin'),
(206, 78, '', 'fileId', '8'),
(207, 78, 'pt_BR', 'filename', 'DOC000000000348826.pdf'),
(208, 78, '', 'fileStage', '10'),
(209, 78, '', 'submissionFileId', '9'),
(210, 78, '', 'submissionId', '3'),
(211, 78, '', 'username', 'admin'),
(218, 80, '', 'fileId', '8'),
(219, 80, 'pt_BR', 'filename', 'DOC000000000348826.pdf'),
(220, 80, '', 'fileStage', '10'),
(221, 80, '', 'submissionFileId', '9'),
(222, 80, '', 'submissionId', '3'),
(223, 80, '', 'username', 'admin'),
(224, 81, '', 'fileId', '9'),
(225, 81, 'pt_BR', 'filename', 'DOC000000000348826.pdf'),
(226, 81, '', 'fileStage', '10'),
(227, 81, '', 'submissionFileId', '10'),
(228, 81, '', 'submissionId', '3'),
(229, 81, '', 'username', 'admin'),
(236, 83, '', 'fileId', '9'),
(237, 83, 'pt_BR', 'filename', 'DOC000000000348826.pdf'),
(238, 83, '', 'fileStage', '10'),
(239, 83, '', 'submissionFileId', '10'),
(240, 83, '', 'submissionId', '3'),
(241, 83, '', 'username', 'admin'),
(242, 89, '', 'fileId', '10'),
(243, 89, 'pt_BR', 'filename', 'DO VESTÍGIO A PROVA A TRAJETÓRIA DA PERÍCIA CRIMINAL DO RIO GRANDE DO NORTE-páginas_compressed-compactado.pdf'),
(244, 89, '', 'fileStage', '2'),
(245, 89, '', 'submissionFileId', '11'),
(246, 89, '', 'submissionId', '4'),
(247, 89, '', 'username', 'admin'),
(248, 90, '', 'fileId', '10'),
(249, 90, 'pt_BR', 'filename', 'DO VESTÍGIO A PROVA A TRAJETÓRIA DA PERÍCIA CRIMINAL DO RIO GRANDE DO NORTE-páginas_compressed-compactado.pdf'),
(250, 90, '', 'fileStage', '2'),
(251, 90, '', 'submissionFileId', '11'),
(252, 90, '', 'submissionId', '4'),
(253, 90, '', 'username', 'admin'),
(254, 91, '', 'fileId', '10'),
(255, 91, 'pt_BR', 'filename', 'DO VESTÍGIO A PROVA A TRAJETÓRIA DA PERÍCIA CRIMINAL DO RIO GRANDE DO NORTE-páginas_compressed-compactado.pdf'),
(256, 91, '', 'fileStage', '2'),
(257, 91, '', 'submissionFileId', '11'),
(258, 91, '', 'submissionId', '4'),
(259, 91, '', 'username', 'admin'),
(260, 99, '', 'fileId', '10'),
(261, 99, 'pt_BR', 'filename', 'DO VESTÍGIO A PROVA A TRAJETÓRIA DA PERÍCIA CRIMINAL DO RIO GRANDE DO NORTE-páginas_compressed-compactado.pdf'),
(262, 99, '', 'fileStage', '4'),
(263, 99, '', 'sourceSubmissionFileId', '11'),
(264, 99, '', 'submissionFileId', '12'),
(265, 99, '', 'submissionId', '4'),
(266, 99, '', 'username', 'admin'),
(267, 100, '', 'fileId', '10'),
(268, 100, 'pt_BR', 'filename', 'DO VESTÍGIO A PROVA A TRAJETÓRIA DA PERÍCIA CRIMINAL DO RIO GRANDE DO NORTE-páginas_compressed-compactado.pdf'),
(269, 100, '', 'fileStage', '4'),
(270, 100, '', 'sourceSubmissionFileId', '11'),
(271, 100, '', 'submissionFileId', '12'),
(272, 100, '', 'submissionId', '4'),
(273, 100, '', 'username', 'admin'),
(274, 113, '', 'fileId', '9'),
(275, 113, 'pt_BR', 'filename', 'DOC000000000348826.pdf'),
(276, 113, '', 'fileStage', '10'),
(277, 113, '', 'submissionFileId', '10'),
(278, 113, '', 'submissionId', '3'),
(279, 113, '', 'username', 'admin'),
(280, 114, '', 'fileId', '8'),
(281, 114, 'pt_BR', 'filename', 'DOC000000000348826.pdf'),
(282, 114, '', 'fileStage', '10'),
(283, 114, '', 'submissionFileId', '9'),
(284, 114, '', 'submissionId', '3'),
(285, 114, '', 'username', 'admin'),
(286, 115, '', 'fileId', '7'),
(287, 115, 'pt_BR', 'filename', 'DOC000000000348826.pdf'),
(288, 115, '', 'fileStage', '4'),
(289, 115, '', 'sourceSubmissionFileId', '7'),
(290, 115, '', 'submissionFileId', '8'),
(291, 115, '', 'submissionId', '3'),
(292, 115, '', 'username', 'admin'),
(293, 116, '', 'fileId', '7'),
(294, 116, 'pt_BR', 'filename', 'DOC000000000348826.pdf'),
(295, 116, '', 'fileStage', '2'),
(296, 116, '', 'submissionFileId', '7'),
(297, 116, '', 'submissionId', '3'),
(298, 116, '', 'username', 'admin'),
(299, 117, '', 'fileId', '11'),
(300, 117, 'pt_BR', 'filename', 'DO VESTÍGIO A PROVA A TRAJETÓRIA DA PERÍCIA CRIMINAL DO RIO GRANDE DO NORTE-páginas_compressed-compactado.pdf'),
(301, 117, '', 'fileStage', '11'),
(302, 117, '', 'submissionFileId', '13'),
(303, 117, '', 'submissionId', '4'),
(304, 117, '', 'username', 'admin'),
(305, 118, '', 'fileId', '11'),
(306, 118, 'pt_BR', 'filename', 'DO VESTÍGIO A PROVA A TRAJETÓRIA DA PERÍCIA CRIMINAL DO RIO GRANDE DO NORTE-páginas_compressed-compactado.pdf'),
(307, 118, '', 'fileStage', '11'),
(308, 118, '', 'submissionFileId', '13'),
(309, 118, '', 'submissionId', '4'),
(310, 118, '', 'username', 'admin'),
(311, 119, '', 'fileId', '11'),
(312, 119, 'pt_BR', 'filename', 'DO VESTÍGIO A PROVA A TRAJETÓRIA DA PERÍCIA CRIMINAL DO RIO GRANDE DO NORTE-páginas_compressed-compactado.pdf'),
(313, 119, '', 'fileStage', '11'),
(314, 119, '', 'submissionFileId', '13'),
(315, 119, '', 'submissionId', '4'),
(316, 119, '', 'username', 'admin'),
(317, 120, '', 'fileId', '12'),
(318, 120, 'pt_BR', 'filename', 'DO VESTÍGIO A PROVA A TRAJETÓRIA DA PERÍCIA CRIMINAL DO RIO GRANDE DO NORTE-páginas_compressed-compactado.pdf'),
(319, 120, '', 'fileStage', '11'),
(320, 120, '', 'submissionFileId', '14'),
(321, 120, '', 'submissionId', '4'),
(322, 120, '', 'username', 'admin'),
(323, 121, '', 'fileId', '12'),
(324, 121, 'pt_BR', 'filename', 'DO VESTÍGIO A PROVA A TRAJETÓRIA DA PERÍCIA CRIMINAL DO RIO GRANDE DO NORTE-páginas_compressed-compactado.pdf'),
(325, 121, '', 'fileStage', '11'),
(326, 121, '', 'submissionFileId', '14'),
(327, 121, '', 'submissionId', '4'),
(328, 121, '', 'username', 'admin'),
(329, 122, '', 'fileId', '12'),
(330, 122, 'pt_BR', 'filename', 'DO VESTÍGIO A PROVA A TRAJETÓRIA DA PERÍCIA CRIMINAL DO RIO GRANDE DO NORTE-páginas_compressed-compactado.pdf'),
(331, 122, '', 'fileStage', '11'),
(332, 122, '', 'submissionFileId', '14'),
(333, 122, '', 'submissionId', '4'),
(334, 122, '', 'username', 'admin'),
(335, 126, '', 'fileId', '13'),
(336, 126, 'pt_BR', 'filename', 'Mdulo_Morfolgico_I_2025.113.03.pdf'),
(337, 126, '', 'fileStage', '2'),
(338, 126, '', 'submissionFileId', '15'),
(339, 126, '', 'submissionId', '5'),
(340, 126, '', 'username', 'admin'),
(341, 127, '', 'fileId', '13'),
(342, 127, 'pt_BR', 'filename', 'Mdulo_Morfolgico_I_2025.113.03.pdf'),
(343, 127, '', 'fileStage', '2'),
(344, 127, '', 'submissionFileId', '15'),
(345, 127, '', 'submissionId', '5'),
(346, 127, '', 'username', 'admin'),
(347, 128, '', 'fileId', '13'),
(348, 128, 'pt_BR', 'filename', 'Mdulo_Morfolgico_I_2025.113.03.pdf'),
(349, 128, '', 'fileStage', '2'),
(350, 128, '', 'submissionFileId', '15'),
(351, 128, '', 'submissionId', '5'),
(352, 128, '', 'username', 'admin'),
(353, 129, '', 'fileId', '13'),
(354, 129, 'pt_BR', 'filename', 'Mdulo_Morfolgico_I_2025.113.03.pdf'),
(355, 129, '', 'fileStage', '2'),
(356, 129, '', 'submissionFileId', '15'),
(357, 129, '', 'submissionId', '5'),
(358, 129, '', 'username', 'admin'),
(359, 132, '', 'fileId', '13'),
(360, 132, 'pt_BR', 'filename', 'Mdulo_Morfolgico_I_2025.113.03.pdf'),
(361, 132, '', 'fileStage', '6'),
(362, 132, '', 'sourceSubmissionFileId', '15'),
(363, 132, '', 'submissionFileId', '16'),
(364, 132, '', 'submissionId', '5'),
(365, 132, '', 'username', 'admin'),
(366, 133, '', 'fileId', '13'),
(367, 133, 'pt_BR', 'filename', 'Mdulo_Morfolgico_I_2025.113.03.pdf'),
(368, 133, '', 'fileStage', '6'),
(369, 133, '', 'sourceSubmissionFileId', '15'),
(370, 133, '', 'submissionFileId', '16'),
(371, 133, '', 'submissionId', '5'),
(372, 133, '', 'username', 'admin'),
(373, 135, '', 'fileId', '13'),
(374, 135, 'pt_BR', 'filename', 'Mdulo_Morfolgico_I_2025.113.03.pdf'),
(375, 135, '', 'fileStage', '11'),
(376, 135, '', 'sourceSubmissionFileId', '16'),
(377, 135, '', 'submissionFileId', '17'),
(378, 135, '', 'submissionId', '5'),
(379, 135, '', 'username', 'admin'),
(380, 136, '', 'fileId', '13'),
(381, 136, 'pt_BR', 'filename', 'Mdulo_Morfolgico_I_2025.113.03.pdf'),
(382, 136, '', 'fileStage', '11'),
(383, 136, '', 'sourceSubmissionFileId', '16'),
(384, 136, '', 'submissionFileId', '17'),
(385, 136, '', 'submissionId', '5'),
(386, 136, '', 'username', 'admin'),
(387, 137, '', 'userFullName', 'admin admin'),
(388, 137, 'en', 'userGroupName', 'Author'),
(389, 137, 'es', 'userGroupName', 'Autor/a'),
(390, 137, 'pt_BR', 'userGroupName', 'Autor'),
(391, 137, '', 'username', 'admin'),
(392, 146, '', 'fileId', '14'),
(393, 146, 'pt_BR', 'filename', 'Kevin-e-Antony PeP SIS.pdf'),
(394, 146, '', 'fileStage', '2'),
(395, 146, '', 'submissionFileId', '18'),
(396, 146, '', 'submissionId', '6'),
(397, 146, '', 'username', 'admin'),
(398, 147, '', 'fileId', '14'),
(399, 147, 'pt_BR', 'filename', 'Kevin-e-Antony PeP SIS.pdf'),
(400, 147, '', 'fileStage', '2'),
(401, 147, '', 'submissionFileId', '18'),
(402, 147, '', 'submissionId', '6'),
(403, 147, '', 'username', 'admin'),
(404, 148, '', 'fileId', '14'),
(405, 148, 'pt_BR', 'filename', 'Kevin-e-Antony PeP SIS.pdf'),
(406, 148, '', 'fileStage', '2'),
(407, 148, '', 'submissionFileId', '18'),
(408, 148, '', 'submissionId', '6'),
(409, 148, '', 'username', 'admin'),
(410, 151, '', 'fileId', '14'),
(411, 151, 'pt_BR', 'filename', 'Kevin-e-Antony PeP SIS.pdf'),
(412, 151, '', 'fileStage', '2'),
(413, 151, '', 'submissionFileId', '18'),
(414, 151, '', 'submissionId', '6'),
(415, 151, '', 'username', 'admin'),
(416, 153, '', 'fileId', '14'),
(417, 153, 'pt_BR', 'filename', 'Kevin-e-Antony PeP SIS.pdf'),
(418, 153, '', 'fileStage', '2'),
(419, 153, '', 'submissionFileId', '18'),
(420, 153, '', 'submissionId', '6'),
(421, 153, '', 'username', 'admin'),
(422, 155, '', 'fileId', '14'),
(423, 155, 'pt_BR', 'filename', 'Kevin-e-Antony PeP SIS.pdf'),
(424, 155, '', 'fileStage', '2'),
(425, 155, '', 'submissionFileId', '18'),
(426, 155, '', 'submissionId', '6'),
(427, 155, '', 'username', 'admin'),
(428, 158, '', 'fileId', '15'),
(429, 158, 'pt_BR', 'filename', 'Defina ciência e engenharia de materiais.pdf'),
(430, 158, '', 'fileStage', '2'),
(431, 158, '', 'submissionFileId', '19'),
(432, 158, '', 'submissionId', '7'),
(433, 158, '', 'username', 'admin'),
(440, 160, '', 'fileId', '15'),
(441, 160, 'pt_BR', 'filename', 'Defina ciência e engenharia de materiais.pdf'),
(442, 160, '', 'fileStage', '2'),
(443, 160, '', 'submissionFileId', '19'),
(444, 160, '', 'submissionId', '7'),
(445, 160, '', 'username', 'admin'),
(446, 163, '', 'fileId', '15'),
(447, 163, 'pt_BR', 'filename', 'Defina ciência e engenharia de materiais.pdf'),
(448, 163, '', 'fileStage', '2'),
(449, 163, '', 'submissionFileId', '19'),
(450, 163, '', 'submissionId', '7'),
(451, 163, '', 'username', 'admin'),
(452, 164, '', 'fileId', '11'),
(453, 164, 'pt_BR', 'filename', 'DO VESTÍGIO A PROVA A TRAJETÓRIA DA PERÍCIA CRIMINAL DO RIO GRANDE DO NORTE-páginas_compressed-compactado.pdf'),
(454, 164, '', 'fileStage', '11'),
(455, 164, '', 'submissionFileId', '13'),
(456, 164, '', 'submissionId', '4'),
(457, 164, '', 'username', 'admin'),
(458, 167, '', 'fileId', '16'),
(459, 167, 'pt_BR', 'filename', 'Kevin-e-Antony PeP SIS.pdf'),
(460, 167, '', 'fileStage', '2'),
(461, 167, '', 'submissionFileId', '20'),
(462, 167, '', 'submissionId', '8'),
(463, 167, '', 'username', 'admin'),
(470, 169, '', 'fileId', '16'),
(471, 169, 'pt_BR', 'filename', 'Kevin-e-Antony PeP SIS.pdf'),
(472, 169, '', 'fileStage', '2'),
(473, 169, '', 'submissionFileId', '20'),
(474, 169, '', 'submissionId', '8'),
(475, 169, '', 'username', 'admin'),
(476, 172, '', 'fileId', '16'),
(477, 172, 'pt_BR', 'filename', 'Kevin-e-Antony PeP SIS.pdf'),
(478, 172, '', 'fileStage', '4'),
(479, 172, '', 'sourceSubmissionFileId', '20'),
(480, 172, '', 'submissionFileId', '21'),
(481, 172, '', 'submissionId', '8'),
(482, 172, '', 'username', 'admin'),
(490, 183, '', 'fileId', '17'),
(491, 183, 'pt_BR', 'filename', 'DO+VESTÍGIO+A+PROVA+A+TRAJETÓRIA+DA+PERÍCIA+CRIMINAL+DO+RIO+GRANDE+DO+NORTE-páginas_compressed-compactado.pdf'),
(492, 183, '', 'fileStage', '6'),
(493, 183, '', 'submissionFileId', '22'),
(494, 183, '', 'submissionId', '8'),
(495, 183, '', 'username', 'admin'),
(502, 185, '', 'fileId', '17'),
(503, 185, 'pt_BR', 'filename', 'DO+VESTÍGIO+A+PROVA+A+TRAJETÓRIA+DA+PERÍCIA+CRIMINAL+DO+RIO+GRANDE+DO+NORTE-páginas_compressed-compactado.pdf'),
(504, 185, '', 'fileStage', '6'),
(505, 185, '', 'submissionFileId', '22'),
(506, 185, '', 'submissionId', '8'),
(507, 185, '', 'username', 'admin'),
(508, 188, '', 'fileId', '18'),
(509, 188, 'pt_BR', 'filename', 'DO+VESTÍGIO+A+PROVA+A+TRAJETÓRIA+DA+PERÍCIA+CRIMINAL+DO+RIO+GRANDE+DO+NORTE-páginas_compressed-compactado.pdf'),
(510, 188, '', 'fileStage', '6'),
(511, 188, '', 'submissionFileId', '23'),
(512, 188, '', 'submissionId', '4'),
(513, 188, '', 'username', 'admin'),
(514, 189, '', 'fileId', '18'),
(515, 189, 'pt_BR', 'filename', 'DO+VESTÍGIO+A+PROVA+A+TRAJETÓRIA+DA+PERÍCIA+CRIMINAL+DO+RIO+GRANDE+DO+NORTE-páginas_compressed-compactado.pdf'),
(516, 189, '', 'fileStage', '6'),
(517, 189, '', 'submissionFileId', '23'),
(518, 189, '', 'submissionId', '4'),
(519, 189, '', 'username', 'admin'),
(520, 190, '', 'fileId', '18'),
(521, 190, 'pt_BR', 'filename', 'DO+VESTÍGIO+A+PROVA+A+TRAJETÓRIA+DA+PERÍCIA+CRIMINAL+DO+RIO+GRANDE+DO+NORTE-páginas_compressed-compactado.pdf'),
(522, 190, '', 'fileStage', '6'),
(523, 190, '', 'submissionFileId', '23'),
(524, 190, '', 'submissionId', '4'),
(525, 190, '', 'username', 'admin'),
(526, 191, '', 'fileId', '18'),
(527, 191, 'pt_BR', 'filename', 'DO+VESTÍGIO+A+PROVA+A+TRAJETÓRIA+DA+PERÍCIA+CRIMINAL+DO+RIO+GRANDE+DO+NORTE-páginas_compressed-compactado.pdf'),
(528, 191, '', 'fileStage', '9'),
(529, 191, '', 'sourceSubmissionFileId', '23'),
(530, 191, '', 'submissionFileId', '24'),
(531, 191, '', 'submissionId', '4'),
(532, 191, '', 'username', 'admin'),
(533, 192, '', 'fileId', '18'),
(534, 192, 'pt_BR', 'filename', 'DO+VESTÍGIO+A+PROVA+A+TRAJETÓRIA+DA+PERÍCIA+CRIMINAL+DO+RIO+GRANDE+DO+NORTE-páginas_compressed-compactado.pdf'),
(535, 192, '', 'fileStage', '9'),
(536, 192, '', 'sourceSubmissionFileId', '23'),
(537, 192, '', 'submissionFileId', '24'),
(538, 192, '', 'submissionId', '4'),
(539, 192, '', 'username', 'admin'),
(540, 197, '', 'fileId', '17'),
(541, 197, 'pt_BR', 'filename', 'DO+VESTÍGIO+A+PROVA+A+TRAJETÓRIA+DA+PERÍCIA+CRIMINAL+DO+RIO+GRANDE+DO+NORTE-páginas_compressed-compactado.pdf'),
(542, 197, '', 'fileStage', '6'),
(543, 197, '', 'submissionFileId', '22'),
(544, 197, '', 'submissionId', '8'),
(545, 197, '', 'username', 'admin'),
(546, 198, '', 'fileId', '16'),
(547, 198, 'pt_BR', 'filename', 'Kevin-e-Antony PeP SIS.pdf'),
(548, 198, '', 'fileStage', '4'),
(549, 198, '', 'sourceSubmissionFileId', '20'),
(550, 198, '', 'submissionFileId', '21'),
(551, 198, '', 'submissionId', '8'),
(552, 198, '', 'username', 'admin'),
(553, 199, '', 'fileId', '16'),
(554, 199, 'pt_BR', 'filename', 'Kevin-e-Antony PeP SIS.pdf'),
(555, 199, '', 'fileStage', '2'),
(556, 199, '', 'submissionFileId', '20'),
(557, 199, '', 'submissionId', '8'),
(558, 199, '', 'username', 'admin'),
(559, 200, '', 'fileId', '12'),
(560, 200, 'pt_BR', 'filename', 'DO VESTÍGIO A PROVA A TRAJETÓRIA DA PERÍCIA CRIMINAL DO RIO GRANDE DO NORTE-páginas_compressed-compactado.pdf'),
(561, 200, '', 'fileStage', '11'),
(562, 200, '', 'submissionFileId', '14'),
(563, 200, '', 'submissionId', '4'),
(564, 200, '', 'username', 'admin'),
(565, 201, '', 'fileId', '18'),
(566, 201, 'pt_BR', 'filename', 'DO+VESTÍGIO+A+PROVA+A+TRAJETÓRIA+DA+PERÍCIA+CRIMINAL+DO+RIO+GRANDE+DO+NORTE-páginas_compressed-compactado.pdf'),
(567, 201, '', 'fileStage', '6'),
(568, 201, '', 'submissionFileId', '23'),
(569, 201, '', 'submissionId', '4'),
(570, 201, '', 'username', 'admin'),
(571, 202, '', 'fileId', '10'),
(572, 202, 'pt_BR', 'filename', 'DO VESTÍGIO A PROVA A TRAJETÓRIA DA PERÍCIA CRIMINAL DO RIO GRANDE DO NORTE-páginas_compressed-compactado.pdf'),
(573, 202, '', 'fileStage', '4'),
(574, 202, '', 'sourceSubmissionFileId', '11'),
(575, 202, '', 'submissionFileId', '12'),
(576, 202, '', 'submissionId', '4'),
(577, 202, '', 'username', 'admin'),
(578, 203, '', 'fileId', '10'),
(579, 203, 'pt_BR', 'filename', 'DO VESTÍGIO A PROVA A TRAJETÓRIA DA PERÍCIA CRIMINAL DO RIO GRANDE DO NORTE-páginas_compressed-compactado.pdf'),
(580, 203, '', 'fileStage', '2'),
(581, 203, '', 'submissionFileId', '11'),
(582, 203, '', 'submissionId', '4'),
(583, 203, '', 'username', 'admin'),
(584, 209, '', 'fileId', '19'),
(585, 209, 'pt_BR', 'filename', 'DO+VESTÍGIO+A+PROVA+A+TRAJETÓRIA+DA+PERÍCIA+CRIMINAL+DO+RIO+GRANDE+DO+NORTE-páginas_compressed-compactado.pdf'),
(586, 209, '', 'fileStage', '10'),
(587, 209, '', 'submissionFileId', '25'),
(588, 209, '', 'submissionId', '9'),
(589, 209, '', 'username', 'admin'),
(590, 210, '', 'fileId', '19'),
(591, 210, 'pt_BR', 'filename', 'DO+VESTÍGIO+A+PROVA+A+TRAJETÓRIA+DA+PERÍCIA+CRIMINAL+DO+RIO+GRANDE+DO+NORTE-páginas_compressed-compactado.pdf'),
(592, 210, '', 'fileStage', '10'),
(593, 210, '', 'submissionFileId', '25'),
(594, 210, '', 'submissionId', '9'),
(595, 210, '', 'username', 'admin'),
(596, 211, '', 'fileId', '19'),
(597, 211, 'pt_BR', 'filename', 'DO+VESTÍGIO+A+PROVA+A+TRAJETÓRIA+DA+PERÍCIA+CRIMINAL+DO+RIO+GRANDE+DO+NORTE-páginas_compressed-compactado.pdf'),
(598, 211, '', 'fileStage', '10'),
(599, 211, '', 'submissionFileId', '25'),
(600, 211, '', 'submissionId', '9'),
(601, 211, '', 'username', 'admin'),
(602, 212, '', 'fileId', '20'),
(603, 212, 'pt_BR', 'filename', 'Ativar windows.txt'),
(604, 212, '', 'fileStage', '10'),
(605, 212, '', 'submissionFileId', '26'),
(606, 212, '', 'submissionId', '9'),
(607, 212, '', 'username', 'admin'),
(608, 213, '', 'fileId', '20'),
(609, 213, 'pt_BR', 'filename', 'Ativar windows.txt'),
(610, 213, '', 'fileStage', '10'),
(611, 213, '', 'submissionFileId', '26'),
(612, 213, '', 'submissionId', '9'),
(613, 213, '', 'username', 'admin'),
(614, 216, '', 'fileId', '19'),
(615, 216, 'en', 'filename', ''),
(616, 216, 'es', 'filename', ''),
(617, 216, 'pt_BR', 'filename', 'DO+VESTÍGIO+A+PROVA+A+TRAJETÓRIA+DA+PERÍCIA+CRIMINAL+DO+RIO+GRANDE+DO+NORTE-páginas_compressed-compactado.pdf'),
(618, 216, '', 'fileStage', '2'),
(619, 216, '', 'sourceSubmissionFileId', '25'),
(620, 216, '', 'submissionFileId', '27'),
(621, 216, '', 'submissionId', '9'),
(622, 216, '', 'username', 'admin'),
(623, 217, '', 'fileId', '19'),
(624, 217, 'en', 'filename', ''),
(625, 217, 'es', 'filename', ''),
(626, 217, 'pt_BR', 'filename', 'DO+VESTÍGIO+A+PROVA+A+TRAJETÓRIA+DA+PERÍCIA+CRIMINAL+DO+RIO+GRANDE+DO+NORTE-páginas_compressed-compactado.pdf'),
(627, 217, '', 'fileStage', '2'),
(628, 217, '', 'sourceSubmissionFileId', '25'),
(629, 217, '', 'submissionFileId', '27'),
(630, 217, '', 'submissionId', '9'),
(631, 217, '', 'username', 'admin'),
(632, 226, '', 'fileId', '21'),
(633, 226, 'pt_BR', 'filename', 'teste (2).html'),
(634, 226, '', 'fileStage', '10'),
(635, 226, '', 'submissionFileId', '28'),
(636, 226, '', 'submissionId', '9'),
(637, 226, '', 'username', 'admin'),
(638, 227, '', 'fileId', '21'),
(639, 227, 'pt_BR', 'filename', 'teste (2).html'),
(640, 227, '', 'fileStage', '10'),
(641, 227, '', 'submissionFileId', '28'),
(642, 227, '', 'submissionId', '9'),
(643, 227, '', 'username', 'admin'),
(644, 228, '', 'fileId', '21'),
(645, 228, 'pt_BR', 'filename', 'teste (2).html'),
(646, 228, '', 'fileStage', '10'),
(647, 228, '', 'submissionFileId', '28'),
(648, 228, '', 'submissionId', '9'),
(649, 228, '', 'username', 'admin'),
(650, 229, '', 'fileId', '22'),
(651, 229, 'pt_BR', 'filename', 'LISTA DE EXERCÍCIOS 1 - 1a UNIDADE - GABARITO.pdf'),
(652, 229, '', 'fileStage', '10'),
(653, 229, '', 'submissionFileId', '29'),
(654, 229, '', 'submissionId', '9'),
(655, 229, '', 'username', 'admin'),
(656, 230, '', 'fileId', '22'),
(657, 230, 'pt_BR', 'filename', 'LISTA DE EXERCÍCIOS 1 - 1a UNIDADE - GABARITO.pdf'),
(658, 230, '', 'fileStage', '10'),
(659, 230, '', 'submissionFileId', '29'),
(660, 230, '', 'submissionId', '9'),
(661, 230, '', 'username', 'admin'),
(662, 231, '', 'fileId', '22'),
(663, 231, 'pt_BR', 'filename', 'LISTA DE EXERCÍCIOS 1 - 1a UNIDADE - GABARITO.pdf'),
(664, 231, '', 'fileStage', '10'),
(665, 231, '', 'submissionFileId', '29'),
(666, 231, '', 'submissionId', '9'),
(667, 231, '', 'username', 'admin'),
(668, 235, '', 'fileId', '23'),
(669, 235, 'pt_BR', 'filename', 'LISTA DE EXERCÍCIOS 2 - 1a UNIDADE - GABARITO.pdf'),
(670, 235, '', 'fileStage', '2'),
(671, 235, '', 'submissionFileId', '30'),
(672, 235, '', 'submissionId', '10'),
(673, 235, '', 'username', 'admin'),
(674, 236, '', 'fileId', '23'),
(675, 236, 'pt_BR', 'filename', 'LISTA DE EXERCÍCIOS 2 - 1a UNIDADE - GABARITO.pdf'),
(676, 236, '', 'fileStage', '2'),
(677, 236, '', 'submissionFileId', '30'),
(678, 236, '', 'submissionId', '10'),
(679, 236, '', 'username', 'admin'),
(680, 237, '', 'fileId', '23'),
(681, 237, 'pt_BR', 'filename', 'LISTA DE EXERCÍCIOS 2 - 1a UNIDADE - GABARITO.pdf'),
(682, 237, '', 'fileStage', '2'),
(683, 237, '', 'submissionFileId', '30'),
(684, 237, '', 'submissionId', '10'),
(685, 237, '', 'username', 'admin'),
(686, 239, 'pt_BR', 'copyrightNotice', '<p><strong>Declaração de Direito Autoral</strong></p>\n<p>Autores que publicam nesta revista concordam com os seguintes termos:</p>\n<ol>\n<li>Autores mantém os direitos autorais e concedem à revista o direito de primeira publicação, com o trabalho simultaneamente licenciado sob a <a href=\"http://creativecommons.org/licenses/by/3.0/\">Licença <em>Creative Commons Attribution</em></a> que permite o compartilhamento do trabalho com reconhecimento da autoria e publicação inicial nesta revista.</li>\n<li>Autores têm autorização para assumir contratos adicionais separadamente, para distribuição não-exclusiva da versão do trabalho publicada nesta revista (ex.: publicar em repositório institucional ou como capítulo de livro), com reconhecimento de autoria e publicação inicial nesta revista.</li>\n<li>Autores têm permissão e são estimulados a publicar e distribuir seu trabalho online (ex.: em repositórios institucionais ou na sua página pessoal) a qualquer ponto antes ou durante o processo editorial, já que isso pode gerar alterações produtivas, bem como aumentar o impacto e a citação do trabalho publicado.</li>\n</ol>'),
(687, 239, '', 'userFullName', 'Kevin'),
(688, 239, '', 'username', 'admin'),
(689, 241, '', 'fileId', '23'),
(690, 241, 'pt_BR', 'filename', 'LISTA DE EXERCÍCIOS 2 - 1a UNIDADE - GABARITO.pdf'),
(691, 241, '', 'fileStage', '6'),
(692, 241, '', 'sourceSubmissionFileId', '30'),
(693, 241, '', 'submissionFileId', '31'),
(694, 241, '', 'submissionId', '10'),
(695, 241, '', 'username', 'admin'),
(696, 242, '', 'fileId', '23'),
(697, 242, 'pt_BR', 'filename', 'LISTA DE EXERCÍCIOS 2 - 1a UNIDADE - GABARITO.pdf'),
(698, 242, '', 'fileStage', '6'),
(699, 242, '', 'sourceSubmissionFileId', '30'),
(700, 242, '', 'submissionFileId', '31'),
(701, 242, '', 'submissionId', '10'),
(702, 242, '', 'username', 'admin'),
(703, 244, '', 'fileId', '23'),
(704, 244, 'pt_BR', 'filename', 'LISTA DE EXERCÍCIOS 2 - 1a UNIDADE - GABARITO.pdf'),
(705, 244, '', 'fileStage', '11'),
(706, 244, '', 'sourceSubmissionFileId', '31'),
(707, 244, '', 'submissionFileId', '32'),
(708, 244, '', 'submissionId', '10'),
(709, 244, '', 'username', 'admin'),
(710, 245, '', 'fileId', '23'),
(711, 245, 'pt_BR', 'filename', 'LISTA DE EXERCÍCIOS 2 - 1a UNIDADE - GABARITO.pdf'),
(712, 245, '', 'fileStage', '11'),
(713, 245, '', 'sourceSubmissionFileId', '31'),
(714, 245, '', 'submissionFileId', '32'),
(715, 245, '', 'submissionId', '10'),
(716, 245, '', 'username', 'admin'),
(717, 246, '', 'fileId', '24'),
(718, 246, 'pt_BR', 'filename', 'LISTA DE EXERCÍCIOS 2 - 1a UNIDADE - GABARITO.pdf'),
(719, 246, '', 'fileStage', '10'),
(720, 246, '', 'submissionFileId', '33'),
(721, 246, '', 'submissionId', '10'),
(722, 246, '', 'username', 'admin'),
(723, 247, '', 'fileId', '24'),
(724, 247, 'pt_BR', 'filename', 'LISTA DE EXERCÍCIOS 2 - 1a UNIDADE - GABARITO.pdf'),
(725, 247, '', 'fileStage', '10'),
(726, 247, '', 'submissionFileId', '33'),
(727, 247, '', 'submissionId', '10'),
(728, 247, '', 'username', 'admin'),
(729, 248, '', 'fileId', '24'),
(730, 248, 'pt_BR', 'filename', 'LISTA DE EXERCÍCIOS 2 - 1a UNIDADE - GABARITO.pdf'),
(731, 248, '', 'fileStage', '10'),
(732, 248, '', 'submissionFileId', '33'),
(733, 248, '', 'submissionId', '10'),
(734, 248, '', 'username', 'admin'),
(735, 249, '', 'fileId', '25'),
(736, 249, 'pt_BR', 'filename', 'teste (2).html'),
(737, 249, '', 'fileStage', '10'),
(738, 249, '', 'submissionFileId', '34'),
(739, 249, '', 'submissionId', '10'),
(740, 249, '', 'username', 'admin'),
(741, 250, '', 'fileId', '25'),
(742, 250, 'pt_BR', 'filename', 'teste (2).html'),
(743, 250, '', 'fileStage', '10'),
(744, 250, '', 'submissionFileId', '34'),
(745, 250, '', 'submissionId', '10'),
(746, 250, '', 'username', 'admin'),
(747, 251, '', 'fileId', '26'),
(748, 251, 'pt_BR', 'filename', 'teste (2).html'),
(749, 251, '', 'fileStage', '17'),
(750, 251, '', 'submissionFileId', '35'),
(751, 251, '', 'submissionId', '10'),
(752, 251, '', 'username', 'admin'),
(753, 252, '', 'fileId', '26'),
(754, 252, 'pt_BR', 'filename', 'teste (2).html'),
(755, 252, '', 'fileStage', '17'),
(756, 252, '', 'submissionFileId', '35'),
(757, 252, '', 'submissionId', '10'),
(758, 252, '', 'username', 'admin'),
(759, 253, '', 'fileId', '26'),
(760, 253, 'pt_BR', 'filename', 'teste (2).html'),
(761, 253, '', 'fileStage', '17'),
(762, 253, '', 'submissionFileId', '35'),
(763, 253, '', 'submissionId', '10'),
(764, 253, '', 'username', 'admin'),
(765, 254, '', 'fileId', '25'),
(766, 254, 'pt_BR', 'filename', 'teste (2).html'),
(767, 254, '', 'fileStage', '10'),
(768, 254, '', 'submissionFileId', '34'),
(769, 254, '', 'submissionId', '10'),
(770, 254, '', 'username', 'admin');

-- --------------------------------------------------------

--
-- Estrutura para tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A log of all failed jobs.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `files`
--

CREATE TABLE `files` (
  `file_id` bigint(20) UNSIGNED NOT NULL,
  `path` varchar(255) NOT NULL,
  `mimetype` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Records information in the database about files tracked by the system, linking them to the local filesystem.';

--
-- Despejando dados para a tabela `files`
--

INSERT INTO `files` (`file_id`, `path`, `mimetype`) VALUES
(13, 'journals/1/articles/5/67d80e806da09.pdf', 'application/pdf'),
(14, 'journals/1/articles/6/67e2b66132d60.pdf', 'application/pdf'),
(19, 'journals/1/articles/9/67f68ceb2c3a1.pdf', 'application/pdf'),
(20, 'journals/1/articles/9/67f6922d84f1d.txt', 'text/plain'),
(21, 'journals/1/articles/9/6810e14b8b899.html', 'text/html'),
(22, 'journals/1/articles/9/6810e6a26978f.pdf', 'application/pdf'),
(23, 'journals/1/articles/10/6810e75e25a36.pdf', 'application/pdf'),
(24, 'journals/1/articles/10/6810e7e6524c0.pdf', 'application/pdf'),
(25, 'journals/1/articles/10/6810e807e45e2.html', 'text/html'),
(26, 'journals/1/articles/10/6810e82391c5d.html', 'text/html');

-- --------------------------------------------------------

--
-- Estrutura para tabela `filters`
--

CREATE TABLE `filters` (
  `filter_id` bigint(20) NOT NULL,
  `filter_group_id` bigint(20) NOT NULL DEFAULT 0,
  `context_id` bigint(20) NOT NULL DEFAULT 0,
  `display_name` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `is_template` smallint(6) NOT NULL DEFAULT 0,
  `parent_filter_id` bigint(20) NOT NULL DEFAULT 0,
  `seq` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Filters represent a transformation of a supported piece of data from one form to another, such as a PHP object into an XML document.';

--
-- Despejando dados para a tabela `filters`
--

INSERT INTO `filters` (`filter_id`, `filter_group_id`, `context_id`, `display_name`, `class_name`, `is_template`, `parent_filter_id`, `seq`) VALUES
(1, 1, 0, 'Crossref XML issue export', 'APP\\plugins\\generic\\crossref\\filter\\IssueCrossrefXmlFilter', 0, 0, 0),
(2, 2, 0, 'Crossref XML article export', 'APP\\plugins\\generic\\crossref\\filter\\ArticleCrossrefXmlFilter', 0, 0, 0),
(3, 3, 0, 'DataCite XML export', 'APP\\plugins\\generic\\datacite\\filter\\DataciteXmlFilter', 0, 0, 0),
(4, 4, 0, 'DataCite XML export', 'APP\\plugins\\generic\\datacite\\filter\\DataciteXmlFilter', 0, 0, 0),
(5, 5, 0, 'DataCite XML export', 'APP\\plugins\\generic\\datacite\\filter\\DataciteXmlFilter', 0, 0, 0),
(6, 6, 0, 'Extract metadata from a(n) Submission', 'APP\\plugins\\metadata\\dc11\\filter\\Dc11SchemaArticleAdapter', 0, 0, 0),
(7, 7, 0, 'DOAJ XML export', 'APP\\plugins\\importexport\\doaj\\filter\\DOAJXmlFilter', 0, 0, 0),
(8, 8, 0, 'DOAJ JSON export', 'APP\\plugins\\importexport\\doaj\\filter\\DOAJJsonFilter', 0, 0, 0),
(9, 9, 0, 'Native XML submission export', 'APP\\plugins\\importexport\\native\\filter\\ArticleNativeXmlFilter', 0, 0, 0),
(10, 10, 0, 'Native XML submission import', 'APP\\plugins\\importexport\\native\\filter\\NativeXmlArticleFilter', 0, 0, 0),
(11, 11, 0, 'Native XML issue export', 'APP\\plugins\\importexport\\native\\filter\\IssueNativeXmlFilter', 0, 0, 0),
(12, 12, 0, 'Native XML issue import', 'APP\\plugins\\importexport\\native\\filter\\NativeXmlIssueFilter', 0, 0, 0),
(13, 13, 0, 'Native XML issue galley export', 'APP\\plugins\\importexport\\native\\filter\\IssueGalleyNativeXmlFilter', 0, 0, 0),
(14, 14, 0, 'Native XML issue galley import', 'APP\\plugins\\importexport\\native\\filter\\NativeXmlIssueGalleyFilter', 0, 0, 0),
(15, 15, 0, 'Native XML author export', 'APP\\plugins\\importexport\\native\\filter\\AuthorNativeXmlFilter', 0, 0, 0),
(16, 16, 0, 'Native XML author import', 'APP\\plugins\\importexport\\native\\filter\\NativeXmlAuthorFilter', 0, 0, 0),
(17, 18, 0, 'Native XML submission file import', 'APP\\plugins\\importexport\\native\\filter\\NativeXmlArticleFileFilter', 0, 0, 0),
(18, 17, 0, 'Native XML submission file export', 'PKP\\plugins\\importexport\\native\\filter\\SubmissionFileNativeXmlFilter', 0, 0, 0),
(19, 19, 0, 'Native XML representation export', 'APP\\plugins\\importexport\\native\\filter\\ArticleGalleyNativeXmlFilter', 0, 0, 0),
(20, 20, 0, 'Native XML representation import', 'APP\\plugins\\importexport\\native\\filter\\NativeXmlArticleGalleyFilter', 0, 0, 0),
(21, 21, 0, 'Native XML Publication export', 'APP\\plugins\\importexport\\native\\filter\\PublicationNativeXmlFilter', 0, 0, 0),
(22, 22, 0, 'Native XML publication import', 'APP\\plugins\\importexport\\native\\filter\\NativeXmlPublicationFilter', 0, 0, 0),
(23, 23, 0, 'APP\\plugins\\importexport\\pubmed\\filter\\ArticlePubMedXmlFilter', 'APP\\plugins\\importexport\\pubmed\\filter\\ArticlePubMedXmlFilter', 0, 0, 0),
(24, 24, 0, 'User XML user export', 'PKP\\plugins\\importexport\\users\\filter\\PKPUserUserXmlFilter', 0, 0, 0),
(25, 25, 0, 'User XML user import', 'PKP\\plugins\\importexport\\users\\filter\\UserXmlPKPUserFilter', 0, 0, 0),
(26, 26, 0, 'Native XML user group export', 'PKP\\plugins\\importexport\\users\\filter\\UserGroupNativeXmlFilter', 0, 0, 0),
(27, 27, 0, 'Native XML user group import', 'PKP\\plugins\\importexport\\users\\filter\\NativeXmlUserGroupFilter', 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `filter_groups`
--

CREATE TABLE `filter_groups` (
  `filter_group_id` bigint(20) NOT NULL,
  `symbolic` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `input_type` varchar(255) DEFAULT NULL,
  `output_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Filter groups are used to organized filters into named sets, which can be retrieved by the application for invocation.';

--
-- Despejando dados para a tabela `filter_groups`
--

INSERT INTO `filter_groups` (`filter_group_id`, `symbolic`, `display_name`, `description`, `input_type`, `output_type`) VALUES
(1, 'issue=>crossref-xml', 'plugins.importexport.crossref.displayName', 'plugins.importexport.crossref.description', 'class::classes.issue.Issue[]', 'xml::schema(https://www.crossref.org/schemas/crossref5.3.1.xsd)'),
(2, 'article=>crossref-xml', 'plugins.importexport.crossref.displayName', 'plugins.importexport.crossref.description', 'class::classes.submission.Submission[]', 'xml::schema(https://www.crossref.org/schemas/crossref5.3.1.xsd)'),
(3, 'issue=>datacite-xml', 'plugins.importexport.datacite.displayName', 'plugins.importexport.datacite.description', 'class::classes.issue.Issue', 'xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),
(4, 'article=>datacite-xml', 'plugins.importexport.datacite.displayName', 'plugins.importexport.datacite.description', 'class::classes.submission.Submission', 'xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),
(5, 'galley=>datacite-xml', 'plugins.importexport.datacite.displayName', 'plugins.importexport.datacite.description', 'class::lib.pkp.classes.galley.Galley', 'xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),
(6, 'article=>dc11', 'plugins.metadata.dc11.articleAdapter.displayName', 'plugins.metadata.dc11.articleAdapter.description', 'class::classes.submission.Submission', 'metadata::APP\\plugins\\metadata\\dc11\\schema\\Dc11Schema(ARTICLE)'),
(7, 'article=>doaj-xml', 'plugins.importexport.doaj.displayName', 'plugins.importexport.doaj.description', 'class::classes.submission.Submission[]', 'xml::schema(plugins/importexport/doaj/doajArticles.xsd)'),
(8, 'article=>doaj-json', 'plugins.importexport.doaj.displayName', 'plugins.importexport.doaj.description', 'class::classes.submission.Submission', 'primitive::string'),
(9, 'article=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.submission.Submission[]', 'xml::schema(plugins/importexport/native/native.xsd)'),
(10, 'native-xml=>article', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.submission.Submission[]'),
(11, 'issue=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.issue.Issue[]', 'xml::schema(plugins/importexport/native/native.xsd)'),
(12, 'native-xml=>issue', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.issue.Issue[]'),
(13, 'issuegalley=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.issue.IssueGalley[]', 'xml::schema(plugins/importexport/native/native.xsd)'),
(14, 'native-xml=>issuegalley', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.issue.IssueGalley[]'),
(15, 'author=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.author.Author[]', 'xml::schema(plugins/importexport/native/native.xsd)'),
(16, 'native-xml=>author', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.author.Author[]'),
(17, 'SubmissionFile=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::lib.pkp.classes.submissionFile.SubmissionFile', 'xml::schema(plugins/importexport/native/native.xsd)'),
(18, 'native-xml=>SubmissionFile', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::lib.pkp.classes.submissionFile.SubmissionFile[]'),
(19, 'article-galley=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::lib.pkp.classes.galley.Galley', 'xml::schema(plugins/importexport/native/native.xsd)'),
(20, 'native-xml=>ArticleGalley', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::lib.pkp.classes.galley.Galley[]'),
(21, 'publication=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.publication.Publication', 'xml::schema(plugins/importexport/native/native.xsd)'),
(22, 'native-xml=>Publication', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.publication.Publication[]'),
(23, 'article=>pubmed-xml', 'plugins.importexport.pubmed.displayName', 'plugins.importexport.pubmed.description', 'class::classes.submission.Submission[]', 'xml::dtd'),
(24, 'user=>user-xml', 'plugins.importexport.users.displayName', 'plugins.importexport.users.description', 'class::lib.pkp.classes.user.User[]', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),
(25, 'user-xml=>user', 'plugins.importexport.users.displayName', 'plugins.importexport.users.description', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)', 'class::classes.users.User[]'),
(26, 'usergroup=>user-xml', 'plugins.importexport.users.displayName', 'plugins.importexport.users.description', 'class::lib.pkp.classes.security.UserGroup[]', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),
(27, 'user-xml=>usergroup', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)', 'class::lib.pkp.classes.security.UserGroup[]');

-- --------------------------------------------------------

--
-- Estrutura para tabela `filter_settings`
--

CREATE TABLE `filter_settings` (
  `filter_setting_id` bigint(20) UNSIGNED NOT NULL,
  `filter_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about filters, including localized content.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `genres`
--

CREATE TABLE `genres` (
  `genre_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `seq` bigint(20) NOT NULL,
  `enabled` smallint(6) NOT NULL DEFAULT 1,
  `category` bigint(20) NOT NULL DEFAULT 1,
  `dependent` smallint(6) NOT NULL DEFAULT 0,
  `supplementary` smallint(6) NOT NULL DEFAULT 0,
  `required` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Whether or not at least one file of this genre is required for a new submission.',
  `entry_key` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='The types of submission files configured for each context, such as Article Text, Data Set, Transcript, etc.';

--
-- Despejando dados para a tabela `genres`
--

INSERT INTO `genres` (`genre_id`, `context_id`, `seq`, `enabled`, `category`, `dependent`, `supplementary`, `required`, `entry_key`) VALUES
(1, 1, 0, 1, 1, 0, 0, 1, 'SUBMISSION'),
(2, 1, 1, 1, 3, 0, 1, 0, 'RESEARCHINSTRUMENT'),
(3, 1, 2, 1, 3, 0, 1, 0, 'RESEARCHMATERIALS'),
(4, 1, 3, 1, 3, 0, 1, 0, 'RESEARCHRESULTS'),
(5, 1, 4, 1, 3, 0, 1, 0, 'TRANSCRIPTS'),
(6, 1, 5, 1, 3, 0, 1, 0, 'DATAANALYSIS'),
(7, 1, 6, 1, 3, 0, 1, 0, 'DATASET'),
(8, 1, 7, 1, 3, 0, 1, 0, 'SOURCETEXTS'),
(9, 1, 8, 1, 1, 1, 1, 0, 'MULTIMEDIA'),
(10, 1, 9, 1, 2, 1, 0, 0, 'IMAGE'),
(11, 1, 10, 1, 1, 1, 0, 0, 'STYLE'),
(12, 1, 11, 1, 3, 0, 1, 0, 'OTHER');

-- --------------------------------------------------------

--
-- Estrutura para tabela `genre_settings`
--

CREATE TABLE `genre_settings` (
  `genre_setting_id` bigint(20) UNSIGNED NOT NULL,
  `genre_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about file genres, including localized properties such as the genre name.';

--
-- Despejando dados para a tabela `genre_settings`
--

INSERT INTO `genre_settings` (`genre_setting_id`, `genre_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 1, 'pt_BR', 'name', 'Texto do artigo', 'string'),
(2, 1, 'en', 'name', 'Article Text', 'string'),
(3, 1, 'es', 'name', 'Texto del artículo', 'string'),
(4, 2, 'pt_BR', 'name', 'Instrumento de pesquisa', 'string'),
(5, 2, 'en', 'name', 'Research Instrument', 'string'),
(6, 2, 'es', 'name', 'Instrumento de investigación', 'string'),
(7, 3, 'pt_BR', 'name', 'Materiais de pesquisa', 'string'),
(8, 3, 'en', 'name', 'Research Materials', 'string'),
(9, 3, 'es', 'name', 'Materiales de investigación', 'string'),
(10, 4, 'pt_BR', 'name', 'Resultados de pesquisa', 'string'),
(11, 4, 'en', 'name', 'Research Results', 'string'),
(12, 4, 'es', 'name', 'Resultados de la investigación', 'string'),
(13, 5, 'pt_BR', 'name', 'Transcrições', 'string'),
(14, 5, 'en', 'name', 'Transcripts', 'string'),
(15, 5, 'es', 'name', 'Transcripciones', 'string'),
(16, 6, 'pt_BR', 'name', 'Análise de dados', 'string'),
(17, 6, 'en', 'name', 'Data Analysis', 'string'),
(18, 6, 'es', 'name', 'Análisis de datos', 'string'),
(19, 7, 'pt_BR', 'name', 'Conjunto de dados', 'string'),
(20, 7, 'en', 'name', 'Data Set', 'string'),
(21, 7, 'es', 'name', 'Conjunto de datos', 'string'),
(22, 8, 'pt_BR', 'name', 'Textos fonte', 'string'),
(23, 8, 'en', 'name', 'Source Texts', 'string'),
(24, 8, 'es', 'name', 'Textos fuente', 'string'),
(25, 9, 'pt_BR', 'name', 'Multimedia', 'string'),
(26, 9, 'en', 'name', 'Multimedia', 'string'),
(27, 9, 'es', 'name', 'Multimedia', 'string'),
(28, 10, 'pt_BR', 'name', 'Imagem', 'string'),
(29, 10, 'en', 'name', 'Image', 'string'),
(30, 10, 'es', 'name', 'Imagen', 'string'),
(31, 11, 'pt_BR', 'name', 'Folha de Estilos', 'string'),
(32, 11, 'en', 'name', 'HTML Stylesheet', 'string'),
(33, 11, 'es', 'name', 'Hoja de estilo HTML', 'string'),
(34, 12, 'pt_BR', 'name', 'Outros', 'string'),
(35, 12, 'en', 'name', 'Other', 'string'),
(36, 12, 'es', 'name', 'Otro', 'string');

-- --------------------------------------------------------

--
-- Estrutura para tabela `institutional_subscriptions`
--

CREATE TABLE `institutional_subscriptions` (
  `institutional_subscription_id` bigint(20) NOT NULL,
  `subscription_id` bigint(20) NOT NULL,
  `institution_id` bigint(20) NOT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A list of institutional subscriptions, linking a subscription with an institution.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `institutions`
--

CREATE TABLE `institutions` (
  `institution_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `ror` varchar(255) DEFAULT NULL COMMENT 'ROR (Research Organization Registry) ID',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Institutions for statistics and subscriptions.';

--
-- Despejando dados para a tabela `institutions`
--

INSERT INTO `institutions` (`institution_id`, `context_id`, `ror`, `deleted_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `institution_ip`
--

CREATE TABLE `institution_ip` (
  `institution_ip_id` bigint(20) NOT NULL,
  `institution_id` bigint(20) NOT NULL,
  `ip_string` varchar(40) NOT NULL,
  `ip_start` bigint(20) NOT NULL,
  `ip_end` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Records IP address ranges and associates them with institutions.';

--
-- Despejando dados para a tabela `institution_ip`
--

INSERT INTO `institution_ip` (`institution_ip_id`, `institution_id`, `ip_string`, `ip_start`, `ip_end`) VALUES
(1, 1, '10.9.9.195', 168364483, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `institution_settings`
--

CREATE TABLE `institution_settings` (
  `institution_setting_id` bigint(20) UNSIGNED NOT NULL,
  `institution_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about institutions, including localized properties like names.';

--
-- Despejando dados para a tabela `institution_settings`
--

INSERT INTO `institution_settings` (`institution_setting_id`, `institution_id`, `locale`, `setting_name`, `setting_value`) VALUES
(1, 1, 'pt_BR', 'name', 'ITEP');

-- --------------------------------------------------------

--
-- Estrutura para tabela `issues`
--

CREATE TABLE `issues` (
  `issue_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `volume` smallint(6) DEFAULT NULL,
  `number` varchar(40) DEFAULT NULL,
  `year` smallint(6) DEFAULT NULL,
  `published` smallint(6) NOT NULL DEFAULT 0,
  `date_published` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `access_status` smallint(6) NOT NULL DEFAULT 1,
  `open_access_date` datetime DEFAULT NULL,
  `show_volume` smallint(6) NOT NULL DEFAULT 0,
  `show_number` smallint(6) NOT NULL DEFAULT 0,
  `show_year` smallint(6) NOT NULL DEFAULT 0,
  `show_title` smallint(6) NOT NULL DEFAULT 0,
  `style_file_name` varchar(90) DEFAULT NULL,
  `original_style_file_name` varchar(255) DEFAULT NULL,
  `url_path` varchar(64) DEFAULT NULL,
  `doi_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A list of all journal issues, with identifying information like year, number, volume, etc.';

--
-- Despejando dados para a tabela `issues`
--

INSERT INTO `issues` (`issue_id`, `journal_id`, `volume`, `number`, `year`, `published`, `date_published`, `date_notified`, `last_modified`, `access_status`, `open_access_date`, `show_volume`, `show_number`, `show_year`, `show_title`, `style_file_name`, `original_style_file_name`, `url_path`, `doi_id`) VALUES
(4, 1, 1, '1', 2025, 1, '2025-04-09 12:49:09', NULL, '2025-04-09 12:49:09', 1, NULL, 1, 1, 1, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `issue_files`
--

CREATE TABLE `issue_files` (
  `file_id` bigint(20) NOT NULL,
  `issue_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `content_type` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Relationships between issues and issue files, such as cover images.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `issue_galleys`
--

CREATE TABLE `issue_galleys` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `issue_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `url_path` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Issue galleys are representations of the entire issue in a single file, such as a complete issue PDF.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `issue_galley_settings`
--

CREATE TABLE `issue_galley_settings` (
  `issue_galley_setting_id` bigint(20) UNSIGNED NOT NULL,
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about issue galleys, including localized content such as labels.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `issue_settings`
--

CREATE TABLE `issue_settings` (
  `issue_setting_id` bigint(20) UNSIGNED NOT NULL,
  `issue_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about issues, including localized properties such as issue titles.';

--
-- Despejando dados para a tabela `issue_settings`
--

INSERT INTO `issue_settings` (`issue_setting_id`, `issue_id`, `locale`, `setting_name`, `setting_value`) VALUES
(10, 4, 'pt_BR', 'description', '<p>A edição Volume 1, Número 1, Ano 2025 da \"Polícia Científica do Rio Grande do Norte\" representa um marco significativo na disseminação do conhecimento e das práticas da ciência forense no estado. Esta edição inaugural busca estabelecer um espaço de diálogo e reflexão sobre os avanços e desafios enfrentados pelos profissionais da área, promovendo a troca de experiências e a atualização constante.</p>'),
(11, 4, 'en', 'description', '<p>The Volume 1, Number 1, Year 2025 edition of the \"Scientific Police of Rio Grande do Norte\" represents a significant milestone in the dissemination of knowledge and practices of forensic science in the state. This inaugural edition seeks to establish a space for dialogue and reflection on the advances and challenges faced by professionals in the area, promoting the exchange of experiences and constant updating.</p>'),
(12, 4, 'es', 'description', '<p>El Volumen 1, Número 1, edición Año 2025 de la \"Policía Científica de Rio Grande do Norte\" representa un hito significativo en la difusión del conocimiento y las prácticas de la ciencia forense en el estado. Esta edición inaugural busca establecer un espacio de diálogo y reflexión sobre los avances y desafíos que enfrentan los profesionales del área, promoviendo el intercambio de experiencias y la actualización constante.</p>'),
(13, 4, 'pt_BR', 'title', 'Polícia Científica do Rio Grande do Norte'),
(14, 4, 'en', 'title', 'Scientific Police of Rio Grande do Norte'),
(15, 4, 'es', 'title', 'Policía Científica de Rio Grande do Norte'),
(16, 4, 'pt_BR', 'coverImage', 'cover_issue_4_pt_BR.jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='All pending or in-progress jobs.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` text NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Job batches allow jobs to be collected into groups for managed processing.';

--
-- Despejando dados para a tabela `job_batches`
--

INSERT INTO `job_batches` (`id`, `name`, `total_jobs`, `pending_jobs`, `failed_jobs`, `failed_job_ids`, `options`, `cancelled_at`, `created_at`, `finished_at`) VALUES
('9e5e47c3-19ea-4e28-9113-4089776159f2', '', 0, 0, 0, '[]', 'a:0:{}', NULL, 1741277681, NULL),
('9e6602c6-e3e0-41a4-9e97-1767eeabea7a', '', 1, 0, 0, '[]', 'a:0:{}', NULL, 1741609704, 1741609706),
('9e6606e3-f8b7-4a52-a9a8-f47c01577edf', '', 1, 0, 0, '[]', 'a:0:{}', NULL, 1741610394, 1741610394),
('9e740ad5-fd4c-4e0f-8dcd-4c978667629f', '', 1, 0, 0, '[]', 'a:0:{}', NULL, 1742212352, 1742212355),
('9e845b2c-474a-4dce-bed0-f6b00ed5beef', '', 1, 0, 0, '[]', 'a:0:{}', NULL, 1742913025, 1742913025),
('9e9259b2-9ad8-4ff2-847c-7c64feaeab40', '', 2, 0, 0, '[]', 'a:0:{}', NULL, 1743514073, 1743514076),
('9ea2a419-8d5f-4932-915e-c2652fa19ae3', '', 1, 0, 0, '[]', 'a:0:{}', NULL, 1744213750, 1744213753);

-- --------------------------------------------------------

--
-- Estrutura para tabela `journals`
--

CREATE TABLE `journals` (
  `journal_id` bigint(20) NOT NULL,
  `path` varchar(32) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Used to order lists of journals',
  `primary_locale` varchar(14) NOT NULL,
  `enabled` smallint(6) NOT NULL DEFAULT 1 COMMENT 'Controls whether or not the journal is considered "live" and will appear on the website. (Note that disabled journals may still be accessible, but only if the user knows the URL.)',
  `current_issue_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A list of all journals in the installation of OJS.';

--
-- Despejando dados para a tabela `journals`
--

INSERT INTO `journals` (`journal_id`, `path`, `seq`, `primary_locale`, `enabled`, `current_issue_id`) VALUES
(1, 'nugecid', 1.00, 'pt_BR', 1, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `journal_settings`
--

CREATE TABLE `journal_settings` (
  `journal_setting_id` bigint(20) UNSIGNED NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about journals, including localized properties like policies.';

--
-- Despejando dados para a tabela `journal_settings`
--

INSERT INTO `journal_settings` (`journal_setting_id`, `journal_id`, `locale`, `setting_name`, `setting_value`) VALUES
(3, 1, 'pt_BR', 'acronym', 'NUGECID'),
(4, 1, 'pt_BR', 'authorGuidelines', '<p><strong>Procedimentos para submissão de originais</strong></p>\n<ol>\n<li>Todas as contribuições devem ser enviadas em formato especificado no <strong>item 4</strong> da seção <strong>Condições para submissão</strong> através do sítio eletrônico da Revista na plataforma &lt;&gt;.</li>\n<li>O autor e os coautores (se houver), deverão <strong>obrigatoriamente</strong> se cadastrar através da criação de um Usuário com login e senha, preenchendo todo o formulário com suas informações acadêmicas, vinculação institucional e pessoais, mas <strong>apenas o autor principal irá realizar a submissão</strong>. (Link direto no endereço: &lt;página do login&gt;). Poderão ser utilizados os tutoriais para cadastro e submissão no OJS, disponíveis nos links: <em><u>Tutorial para cadastro no OJS</u> </em>e <em><u>Tutorial para o(a) Autor(a).</u></em></li>\n<li>No caso do reenvio do manuscrito revisado, quando de Revisões Requeridas, o autor principal deverá reenviar o trabalho revisado no Menu Avaliação, setor Decisão Editorial, no quesito Versão do Autor (Escolher Arquivo &gt; Transferir), no perfil original da submissão. <strong>Não se deve submeter o manuscrito revisado como se fosse um novo trabalho</strong>.</li>\n<li>Os trabalhos a serem submetidos deve seguir o arquivo <em><u>(Template)</u></em></li>\n</ol>\n<p><strong>Orientações gerais</strong></p>\n<p>Os trabalhos enviados à RPCRN, digitados em formato .doc ou .docx, deverão conter obrigatoriamente a formatação a seguir que contém nos Template:</p>\n<ol>\n<li>Fonte do documento: Times New Roman;</li>\n<li>Folha: tamanho A4;</li>\n<li>Margens: Superior e Esquerda (3cm); Inferior e Direita (2cm);</li>\n<li>Título e subtítulo (se houver): primeira letra em maiúsculo e em caixa baixa, tamanho 16, negrito, centralizado;</li>\n<li>Título em inglês e subtítulo: primeira letra em maiúsculo e em caixa baixa, tamanho 16, itálico, centralizado;</li>\n<li>Título das seções (Introdução, Metodologia, Resultados e Discussões, Considerações finais ou Conclusões): em caixa alta, tamanho 14, negrito, alinhado a esquerda;</li>\n<li>Corpo do texto: tamanho 12, justificado;</li>\n<li>Citações<strong>de mais de três linhas: tamanho 11, recuo de 2 cm, justificado;</strong></li>\n<li>Resumo, palavras-chave, paginação, notas de rodapé, texto da fonte das ilustrações, figuras, quadros e tabelas: tamanho 10</li>\n<li>Titulo das legendas das ilustrações, figuras, quadros e tabelas: tamanho 12, centralizado; (Ex: <strong>Gráfico 1</strong> -, <strong>Figura 1</strong> -, <strong>Quadro 1</strong> -, <strong>Tabela 1</strong> -;</li>\n<li>Palavras estrangeiras e títulos de obras devem ser escritos em itálico;</li>\n<li>Corpo textual da Introdução, Metodologia, Resultados e Discussões, Considerações finais ou Conclusões: espaçamento entre linhas de 1,5, justificado;</li>\n<li>As ilustrações, figuras, quadros e tabelas serão inseridas em ordem crescente, logo após sua menção no texto, e não devem ultrapassar a margem da página. As ilustrações e figuras deverão estar em alta resolução (mínimo de 300 dpi). As legendas dos títulos de todos as tipologias mencionadas anteriormente deverão ser inseridas logo acima dos mesmos. Logo após a figura/quadro/tabela deve ser inserida informação Fonte e ano. Para os casos de figura elaboradas pelos autores ou terceiros informar a Elaboração e ano. (No caso de imagens de terceiros, a responsabilidade de cumprimento das leis de direitos autorais é dos autores);</li>\n<li>Citações com até 3 linhas devem aparecer referenciadas no corpo do texto e conter aspas;</li>\n<li>A chamada de autores no texto deverá ser feita pelo sistema Autor, data.</li>\n<li>Os agradecimentos a auxílios recebidos pelo(s) autor(es) podem ser mencionados ao final do texto.</li>\n<li>Os trabalhos submetidos a RPCRN serão submetidos a sistema de avaliação por pares duplamente cega.</li>\n<li>Os serviços de <strong>revisão textual</strong> são contratados e de <strong>responsabilidade dos autores</strong>.</li>\n</ol>'),
(5, 1, 'en', 'authorGuidelines', '<p>Authors are invited to make a submission to this journal. All submissions will be assessed by an editor to determine whether they meet the aims and scope of this journal. Those considered to be a good fit will be sent for peer review before determining whether they will be accepted or rejected.</p><p>Before making a submission, authors are responsible for obtaining permission to publish any material included with the submission, such as photos, documents and datasets. All authors identified on the submission must consent to be identified as an author. Where appropriate, research should be approved by an appropriate ethics committee in accordance with the legal requirements of the study\'s country.</p><p>An editor may desk reject a submission if it does not meet minimum standards of quality. Before submitting, please ensure that the study design and research argument are structured and articulated properly. The title should be concise and the abstract should be able to stand on its own. This will increase the likelihood of reviewers agreeing to review the paper. When you\'re satisfied that your submission meets this standard, please follow the checklist below to prepare your submission.</p>'),
(6, 1, 'es', 'authorGuidelines', '<p>Se invita a los autores/as a realizar un envío a esta revista. Todas los envíos serán evaluados por un editor/a para determinar si cumplen con los objetivos y el alcance de esta revista. Los que se consideren adecuados se enviarán a una revisión por pares antes de determinar si serán aceptados o rechazados.</p><p>Antes de remitir un envío, los autores/as son responsables de obtener el permiso para publicar cualquier material incluido en él, como fotos, documentos y conjuntos de datos. Todos los autores/as identificados en el envío deben dar su consentimiento para ser identificados como autores/as. Cuando corresponda, la investigación debe ser aprobada por un comité de ética apropiado de acuerdo con los requisitos legales del país del estudio.</p><p>Un editor/a puede rechazar un envío si no cumple con los estándares mínimos de calidad. Antes de hacer el envío, asegúrese de que el diseño del estudio y el argumento de la investigación estén estructurados y articulados correctamente. El título debe ser conciso y el resumen debe poder sostenerse por sí solo. Esto aumentará la probabilidad de que los revisores/as acepten revisar el artículo. Cuando tenga la certeza de que su envío cumple con este estándar, continúe a la lista de verificación que hay a continuación para preparar su envío.</p>'),
(7, 1, 'pt_BR', 'authorInformation', 'Interessado em enviar para esta revista? Recomendamos que você analise a <a href=\"http://localhost/ojs-system/index.php/nugecid/about\">About the Journal</a> página para as políticas de seção da revista, bem como as <a href=\"http://localhost/ojs-system/index.php/nugecid/about/submissions#authorGuidelines\">Diretrizes para autores</a>. Autores precisam <a href=\"http://localhost/ojs-system/index.php/nugecid/user/register\">registrar-se</a> com a revista antes de enviar ou, se já estiver registrado, pode simplesmente <a href=\"http://localhost/ojs-system/index.php/index/login\"> fazer log in</a> e iniciar o processo de cinco etapas.'),
(8, 1, 'en', 'authorInformation', 'Interested in submitting to this journal? We recommend that you review the <a href=\"http://localhost/ojs-system/index.php/nugecid/about\">About the Journal</a> page for the journal\'s section policies, as well as the <a href=\"http://localhost/ojs-system/index.php/nugecid/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/ojs-system/index.php/nugecid/user/register\">register</a> with the journal prior to submitting or, if already registered, can simply <a href=\"http://localhost/ojs-system/index.php/index/login\">log in</a> and begin the five-step process.'),
(9, 1, 'es', 'authorInformation', '¿Está interesado en publicar en la revista? Se recomienda revisar la página <a href=\"http://localhost/ojs-system/index.php/nugecid/about\">Acerca de la revista</a> para consultar las políticas de sección de la revista, así como las <a href=\"http://localhost/ojs-system/index.php/nugecid/about/submissions#authorGuidelines\">Directrices del autor/a</a>. Los autores/as deben <a href=\"http://localhost/ojs-system/index.php/nugecid/user/register\">registrarse</a> en la revista antes de publicar o, si ya están registrados, pueden simplemente <a href=\"http://localhost/ojs-system/index.php/index/login\">iniciar sesión</a> y comenzar el proceso de cinco pasos.'),
(10, 1, 'pt_BR', 'beginSubmissionHelp', '<p>Obrigado por submeter para Nugecid. Você será solicitado a enviar arquivos, identificar coautores e fornecer informações como título e resumo.<p><p>Leia nossas <a href=\"http://localhost/ojs-system/index.php/nugecid/about/submissions\" target=\"_blank\">Diretrizes de Submissão </a> caso ainda não o tenha feito. Ao preencher os formulários, forneça o máximo de detalhes possível para ajudar nossos editores a avaliar seu trabalho.</p><p>Depois de começar, você pode salvar sua submissão e voltar a ele mais tarde. Você poderá revisar e corrigir qualquer informação antes de submeter.</p>'),
(11, 1, 'en', 'beginSubmissionHelp', '<p>Thank you for submitting to the Nugecid. You will be asked to upload files, identify co-authors, and provide information such as the title and abstract.<p><p>Please read our <a href=\"http://localhost/ojs-system/index.php/nugecid/about/submissions\" target=\"_blank\">Submission Guidelines</a> if you have not done so already. When filling out the forms, provide as many details as possible in order to help our editors evaluate your work.</p><p>Once you begin, you can save your submission and come back to it later. You will be able to review and correct any information before you submit.</p>'),
(12, 1, 'es', 'beginSubmissionHelp', '<p>Gracias por su envío a Nugecid. Se le pedirá que cargue archivos, identifique coautores y proporcione información como el título y el resumen.<p><p>Lea nuestras <a href=\"http://localhost/ojs-system/index.php/nugecid/about/submissions\" target=\"_blank\">directrices de envío</a> si aún no lo ha hecho. Cuando rellene los formularios, proporcione todos los detalles posibles para ayudar a nuestros editores/as a evaluar su trabajo.</p><p>Una vez iniciado, podrá guardar el envío y recuperarlo más tarde, así como revisar y corregir cualquier información antes de remitirlo.</p>'),
(13, 1, '', 'contactEmail', 'revistapericiacientifica@itep.rn.gov.br'),
(14, 1, '', 'contactName', 'NUCLEO DE GESTÃO DO CONHECIMENTO, INFORMAÇÃO, DOCUMENTAÇÃO E MEMÓRIA.(NUGECID)'),
(15, 1, 'pt_BR', 'contributorsHelp', '<p>Adicione os detalhes de todos os contribuidores a esta submissão. Os colaboradores adicionados aqui receberão um e-mail de confirmação da submissão, bem como uma cópia de todas as decisões editoriais registradas contra esta submissão.</p><p>Se um colaborador não puder ser contatado por e-mail, porque deve permanecer anônimo ou não possui uma conta de e-mail, por favor, não insira um endereço de e-mail falso. Você pode adicionar informações sobre este colaborador em uma mensagem ao editor em uma etapa posterior do processo de submissão.</p>'),
(16, 1, 'en', 'contributorsHelp', '<p>Add details for all of the contributors to this submission. Contributors added here will be sent an email confirmation of the submission, as well as a copy of all editorial decisions recorded against this submission.</p><p>If a contributor can not be contacted by email, because they must remain anonymous or do not have an email account, please do not enter a fake email address. You can add information about this contributor in a message to the editor at a later step in the submission process.</p>'),
(17, 1, 'es', 'contributorsHelp', '<p>Añada los detalles de todos los colaboradores/as de este envío. Los colaboradores/as que añada aquí recibirán un correo electrónico de confirmación del envío, así como una copia de todas las decisiones editoriales registradas relacionadas con este envío.</p><p>Si un colaborador/a no quiere ser contactado por correo electrónico, ya sea porque quiere permanecer anónimo o porque no tiene una cuenta de correo, no introduzca una dirección de correo electrónico falsa. Puede añadir información sobre este colaborador/a en un mensaje para el editor/a en el último paso del proceso de envío.</p>'),
(18, 1, '', 'country', 'BR'),
(19, 1, '', 'defaultReviewMode', '2'),
(23, 1, 'pt_BR', 'detailsHelp', '<p>Forneça os seguintes detalhes para nos ajudar a gerenciar sua submissão em nosso sistema.</p>'),
(24, 1, 'en', 'detailsHelp', '<p>Please provide the following details to help us manage your submission in our system.</p>'),
(25, 1, 'es', 'detailsHelp', '<p>Proporcione los detalles siguientes para ayudarnos a gestionar su envío en nuestro sistema.</p>'),
(26, 1, '', 'copySubmissionAckPrimaryContact', '0'),
(28, 1, '', 'emailSignature', '<p>{$journalAcronym}</p>\n<p>{$journalUrl}</p>\n<hr />\n<p> </p>\n<p>Esta é uma mensagem automática de <a href=\"http://localhost/ojs-system/index.php/nugecid\"> Nugecid/ITEP</a></p>\n<p>E: revistapericiacientifica@itep.rn.gov.br</p>\n<p>P: +55 84 3232-6928</p>'),
(29, 1, '', 'enableDois', '1'),
(30, 1, '', 'doiSuffixType', 'default'),
(31, 1, '', 'registrationAgency', ''),
(32, 1, '', 'disableSubmissions', '0'),
(33, 1, '', 'editorialStatsEmail', '1'),
(34, 1, 'pt_BR', 'forTheEditorsHelp', '<p>Forneça os seguintes detalhes para ajudar nossa equipe editorial a gerenciar sua submissão.</p><p>Ao inserir metadados, forneça entradas que você acha que seriam mais úteis para a pessoa que está gerenciando sua submissão. Esta informação pode ser alterada antes da publicação.</p>'),
(35, 1, 'en', 'forTheEditorsHelp', '<p>Please provide the following details in order to help our editorial team manage your submission.</p><p>When entering metadata, provide entries that you think would be most helpful to the person managing your submission. This information can be changed before publication.</p>'),
(36, 1, 'es', 'forTheEditorsHelp', '<p>Proporcione los detalles siguientes para ayudar a nuestro equipo editorial a gestionar su envío.</p><p>Cuando introduzca los metadatos, facilite las entradas que considere más útiles para la persona que gestione su envío. Esta información puede modificarse antes de la publicación.</p>'),
(37, 1, '', 'itemsPerPage', '25'),
(38, 1, '', 'keywords', 'request'),
(39, 1, 'pt_BR', 'librarianInformation', 'Encorajamos bibliotecários de pesquisa a listar este periódico entre os itens de periódicos eletrônicos de sua biblioteca. Além disso, pode ser interessante notar que o sistema de publicação de código aberto desta revista é adequado para as bibliotecas hospedarem seus professores para usarem com os periódicos envolvidos na edição (veja <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).'),
(40, 1, 'en', 'librarianInformation', 'We encourage research librarians to list this journal among their library\'s electronic journal holdings. As well, it may be worth noting that this journal\'s open source publishing system is suitable for libraries to host for their faculty members to use with journals they are involved in editing (see <a href=\"https://pkp.sfu.ca/ojs\">Open Journal Systems</a>).'),
(41, 1, 'es', 'librarianInformation', 'Se recomienda a los investigadores/as bibliotecarios/as que incluyan esta revista en su listado de revistas electrónicas. Asimismo, cabría destacar que el sistema de publicación de código abierto de esta revista es apto para bibliotecas con personal docente que desee editar sus propias revistas (ver <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).'),
(44, 1, 'pt_BR', 'name', 'NUGECID'),
(45, 1, '', 'notifyAllAuthors', '1'),
(46, 1, '', 'numPageLinks', '10'),
(47, 1, '', 'numWeeksPerResponse', '4'),
(48, 1, '', 'numWeeksPerReview', '4'),
(49, 1, 'pt_BR', 'openAccessPolicy', 'Esta revista oferece acesso livre imediato ao seu conteúdo, seguindo o princípio de que disponibilizar gratuitamente o conhecimento científico ao público proporciona maior democratização mundial do conhecimento.'),
(50, 1, 'en', 'openAccessPolicy', 'This journal provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.'),
(51, 1, 'es', 'openAccessPolicy', 'Esta revista proporciona un acceso abierto inmediato a su contenido, basado en el principio de ofrecer al público un acceso libre a las investigaciones ayuda a un mayor intercambio global de conocimiento.'),
(52, 1, 'pt_BR', 'privacyStatement', '<p>Os nomes e endereços informados nesta revista serão usados exclusivamente para os serviços prestados por esta publicação, não sendo disponibilizados para outras finalidades ou a terceiros.</p>'),
(53, 1, 'en', 'privacyStatement', '<p>The names and email addresses entered in this journal site will be used exclusively for the stated purposes of this journal and will not be made available for any other purpose or to any other party.</p>'),
(54, 1, 'es', 'privacyStatement', '<p>Los nombres y las direcciones de correo electrónico introducidos en esta revista se usarán exclusivamente para los fines establecidos en ella y no se proporcionarán a terceros o para su uso con otros fines.</p>'),
(55, 1, 'pt_BR', 'readerInformation', 'Incentivamos os leitores a se inscreverem no serviço de notificação de publicação deste periódico. Use o <a href=\"http://localhost/ojs-system/index.php/nugecid/user/register\">Registrar</a> link na parte superior da página inicial da revista. Esse registro fará com que o leitor receba o Índice por e-mail para cada nova edição da revista. Essa lista também permite que o periódico reivindique um certo nível de suporte ou leitores. Veja a <a href=\"http://localhost/ojs-system/index.php/nugecid/about/submissions#privacyStatement\">Declaração de privacidade da revista</a>, que garante aos leitores que seu nome e endereço de e-mail não serão usados para outros fins.'),
(56, 1, 'en', 'readerInformation', 'We encourage readers to sign up for the publishing notification service for this journal. Use the <a href=\"http://localhost/ojs-system/index.php/nugecid/user/register\">Register</a> link at the top of the home page for the journal. This registration will result in the reader receiving the Table of Contents by email for each new issue of the journal. This list also allows the journal to claim a certain level of support or readership. See the journal\'s <a href=\"http://localhost/ojs-system/index.php/nugecid/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.'),
(57, 1, 'es', 'readerInformation', 'Animamos a los lectores/as a registrarse en el servicio de notificación de publicaciones de la revista. Utilice el enlace <a href=\"http://localhost/ojs-system/index.php/nugecid/user/register\">Registro</a> de la parte superior de la página de inicio de la revista. Como resultado del registro, el lector/a recibirá por correo electrónico la Tabla de contenidos de cada número de la revista. Esta lista también permite que se le atribuya a la revista un cierto nivel de apoyo o número de lectores/as. Consulte la <a href=\"http://localhost/ojs-system/index.php/nugecid/about/submissions#privacyStatement\">Declaración de privacidad</a> de la revista, que garantiza a los lectores/as que sus nombres y direcciones de correo electrónico no se usarán con otros fines.'),
(58, 1, 'pt_BR', 'reviewHelp', '<p>Revise as informações inseridas antes de concluir a submissão. Você pode alterar qualquer um dos detalhes exibidos aqui clicando no botão de edição na parte superior de cada seção.</p><p>Depois de concluir sua submissão, um membro de nossa equipe editorial será designado para revisá-lo. Certifique-se de que os detalhes inseridos aqui sejam os mais precisos possíveis.</p>'),
(59, 1, 'en', 'reviewHelp', '<p>Review the information you have entered before you complete your submission. You can change any of the details displayed here by clicking the edit button at the top of each section.</p><p>Once you complete your submission, a member of our editorial team will be assigned to review it. Please ensure the details you have entered here are as accurate as possible.</p>'),
(60, 1, 'es', 'reviewHelp', '<p>Revise la información que ha introducido antes de finalizar el envío. Puede modificar cualquier detalle que se muestre aquí a través del botón de edición situado en la parte superior de cada sección.</p><p>Una vez finalizado el envío, este se asignará a una persona de nuestro equipo editorial para que lo revise. Asegúrese de que la información que ha introducido sea lo más precisa posible.</p>'),
(61, 1, '', 'submissionAcknowledgement', 'allAuthors'),
(62, 1, 'pt_BR', 'submissionChecklist', '<ul>\n<li>Como parte do processo de submissão, os autores são obrigados a verificar a conformidade da submissão em relação a todos os itens listados a seguir. As submissões que não estiverem de acordo com as normas serão devolvidas aos autores.</li>\n</ul>\n<p> </p>\n<ol>\n<li>A submissão só será aceita se o <strong><u>cadastro do autor(a)</u></strong><u> <strong>no sistema estiver</strong></u> <strong><u>completo</u></strong>.</li>\n<li>A contribuição é <strong><u>original e inédita</u></strong>, e não está sendo avaliada para publicação por outra revista.</li>\n<li>Os trabalhos deverão conter os seguintes limites de paginação:</li>\n</ol>\n<p> </p>\n<ol>\n<li>Artigo, ensaios fotográficos, memoriais, entrevistas e traduções (15 a 25 páginas);</li>\n<li>Resenhas (máx. 3 páginas).</li>\n</ol>\n<p> </p>\n<ol start=\"4\">\n<li>O texto segue os padrões de estilo e requisitos apresentados no template de acordo com a tipologia de trabalho a ser submetido.</li>\n<li>O arquivo da submissão está em formato .doc ou ODT.</li>\n<li>Na submissão a uma seção com avaliação por pares (ex.: artigos, resenhas, ensaios fotográficos, memoriais, entrevistas e traduções), deve ser retirado qualquer metadado que identifique a autoria (ex. Citação, Referências, Nome de Projetos, Propriedades do documento).</li>\n<li>Você receberá uma confirmação de cada passo de seu artigo, porém, <strong><u>não se esqueça de cadastrar o e-mail do admin</u> </strong>(inserir e-mail da revista na sua caixa de e-mail, assim ele não será confundido com um SPAM). A não execução desse item é a principal causa de não recebimento de e-mails a respeito da revista e seu artigo. Clicando nesse item você concorda que <strong>toda a comunicação será feita por meio eletrônico</strong>.</li>\n<li>URLs e/ou DOIs para as referências serão sempre informados.</li>\n<li>Os autores transferem os direitos sob o arquivo e seus metadados adicionais a RPCRN.</li>\n<li>Os autores concordam em conceder a RPCRN o direito de primeira publicação dos trabalhos submetidos;</li>\n<li>Os autores concordam que caso seja aceito para publicação o trabalho submetido passa a ser licenciado sob uma Licença Internacional (<em>Creative Commons</em> Atribuição 4.0 Internacional) do tipo <em>Attribution-NonCommercial-ShareAlike</em>0 International (CC BY-NC-SA 4.0), sendo garantido o acesso aberto a todo o seu conteúdo, sem restrições, desde que seja respeitada a licença concedida.</li>\n</ol>'),
(63, 1, 'en', 'submissionChecklist', '<p>All submissions must meet the following requirements.</p><ul><li>This submission meets the requirements outlined in the <a href=\"http://localhost/ojs-system/index.php/nugecid/about/submissions\">Author Guidelines</a>.</li><li>This submission has not been previously published, nor is it before another journal for consideration.</li><li>All references have been checked for accuracy and completeness.</li><li>All tables and figures have been numbered and labeled.</li><li>Permission has been obtained to publish all photos, datasets and other material provided with this submission.</li></ul>'),
(64, 1, 'es', 'submissionChecklist', '<p>Todos los envíos deben cumplir con los siguientes requisitos.</p><ul><li>Este envío cumple con los requisitos descritos en las <a href=\"http://localhost/ojs-system/index.php/nugecid/about/submissions\">Directrices para autores/as</a>.</li><li>Este envío no ha sido publicado previamente, ni se ha presentado ante otra revista para su consideración.</li><li>Todas las referencias han sido verificadas para ver si son precisas y completas.</li><li>Todas las tablas y figuras han sido numeradas y etiquetadas.</li><li>Se ha obtenido permiso para publicar todas las imágenes, conjuntos de datos y cualquier otro material proporcionado con este envío.</li></ul>'),
(65, 1, '', 'submitWithCategories', '0'),
(66, 1, '', 'supportedFormLocales', '[\"pt_BR\",\"en\",\"es\"]'),
(67, 1, '', 'supportedLocales', '[\"pt_BR\",\"en\",\"es\"]'),
(68, 1, '', 'supportedSubmissionLocales', '[\"pt_BR\",\"es\",\"en\"]'),
(69, 1, '', 'themePluginPath', 'bootstrap3'),
(70, 1, 'pt_BR', 'uploadFilesHelp', '<p>Forneça todos os arquivos que nossa equipe editorial possa precisar para avaliar sua submissão. Além do trabalho principal, você pode enviar conjuntos de dados, declarações de conflito de interesses ou outros arquivos suplementares se forem úteis para nossos editores.</p>'),
(71, 1, 'en', 'uploadFilesHelp', '<p>Provide any files our editorial team may need to evaluate your submission. In addition to the main work, you may wish to submit data sets, conflict of interest statements, or other supplementary files if these will be helpful for our editors.</p>'),
(72, 1, 'es', 'uploadFilesHelp', '<p>Proporcione todos los archivos que nuestro equipo editorial necesite para evaluar su envío. Además de la obra principal puede enviarnos conjuntos de datos, declaraciones de conflictos de interés u otros archivos adicionales si considera que serán de ayuda para nuestros editores/as.</p>'),
(73, 1, '', 'enableGeoUsageStats', 'country+region+city'),
(74, 1, '', 'enableInstitutionUsageStats', '1'),
(75, 1, '', 'isSushiApiPublic', '0'),
(78, 1, 'pt_BR', 'abbreviation', 'NUGECID'),
(79, 1, 'pt_BR', 'clockssLicense', 'Esta revista utiliza o sistema CLOCKSS para criar um sistema de arquivos distribuídos entre bibliotecas participantes e permite que tais bibliotecas mantenham cópias permanentes da revista para propósitos de preservação e recuperação. <a href=\"http://clockss.org/\">Saiba mais...</a>'),
(80, 1, 'en', 'clockssLicense', 'This journal utilizes the CLOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"https://clockss.org\">More...</a>'),
(81, 1, 'es', 'clockssLicense', 'Esta revista utiliza el sistema CLOCKSS para crear un sistema de archivos distribuido entre las bibliotecas participantes y permite a estas bibliotecas crear archivos permanentes de la revista con finalidad de preservación y restauración. <a href=\"https://clockss.org/\">Saber más...</a>'),
(82, 1, '', 'copyrightYearBasis', 'issue'),
(83, 1, '', 'enabledDoiTypes', '[\"publication\"]'),
(84, 1, '', 'doiCreationTime', 'copyEditCreationTime'),
(85, 1, '', 'enableOai', '1'),
(86, 1, 'pt_BR', 'lockssLicense', 'Este periódico utiliza o sistema LOCKSS para criar um sistema de arquivamento distribuído entre as bibliotecas participantes e permite que essas bibliotecas criem arquivos permanentes do periódico para fins de preservação e restauração. <a href=\"http://www.lockss.org/\">More...</a>'),
(87, 1, 'en', 'lockssLicense', 'This journal utilizes the LOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"https://www.lockss.org\">More...</a>'),
(88, 1, 'es', 'lockssLicense', 'Esta revista utiliza el sistema LOCKSS para crear un sistema de archivos distribuido entre las bibliotecas participantes y permite a estas bibliotecas crear archivos permanentes de la revista con finalidades de preservación y restauración. <a href=\"https://lockss.org/\">Saber más...</a>'),
(89, 1, '', 'membershipFee', '0'),
(90, 1, '', 'publicationFee', '0'),
(91, 1, '', 'purchaseArticleFee', '0'),
(92, 1, '', 'doiVersioning', '0'),
(93, 1, 'pt_BR', 'announcementsIntroduction', '<p data-start=\"0\" data-end=\"92\"><strong data-start=\"0\" data-end=\"90\">Nova Revista Científica do NUGECID – ITEP é Lançada para Fomentar a Produção Acadêmica</strong></p>\n<p data-start=\"94\" data-end=\"503\">O Instituto Técnico-Científico de Perícia do Rio Grande do Norte (ITEP-RN), por meio do Núcleo de Gestão de Conhecimento e Informação, Documentação e Memória (NUGECID), anuncia o lançamento de sua revista científica. A publicação tem como objetivo promover a disseminação de pesquisas, estudos e inovações nas áreas de gestão do conhecimento, informação, documentação e preservação da memória institucional.</p>\n<p data-start=\"505\" data-end=\"815\">Com a revista, o NUGECID busca fortalecer o debate acadêmico e contribuir para o avanço das práticas científicas, ampliando o acesso ao conhecimento produzido por especialistas e pesquisadores. A iniciativa reforça o compromisso do ITEP-RN com a valorização da informação e o incentivo à produção científica.</p>\n<p data-start=\"817\" data-end=\"1039\" data-is-last-node=\"\" data-is-only-node=\"\">Em sua edição inaugural, a revista trará artigos e análises sobre temas atuais e relevantes para a comunidade acadêmica e profissional. A publicação estará disponível online, garantindo amplo acesso ao público interessado.</p>'),
(94, 1, '', 'enableAnnouncements', '1'),
(95, 1, '', 'numAnnouncementsHomepage', '3'),
(96, 1, 'pt_BR', 'dateFormatLong', '%e %B %Y'),
(97, 1, 'pt_BR', 'dateFormatShort', '%m/%d/%Y'),
(98, 1, 'pt_BR', 'datetimeFormatLong', '%e %B %Y - %H:%M'),
(99, 1, 'pt_BR', 'datetimeFormatShort', '%m/%d/%Y %H:%M'),
(100, 1, 'pt_BR', 'timeFormat', '%H:%M'),
(101, 1, 'pt_BR', 'favicon', '{\"name\":\"favicon-removebg-preview.png\",\"uploadName\":\"favicon_pt_BR.png\",\"width\":390,\"height\":455,\"dateUploaded\":\"2025-03-06 13:33:27\",\"altText\":\"Favicon.ico\"}'),
(103, 1, '', 'sidebar', '[\"AnnouncementFeedBlockPlugin\",\"WebFeedBlockPlugin\",\"languagetoggleblockplugin\",\"developedbyblockplugin\"]'),
(105, 1, 'pt_BR', 'pageFooter', '<div class=\"custom-footer-content\" style=\"display: flex; justify-content: space-between; align-items: stretch; width: 100%; font-size: 14px; padding: 10px 0;\"><!-- Lado Esquerdo -->\n<div style=\"width: 50%; text-align: left; padding-right: 20px;\">Av. Duque de Caxias, 97 - Ribeira, Natal - RN, 59010-200 <br />Núcleo de Gestão de Conhecimento e Informação Documentação e Memória.</div>\n<!-- Linha Vertical + Lado Direito -->\n<div style=\"width: 50%; text-align: left; padding-left: 20px; border-left: 2px solid #ccc;\">\n<div style=\"display: flex; flex-direction: column;\">\n<div>E-mail:<a style=\"color: #3b82f6; text-decoration: none; margin-left: 5px;\" href=\"mailto:revistapericiacientifica@itep.rn.gov.br\"> revistapericiacientifica@itep.rn.gov.br </a></div>\n<div style=\"margin-top: 5px;\">Contato:<a style=\"color: #3b82f6; text-decoration: none; margin-left: 5px;\" href=\"tel:+558432236928\"> +55 (84) 3223-6928 </a></div>\n</div>\n</div>\n</div>\n<!-- Copyright -->\n<p class=\"custom-footer-copyright\" style=\"text-align: center; font-size: 12px; margin-top: 10px;\">Copyright © 2025 - INSTITUTO TÉCNICO-CIENTÍFICO DE PERÍCIA - ITEP/RN. Todos os direitos reservados.</p>\n<p class=\"custom-footer-designed\" style=\"text-align: center; font-size: 12px;\">Designed by <a href=\"http://localhost/ojs-system/index.php/nugecid/nugecid\">NUGECID</a>.</p>'),
(106, 1, '', 'copyrightHolderType', 'author'),
(107, 1, '', 'agencies', '0'),
(108, 1, '', 'citations', '0'),
(109, 1, '', 'coverage', '0'),
(110, 1, '', 'disciplines', '0'),
(111, 1, '', 'requireAuthorCompetingInterests', '0'),
(112, 1, '', 'languages', '0'),
(113, 1, '', 'rights', '0'),
(114, 1, '', 'source', '0'),
(115, 1, '', 'subjects', '0'),
(116, 1, '', 'type', '0'),
(117, 1, '', 'dataAvailability', '0'),
(118, 1, '', 'enablePublisherId', '[]'),
(121, 1, '', 'supportEmail', 'revistapericiacientifica@itep.rn.gov.br'),
(122, 1, '', 'supportName', 'Equipe Técnica NUGECID'),
(123, 1, '', 'supportPhone', '+558432326928'),
(124, 1, '', 'mailingAddress', 'Av. Duque Caxias 97, Natal, RN, 59012-200 '),
(125, 1, 'pt_BR', 'contactAffiliation', 'INSTITUTO TÉCNICO-CIENTÍFICO DE PERÍCIA (ITEP/RN)'),
(126, 1, '', 'contactPhone', '+558432326928'),
(128, 1, 'pt_BR', 'journalThumbnail', '{\"name\":\"favicon-removebg-preview.png\",\"uploadName\":\"journalThumbnail_pt_BR.png\",\"width\":390,\"height\":455,\"dateUploaded\":\"2025-03-07 08:30:24\",\"altText\":\"Favicon.ico\"}'),
(129, 1, 'pt_BR', 'pageHeaderLogoImage', '{\"name\":\"logo_texto_branco.png\",\"uploadName\":\"pageHeaderLogoImage_pt_BR.png\",\"width\":3000,\"height\":497,\"dateUploaded\":\"2025-03-07 10:41:09\",\"altText\":\"Branco\"}'),
(134, 1, 'pt_BR', 'about', '<hr style=\"border: 1px solid #ccc; margin: 10px 0;\" /><!-- Linha superior -->\n<p style=\"background-color: #f5f5f5; padding: 15px; border-radius: 5px;\">A <strong>Revista da NUGECID</strong>(Núcleo de Gestão de Conhecimento e Informação Documentação e Memória do ITEP/RN) é uma publicação científica dedicada à disseminação de conhecimentos, pesquisas e inovações nas áreas de ciências aplicadas, tecnologia e gestão. Tem como objetivo promover o debate acadêmico e científico sobre temas relevantes para o desenvolvimento de soluções inovadoras no contexto da pesquisa científica e do uso da tecnologia para melhorar a qualidade dos serviços prestados à sociedade. A revista está aberta à publicação de artigos, estudos de caso, resenhas e outros tipos de produção científica relacionados ao avanço do conhecimento e à aplicação prática de novas tecnologias no âmbito institucional e na sociedade em geral.</p>\n<hr style=\"border: 1px solid #ccc; margin: 10px 0;\" /><!-- Linha inferior -->\n<p> </p>'),
(136, 1, '', 'publisherInstitution', 'NUGECID'),
(137, 1, '', 'publisherUrl', 'http://www.itep.rn.gov.br/'),
(138, 1, '', 'onlineIssn', '0000-0000'),
(139, 1, '', 'printIssn', '0000-0000'),
(142, 1, '', 'licenseUrl', 'https://creativecommons.org/licenses/by-sa/4.0'),
(143, 1, '', 'publishingMode', '0'),
(144, 1, 'pt_BR', 'copyrightNotice', '<p><strong>Declaração de Direito Autoral</strong></p>\n<p>Autores que publicam nesta revista concordam com os seguintes termos:</p>\n<ol>\n<li>Autores mantém os direitos autorais e concedem à revista o direito de primeira publicação, com o trabalho simultaneamente licenciado sob a <a href=\"http://creativecommons.org/licenses/by/3.0/\">Licença <em>Creative Commons Attribution</em></a> que permite o compartilhamento do trabalho com reconhecimento da autoria e publicação inicial nesta revista.</li>\n<li>Autores têm autorização para assumir contratos adicionais separadamente, para distribuição não-exclusiva da versão do trabalho publicada nesta revista (ex.: publicar em repositório institucional ou como capítulo de livro), com reconhecimento de autoria e publicação inicial nesta revista.</li>\n<li>Autores têm permissão e são estimulados a publicar e distribuir seu trabalho online (ex.: em repositórios institucionais ou na sua página pessoal) a qualquer ponto antes ou durante o processo editorial, já que isso pode gerar alterações produtivas, bem como aumentar o impacto e a citação do trabalho publicado.</li>\n</ol>'),
(145, 1, 'pt_BR', 'description', '<p>A Revista da Polícia Científica do Rio Grande do Norte (RPCIRN) está vinculada ao Núcleo de Gestão do Conhecimento, Informação, Documentação e Memória (NUGECID). Destina-se a publicação gratuita de artigos originais que contribuam para a promoção, a divulgação e o desenvolvimento científico e tecnológico das ciências forenses, referentes aos resultados de pesquisas, avanços, projetos técnico-científicos e relatos de caso relacionados à Medicina Legal, Criminalística e Papiloscopia nas seguintes áreas como: Física, Química, Biologia, Odontologia, Farmacologia, Informática, Contabilidade, Engenharia Legal, Antropologia, Arqueologia, Psicologia, e áreas correlatas à perícia científica, como: Direito, Biblioteconomia, Arquivologia, Administração, Comunicação social, Engenharia de Produção, Serviço Social, Análise e Desenvolvimento de Sistemas e Engenharia de Segurança do Trabalho.</p>'),
(146, 1, 'en', 'pageFooter', '<div class=\"custom-footer-content\" style=\"display: flex; justify-content: space-between; align-items: stretch; width: 100%; font-size: 14px; padding: 10px 0;\"><!-- Lado Esquerdo -->\n<div style=\"width: 50%; text-align: left; padding-right: 20px;\">Avenue Duque de Caxias, 97 - Ribeira, Natal - RN, 59010-200 <br />Center for Knowledge and Information Management, Documentation and Memory</div>\n<!-- Linha Vertical + Lado Direito -->\n<div style=\"width: 50%; text-align: left; padding-left: 20px; border-left: 2px solid #ccc;\">\n<div style=\"display: flex; flex-direction: column;\">\n<div>E:<a style=\"color: #3b82f6; text-decoration: none; margin-left: 5px;\" href=\"mailto:revistapericiacientifica@itep.rn.gov.br\"> revistapericiacientifica@itep.rn.gov.br </a></div>\n<div style=\"margin-top: 5px;\">P:<a style=\"color: #3b82f6; text-decoration: none; margin-left: 5px;\" href=\"tel:+558432236928\"> +55 84 3223-6928 </a></div>\n</div>\n</div>\n</div>\n<!-- Copyright -->\n<p class=\"custom-footer-copyright\" style=\"text-align: center; font-size: 12px; margin-top: 10px;\">Copyright © 2025 - INSTITUTO TÉCNICO-CIENTÍFICO DE PERÍCIA - ITEP/RN. All rights reserved.</p>\n<p class=\"custom-footer-designed\" style=\"text-align: center; font-size: 12px;\">Designed by NUGECID.</p>'),
(147, 1, 'es', 'pageFooter', '<div class=\"custom-footer-content\" style=\"display: flex; justify-content: space-between; align-items: stretch; width: 100%; font-size: 14px; padding: 10px 0;\"><!-- Lado Esquerdo -->\n<div style=\"width: 50%; text-align: left; padding-right: 20px;\">Av. Duque de Caxias, 97 - Ribeira, Natal - RN, 59010-200 <br />Centro de Gestión del Conocimiento y la Información, Documentación y Memoria</div>\n<!-- Linha Vertical + Lado Direito -->\n<div style=\"width: 50%; text-align: left; padding-left: 20px; border-left: 2px solid #ccc;\">\n<div style=\"display: flex; flex-direction: column;\">\n<div>E:<a style=\"color: #3b82f6; text-decoration: none; margin-left: 5px;\" href=\"mailto:revistapericiacientifica@itep.rn.gov.br\"> revistapericiacientifica@itep.rn.gov.br </a></div>\n<div style=\"margin-top: 5px;\">P:<a style=\"color: #3b82f6; text-decoration: none; margin-left: 5px;\" href=\"tel:+558432236928\"> +55 84 3223-6928 </a></div>\n</div>\n</div>\n</div>\n<!-- Copyright -->\n<p class=\"custom-footer-copyright\" style=\"text-align: center; font-size: 12px; margin-top: 10px;\">Copyright © 2025 - INSTITUTO TÉCNICO-CIENTÍFICO DE PERÍCIA - ITEP/RN. Todos los derechos reservados.</p>\n<p class=\"custom-footer-designed\" style=\"text-align: center; font-size: 12px;\">Designed by NUGECID.</p>'),
(148, 1, 'en', 'about', '<hr style=\"border: 1px solid #ccc; margin: 10px 0;\" /><!-- Linha superior -->\n<p style=\"background-color: #f5f5f5; padding: 15px; border-radius: 5px;\">A <strong>Revista da NUGECID</strong>(Center for Knowledge and Information Management, Documentation and Memory of ITEP/RN) is a scientific publication dedicated to the dissemination of knowledge, research and innovations in the areas of applied sciences, technology and management. It aims to promote academic and scientific debate on topics relevant to the development of innovative solutions in the context of scientific research and the use of technology to improve the quality of services provided to society. The journal is open to the publication of articles, case studies, reviews and other types of scientific production related to the advancement of knowledge and the practical application of new technologies in the institutional sphere and in society in general.</p>\n<hr style=\"border: 1px solid #ccc; margin: 10px 0;\" /><!-- Linha inferior -->\n<p> </p>'),
(149, 1, 'en', 'description', '<p>The Scientific Police Journal of Rio Grande do Norte (RPCRN) is linked to the Center for Knowledge, Information, Documentation and Memory Management (NUGECID). It is intended for the free publication of original articles that contribute to the promotion, dissemination and scientific and technological development of forensic sciences, referring to the results of research, advances, technical-scientific projects and case reports related to Forensic Medicine, Criminalistics and Papilloscopy in the following areas such as: Physics, Chemistry, Biology, Dentistry, Pharmacology, Informatics, Accounting, Legal Engineering, Anthropology, Archaeology, Psychology, and areas related to scientific expertise, such as: Law, Library Science, Archivology, Administration, Social Communication, Production Engineering, Social Work, Systems Analysis and Development, and Occupational Safety Engineering.</p>'),
(150, 1, 'es', 'about', '<hr style=\"border: 1px solid #ccc; margin: 10px 0;\" /><!-- Linha superior -->\n<p style=\"background-color: #f5f5f5; padding: 15px; border-radius: 5px;\">A <strong>Revista da NUGECID</strong>(Centro de Gestión del Conocimiento e Información, Documentación y Memoria del ITEP/RN) es una publicación científica dedicada a la difusión del conocimiento, la investigación y las innovaciones en las áreas de ciencias aplicadas, tecnología y gestión. Su objetivo es promover el debate académico y científico sobre temas relevantes para el desarrollo de soluciones innovadoras en el contexto de la investigación científica y el uso de la tecnología para mejorar la calidad de los servicios prestados a la sociedad. La revista está abierta a la publicación de artículos, estudios de caso, revisiones y otros tipos de producción científica relacionados con el avance del conocimiento y la aplicación práctica de las nuevas tecnologías en el ámbito institucional y en la sociedad en general.</p>\n<hr style=\"border: 1px solid #ccc; margin: 10px 0;\" /><!-- Linha inferior -->\n<p> </p>'),
(151, 1, 'es', 'description', '<p>La Revista Científica de Policía de Rio Grande do Norte (RPCRN) está vinculada al Centro de Conocimiento, Información, Documentación y Gestión de la Memoria (NUGECID). Está destinado a la publicación gratuita de artículos originales que contribuyan a la promoción, difusión y desarrollo científico y tecnológico de las ciencias forenses, referidos a los resultados de investigaciones, avances, proyectos técnico-científicos y reportes de casos relacionados con la Medicina Forense, la Criminalística y la Papiloscopía en las siguientes áreas tales como: Física, Química, Biología, Odontología, Farmacología, Informática, Contabilidad, Ingeniería Jurídica, Antropología, Arqueología, Psicología, y áreas afines al conocimiento científico, tales como: Derecho, Bibliotecología, Archivología, Administración, Comunicación Social, Ingeniería de Producción, Trabajo Social, Análisis y Desarrollo de Sistemas e Ingeniería de Seguridad Ocupacional.</p>');

-- --------------------------------------------------------

--
-- Estrutura para tabela `library_files`
--

CREATE TABLE `library_files` (
  `file_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `original_file_name` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `type` smallint(6) NOT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `submission_id` bigint(20) DEFAULT NULL,
  `public_access` smallint(6) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Library files can be associated with the context (press/server/journal) or with individual submissions, and are typically forms, agreements, and other administrative documents that are not part of the scholarly content.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `library_file_settings`
--

CREATE TABLE `library_file_settings` (
  `library_file_setting_id` bigint(20) UNSIGNED NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object|date)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about library files, including localized content such as names.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `metrics_context`
--

CREATE TABLE `metrics_context` (
  `metrics_context_id` bigint(20) UNSIGNED NOT NULL,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `metric` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Daily statistics for views of the homepage.';

--
-- Despejando dados para a tabela `metrics_context`
--

INSERT INTO `metrics_context` (`metrics_context_id`, `load_id`, `context_id`, `date`, `metric`) VALUES
(1, 'usage_events_20250306.log', 1, '2025-03-06', 8),
(2, 'usage_events_20250307.log', 1, '2025-03-07', 39),
(3, 'usage_events_20250310.log', 1, '2025-03-10', 15),
(4, 'usage_events_20250311.log', 1, '2025-03-11', 52),
(5, 'usage_events_20250312.log', 1, '2025-03-12', 40),
(6, 'usage_events_20250313.log', 1, '2025-03-13', 28),
(7, 'usage_events_20250314.log', 1, '2025-03-14', 35),
(8, 'usage_events_20250317.log', 1, '2025-03-17', 7),
(9, 'usage_events_20250318.log', 1, '2025-03-18', 21),
(10, 'usage_events_20250319.log', 1, '2025-03-19', 29),
(11, 'usage_events_20250320.log', 1, '2025-03-20', 37),
(12, 'usage_events_20250321.log', 1, '2025-03-21', 29),
(13, 'usage_events_20250323.log', 1, '2025-03-23', 1),
(14, 'usage_events_20250324.log', 1, '2025-03-24', 3),
(15, 'usage_events_20250325.log', 1, '2025-03-25', 24),
(16, 'usage_events_20250326.log', 1, '2025-03-26', 10),
(17, 'usage_events_20250331.log', 1, '2025-03-31', 20);

-- --------------------------------------------------------

--
-- Estrutura para tabela `metrics_counter_submission_daily`
--

CREATE TABLE `metrics_counter_submission_daily` (
  `metrics_counter_submission_daily_id` bigint(20) UNSIGNED NOT NULL,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `metric_investigations` int(11) NOT NULL,
  `metric_investigations_unique` int(11) NOT NULL,
  `metric_requests` int(11) NOT NULL,
  `metric_requests_unique` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Daily statistics matching the COUNTER R5 protocol for views and downloads of published submissions and galleys.';

--
-- Despejando dados para a tabela `metrics_counter_submission_daily`
--

INSERT INTO `metrics_counter_submission_daily` (`metrics_counter_submission_daily_id`, `load_id`, `context_id`, `submission_id`, `date`, `metric_investigations`, `metric_investigations_unique`, `metric_requests`, `metric_requests_unique`) VALUES
(9, 'usage_events_20250312.log', 1, 4, '2025-03-12', 2, 1, 0, 0),
(11, 'usage_events_20250314.log', 1, 4, '2025-03-14', 4, 1, 0, 0),
(13, 'usage_events_20250317.log', 1, 5, '2025-03-17', 1, 1, 0, 0),
(15, 'usage_events_20250319.log', 1, 4, '2025-03-19', 1, 1, 0, 0),
(17, 'usage_events_20250325.log', 1, 4, '2025-03-25', 2, 1, 0, 0),
(19, 'usage_events_20250326.log', 1, 4, '2025-03-26', 1, 1, 0, 0),
(21, 'usage_events_20250331.log', 1, 4, '2025-03-31', 4, 3, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `metrics_counter_submission_institution_daily`
--

CREATE TABLE `metrics_counter_submission_institution_daily` (
  `metrics_counter_submission_institution_daily_id` bigint(20) UNSIGNED NOT NULL,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `institution_id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `metric_investigations` int(11) NOT NULL,
  `metric_investigations_unique` int(11) NOT NULL,
  `metric_requests` int(11) NOT NULL,
  `metric_requests_unique` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Daily statistics matching the COUNTER R5 protocol for views and downloads from institutions.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `metrics_counter_submission_institution_monthly`
--

CREATE TABLE `metrics_counter_submission_institution_monthly` (
  `metrics_counter_submission_institution_monthly_id` bigint(20) UNSIGNED NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `institution_id` bigint(20) NOT NULL,
  `month` int(11) NOT NULL,
  `metric_investigations` int(11) NOT NULL,
  `metric_investigations_unique` int(11) NOT NULL,
  `metric_requests` int(11) NOT NULL,
  `metric_requests_unique` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Monthly statistics matching the COUNTER R5 protocol for views and downloads from institutions.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `metrics_counter_submission_monthly`
--

CREATE TABLE `metrics_counter_submission_monthly` (
  `metrics_counter_submission_monthly_id` bigint(20) UNSIGNED NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `month` int(11) NOT NULL,
  `metric_investigations` int(11) NOT NULL,
  `metric_investigations_unique` int(11) NOT NULL,
  `metric_requests` int(11) NOT NULL,
  `metric_requests_unique` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Monthly statistics matching the COUNTER R5 protocol for views and downloads of published submissions and galleys.';

--
-- Despejando dados para a tabela `metrics_counter_submission_monthly`
--

INSERT INTO `metrics_counter_submission_monthly` (`metrics_counter_submission_monthly_id`, `context_id`, `submission_id`, `month`, `metric_investigations`, `metric_investigations_unique`, `metric_requests`, `metric_requests_unique`) VALUES
(23, 1, 4, 202503, 14, 8, 0, 0),
(24, 1, 5, 202503, 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `metrics_issue`
--

CREATE TABLE `metrics_issue` (
  `metrics_issue_id` bigint(20) UNSIGNED NOT NULL,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `issue_id` bigint(20) NOT NULL,
  `issue_galley_id` bigint(20) DEFAULT NULL,
  `date` date NOT NULL,
  `metric` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Daily statistics for views and downloads of published issues.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `metrics_submission`
--

CREATE TABLE `metrics_submission` (
  `metrics_submission_id` bigint(20) UNSIGNED NOT NULL,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `representation_id` bigint(20) DEFAULT NULL,
  `submission_file_id` bigint(20) UNSIGNED DEFAULT NULL,
  `file_type` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `metric` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Daily statistics for views and downloads of published submissions and galleys.';

--
-- Despejando dados para a tabela `metrics_submission`
--

INSERT INTO `metrics_submission` (`metrics_submission_id`, `load_id`, `context_id`, `submission_id`, `representation_id`, `submission_file_id`, `file_type`, `assoc_type`, `date`, `metric`) VALUES
(5, 'usage_events_20250312.log', 1, 4, NULL, NULL, NULL, 1048585, '2025-03-12', 2),
(6, 'usage_events_20250314.log', 1, 4, NULL, NULL, NULL, 1048585, '2025-03-14', 4),
(7, 'usage_events_20250317.log', 1, 5, NULL, NULL, NULL, 1048585, '2025-03-17', 1),
(8, 'usage_events_20250319.log', 1, 4, NULL, NULL, NULL, 1048585, '2025-03-19', 1),
(9, 'usage_events_20250325.log', 1, 4, NULL, NULL, NULL, 1048585, '2025-03-25', 2),
(10, 'usage_events_20250326.log', 1, 4, NULL, NULL, NULL, 1048585, '2025-03-26', 1),
(11, 'usage_events_20250331.log', 1, 4, NULL, NULL, NULL, 1048585, '2025-03-31', 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `metrics_submission_geo_daily`
--

CREATE TABLE `metrics_submission_geo_daily` (
  `metrics_submission_geo_daily_id` bigint(20) UNSIGNED NOT NULL,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `date` date NOT NULL,
  `metric` int(11) NOT NULL,
  `metric_unique` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Daily statistics by country, region and city for views and downloads of published submissions and galleys.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `metrics_submission_geo_monthly`
--

CREATE TABLE `metrics_submission_geo_monthly` (
  `metrics_submission_geo_monthly_id` bigint(20) UNSIGNED NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `month` int(11) NOT NULL,
  `metric` int(11) NOT NULL,
  `metric_unique` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Monthly statistics by country, region and city for views and downloads of published submissions and galleys.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `navigation_menus`
--

CREATE TABLE `navigation_menus` (
  `navigation_menu_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `area_name` varchar(255) DEFAULT '',
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Navigation menus on the website are installed with the software as a default set, and can be customized.';

--
-- Despejando dados para a tabela `navigation_menus`
--

INSERT INTO `navigation_menus` (`navigation_menu_id`, `context_id`, `area_name`, `title`) VALUES
(1, 0, 'user', 'User Navigation Menu'),
(2, 1, 'user', 'User Navigation Menu'),
(3, 1, 'primary', 'Primary Navigation Menu');

-- --------------------------------------------------------

--
-- Estrutura para tabela `navigation_menu_items`
--

CREATE TABLE `navigation_menu_items` (
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `path` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Navigation menu items are single elements within a navigation menu.';

--
-- Despejando dados para a tabela `navigation_menu_items`
--

INSERT INTO `navigation_menu_items` (`navigation_menu_item_id`, `context_id`, `path`, `type`) VALUES
(1, 0, NULL, 'NMI_TYPE_USER_REGISTER'),
(2, 0, NULL, 'NMI_TYPE_USER_LOGIN'),
(3, 0, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(4, 0, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(5, 0, NULL, 'NMI_TYPE_USER_PROFILE'),
(6, 0, NULL, 'NMI_TYPE_ADMINISTRATION'),
(7, 0, NULL, 'NMI_TYPE_USER_LOGOUT'),
(8, 1, '', 'NMI_TYPE_USER_REGISTER'),
(9, 1, NULL, 'NMI_TYPE_USER_LOGIN'),
(10, 1, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(11, 1, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(12, 1, NULL, 'NMI_TYPE_USER_PROFILE'),
(13, 1, NULL, 'NMI_TYPE_ADMINISTRATION'),
(14, 1, NULL, 'NMI_TYPE_USER_LOGOUT'),
(15, 1, NULL, 'NMI_TYPE_CURRENT'),
(16, 1, NULL, 'NMI_TYPE_ARCHIVES'),
(17, 1, NULL, 'NMI_TYPE_ANNOUNCEMENTS'),
(18, 1, NULL, 'NMI_TYPE_ABOUT'),
(19, 1, NULL, 'NMI_TYPE_ABOUT'),
(20, 1, NULL, 'NMI_TYPE_SUBMISSIONS'),
(22, 1, NULL, 'NMI_TYPE_PRIVACY'),
(23, 1, NULL, 'NMI_TYPE_CONTACT'),
(24, 1, '', 'NMI_TYPE_SEARCH'),
(27, 1, 'teste', 'NMI_TYPE_CUSTOM'),
(28, 1, 'about/editorialTeam', 'NMI_TYPE_CUSTOM'),
(29, 1, '', 'NMI_TYPE_REMOTE_URL');

-- --------------------------------------------------------

--
-- Estrutura para tabela `navigation_menu_item_assignments`
--

CREATE TABLE `navigation_menu_item_assignments` (
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL,
  `navigation_menu_id` bigint(20) NOT NULL,
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `seq` bigint(20) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Links navigation menu items to navigation menus.';

--
-- Despejando dados para a tabela `navigation_menu_item_assignments`
--

INSERT INTO `navigation_menu_item_assignments` (`navigation_menu_item_assignment_id`, `navigation_menu_id`, `navigation_menu_item_id`, `parent_id`, `seq`) VALUES
(1, 1, 1, 0, 0),
(2, 1, 2, 0, 1),
(3, 1, 3, 0, 2),
(4, 1, 4, 3, 0),
(5, 1, 5, 3, 1),
(6, 1, 6, 3, 2),
(7, 1, 7, 3, 3),
(150, 2, 29, 0, 0),
(151, 2, 8, 0, 1),
(152, 2, 9, 0, 2),
(153, 2, 10, 0, 3),
(154, 2, 11, 10, 4),
(155, 2, 12, 10, 5),
(156, 2, 13, 10, 6),
(157, 2, 14, 10, 7),
(158, 3, 18, 0, 0),
(159, 3, 19, 18, 1),
(160, 3, 20, 18, 2),
(161, 3, 28, 18, 3),
(162, 3, 22, 18, 4),
(163, 3, 23, 18, 5),
(164, 3, 15, 0, 6),
(165, 3, 16, 0, 7),
(166, 3, 17, 0, 8);

-- --------------------------------------------------------

--
-- Estrutura para tabela `navigation_menu_item_assignment_settings`
--

CREATE TABLE `navigation_menu_item_assignment_settings` (
  `navigation_menu_item_assignment_setting_id` bigint(20) UNSIGNED NOT NULL,
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about navigation menu item assignments to navigation menus, including localized content.';

--
-- Despejando dados para a tabela `navigation_menu_item_assignment_settings`
--

INSERT INTO `navigation_menu_item_assignment_settings` (`navigation_menu_item_assignment_setting_id`, `navigation_menu_item_assignment_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(13, 150, 'pt_BR', 'title', 'Site Institucional', 'string'),
(14, 151, 'pt_BR', 'title', 'Cadastro', 'string'),
(15, 161, 'pt_BR', 'title', 'Equipe Editorial', 'string');

-- --------------------------------------------------------

--
-- Estrutura para tabela `navigation_menu_item_settings`
--

CREATE TABLE `navigation_menu_item_settings` (
  `navigation_menu_item_setting_id` bigint(20) UNSIGNED NOT NULL,
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about navigation menu items, including localized content such as names.';

--
-- Despejando dados para a tabela `navigation_menu_item_settings`
--

INSERT INTO `navigation_menu_item_settings` (`navigation_menu_item_setting_id`, `navigation_menu_item_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 1, '', 'titleLocaleKey', 'navigation.register', 'string'),
(2, 2, '', 'titleLocaleKey', 'navigation.login', 'string'),
(3, 3, '', 'titleLocaleKey', '{$loggedInUsername}', 'string'),
(4, 4, '', 'titleLocaleKey', 'navigation.dashboard', 'string'),
(5, 5, '', 'titleLocaleKey', 'common.viewProfile', 'string'),
(6, 6, '', 'titleLocaleKey', 'navigation.admin', 'string'),
(7, 7, '', 'titleLocaleKey', 'user.logOut', 'string'),
(8, 8, '', 'titleLocaleKey', 'navigation.register', 'string'),
(9, 9, '', 'titleLocaleKey', 'navigation.login', 'string'),
(10, 10, '', 'titleLocaleKey', '{$loggedInUsername}', 'string'),
(11, 11, '', 'titleLocaleKey', 'navigation.dashboard', 'string'),
(12, 12, '', 'titleLocaleKey', 'common.viewProfile', 'string'),
(13, 13, '', 'titleLocaleKey', 'navigation.admin', 'string'),
(14, 14, '', 'titleLocaleKey', 'user.logOut', 'string'),
(15, 15, '', 'titleLocaleKey', 'navigation.current', 'string'),
(16, 16, '', 'titleLocaleKey', 'navigation.archives', 'string'),
(17, 17, '', 'titleLocaleKey', 'manager.announcements', 'string'),
(18, 18, '', 'titleLocaleKey', 'navigation.about', 'string'),
(19, 19, '', 'titleLocaleKey', 'about.aboutContext', 'string'),
(20, 20, '', 'titleLocaleKey', 'about.submissions', 'string'),
(22, 22, '', 'titleLocaleKey', 'manager.setup.privacyStatement', 'string'),
(23, 23, '', 'titleLocaleKey', 'about.contact', 'string'),
(24, 24, '', 'titleLocaleKey', 'common.search', 'string'),
(34, 27, 'pt_BR', 'title', 'Teste', 'string'),
(35, 27, 'pt_BR', 'content', '<p>TESTES TE TES TE TS T SADNADA<br>DNA<br>DNAD<br>AND<br>ANDS<br>DNADSA</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"http://localhost/ojs-system/public/site/images/admin/print-210da307a55b0f76d2935b13072b17a3.png\" alt=\"\" width=\"780\" height=\"602\"></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>TESTETTESTE STES TES</p>\r\n<p>&nbsp;</p>\r\n<p>{$contactName}{$contactEmail}{$supportEmail}</p>', 'string'),
(36, 27, 'pt_BR', 'remoteUrl', '', 'string'),
(37, 28, 'pt_BR', 'title', 'Equipe Editorial', 'string'),
(38, 28, 'pt_BR', 'content', '<div class=\"uk-container-medium\">\r\n<div id=\"group\" style=\"background-color: #f5f5f5; padding: 20px; margin: 10px 0; border-radius: 5px;\">\r\n<h4>Editora Chefe</h4>\r\n<ul>\r\n<li>Gesiele Farias da Silva, ITEP/RN, Brasil.</li>\r\n</ul>\r\n<h4>Editor Adjunto</h4>\r\n<ul>\r\n<li>(a definir)</li>\r\n</ul>\r\n<h4>Assistente Editorial</h4>\r\n<ul>\r\n<li>(a definir)</li>\r\n</ul>\r\n<h4>Suporte Tecnológico</h4>\r\n<ul>\r\n<li>(a definir)</li>\r\n</ul>\r\n<h4>COMISSÃO EDITORIAL</h4>\r\n<ul>\r\n<li>Peritos Médicos: Matheus do Sindperitos</li>\r\n<li>Peritos Criminais: Pedro, Newton, Marcos Brandão</li>\r\n<li>Engenharia de Produção: Gabriela</li>\r\n<li>Administração: Jailma</li>\r\n<li>Serviço Social: Angely</li>\r\n<li>Direito Penal: Stefani</li>\r\n<li>Psicologia: Suzy</li>\r\n</ul>\r\n<h4>CONSELHO EDITORIAL</h4>\r\n<p>&nbsp;</p>\r\n</div>\r\n</div>', 'string'),
(39, 28, 'pt_BR', 'remoteUrl', '', 'string'),
(40, 24, 'pt_BR', 'content', '', 'string'),
(41, 24, 'pt_BR', 'remoteUrl', '', 'string'),
(42, 8, 'pt_BR', 'title', 'Cadastro', 'string'),
(43, 8, 'pt_BR', 'content', '', 'string'),
(44, 8, 'pt_BR', 'remoteUrl', '', 'string'),
(45, 29, 'pt_BR', 'title', 'Site Institucional', 'string'),
(46, 29, 'pt_BR', 'content', '', 'string'),
(47, 29, 'pt_BR', 'remoteUrl', 'http://www.itep.rn.gov.br/', 'string');

-- --------------------------------------------------------

--
-- Estrutura para tabela `notes`
--

CREATE TABLE `notes` (
  `note_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `contents` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Notes allow users to annotate associated entities, such as submissions.';

--
-- Despejando dados para a tabela `notes`
--

INSERT INTO `notes` (`note_id`, `assoc_type`, `assoc_id`, `user_id`, `date_created`, `date_modified`, `title`, `contents`) VALUES
(8, 1048586, 6, 1, '2025-03-17 09:04:31', '2025-03-17 09:04:31', 'Comentários para o editor', '<p>Isso é um teste, isso é um teste, de um teste...</p>'),
(15, 1048586, 13, 1, '2025-04-29 11:51:42', '2025-04-29 11:51:42', 'Comentários para o editor', '<p>Isso é um teste</p>');

-- --------------------------------------------------------

--
-- Estrutura para tabela `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` bigint(20) NOT NULL,
  `context_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `level` bigint(20) NOT NULL,
  `type` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='User notifications created during certain operations.';

--
-- Despejando dados para a tabela `notifications`
--

INSERT INTO `notifications` (`notification_id`, `context_id`, `user_id`, `level`, `type`, `date_created`, `date_read`, `assoc_type`, `assoc_id`) VALUES
(70, 1, 1, 2, 8, '2025-03-10 09:28:24', NULL, 0, 0),
(71, 1, 3, 2, 8, '2025-03-10 09:28:25', NULL, 0, 0),
(72, 1, 2, 2, 8, '2025-03-10 09:28:25', NULL, 0, 0),
(78, 1, 1, 2, 268435477, '2025-03-10 09:39:54', NULL, 259, 1),
(79, 1, 3, 2, 268435477, '2025-03-10 09:39:54', NULL, 259, 1),
(80, 1, 2, 2, 268435477, '2025-03-10 09:39:54', NULL, 259, 1),
(127, 1, 1, 2, 16777217, '2025-03-12 10:50:49', NULL, 1048585, 4),
(128, 1, 1, 2, 16777217, '2025-03-12 10:50:49', NULL, 1048585, 4),
(129, 1, 1, 2, 16777217, '2025-03-12 10:50:49', NULL, 1048585, 4),
(130, 1, 1, 2, 16777217, '2025-03-12 10:50:49', NULL, 1048585, 4),
(136, 1, NULL, 2, 16777236, '2025-03-12 10:57:26', '2025-03-12 10:57:37', 523, 3),
(138, 1, 1, 2, 16777254, '2025-03-12 10:57:52', '2025-03-12 10:57:56', 1048585, 4),
(152, 1, 1, 2, 268435477, '2025-03-17 08:52:32', NULL, 259, 2),
(153, 1, 3, 2, 268435477, '2025-03-17 08:52:35', NULL, 259, 2),
(154, 1, 2, 2, 268435477, '2025-03-17 08:52:35', NULL, 259, 2),
(155, 1, 1, 2, 16777217, '2025-03-17 09:04:30', NULL, 1048585, 5),
(156, 1, 1, 2, 16777217, '2025-03-17 09:04:30', NULL, 1048585, 5),
(157, 1, 1, 2, 16777217, '2025-03-17 09:04:30', NULL, 1048585, 5),
(158, 1, 1, 2, 16777217, '2025-03-17 09:04:30', NULL, 1048585, 5),
(163, 1, 1, 2, 16777254, '2025-03-17 09:05:19', '2025-03-17 09:05:23', 1048585, 5),
(202, 1, 1, 2, 16777217, '2025-03-25 11:06:08', NULL, 1048585, 6),
(203, 1, 1, 2, 16777217, '2025-03-25 11:06:08', NULL, 1048585, 6),
(204, 1, 1, 2, 16777217, '2025-03-25 11:06:08', NULL, 1048585, 6),
(205, 1, 1, 2, 16777217, '2025-03-25 11:06:08', NULL, 1048585, 6),
(226, 1, 1, 2, 268435477, '2025-03-25 11:30:25', NULL, 259, 3),
(227, 1, 3, 2, 268435477, '2025-03-25 11:30:25', NULL, 259, 3),
(228, 1, 6, 2, 268435477, '2025-03-25 11:30:25', NULL, 259, 3),
(229, 1, 2, 2, 268435477, '2025-03-25 11:30:25', NULL, 259, 3),
(230, 1, 5, 2, 268435477, '2025-03-25 11:30:25', NULL, 259, 3),
(239, 1, 1, 3, 16777258, '2025-04-01 10:27:54', '2025-04-10 10:27:21', 0, 0),
(240, 1, 1, 2, 16777258, '2025-04-01 10:27:55', NULL, 0, 0),
(241, 1, 1, 2, 16777260, '2025-04-01 10:27:56', NULL, 0, 0),
(261, 1, 1, 2, 268435477, '2025-04-09 12:49:11', NULL, 259, 4),
(262, 1, 3, 2, 268435477, '2025-04-09 12:49:13', NULL, 259, 4),
(263, 1, 6, 2, 268435477, '2025-04-09 12:49:13', NULL, 259, 4),
(264, 1, 2, 2, 268435477, '2025-04-09 12:49:13', NULL, 259, 4),
(265, 1, 5, 2, 268435477, '2025-04-09 12:49:13', NULL, 259, 4),
(266, 1, 7, 2, 268435477, '2025-04-09 12:49:13', NULL, 259, 4),
(268, 1, 1, 2, 16777217, '2025-04-29 11:51:38', NULL, 1048585, 10),
(269, 1, 1, 2, 16777217, '2025-04-29 11:51:38', NULL, 1048585, 10),
(270, 1, 1, 2, 16777217, '2025-04-29 11:51:38', NULL, 1048585, 10),
(271, 1, 1, 2, 16777217, '2025-04-29 11:51:38', NULL, 1048585, 10),
(272, 1, 1, 3, 16777249, '2025-04-29 11:51:42', NULL, 1048586, 13),
(273, 1, 1, 3, 16777249, '2025-04-29 11:51:46', NULL, 1048586, 13),
(274, 1, 1, 3, 16777249, '2025-04-29 11:51:50', NULL, 1048586, 13),
(275, 1, 1, 3, 16777249, '2025-04-29 11:51:53', NULL, 1048586, 13);

-- --------------------------------------------------------

--
-- Estrutura para tabela `notification_settings`
--

CREATE TABLE `notification_settings` (
  `notification_setting_id` bigint(20) UNSIGNED NOT NULL,
  `notification_id` bigint(20) NOT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` mediumtext NOT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about notifications, including localized properties.';

--
-- Despejando dados para a tabela `notification_settings`
--

INSERT INTO `notification_settings` (`notification_setting_id`, `notification_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(41, 70, '', 'contents', 'Teste zero um', 'string'),
(42, 71, '', 'contents', 'Teste zero um', 'string'),
(43, 72, '', 'contents', 'Teste zero um', 'string'),
(121, 239, '', 'contents', 'Este é um lembrete para você verificar a situação do seu periódico por meio do relatório editorial.', 'string');

-- --------------------------------------------------------

--
-- Estrutura para tabela `notification_subscription_settings`
--

CREATE TABLE `notification_subscription_settings` (
  `setting_id` bigint(20) NOT NULL,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` mediumtext NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `context` bigint(20) DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Which email notifications a user has chosen to unsubscribe from.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `oai_resumption_tokens`
--

CREATE TABLE `oai_resumption_tokens` (
  `oai_resumption_token_id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(32) NOT NULL,
  `expire` bigint(20) NOT NULL,
  `record_offset` int(11) NOT NULL,
  `params` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='OAI resumption tokens are used to allow for pagination of large result sets into manageable pieces.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `plugin_settings`
--

CREATE TABLE `plugin_settings` (
  `plugin_setting_id` bigint(20) UNSIGNED NOT NULL,
  `plugin_name` varchar(80) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `setting_name` varchar(80) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about plugins, including localized properties. This table is frequently used to store plugin-specific configuration.';

--
-- Despejando dados para a tabela `plugin_settings`
--

INSERT INTO `plugin_settings` (`plugin_setting_id`, `plugin_name`, `context_id`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'acronplugin', 0, 'enabled', '0', 'bool'),
(2, 'acronplugin', 0, 'crontab', '[{\"className\":\"APP\\\\plugins\\\\importexport\\\\doaj\\\\DOAJInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\ReviewReminder\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\StatisticsReport\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"APP\\\\tasks\\\\SubscriptionExpiryReminder\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"PKP\\\\task\\\\DepositDois\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\RemoveUnvalidatedExpiredUsers\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"PKP\\\\task\\\\EditorialReminders\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"PKP\\\\task\\\\UpdateIPGeoDB\",\"frequency\":{\"day\":\"10\"},\"args\":[]},{\"className\":\"APP\\\\tasks\\\\UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\ProcessQueueJobs\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\RemoveFailedJobs\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"APP\\\\tasks\\\\OpenAccessNotification\",\"frequency\":{\"hour\":24},\"args\":[]}]', 'object'),
(3, 'defaultthemeplugin', 0, 'enabled', '1', 'bool'),
(4, 'tinymceplugin', 0, 'enabled', '1', 'bool'),
(5, 'usageeventplugin', 0, 'enabled', '1', 'bool'),
(6, 'developedbyblockplugin', 0, 'enabled', '0', 'bool'),
(7, 'developedbyblockplugin', 0, 'seq', '0', 'int'),
(8, 'languagetoggleblockplugin', 0, 'enabled', '1', 'bool'),
(9, 'languagetoggleblockplugin', 0, 'seq', '4', 'int'),
(10, 'defaultthemeplugin', 1, 'enabled', '1', 'bool'),
(11, 'tinymceplugin', 1, 'enabled', '1', 'bool'),
(12, 'developedbyblockplugin', 1, 'enabled', '1', 'bool'),
(13, 'developedbyblockplugin', 1, 'seq', '0', 'int'),
(14, 'informationblockplugin', 1, 'enabled', '1', 'bool'),
(15, 'informationblockplugin', 1, 'seq', '7', 'int'),
(16, 'languagetoggleblockplugin', 1, 'enabled', '1', 'bool'),
(17, 'languagetoggleblockplugin', 1, 'seq', '4', 'int'),
(18, 'subscriptionblockplugin', 1, 'enabled', '1', 'bool'),
(19, 'subscriptionblockplugin', 1, 'seq', '2', 'int'),
(20, 'resolverplugin', 1, 'enabled', '1', 'bool'),
(21, 'dublincoremetaplugin', 1, 'enabled', '1', 'bool'),
(22, 'googlescholarplugin', 1, 'enabled', '1', 'bool'),
(23, 'htmlarticlegalleyplugin', 1, 'enabled', '1', 'bool'),
(24, 'lensgalleyplugin', 1, 'enabled', '1', 'bool'),
(25, 'pdfjsviewerplugin', 1, 'enabled', '1', 'bool'),
(26, 'webfeedplugin', 1, 'enabled', '1', 'bool'),
(27, 'webfeedplugin', 1, 'displayPage', 'homepage', 'string'),
(28, 'webfeedplugin', 1, 'displayItems', '1', 'bool'),
(29, 'webfeedplugin', 1, 'recentItems', '30', 'int'),
(30, 'webfeedplugin', 1, 'includeIdentifiers', '0', 'bool'),
(31, 'defaultthemeplugin', 1, 'typography', 'lato', 'string'),
(32, 'defaultthemeplugin', 1, 'baseColour', '#1E6292', 'string'),
(33, 'defaultthemeplugin', 1, 'showDescriptionInJournalIndex', 'true', 'string'),
(34, 'defaultthemeplugin', 1, 'useHomepageImageAsHeader', 'true', 'string'),
(35, 'defaultthemeplugin', 1, 'displayStats', 'none', 'string'),
(36, 'browseblockplugin', 1, 'enabled', '1', 'bool'),
(37, 'makesubmissionblockplugin', 1, 'enabled', '1', 'bool'),
(38, 'announcementfeedplugin', 1, 'enabled', '1', 'bool'),
(39, 'citationstylelanguageplugin', 1, 'enabled', '1', 'bool'),
(40, 'recommendbyauthorplugin', 1, 'enabled', '1', 'bool'),
(41, 'customblockmanagerplugin', 1, 'enabled', '1', 'bool'),
(42, 'bootstrapthreethemeplugin', 1, 'enabled', '1', 'bool'),
(43, 'healthsciencesthemeplugin', 1, 'enabled', '1', 'bool'),
(44, 'bootstrapthreethemeplugin', 1, 'bootstrapTheme', 'paper', 'string'),
(45, 'bootstrapthreethemeplugin', 1, 'displayStats', 'none', 'string'),
(46, 'healthsciencesthemeplugin', 1, 'baseColour', '#CED9D5', 'string'),
(47, 'healthsciencesthemeplugin', 1, 'displayStats', 'none', 'string'),
(48, 'classicthemeplugin', 1, 'enabled', '1', 'bool'),
(49, 'classicthemeplugin', 1, 'primaryColor', '#624E0F', 'string'),
(50, 'classicthemeplugin', 1, 'journalSummary', '0', 'string'),
(51, 'classicthemeplugin', 1, 'displayStats', 'bar', 'string'),
(52, 'recommendbysimilarityplugin', 1, 'enabled', '1', 'bool'),
(53, 'reviewreminderplugin', 1, 'enabled', '1', 'bool'),
(54, 'staticpagesplugin', 1, 'enabled', '1', 'bool'),
(55, 'customheaderplugin', 1, 'enabled', '0', 'bool'),
(56, 'customheaderplugin', 1, 'content', '', 'string'),
(57, 'customheaderplugin', 1, 'footerContent', '', 'string'),
(58, 'customblockmanagerplugin', 1, 'blocks', '[\"indexadores\"]', 'object'),
(59, 'indexadores', 1, 'enabled', '1', 'bool'),
(60, 'indexadores', 1, 'blockTitle', '{\"pt_BR\":\"Indexadores\"}', 'object'),
(61, 'indexadores', 1, 'blockContent', '{\"pt_BR\":\"<p><a href=\\\"http:\\/\\/www.itep.rn.gov.br\\/\\\" target=\\\"_blank\\\" rel=\\\"noopener\\\"><img src=\\\"http:\\/\\/localhost\\/ojs-system\\/public\\/site\\/images\\/admin\\/favicon-removebg-preview.png\\\" alt=\\\"\\\" width=\\\"390\\\" height=\\\"455\\\"><\\/a><\\/p>\\r\\n<p><a href=\\\"http:\\/\\/www.google.com\\\" target=\\\"_blank\\\" rel=\\\"noopener\\\"><img src=\\\"http:\\/\\/localhost\\/ojs-system\\/public\\/site\\/images\\/admin\\/favicon-removebg-preview-4233916bd618fb04f27975b1f591618c.png\\\" alt=\\\"\\\" width=\\\"390\\\" height=\\\"455\\\"><\\/a><\\/p>\"}', 'object'),
(62, 'indexadores', 1, 'showName', '1', 'string'),
(63, 'citationstylelanguageplugin', 1, 'primaryCitationStyle', 'associacao-brasileira-de-normas-tecnicas', 'string'),
(64, 'citationstylelanguageplugin', 1, 'enabledCitationStyles', '[\"acm-sig-proceedings\",\"acs-nano\",\"apa\",\"associacao-brasileira-de-normas-tecnicas\",\"chicago-author-date\",\"harvard-cite-them-right\",\"ieee\",\"modern-language-association\",\"turabian-fullnote-bibliography\",\"vancouver\",\"ama\"]', 'object'),
(65, 'citationstylelanguageplugin', 1, 'enabledCitationDownloads', '[\"ris\",\"bibtex\"]', 'object'),
(66, 'citationstylelanguageplugin', 1, 'publisherLocation', '', 'string'),
(67, 'citationstylelanguageplugin', 1, 'groupAuthor', '[\"14\",\"15\"]', 'object'),
(68, 'citationstylelanguageplugin', 1, 'groupTranslator', NULL, 'string'),
(69, 'materialthemeplugin', 0, 'enabled', '1', 'bool'),
(70, 'immersionthemeplugin', 1, 'enabled', '1', 'bool'),
(71, 'materialthemeplugin', 1, 'enabled', '1', 'bool'),
(72, 'pragmathemeplugin', 1, 'enabled', '1', 'bool'),
(73, 'defaultmanuscriptchildthemeplugin', 1, 'enabled', '1', 'bool'),
(74, 'pragmathemeplugin', 1, 'baseColour', '#A8DCDD', 'string'),
(75, 'pragmathemeplugin', 1, 'displayStats', 'none', 'string'),
(76, 'immersionthemeplugin', 1, 'sectionDescriptionSetting', 'enable', 'string'),
(77, 'immersionthemeplugin', 1, 'journalDescription', '1', 'string'),
(78, 'immersionthemeplugin', 1, 'journalDescriptionColour', '#6B3434', 'string'),
(79, 'immersionthemeplugin', 1, 'immersionAnnouncementsColor', '#8A3838', 'string'),
(80, 'immersionthemeplugin', 1, 'displayStats', 'none', 'string'),
(81, 'defaultmanuscriptchildthemeplugin', 1, 'accentColour', '#F7BC4A', 'string'),
(82, 'materialthemeplugin', 1, 'showDescriptionInJournalIndex', 'false', 'string'),
(83, 'materialthemeplugin', 1, 'useHomepageImageAsHeader', 'false', 'string'),
(84, 'materialthemeplugin', 1, 'materialBaseColour', 'orange', 'string'),
(85, 'customlocaleplugin', 1, 'enabled', '1', 'bool'),
(86, 'texteditorextrasplugin', 1, 'enabled', '1', 'bool'),
(87, 'urnpubidplugin', 1, 'enabled', '1', 'bool'),
(88, 'backupplugin', 0, 'enabled', '1', 'bool'),
(89, 'alloweduploadsplugin', 1, 'enabled', '0', 'bool'),
(90, 'jatstemplateplugin', 1, 'enabled', '1', 'bool'),
(91, 'sitesearchplugin', 1, 'enabled', '0', 'bool'),
(92, 'browsebysectionplugin', 1, 'enabled', '1', 'bool');

-- --------------------------------------------------------

--
-- Estrutura para tabela `publications`
--

CREATE TABLE `publications` (
  `publication_id` bigint(20) NOT NULL,
  `access_status` bigint(20) DEFAULT 0,
  `date_published` date DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `primary_contact_id` bigint(20) DEFAULT NULL,
  `section_id` bigint(20) DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `submission_id` bigint(20) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `url_path` varchar(64) DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL,
  `doi_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Each publication is one version of a submission.';

--
-- Despejando dados para a tabela `publications`
--

INSERT INTO `publications` (`publication_id`, `access_status`, `date_published`, `last_modified`, `primary_contact_id`, `section_id`, `seq`, `submission_id`, `status`, `url_path`, `version`, `doi_id`) VALUES
(4, 0, '2025-03-12', '2025-04-01 11:12:23', NULL, 1, 0.00, 4, 1, NULL, 1, NULL),
(5, 0, '2025-03-17', '2025-03-25 10:40:33', NULL, 1, 0.00, 5, 1, NULL, 1, NULL),
(6, 0, NULL, '2025-03-25 11:29:37', 6, 1, 0.00, 6, 1, NULL, 1, NULL),
(9, 0, '2025-04-09', '2025-04-09 12:49:09', NULL, 1, 0.00, 9, 3, NULL, 1, NULL),
(10, 0, NULL, '2025-04-09 13:39:06', NULL, 1, 0.00, 9, 1, NULL, 2, NULL),
(11, 0, '2025-04-29', '2025-04-29 11:56:29', NULL, 1, 0.00, 10, 3, NULL, 1, NULL),
(12, 0, NULL, '2025-04-30 12:32:59', NULL, 1, 0.00, 11, 1, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `publication_categories`
--

CREATE TABLE `publication_categories` (
  `publication_category_id` bigint(20) UNSIGNED NOT NULL,
  `publication_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Associates publications (and thus submissions) with categories.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `publication_galleys`
--

CREATE TABLE `publication_galleys` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `publication_id` bigint(20) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `submission_file_id` bigint(20) UNSIGNED DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `remote_url` varchar(2047) DEFAULT NULL,
  `is_approved` smallint(6) NOT NULL DEFAULT 0,
  `url_path` varchar(64) DEFAULT NULL,
  `doi_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Publication galleys are representations of a publication in a specific format, e.g. a PDF.';

--
-- Despejando dados para a tabela `publication_galleys`
--

INSERT INTO `publication_galleys` (`galley_id`, `locale`, `publication_id`, `label`, `submission_file_id`, `seq`, `remote_url`, `is_approved`, `url_path`, `doi_id`) VALUES
(3, 'pt_BR', 9, 'PDF', 25, 0.00, NULL, 0, NULL, NULL),
(5, 'pt_BR', 10, 'PDF', 29, 0.00, NULL, 0, NULL, NULL),
(7, 'pt_BR', 11, 'PDF', 33, 0.00, NULL, 0, NULL, NULL),
(8, 'pt_BR', 11, 'HTML', 34, 0.00, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `publication_galley_settings`
--

CREATE TABLE `publication_galley_settings` (
  `publication_galley_setting_id` bigint(20) UNSIGNED NOT NULL,
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about publication galleys, including localized content such as labels.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `publication_settings`
--

CREATE TABLE `publication_settings` (
  `publication_setting_id` bigint(20) UNSIGNED NOT NULL,
  `publication_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about publications, including localized properties such as the title and abstract.';

--
-- Despejando dados para a tabela `publication_settings`
--

INSERT INTO `publication_settings` (`publication_setting_id`, `publication_id`, `locale`, `setting_name`, `setting_value`) VALUES
(21, 4, '', 'categoryIds', '[]'),
(22, 4, 'pt_BR', 'title', 'DO VESTÍGIO A PROVA A TRAJETÓRIA DA PERÍCIA CRIMINAL DO RIO GRANDE DO NORTE'),
(23, 4, 'pt_BR', 'abstract', '<p>O livro <strong data-start=\"8\" data-end=\"90\">\"Do Vestígio à Prova: A Trajetória da Perícia Criminal no Rio Grande do Norte\"</strong> apresenta a história e evolução da perícia criminal no estado, destacando o papel do Instituto Técnico-Científico de Perícia (ITEP-RN). A obra traça desde os primeiros registros da atividade pericial até sua modernização, abordando aspectos da medicina legal, criminalística e identificação civil. Além disso, evidencia marcos legais, personalidades importantes e avanços tecnológicos que contribuíram para a consolidação da perícia no Rio Grande do Norte.</p>'),
(24, 4, '', 'issueId', '0'),
(25, 4, 'pt_BR', 'copyrightHolder', 'Gesiele  (Autor)'),
(26, 4, '', 'copyrightYear', '2025'),
(27, 4, '', 'pages', '147'),
(28, 4, 'pt_BR', 'coverImage', '{\"dateUploaded\":\"2025-03-12 11:19:24\",\"uploadName\":\"submission_4_4_coverImage_pt_BR.jpg\",\"altText\":\"Capa\"}'),
(29, 5, '', 'categoryIds', '[]'),
(30, 5, 'pt_BR', 'title', '<b><i>Isso é um teste de submissão</i></b>'),
(31, 5, 'pt_BR', 'abstract', '<p>Teste, teste, teste, teste, teste e teste...</p>'),
(32, 5, 'pt_BR', 'coverImage', '{\"dateUploaded\":\"2025-03-17 09:06:31\",\"uploadName\":\"submission_5_5_coverImage_pt_BR.jpg\",\"altText\":\"\"}'),
(33, 5, '', 'pages', '1'),
(34, 5, '', 'issueId', '0'),
(35, 5, 'pt_BR', 'copyrightHolder', 'Teste (Autor)'),
(36, 5, '', 'copyrightYear', '2025'),
(37, 6, '', 'categoryIds', '[]'),
(38, 6, 'pt_BR', 'title', 'Uso de IA em Prontuários Eletrônicos'),
(39, 6, 'pt_BR', 'abstract', '<p>A implementação da IA em prontuários eletrônicos oferece benefícios claros, como maior eficiência, precisão e personalização na prática médica, mas enfrenta desafios significativos relacionados a tecnologia, custos e aceitação. Exemplos como a Clínica nas Nuvens e o Cerner Millennium mostram que a IA já está transformando a gestão de informações de saúde, tanto em escala local quanto global. Para maximizar seu potencial, é necessário superar barreiras de interoperabilidade, garantir a segurança dos dados e promover a capacitação dos profissionais, equilibrando tecnologia e humanização no cuidado.</p>'),
(51, 9, '', 'categoryIds', '[]'),
(52, 9, 'pt_BR', 'coverImage', '{\"uploadName\":\"article_9_cover_pt_BR.jpg\",\"altText\":\"\"}'),
(53, 9, 'pt_BR', 'abstract', '<p>O livro \"Do Vestígio à Prova: A Trajetória da Perícia Criminal no Rio Grande do Norte\" apresenta a história e evolução da perícia criminal no estado, destacando o papel do Instituto Técnico-Científico de Perícia (ITEP-RN). A obra traça desde os primeiros registros da atividade pericial até sua modernização, abordando aspectos da medicina legal, criminalística e identificação civil. Além disso, evidencia marcos legais, personalidades importantes e avanços tecnológicos que contribuíram para a consolidação da perícia no Rio Grande do Norte.</p>'),
(55, 9, 'es', 'abstract', '<p>El libro \"Del vestigio a la prueba: la trayectoria de la criminalística forense en Rio Grande do Norte\" presenta la historia y la evolución de la criminalística forense en el estado, destacando el papel del Instituto Técnico-Científico de la Medicina Forense (ITEP-RN). El trabajo recorre desde los primeros registros de la actividad forense hasta su modernización, abordando aspectos de la medicina forense, la criminalística y la identificación civil. Además, destaca marcos legales, personalidades importantes y avances tecnológicos que contribuyeron a la consolidación de la experiencia en Rio Grande do Norte.</p>'),
(62, 9, 'pt_BR', 'title', 'DO VESTÍGIO A PROVA A TRAJETÓRIA DA PERÍCIA CRIMINAL DO RIO GRANDE DO NORTE'),
(63, 9, 'en', 'title', 'FROM TRACE TO PROOF THE TRAJECTORY OF CRIMINAL EXPERTISE IN RIO GRANDE DO NORTE'),
(64, 9, 'es', 'title', 'DEL RASTRO A LA PRUEBA: LA TRAYECTORIA DE LA PERICIA CRIMINAL EN RIO GRANDE DO NORTE'),
(65, 9, 'en', 'abstract', '<p>The book \"From Vestige to Proof: The Trajectory of Criminal Forensics in Rio Grande do Norte\" presents the history and evolution of criminal forensics in the state, highlighting the role of the Technical-Scientific Institute of Forensics (ITEP-RN). The work traces from the first records of forensic activity to its modernization, addressing aspects of forensic medicine, criminalistics and civil identification. In addition, it highlights legal frameworks, important personalities and technological advances that contributed to the consolidation of expertise in Rio Grande do Norte.</p>'),
(66, 9, '', 'issueId', '4'),
(67, 9, 'pt_BR', 'copyrightHolder', 'ITEP (Autor)'),
(68, 9, '', 'copyrightYear', '2025'),
(69, 9, '', 'licenseUrl', 'https://creativecommons.org/licenses/by-sa/4.0'),
(70, 10, 'en', 'abstract', '<p>The book \"From Vestige to Proof: The Trajectory of Criminal Forensics in Rio Grande do Norte\" presents the history and evolution of criminal forensics in the state, highlighting the role of the Technical-Scientific Institute of Forensics (ITEP-RN). The work traces from the first records of forensic activity to its modernization, addressing aspects of forensic medicine, criminalistics and civil identification. In addition, it highlights legal frameworks, important personalities and technological advances that contributed to the consolidation of expertise in Rio Grande do Norte.</p>'),
(71, 10, 'es', 'abstract', '<p>El libro \"Del vestigio a la prueba: la trayectoria de la criminalística forense en Rio Grande do Norte\" presenta la historia y la evolución de la criminalística forense en el estado, destacando el papel del Instituto Técnico-Científico de la Medicina Forense (ITEP-RN). El trabajo recorre desde los primeros registros de la actividad forense hasta su modernización, abordando aspectos de la medicina forense, la criminalística y la identificación civil. Además, destaca marcos legales, personalidades importantes y avances tecnológicos que contribuyeron a la consolidación de la experiencia en Rio Grande do Norte.</p>'),
(72, 10, 'pt_BR', 'abstract', '<p>O livro \"Do Vestígio à Prova: A Trajetória da Perícia Criminal no Rio Grande do Norte\" apresenta a história e evolução da perícia criminal no estado, destacando o papel do Instituto Técnico-Científico de Perícia (ITEP-RN). A obra traça desde os primeiros registros da atividade pericial até sua modernização, abordando aspectos da medicina legal, criminalística e identificação civil. Além disso, evidencia marcos legais, personalidades importantes e avanços tecnológicos que contribuíram para a consolidação da perícia no Rio Grande do Norte.</p>'),
(73, 10, '', 'categoryIds', '[]'),
(74, 10, 'pt_BR', 'copyrightHolder', 'ITEP (Autor)'),
(75, 10, '', 'copyrightYear', '2025'),
(76, 10, 'pt_BR', 'coverImage', '{\"uploadName\":\"article_9_cover_pt_BR.jpg\",\"altText\":\"\"}'),
(77, 10, '', 'licenseUrl', 'https://creativecommons.org/licenses/by-sa/4.0'),
(78, 10, 'en', 'title', 'FROM TRACE TO PROOF THE TRAJECTORY OF CRIMINAL EXPERTISE IN RIO GRANDE DO NORTE'),
(79, 10, 'es', 'title', 'DEL RASTRO A LA PRUEBA: LA TRAYECTORIA DE LA PERICIA CRIMINAL EN RIO GRANDE DO NORTE'),
(80, 10, 'pt_BR', 'title', 'DO VESTÍGIO A PROVA A TRAJETÓRIA DA PERÍCIA CRIMINAL DO RIO GRANDE DO NORTE'),
(81, 10, '', 'issueId', '4'),
(82, 11, '', 'categoryIds', '[]'),
(83, 11, 'pt_BR', 'title', 'Teste'),
(84, 11, 'pt_BR', 'abstract', '<p>Isso é um teste</p>'),
(85, 11, 'en', 'abstract', '<p>This is a test</p>'),
(86, 11, 'en', 'title', 'test'),
(87, 11, '', 'issueId', '4'),
(88, 11, 'pt_BR', 'copyrightHolder', ''),
(89, 11, '', 'copyrightYear', '2025'),
(90, 11, '', 'licenseUrl', 'https://creativecommons.org/licenses/by-sa/4.0'),
(91, 12, '', 'categoryIds', '[]'),
(92, 12, 'pt_BR', 'title', 'dasdsa');

-- --------------------------------------------------------

--
-- Estrutura para tabela `queries`
--

CREATE TABLE `queries` (
  `query_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `closed` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Discussions, usually related to a submission, created by editors, authors and other editorial staff.';

--
-- Despejando dados para a tabela `queries`
--

INSERT INTO `queries` (`query_id`, `assoc_type`, `assoc_id`, `stage_id`, `seq`, `date_posted`, `date_modified`, `closed`) VALUES
(6, 1048585, 5, 1, 1.00, NULL, NULL, 0),
(13, 1048585, 10, 1, 1.00, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `query_participants`
--

CREATE TABLE `query_participants` (
  `query_participant_id` bigint(20) UNSIGNED NOT NULL,
  `query_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='The users assigned to a discussion.';

--
-- Despejando dados para a tabela `query_participants`
--

INSERT INTO `query_participants` (`query_participant_id`, `query_id`, `user_id`) VALUES
(5, 6, 1),
(12, 13, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `queued_payments`
--

CREATE TABLE `queued_payments` (
  `queued_payment_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `payment_data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Unfulfilled (queued) payments, i.e. payments that have not yet been completed via an online payment system.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `review_assignments`
--

CREATE TABLE `review_assignments` (
  `review_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `reviewer_id` bigint(20) NOT NULL,
  `competing_interests` text DEFAULT NULL,
  `recommendation` smallint(6) DEFAULT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_confirmed` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_acknowledged` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `date_response_due` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reminder_was_automatic` smallint(6) NOT NULL DEFAULT 0,
  `declined` smallint(6) NOT NULL DEFAULT 0,
  `cancelled` smallint(6) NOT NULL DEFAULT 0,
  `date_rated` datetime DEFAULT NULL,
  `date_reminded` datetime DEFAULT NULL,
  `quality` smallint(6) DEFAULT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `review_method` smallint(6) NOT NULL DEFAULT 1,
  `round` smallint(6) NOT NULL DEFAULT 1,
  `step` smallint(6) NOT NULL DEFAULT 1,
  `review_form_id` bigint(20) DEFAULT NULL,
  `considered` smallint(6) DEFAULT NULL,
  `request_resent` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Data about peer review assignments for all submissions.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `review_files`
--

CREATE TABLE `review_files` (
  `review_file_id` bigint(20) UNSIGNED NOT NULL,
  `review_id` bigint(20) NOT NULL,
  `submission_file_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A list of the submission files made available to each assigned reviewer.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `review_forms`
--

CREATE TABLE `review_forms` (
  `review_form_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `seq` double(8,2) DEFAULT NULL,
  `is_active` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Review forms provide custom templates for peer reviews with several types of questions.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `review_form_elements`
--

CREATE TABLE `review_form_elements` (
  `review_form_element_id` bigint(20) NOT NULL,
  `review_form_id` bigint(20) NOT NULL,
  `seq` double(8,2) DEFAULT NULL,
  `element_type` bigint(20) DEFAULT NULL,
  `required` smallint(6) DEFAULT NULL,
  `included` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Each review form element represents a single question on a review form.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `review_form_element_settings`
--

CREATE TABLE `review_form_element_settings` (
  `review_form_element_setting_id` bigint(20) UNSIGNED NOT NULL,
  `review_form_element_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about review form elements, including localized content such as question text.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `review_form_responses`
--

CREATE TABLE `review_form_responses` (
  `review_form_response_id` bigint(20) UNSIGNED NOT NULL,
  `review_form_element_id` bigint(20) NOT NULL,
  `review_id` bigint(20) NOT NULL,
  `response_type` varchar(6) DEFAULT NULL,
  `response_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Each review form response records a reviewer''s answer to a review form element associated with a peer review.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `review_form_settings`
--

CREATE TABLE `review_form_settings` (
  `review_form_setting_id` bigint(20) UNSIGNED NOT NULL,
  `review_form_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about review forms, including localized content such as names.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `review_rounds`
--

CREATE TABLE `review_rounds` (
  `review_round_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` smallint(6) NOT NULL,
  `review_revision` bigint(20) DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Peer review assignments are organized into multiple rounds on a submission.';

--
-- Despejando dados para a tabela `review_rounds`
--

INSERT INTO `review_rounds` (`review_round_id`, `submission_id`, `stage_id`, `round`, `review_revision`, `status`) VALUES
(3, 4, 3, 1, NULL, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `review_round_files`
--

CREATE TABLE `review_round_files` (
  `review_round_file_id` bigint(20) UNSIGNED NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `submission_file_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Records the files made available to reviewers for a round of reviews. These can be further customized on a per review basis with review_files.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `scheduled_tasks`
--

CREATE TABLE `scheduled_tasks` (
  `scheduled_task_id` bigint(20) UNSIGNED NOT NULL,
  `class_name` varchar(255) NOT NULL,
  `last_run` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='The last time each scheduled task was run.';

--
-- Despejando dados para a tabela `scheduled_tasks`
--

INSERT INTO `scheduled_tasks` (`scheduled_task_id`, `class_name`, `last_run`) VALUES
(1, 'PKP\\task\\ReviewReminder', '2025-04-01 10:27:51'),
(2, 'PKP\\task\\StatisticsReport', '2025-04-01 10:27:51'),
(3, 'APP\\tasks\\SubscriptionExpiryReminder', '2025-04-01 10:27:53'),
(4, 'PKP\\task\\DepositDois', '2025-04-01 10:27:53'),
(5, 'PKP\\task\\RemoveUnvalidatedExpiredUsers', '2025-04-01 10:27:53'),
(6, 'PKP\\task\\EditorialReminders', '2025-04-01 10:27:53'),
(7, 'PKP\\task\\UpdateIPGeoDB', '2025-03-10 08:33:35'),
(8, 'APP\\tasks\\UsageStatsLoader', '2025-04-01 10:27:53'),
(9, 'PKP\\task\\ProcessQueueJobs', '2025-04-01 10:27:54'),
(10, 'PKP\\task\\RemoveFailedJobs', '2025-04-01 10:27:57'),
(11, 'APP\\tasks\\OpenAccessNotification', '2025-04-01 10:27:57'),
(12, 'APP\\plugins\\importexport\\doaj\\DOAJInfoSender', '2025-04-01 10:27:49');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sections`
--

CREATE TABLE `sections` (
  `section_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `review_form_id` bigint(20) DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `editor_restricted` smallint(6) NOT NULL DEFAULT 0,
  `meta_indexed` smallint(6) NOT NULL DEFAULT 0,
  `meta_reviewed` smallint(6) NOT NULL DEFAULT 1,
  `abstracts_not_required` smallint(6) NOT NULL DEFAULT 0,
  `hide_title` smallint(6) NOT NULL DEFAULT 0,
  `hide_author` smallint(6) NOT NULL DEFAULT 0,
  `is_inactive` smallint(6) NOT NULL DEFAULT 0,
  `abstract_word_count` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A list of all sections into which submissions can be organized, forming the table of contents.';

--
-- Despejando dados para a tabela `sections`
--

INSERT INTO `sections` (`section_id`, `journal_id`, `review_form_id`, `seq`, `editor_restricted`, `meta_indexed`, `meta_reviewed`, `abstracts_not_required`, `hide_title`, `hide_author`, `is_inactive`, `abstract_word_count`) VALUES
(1, 1, NULL, 0.00, 0, 1, 1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `section_settings`
--

CREATE TABLE `section_settings` (
  `section_setting_id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about sections, including localized properties like section titles.';

--
-- Despejando dados para a tabela `section_settings`
--

INSERT INTO `section_settings` (`section_setting_id`, `section_id`, `locale`, `setting_name`, `setting_value`) VALUES
(1, 1, 'pt_BR', 'title', 'Artigos'),
(2, 1, 'pt_BR', 'abbrev', 'ART'),
(3, 1, 'pt_BR', 'policy', '<p>Política padrão de seção</p>'),
(4, 1, 'pt_BR', 'identifyType', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `ip_address` varchar(39) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created` bigint(20) NOT NULL DEFAULT 0,
  `last_used` bigint(20) NOT NULL DEFAULT 0,
  `remember` smallint(6) NOT NULL DEFAULT 0,
  `data` text NOT NULL,
  `domain` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Session data for logged-in users.';

--
-- Despejando dados para a tabela `sessions`
--

INSERT INTO `sessions` (`session_id`, `user_id`, `ip_address`, `user_agent`, `created`, `last_used`, `remember`, `data`, `domain`) VALUES
('1kejg5bppc2qtp9lgeupds2230', 1, '10.9.9.79', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0', 1745407807, 1745414952, 1, 'csrf|a:2:{s:9:\"timestamp\";i:1745409238;s:5:\"token\";s:32:\"3f1d82e4b6434e1b61cc48cc5653430c\";}userId|i:1;username|s:5:\"admin\";', '10.9.9.79'),
('807jld3ib72vv73bamhllrcp91', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0', 1745935214, 1746031334, 1, 'csrf|a:2:{s:9:\"timestamp\";i:1746031336;s:5:\"token\";s:32:\"40bd672e5d3a7b268975bd1fe1adf793\";}username|s:5:\"admin\";currentLocale|s:5:\"pt_BR\";userId|i:1;', 'localhost'),
('9b6r83pqdv9mh6qrp6o0f9h8aq', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0', 1742315737, 1743782498, 1, 'csrf|a:2:{s:9:\"timestamp\";i:1743782498;s:5:\"token\";s:32:\"9bfffb42d1a263ee5d17b58a792a73a3\";}username|s:5:\"admin\";currentLocale|s:5:\"pt_BR\";userId|i:1;', 'localhost'),
('pft54c1rmpml67r3j92urlrm5q', 1, '10.9.9.195', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0', 1744024183, 1745329649, 1, 'csrf|a:2:{s:9:\"timestamp\";i:1745329649;s:5:\"token\";s:32:\"7a908ff69a04d742a74a8e6c259b2a78\";}username|s:5:\"admin\";currentLocale|s:5:\"pt_BR\";userId|i:1;', '10.9.9.195'),
('tkqtiro3fod60s3f8559e98qhp', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', 1746442662, 1746807224, 1, 'csrf|a:2:{s:9:\"timestamp\";i:1746807224;s:5:\"token\";s:32:\"b12846335850fde5459bb1fb86d754d8\";}username|s:5:\"admin\";currentLocale|s:5:\"pt_BR\";userId|i:1;', 'localhost'),
('tog2563lijmuvsd3ab8tf6sdbt', NULL, '10.9.9.43', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', 1746023254, 1746029544, 0, '', '10.9.9.163'),
('v7ul83u3c6jiv8ue9hn3edelso', NULL, '10.9.9.163', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0', 1746023009, 1746023137, 0, '', '10.9.9.163'),
('v8ns3ujhqb5n0f9jrsfrlfpsk8', 1, '10.9.9.195', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0', 1742391654, 1743782829, 1, 'csrf|a:2:{s:9:\"timestamp\";i:1743782829;s:5:\"token\";s:32:\"a991a02956bfe80afdb1cbe15d5ed1c2\";}username|s:5:\"admin\";userId|i:1;', '10.9.9.195');

-- --------------------------------------------------------

--
-- Estrutura para tabela `site`
--

CREATE TABLE `site` (
  `site_id` bigint(20) UNSIGNED NOT NULL,
  `redirect` bigint(20) NOT NULL DEFAULT 0 COMMENT 'If not 0, redirect to the specified journal/conference/... site.',
  `primary_locale` varchar(14) NOT NULL COMMENT 'Primary locale for the site.',
  `min_password_length` smallint(6) NOT NULL DEFAULT 6,
  `installed_locales` varchar(1024) NOT NULL DEFAULT 'en' COMMENT 'Locales for which support has been installed.',
  `supported_locales` varchar(1024) DEFAULT NULL COMMENT 'Locales supported by the site (for hosted journals/conferences/...).',
  `original_style_file_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A singleton table describing basic information about the site.';

--
-- Despejando dados para a tabela `site`
--

INSERT INTO `site` (`site_id`, `redirect`, `primary_locale`, `min_password_length`, `installed_locales`, `supported_locales`, `original_style_file_name`) VALUES
(1, 0, 'pt_BR', 6, '[\"en\",\"es\",\"pt_BR\",\"de\",\"it\",\"ja\",\"pt_PT\",\"zh_CN\"]', '[\"en\",\"es\",\"pt_BR\",\"de\",\"it\",\"ja\",\"pt_PT\",\"zh_CN\"]', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `site_settings`
--

CREATE TABLE `site_settings` (
  `site_setting_id` bigint(20) UNSIGNED NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_value` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about the site, including localized properties such as its name.';

--
-- Despejando dados para a tabela `site_settings`
--

INSERT INTO `site_settings` (`site_setting_id`, `setting_name`, `locale`, `setting_value`) VALUES
(1, 'contactEmail', 'pt_BR', 'nugecid@gmail.com'),
(2, 'contactName', 'en', 'Open Journal Systems'),
(3, 'contactName', 'es', 'Open Journal Systems'),
(4, 'contactName', 'pt_BR', 'Open Journal Systems'),
(5, 'compressStatsLogs', '', '0'),
(6, 'enableGeoUsageStats', '', 'country+region+city'),
(7, 'enableInstitutionUsageStats', '', '1'),
(8, 'keepDailyUsageStats', '', '1'),
(9, 'isSiteSushiPlatform', '', '0'),
(10, 'isSushiApiPublic', '', '1'),
(11, 'disableSharedReviewerStatistics', '', '0'),
(12, 'themePluginPath', '', 'default'),
(13, 'uniqueSiteId', '', '9C8D3941-B527-4801-9944-F1239107F9B4'),
(14, 'enableBulkEmails', '', '[1]');

-- --------------------------------------------------------

--
-- Estrutura para tabela `stage_assignments`
--

CREATE TABLE `stage_assignments` (
  `stage_assignment_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_assigned` datetime NOT NULL,
  `recommend_only` smallint(6) NOT NULL DEFAULT 0,
  `can_change_metadata` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Who can access a submission while it is in the editorial workflow. Includes all editorial and author assignments. For reviewers, see review_assignments.';

--
-- Despejando dados para a tabela `stage_assignments`
--

INSERT INTO `stage_assignments` (`stage_assignment_id`, `submission_id`, `user_group_id`, `user_id`, `date_assigned`, `recommend_only`, `can_change_metadata`) VALUES
(5, 4, 2, 1, '2025-03-11 13:37:07', 0, 1),
(6, 4, 3, 1, '2025-03-12 10:50:49', 0, 1),
(7, 4, 5, 1, '2025-03-12 10:50:49', 0, 1),
(8, 4, 6, 1, '2025-03-12 10:50:49', 0, 0),
(9, 4, 9, 1, '2025-03-12 10:50:49', 0, 0),
(10, 5, 2, 1, '2025-03-17 08:54:15', 0, 1),
(11, 5, 3, 1, '2025-03-17 09:04:29', 0, 1),
(12, 5, 5, 1, '2025-03-17 09:04:29', 0, 1),
(13, 5, 6, 1, '2025-03-17 09:04:29', 0, 0),
(14, 5, 9, 1, '2025-03-17 09:04:29', 0, 0),
(15, 5, 14, 1, '2025-03-17 09:05:43', 0, 0),
(16, 6, 14, 1, '2025-03-25 11:06:09', 0, 0),
(17, 6, 3, 1, '2025-03-25 11:06:08', 0, 1),
(18, 6, 5, 1, '2025-03-25 11:06:08', 0, 1),
(19, 6, 6, 1, '2025-03-25 11:06:08', 0, 0),
(20, 6, 9, 1, '2025-03-25 11:06:08', 0, 0),
(31, 9, 2, 1, '2025-04-09 11:48:57', 0, 1),
(32, 10, 2, 1, '2025-04-29 11:49:30', 0, 1),
(33, 10, 3, 1, '2025-04-29 11:51:38', 0, 1),
(34, 10, 5, 1, '2025-04-29 11:51:38', 0, 1),
(35, 10, 6, 1, '2025-04-29 11:51:38', 0, 0),
(36, 10, 9, 1, '2025-04-29 11:51:38', 0, 0),
(37, 11, 2, 1, '2025-04-30 12:32:59', 0, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `static_pages`
--

CREATE TABLE `static_pages` (
  `static_page_id` bigint(20) NOT NULL,
  `path` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `static_page_settings`
--

CREATE TABLE `static_page_settings` (
  `static_page_setting_id` bigint(20) UNSIGNED NOT NULL,
  `static_page_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `subeditor_submission_group`
--

CREATE TABLE `subeditor_submission_group` (
  `subeditor_submission_group_id` bigint(20) UNSIGNED NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Subeditor assignments to e.g. sections and categories';

--
-- Despejando dados para a tabela `subeditor_submission_group`
--

INSERT INTO `subeditor_submission_group` (`subeditor_submission_group_id`, `context_id`, `assoc_id`, `assoc_type`, `user_id`, `user_group_id`) VALUES
(1, 1, 1, 530, 1, 3),
(2, 1, 1, 530, 1, 5),
(3, 1, 1, 530, 1, 6),
(4, 1, 1, 530, 1, 9);

-- --------------------------------------------------------

--
-- Estrutura para tabela `submissions`
--

CREATE TABLE `submissions` (
  `submission_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `current_publication_id` bigint(20) DEFAULT NULL,
  `date_last_activity` datetime DEFAULT NULL,
  `date_submitted` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `stage_id` bigint(20) NOT NULL DEFAULT 1,
  `locale` varchar(14) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `submission_progress` varchar(50) NOT NULL DEFAULT 'start',
  `work_type` smallint(6) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='All submissions submitted to the context, including incomplete, declined and unpublished submissions.';

--
-- Despejando dados para a tabela `submissions`
--

INSERT INTO `submissions` (`submission_id`, `context_id`, `current_publication_id`, `date_last_activity`, `date_submitted`, `last_modified`, `stage_id`, `locale`, `status`, `submission_progress`, `work_type`) VALUES
(4, 1, 4, '2025-04-01 11:12:24', '2025-03-12 10:50:48', '2025-03-12 10:50:48', 5, 'pt_BR', 1, '', 0),
(5, 1, 5, '2025-03-25 10:40:34', '2025-03-17 09:04:29', '2025-03-17 09:04:29', 5, 'pt_BR', 1, '', 0),
(6, 1, 6, '2025-03-25 11:29:37', '2025-03-25 11:06:07', '2025-03-25 11:06:07', 1, 'pt_BR', 1, '', 0),
(9, 1, 9, '2025-04-29 11:48:02', '2025-04-09 12:32:03', '2025-04-09 12:32:03', 5, 'pt_BR', 3, '', 0),
(10, 1, 11, '2025-04-29 11:56:29', '2025-04-29 11:51:38', '2025-04-29 11:51:38', 5, 'pt_BR', 3, '', 0),
(11, 1, 12, '2025-04-30 12:32:59', '2025-04-30 12:32:58', '2025-04-30 12:32:59', 1, 'pt_BR', 1, 'start', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `submission_comments`
--

CREATE TABLE `submission_comments` (
  `comment_id` bigint(20) NOT NULL,
  `comment_type` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `comment_title` text NOT NULL,
  `comments` text DEFAULT NULL,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `viewable` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Comments on a submission, e.g. peer review comments';

-- --------------------------------------------------------

--
-- Estrutura para tabela `submission_files`
--

CREATE TABLE `submission_files` (
  `submission_file_id` bigint(20) UNSIGNED NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `file_id` bigint(20) UNSIGNED NOT NULL,
  `source_submission_file_id` bigint(20) UNSIGNED DEFAULT NULL,
  `genre_id` bigint(20) DEFAULT NULL,
  `file_stage` bigint(20) NOT NULL,
  `direct_sales_price` varchar(255) DEFAULT NULL,
  `sales_type` varchar(255) DEFAULT NULL,
  `viewable` smallint(6) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `uploader_user_id` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='All files associated with a submission, such as those uploaded during submission, as revisions, or by copyeditors or layout editors for production.';

--
-- Despejando dados para a tabela `submission_files`
--

INSERT INTO `submission_files` (`submission_file_id`, `submission_id`, `file_id`, `source_submission_file_id`, `genre_id`, `file_stage`, `direct_sales_price`, `sales_type`, `viewable`, `created_at`, `updated_at`, `uploader_user_id`, `assoc_type`, `assoc_id`) VALUES
(15, 5, 13, NULL, 1, 2, NULL, NULL, NULL, '2025-03-17 08:58:56', '2025-03-17 08:59:04', 1, NULL, NULL),
(16, 5, 13, 15, 1, 6, NULL, NULL, NULL, '2025-03-17 09:05:03', '2025-03-17 09:05:03', 1, NULL, NULL),
(17, 5, 13, 16, 1, 11, NULL, NULL, NULL, '2025-03-17 09:05:19', '2025-03-17 09:05:19', 1, NULL, NULL),
(18, 6, 14, NULL, 1, 2, NULL, NULL, NULL, '2025-03-25 10:57:53', '2025-03-25 11:13:01', 1, NULL, NULL),
(25, 9, 19, NULL, 1, 10, NULL, NULL, NULL, '2025-04-09 12:06:19', '2025-04-09 12:06:27', 1, 521, 3),
(26, 9, 20, NULL, 12, 10, NULL, NULL, NULL, '2025-04-09 12:28:45', '2025-04-09 12:28:45', 1, 521, 4),
(27, 9, 19, 25, 1, 2, NULL, NULL, 1, '2025-04-09 12:32:03', '2025-04-09 12:32:03', 1, NULL, NULL),
(28, 9, 21, NULL, 1, 10, NULL, NULL, NULL, '2025-04-29 11:25:15', '2025-04-29 11:25:21', 1, 521, 6),
(29, 9, 22, NULL, 1, 10, NULL, NULL, NULL, '2025-04-29 11:48:02', '2025-04-29 11:48:05', 1, 521, 5),
(30, 10, 23, NULL, 1, 2, NULL, NULL, NULL, '2025-04-29 11:51:10', '2025-04-29 11:51:12', 1, NULL, NULL),
(31, 10, 23, 30, 1, 6, NULL, NULL, NULL, '2025-04-29 11:52:28', '2025-04-29 11:52:28', 1, NULL, NULL),
(32, 10, 23, 31, 1, 11, NULL, NULL, NULL, '2025-04-29 11:52:47', '2025-04-29 11:52:47', 1, NULL, NULL),
(33, 10, 24, NULL, 1, 10, NULL, NULL, NULL, '2025-04-29 11:53:26', '2025-04-29 11:53:32', 1, 521, 7),
(34, 10, 25, NULL, 1, 10, NULL, NULL, NULL, '2025-04-29 11:53:59', '2025-04-29 11:54:40', 1, 521, 8),
(35, 10, 26, NULL, 9, 17, NULL, NULL, NULL, '2025-04-29 11:54:27', '2025-04-29 11:54:30', 1, 515, 34);

-- --------------------------------------------------------

--
-- Estrutura para tabela `submission_file_revisions`
--

CREATE TABLE `submission_file_revisions` (
  `revision_id` bigint(20) UNSIGNED NOT NULL,
  `submission_file_id` bigint(20) UNSIGNED NOT NULL,
  `file_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Revisions map submission_file entries to files on the data store.';

--
-- Despejando dados para a tabela `submission_file_revisions`
--

INSERT INTO `submission_file_revisions` (`revision_id`, `submission_file_id`, `file_id`) VALUES
(17, 15, 13),
(18, 16, 13),
(19, 17, 13),
(20, 18, 14),
(27, 25, 19),
(28, 26, 20),
(29, 27, 19),
(30, 28, 21),
(31, 29, 22),
(32, 30, 23),
(33, 31, 23),
(34, 32, 23),
(35, 33, 24),
(36, 34, 25),
(37, 35, 26);

-- --------------------------------------------------------

--
-- Estrutura para tabela `submission_file_settings`
--

CREATE TABLE `submission_file_settings` (
  `submission_file_setting_id` bigint(20) UNSIGNED NOT NULL,
  `submission_file_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Localized data about submission files like published metadata.';

--
-- Despejando dados para a tabela `submission_file_settings`
--

INSERT INTO `submission_file_settings` (`submission_file_setting_id`, `submission_file_id`, `locale`, `setting_name`, `setting_value`) VALUES
(15, 15, 'pt_BR', 'name', 'Mdulo_Morfolgico_I_2025.113.03.pdf'),
(16, 16, 'pt_BR', 'name', 'Mdulo_Morfolgico_I_2025.113.03.pdf'),
(17, 17, 'pt_BR', 'name', 'Mdulo_Morfolgico_I_2025.113.03.pdf'),
(18, 18, 'pt_BR', 'name', 'Kevin-e-Antony PeP SIS.pdf'),
(25, 25, 'pt_BR', 'name', 'DO+VESTÍGIO+A+PROVA+A+TRAJETÓRIA+DA+PERÍCIA+CRIMINAL+DO+RIO+GRANDE+DO+NORTE-páginas_compressed-compactado.pdf'),
(26, 25, 'en', 'name', ''),
(27, 25, 'es', 'name', ''),
(28, 26, 'pt_BR', 'name', 'Ativar windows.txt'),
(29, 27, 'pt_BR', 'name', 'DO+VESTÍGIO+A+PROVA+A+TRAJETÓRIA+DA+PERÍCIA+CRIMINAL+DO+RIO+GRANDE+DO+NORTE-páginas_compressed-compactado.pdf'),
(30, 27, 'en', 'name', ''),
(31, 27, 'es', 'name', ''),
(32, 28, 'pt_BR', 'name', 'teste (2).html'),
(33, 28, 'en', 'name', ''),
(34, 28, 'es', 'name', ''),
(35, 29, 'pt_BR', 'name', 'LISTA DE EXERCÍCIOS 1 - 1a UNIDADE - GABARITO.pdf'),
(36, 29, 'en', 'name', ''),
(37, 29, 'es', 'name', ''),
(38, 30, 'pt_BR', 'name', 'LISTA DE EXERCÍCIOS 2 - 1a UNIDADE - GABARITO.pdf'),
(39, 31, 'pt_BR', 'name', 'LISTA DE EXERCÍCIOS 2 - 1a UNIDADE - GABARITO.pdf'),
(40, 32, 'pt_BR', 'name', 'LISTA DE EXERCÍCIOS 2 - 1a UNIDADE - GABARITO.pdf'),
(41, 33, 'pt_BR', 'name', 'LISTA DE EXERCÍCIOS 2 - 1a UNIDADE - GABARITO.pdf'),
(42, 33, 'en', 'name', ''),
(43, 33, 'es', 'name', ''),
(44, 34, 'pt_BR', 'name', 'teste (2).html'),
(45, 35, 'pt_BR', 'name', 'teste (2).html'),
(46, 35, 'en', 'name', ''),
(47, 35, 'es', 'name', ''),
(48, 34, 'en', 'name', ''),
(49, 34, 'es', 'name', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `submission_search_keyword_list`
--

CREATE TABLE `submission_search_keyword_list` (
  `keyword_id` bigint(20) NOT NULL,
  `keyword_text` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A list of all keywords used in the search index';

--
-- Despejando dados para a tabela `submission_search_keyword_list`
--

INSERT INTO `submission_search_keyword_list` (`keyword_id`, `keyword_text`) VALUES
(226, '10px'),
(216, '20px'),
(221, '800px'),
(142, '8m4k7'),
(48, 'abordando'),
(93, 'aceitação'),
(196, 'actividad'),
(172, 'activity'),
(179, 'addition'),
(174, 'addressing'),
(200, 'además'),
(69, 'admin'),
(148, 'administrador'),
(185, 'advances'),
(250, 'alcançar'),
(55, 'além'),
(228, 'align'),
(254, 'análise'),
(269, 'ano'),
(263, 'aplicações'),
(260, 'apontando'),
(29, 'apresenta'),
(252, 'apresentação'),
(244, 'apresentando'),
(232, 'aqui'),
(212, 'arial'),
(208, 'artigo'),
(49, 'aspectos'),
(175, 'aspects'),
(45, 'até'),
(43, 'atividade'),
(223, 'auto'),
(268, 'autor'),
(203, 'avances'),
(62, 'avanços'),
(116, 'barreiras'),
(78, 'benefícios'),
(209, 'body'),
(156, 'book'),
(72, 'borges'),
(225, 'bottom'),
(123, 'capacitação'),
(98, 'cerner'),
(37, 'científico'),
(54, 'civil'),
(79, 'claros'),
(95, 'clínica'),
(224, 'color'),
(149, 'comando'),
(18, 'como'),
(255, 'conclusão'),
(17, 'conferir'),
(256, 'considerações'),
(65, 'consolidação'),
(205, 'consolidación'),
(187, 'consolidation'),
(64, 'contribuíram'),
(186, 'contributed'),
(204, 'contribuyeron'),
(11, 'criminal'),
(52, 'criminalística'),
(177, 'criminalistics'),
(127, 'cuidado'),
(92, 'custos'),
(121, 'dados'),
(26, 'data'),
(135, 'del'),
(88, 'desafios'),
(234, 'descreve'),
(247, 'descrição'),
(40, 'desde'),
(201, 'destaca'),
(33, 'destacando'),
(153, 'dev'),
(251, 'discussão'),
(56, 'disso'),
(120, 'dos'),
(143, 'drr9m'),
(81, 'eficiência'),
(129, 'eletrônico'),
(75, 'eletrônicos'),
(253, 'encontrados'),
(28, 'end'),
(87, 'enfrenta'),
(125, 'equilibrando'),
(107, 'escala'),
(101, 'está'),
(32, 'estado'),
(231, 'este'),
(57, 'evidencia'),
(31, 'evolução'),
(191, 'evolución'),
(161, 'evolution'),
(267, 'exemplo'),
(94, 'exemplos'),
(206, 'experiencia'),
(134, 'expertise'),
(211, 'family'),
(23, 'farias'),
(20, 'feitas'),
(257, 'finais'),
(210, 'font'),
(189, 'forense'),
(171, 'forensic'),
(158, 'forensics'),
(181, 'frameworks'),
(261, 'futuras'),
(118, 'garantir'),
(1, 'gesiele'),
(103, 'gestão'),
(110, 'global'),
(13, 'grande'),
(197, 'hasta'),
(218, 'height'),
(163, 'highlighting'),
(180, 'highlights'),
(30, 'história'),
(160, 'history'),
(151, 'https'),
(126, 'humanização'),
(53, 'identificação'),
(199, 'identificación'),
(178, 'identification'),
(154, 'iex'),
(76, 'implementação'),
(243, 'importância'),
(182, 'important'),
(61, 'importantes'),
(104, 'informações'),
(145, 'iniciar'),
(167, 'institute'),
(35, 'instituto'),
(117, 'interoperabilidade'),
(238, 'introdução'),
(240, 'introduz'),
(150, 'irm'),
(3, 'isso'),
(67, 'isto'),
(5, 'itep'),
(242, 'justificando'),
(229, 'justify'),
(70, 'kevin'),
(222, 'left'),
(59, 'legais'),
(51, 'legal'),
(202, 'legales'),
(188, 'libro'),
(217, 'line'),
(24, 'livro'),
(108, 'local'),
(194, 'los'),
(80, 'maior'),
(58, 'marcos'),
(215, 'margin'),
(86, 'mas'),
(152, 'massgrave'),
(219, 'max'),
(111, 'maximizar'),
(85, 'médica'),
(50, 'medicina'),
(176, 'medicine'),
(144, 'menu'),
(246, 'metodologia'),
(248, 'métodos'),
(99, 'millennium'),
(47, 'modernização'),
(198, 'modernización'),
(173, 'modernization'),
(147, 'modo'),
(100, 'mostram'),
(96, 'nas'),
(114, 'necessário'),
(140, 'njy7q'),
(14, 'norte'),
(130, 'nugecid'),
(97, 'nuvens'),
(235, 'objetivo'),
(245, 'objetivos'),
(38, 'obra'),
(77, 'oferece'),
(155, 'opção'),
(34, 'papel'),
(16, 'para'),
(71, 'patrick'),
(10, 'perícia'),
(44, 'pericial'),
(66, 'perita'),
(4, 'perito'),
(60, 'personalidades'),
(183, 'personalities'),
(83, 'personalização'),
(262, 'pesquisas'),
(113, 'potencial'),
(146, 'powershell'),
(84, 'prática'),
(264, 'práticas'),
(82, 'precisão'),
(190, 'presenta'),
(159, 'presents'),
(41, 'primeiros'),
(195, 'primeros'),
(236, 'principais'),
(124, 'profissionais'),
(122, 'promover'),
(128, 'prontuário'),
(74, 'prontuários'),
(132, 'proof'),
(7, 'prova'),
(137, 'prueba'),
(21, 'publicações'),
(109, 'quanto'),
(136, 'rastro'),
(170, 'records'),
(193, 'recorre'),
(266, 'referência'),
(265, 'referências'),
(42, 'registros'),
(90, 'relacionados'),
(237, 'resultados'),
(230, 'resumo'),
(22, 'revista'),
(12, 'rio'),
(164, 'role'),
(213, 'sans'),
(105, 'saúde'),
(166, 'scientific'),
(239, 'seção'),
(119, 'segurança'),
(19, 'serão'),
(214, 'serif'),
(112, 'seu'),
(89, 'significativos'),
(258, 'sobre'),
(27, 'start'),
(162, 'state'),
(25, 'strong'),
(46, 'sua'),
(68, 'submissão'),
(115, 'superar'),
(106, 'tanto'),
(165, 'technical'),
(184, 'technological'),
(36, 'técnico'),
(91, 'tecnologia'),
(63, 'tecnológicos'),
(241, 'tema'),
(270, 'test'),
(2, 'teste'),
(15, 'teste1'),
(227, 'text'),
(207, 'título'),
(192, 'trabajo'),
(259, 'trabalho'),
(39, 'traça'),
(131, 'trace'),
(169, 'traces'),
(133, 'trajectory'),
(9, 'trajetória'),
(102, 'transformando'),
(138, 'trayectoria'),
(73, 'uso'),
(249, 'utilizados'),
(157, 'vestige'),
(6, 'vestígio'),
(233, 'você'),
(8, 'vol'),
(139, 'vtq6d'),
(220, 'width'),
(168, 'work'),
(141, 'wxtdq');

-- --------------------------------------------------------

--
-- Estrutura para tabela `submission_search_objects`
--

CREATE TABLE `submission_search_objects` (
  `object_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL COMMENT 'Type of item. E.g., abstract, fulltext, etc.',
  `assoc_id` bigint(20) DEFAULT NULL COMMENT 'Optional ID of an associated record (e.g., a file_id)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A list of all search objects indexed in the search index';

--
-- Despejando dados para a tabela `submission_search_objects`
--

INSERT INTO `submission_search_objects` (`object_id`, `submission_id`, `type`, `assoc_id`) VALUES
(49, 5, 1, NULL),
(50, 5, 2, NULL),
(51, 5, 4, NULL),
(52, 5, 16, NULL),
(53, 5, 17, NULL),
(54, 5, 8, NULL),
(55, 5, 32, NULL),
(56, 5, 64, NULL),
(57, 6, 1, NULL),
(58, 6, 2, NULL),
(59, 6, 4, NULL),
(60, 6, 16, NULL),
(61, 6, 17, NULL),
(62, 6, 8, NULL),
(63, 6, 32, NULL),
(64, 6, 64, NULL),
(73, 4, 1, NULL),
(74, 4, 2, NULL),
(75, 4, 4, NULL),
(76, 4, 16, NULL),
(77, 4, 17, NULL),
(78, 4, 8, NULL),
(79, 4, 32, NULL),
(80, 4, 64, NULL),
(90, 9, 1, NULL),
(91, 9, 2, NULL),
(92, 9, 4, NULL),
(93, 9, 16, NULL),
(94, 9, 17, NULL),
(95, 9, 8, NULL),
(96, 9, 32, NULL),
(97, 9, 64, NULL),
(98, 9, 128, 26),
(99, 9, 128, 28),
(110, 10, 1, NULL),
(111, 10, 2, NULL),
(112, 10, 4, NULL),
(113, 10, 16, NULL),
(114, 10, 17, NULL),
(115, 10, 8, NULL),
(116, 10, 32, NULL),
(117, 10, 64, NULL),
(118, 10, 128, 34),
(119, 10, 256, 35);

-- --------------------------------------------------------

--
-- Estrutura para tabela `submission_search_object_keywords`
--

CREATE TABLE `submission_search_object_keywords` (
  `submission_search_object_keyword_id` bigint(20) UNSIGNED NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `keyword_id` bigint(20) NOT NULL,
  `pos` int(11) NOT NULL COMMENT 'Word position of the keyword in the object.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Relationships between search objects and keywords in the search index';

--
-- Despejando dados para a tabela `submission_search_object_keywords`
--

INSERT INTO `submission_search_object_keywords` (`submission_search_object_keyword_id`, `object_id`, `keyword_id`, `pos`) VALUES
(476, 49, 2, 0),
(477, 49, 2, 1),
(478, 49, 2, 2),
(479, 49, 3, 3),
(480, 49, 2, 4),
(481, 49, 2, 5),
(482, 49, 67, 6),
(483, 49, 2, 7),
(484, 50, 3, 0),
(485, 50, 2, 1),
(486, 50, 68, 2),
(487, 51, 2, 0),
(488, 51, 2, 1),
(489, 51, 2, 2),
(490, 51, 2, 3),
(491, 51, 2, 4),
(492, 51, 2, 5),
(493, 53, 2, 0),
(565, 57, 69, 0),
(566, 57, 69, 1),
(567, 57, 70, 2),
(568, 57, 71, 3),
(569, 57, 72, 4),
(570, 57, 70, 5),
(571, 57, 71, 6),
(572, 58, 73, 0),
(573, 58, 74, 1),
(574, 58, 75, 2),
(575, 59, 76, 0),
(576, 59, 74, 1),
(577, 59, 75, 2),
(578, 59, 77, 3),
(579, 59, 78, 4),
(580, 59, 79, 5),
(581, 59, 18, 6),
(582, 59, 80, 7),
(583, 59, 81, 8),
(584, 59, 82, 9),
(585, 59, 83, 10),
(586, 59, 84, 11),
(587, 59, 85, 12),
(588, 59, 86, 13),
(589, 59, 87, 14),
(590, 59, 88, 15),
(591, 59, 89, 16),
(592, 59, 90, 17),
(593, 59, 91, 18),
(594, 59, 92, 19),
(595, 59, 93, 20),
(596, 59, 94, 21),
(597, 59, 18, 22),
(598, 59, 95, 23),
(599, 59, 96, 24),
(600, 59, 97, 25),
(601, 59, 98, 26),
(602, 59, 99, 27),
(603, 59, 100, 28),
(604, 59, 101, 29),
(605, 59, 102, 30),
(606, 59, 103, 31),
(607, 59, 104, 32),
(608, 59, 105, 33),
(609, 59, 106, 34),
(610, 59, 107, 35),
(611, 59, 108, 36),
(612, 59, 109, 37),
(613, 59, 110, 38),
(614, 59, 16, 39),
(615, 59, 111, 40),
(616, 59, 112, 41),
(617, 59, 113, 42),
(618, 59, 114, 43),
(619, 59, 115, 44),
(620, 59, 116, 45),
(621, 59, 117, 46),
(622, 59, 118, 47),
(623, 59, 119, 48),
(624, 59, 120, 49),
(625, 59, 121, 50),
(626, 59, 122, 51),
(627, 59, 123, 52),
(628, 59, 120, 53),
(629, 59, 124, 54),
(630, 59, 125, 55),
(631, 59, 91, 56),
(632, 59, 126, 57),
(633, 59, 127, 58),
(634, 61, 128, 0),
(635, 61, 129, 1),
(920, 73, 1, 0),
(921, 73, 23, 1),
(922, 73, 1, 2),
(923, 73, 5, 3),
(924, 74, 6, 0),
(925, 74, 7, 1),
(926, 74, 9, 2),
(927, 74, 10, 3),
(928, 74, 11, 4),
(929, 74, 12, 5),
(930, 74, 13, 6),
(931, 74, 14, 7),
(932, 75, 24, 0),
(933, 75, 25, 1),
(934, 75, 26, 2),
(935, 75, 27, 3),
(936, 75, 26, 4),
(937, 75, 28, 5),
(938, 75, 6, 6),
(939, 75, 7, 7),
(940, 75, 9, 8),
(941, 75, 10, 9),
(942, 75, 11, 10),
(943, 75, 12, 11),
(944, 75, 13, 12),
(945, 75, 14, 13),
(946, 75, 25, 14),
(947, 75, 29, 15),
(948, 75, 30, 16),
(949, 75, 31, 17),
(950, 75, 10, 18),
(951, 75, 11, 19),
(952, 75, 32, 20),
(953, 75, 33, 21),
(954, 75, 34, 22),
(955, 75, 35, 23),
(956, 75, 36, 24),
(957, 75, 37, 25),
(958, 75, 10, 26),
(959, 75, 5, 27),
(960, 75, 38, 28),
(961, 75, 39, 29),
(962, 75, 40, 30),
(963, 75, 41, 31),
(964, 75, 42, 32),
(965, 75, 43, 33),
(966, 75, 44, 34),
(967, 75, 45, 35),
(968, 75, 46, 36),
(969, 75, 47, 37),
(970, 75, 48, 38),
(971, 75, 49, 39),
(972, 75, 50, 40),
(973, 75, 51, 41),
(974, 75, 52, 42),
(975, 75, 53, 43),
(976, 75, 54, 44),
(977, 75, 55, 45),
(978, 75, 56, 46),
(979, 75, 57, 47),
(980, 75, 58, 48),
(981, 75, 59, 49),
(982, 75, 60, 50),
(983, 75, 61, 51),
(984, 75, 62, 52),
(985, 75, 63, 53),
(986, 75, 64, 54),
(987, 75, 16, 55),
(988, 75, 65, 56),
(989, 75, 10, 57),
(990, 75, 12, 58),
(991, 75, 13, 59),
(992, 75, 14, 60),
(993, 77, 5, 0),
(994, 77, 4, 1),
(995, 77, 30, 2),
(996, 77, 66, 3),
(1601, 90, 130, 0),
(1602, 90, 5, 1),
(1603, 90, 5, 2),
(1604, 91, 131, 0),
(1605, 91, 132, 1),
(1606, 91, 133, 2),
(1607, 91, 11, 3),
(1608, 91, 134, 4),
(1609, 91, 12, 5),
(1610, 91, 13, 6),
(1611, 91, 14, 7),
(1612, 91, 135, 8),
(1613, 91, 136, 9),
(1614, 91, 137, 10),
(1615, 91, 138, 11),
(1616, 91, 10, 12),
(1617, 91, 11, 13),
(1618, 91, 12, 14),
(1619, 91, 13, 15),
(1620, 91, 14, 16),
(1621, 91, 6, 17),
(1622, 91, 7, 18),
(1623, 91, 9, 19),
(1624, 91, 10, 20),
(1625, 91, 11, 21),
(1626, 91, 12, 22),
(1627, 91, 13, 23),
(1628, 91, 14, 24),
(1629, 92, 156, 0),
(1630, 92, 157, 1),
(1631, 92, 132, 2),
(1632, 92, 133, 3),
(1633, 92, 11, 4),
(1634, 92, 158, 5),
(1635, 92, 12, 6),
(1636, 92, 13, 7),
(1637, 92, 14, 8),
(1638, 92, 159, 9),
(1639, 92, 160, 10),
(1640, 92, 161, 11),
(1641, 92, 11, 12),
(1642, 92, 158, 13),
(1643, 92, 162, 14),
(1644, 92, 163, 15),
(1645, 92, 164, 16),
(1646, 92, 165, 17),
(1647, 92, 166, 18),
(1648, 92, 167, 19),
(1649, 92, 158, 20),
(1650, 92, 5, 21),
(1651, 92, 168, 22),
(1652, 92, 169, 23),
(1653, 92, 170, 24),
(1654, 92, 171, 25),
(1655, 92, 172, 26),
(1656, 92, 173, 27),
(1657, 92, 174, 28),
(1658, 92, 175, 29),
(1659, 92, 171, 30),
(1660, 92, 176, 31),
(1661, 92, 177, 32),
(1662, 92, 54, 33),
(1663, 92, 178, 34),
(1664, 92, 179, 35),
(1665, 92, 180, 36),
(1666, 92, 51, 37),
(1667, 92, 181, 38),
(1668, 92, 182, 39),
(1669, 92, 183, 40),
(1670, 92, 184, 41),
(1671, 92, 185, 42),
(1672, 92, 186, 43),
(1673, 92, 187, 44),
(1674, 92, 134, 45),
(1675, 92, 12, 46),
(1676, 92, 13, 47),
(1677, 92, 14, 48),
(1678, 92, 188, 49),
(1679, 92, 135, 50),
(1680, 92, 6, 51),
(1681, 92, 137, 52),
(1682, 92, 138, 53),
(1683, 92, 52, 54),
(1684, 92, 189, 55),
(1685, 92, 12, 56),
(1686, 92, 13, 57),
(1687, 92, 14, 58),
(1688, 92, 190, 59),
(1689, 92, 30, 60),
(1690, 92, 191, 61),
(1691, 92, 52, 62),
(1692, 92, 189, 63),
(1693, 92, 32, 64),
(1694, 92, 33, 65),
(1695, 92, 34, 66),
(1696, 92, 135, 67),
(1697, 92, 35, 68),
(1698, 92, 36, 69),
(1699, 92, 37, 70),
(1700, 92, 50, 71),
(1701, 92, 189, 72),
(1702, 92, 5, 73),
(1703, 92, 192, 74),
(1704, 92, 193, 75),
(1705, 92, 40, 76),
(1706, 92, 194, 77),
(1707, 92, 195, 78),
(1708, 92, 42, 79),
(1709, 92, 196, 80),
(1710, 92, 189, 81),
(1711, 92, 197, 82),
(1712, 92, 198, 83),
(1713, 92, 48, 84),
(1714, 92, 49, 85),
(1715, 92, 50, 86),
(1716, 92, 189, 87),
(1717, 92, 52, 88),
(1718, 92, 199, 89),
(1719, 92, 54, 90),
(1720, 92, 200, 91),
(1721, 92, 201, 92),
(1722, 92, 58, 93),
(1723, 92, 202, 94),
(1724, 92, 60, 95),
(1725, 92, 61, 96),
(1726, 92, 203, 97),
(1727, 92, 63, 98),
(1728, 92, 204, 99),
(1729, 92, 205, 100),
(1730, 92, 206, 101),
(1731, 92, 12, 102),
(1732, 92, 13, 103),
(1733, 92, 14, 104),
(1734, 92, 24, 105),
(1735, 92, 6, 106),
(1736, 92, 7, 107),
(1737, 92, 9, 108),
(1738, 92, 10, 109),
(1739, 92, 11, 110),
(1740, 92, 12, 111),
(1741, 92, 13, 112),
(1742, 92, 14, 113),
(1743, 92, 29, 114),
(1744, 92, 30, 115),
(1745, 92, 31, 116),
(1746, 92, 10, 117),
(1747, 92, 11, 118),
(1748, 92, 32, 119),
(1749, 92, 33, 120),
(1750, 92, 34, 121),
(1751, 92, 35, 122),
(1752, 92, 36, 123),
(1753, 92, 37, 124),
(1754, 92, 10, 125),
(1755, 92, 5, 126),
(1756, 92, 38, 127),
(1757, 92, 39, 128),
(1758, 92, 40, 129),
(1759, 92, 41, 130),
(1760, 92, 42, 131),
(1761, 92, 43, 132),
(1762, 92, 44, 133),
(1763, 92, 45, 134),
(1764, 92, 46, 135),
(1765, 92, 47, 136),
(1766, 92, 48, 137),
(1767, 92, 49, 138),
(1768, 92, 50, 139),
(1769, 92, 51, 140),
(1770, 92, 52, 141),
(1771, 92, 53, 142),
(1772, 92, 54, 143),
(1773, 92, 55, 144),
(1774, 92, 56, 145),
(1775, 92, 57, 146),
(1776, 92, 58, 147),
(1777, 92, 59, 148),
(1778, 92, 60, 149),
(1779, 92, 61, 150),
(1780, 92, 62, 151),
(1781, 92, 63, 152),
(1782, 92, 64, 153),
(1783, 92, 16, 154),
(1784, 92, 65, 155),
(1785, 92, 10, 156),
(1786, 92, 12, 157),
(1787, 92, 13, 158),
(1788, 92, 14, 159),
(1789, 94, 5, 0),
(1790, 94, 4, 1),
(1791, 94, 10, 2),
(1792, 94, 66, 3),
(1793, 99, 207, 0),
(1794, 99, 208, 1),
(1795, 99, 209, 2),
(1796, 99, 210, 3),
(1797, 99, 211, 4),
(1798, 99, 212, 5),
(1799, 99, 213, 6),
(1800, 99, 214, 7),
(1801, 99, 215, 8),
(1802, 99, 216, 9),
(1803, 99, 217, 10),
(1804, 99, 218, 11),
(1805, 99, 219, 12),
(1806, 99, 220, 13),
(1807, 99, 221, 14),
(1808, 99, 215, 15),
(1809, 99, 222, 16),
(1810, 99, 223, 17),
(1811, 99, 215, 18),
(1812, 99, 223, 19),
(1813, 99, 224, 20),
(1814, 99, 215, 21),
(1815, 99, 225, 22),
(1816, 99, 226, 23),
(1817, 99, 227, 24),
(1818, 99, 228, 25),
(1819, 99, 229, 26),
(1820, 99, 207, 27),
(1821, 99, 208, 28),
(1822, 99, 230, 29),
(1823, 99, 231, 30),
(1824, 99, 230, 31),
(1825, 99, 208, 32),
(1826, 99, 232, 33),
(1827, 99, 233, 34),
(1828, 99, 234, 35),
(1829, 99, 235, 36),
(1830, 99, 236, 37),
(1831, 99, 237, 38),
(1832, 99, 238, 39),
(1833, 99, 101, 40),
(1834, 99, 239, 41),
(1835, 99, 240, 42),
(1836, 99, 241, 43),
(1837, 99, 208, 44),
(1838, 99, 242, 45),
(1839, 99, 46, 46),
(1840, 99, 243, 47),
(1841, 99, 244, 48),
(1842, 99, 245, 49),
(1843, 99, 246, 50),
(1844, 99, 247, 51),
(1845, 99, 120, 52),
(1846, 99, 248, 53),
(1847, 99, 249, 54),
(1848, 99, 16, 55),
(1849, 99, 250, 56),
(1850, 99, 237, 57),
(1851, 99, 237, 58),
(1852, 99, 251, 59),
(1853, 99, 252, 60),
(1854, 99, 120, 61),
(1855, 99, 237, 62),
(1856, 99, 253, 63),
(1857, 99, 46, 64),
(1858, 99, 254, 65),
(1859, 99, 255, 66),
(1860, 99, 256, 67),
(1861, 99, 257, 68),
(1862, 99, 258, 69),
(1863, 99, 259, 70),
(1864, 99, 260, 71),
(1865, 99, 16, 72),
(1866, 99, 261, 73),
(1867, 99, 262, 74),
(1868, 99, 263, 75),
(1869, 99, 264, 76),
(1870, 99, 265, 77),
(1871, 99, 266, 78),
(1872, 99, 267, 79),
(1873, 99, 268, 80),
(1874, 99, 207, 81),
(1875, 99, 269, 82),
(1876, 98, 139, 0),
(1877, 98, 140, 1),
(1878, 98, 141, 2),
(1879, 98, 142, 3),
(1880, 98, 143, 4),
(1881, 98, 144, 5),
(1882, 98, 145, 6),
(1883, 98, 146, 7),
(1884, 98, 147, 8),
(1885, 98, 148, 9),
(1886, 98, 149, 10),
(1887, 98, 150, 11),
(1888, 98, 151, 12),
(1889, 98, 152, 13),
(1890, 98, 153, 14),
(1891, 98, 154, 15),
(1892, 98, 155, 16),
(2419, 111, 270, 0),
(2420, 111, 2, 1),
(2421, 112, 270, 0),
(2422, 112, 3, 1),
(2423, 112, 2, 2),
(2424, 114, 270, 0),
(2425, 114, 2, 1),
(2426, 118, 207, 0),
(2427, 118, 208, 1),
(2428, 118, 209, 2),
(2429, 118, 210, 3),
(2430, 118, 211, 4),
(2431, 118, 212, 5),
(2432, 118, 213, 6),
(2433, 118, 214, 7),
(2434, 118, 215, 8),
(2435, 118, 216, 9),
(2436, 118, 217, 10),
(2437, 118, 218, 11),
(2438, 118, 219, 12),
(2439, 118, 220, 13),
(2440, 118, 221, 14),
(2441, 118, 215, 15),
(2442, 118, 222, 16),
(2443, 118, 223, 17),
(2444, 118, 215, 18),
(2445, 118, 223, 19),
(2446, 118, 224, 20),
(2447, 118, 215, 21),
(2448, 118, 225, 22),
(2449, 118, 226, 23),
(2450, 118, 227, 24),
(2451, 118, 228, 25),
(2452, 118, 229, 26),
(2453, 118, 207, 27),
(2454, 118, 208, 28),
(2455, 118, 230, 29),
(2456, 118, 231, 30),
(2457, 118, 230, 31),
(2458, 118, 208, 32),
(2459, 118, 232, 33),
(2460, 118, 233, 34),
(2461, 118, 234, 35),
(2462, 118, 235, 36),
(2463, 118, 236, 37),
(2464, 118, 237, 38),
(2465, 118, 238, 39),
(2466, 118, 101, 40),
(2467, 118, 239, 41),
(2468, 118, 240, 42),
(2469, 118, 241, 43),
(2470, 118, 208, 44),
(2471, 118, 242, 45),
(2472, 118, 46, 46),
(2473, 118, 243, 47),
(2474, 118, 244, 48),
(2475, 118, 245, 49),
(2476, 118, 246, 50),
(2477, 118, 247, 51),
(2478, 118, 120, 52),
(2479, 118, 248, 53),
(2480, 118, 249, 54),
(2481, 118, 16, 55),
(2482, 118, 250, 56),
(2483, 118, 237, 57),
(2484, 118, 237, 58),
(2485, 118, 251, 59),
(2486, 118, 252, 60),
(2487, 118, 120, 61),
(2488, 118, 237, 62),
(2489, 118, 253, 63),
(2490, 118, 46, 64),
(2491, 118, 254, 65),
(2492, 118, 255, 66),
(2493, 118, 256, 67),
(2494, 118, 257, 68),
(2495, 118, 258, 69),
(2496, 118, 259, 70),
(2497, 118, 260, 71),
(2498, 118, 16, 72),
(2499, 118, 261, 73),
(2500, 118, 262, 74),
(2501, 118, 263, 75),
(2502, 118, 264, 76),
(2503, 118, 265, 77),
(2504, 118, 266, 78),
(2505, 118, 267, 79),
(2506, 118, 268, 80),
(2507, 118, 207, 81),
(2508, 118, 269, 82),
(2509, 119, 207, 0),
(2510, 119, 208, 1),
(2511, 119, 209, 2),
(2512, 119, 210, 3),
(2513, 119, 211, 4),
(2514, 119, 212, 5),
(2515, 119, 213, 6),
(2516, 119, 214, 7),
(2517, 119, 215, 8),
(2518, 119, 216, 9),
(2519, 119, 217, 10),
(2520, 119, 218, 11),
(2521, 119, 219, 12),
(2522, 119, 220, 13),
(2523, 119, 221, 14),
(2524, 119, 215, 15),
(2525, 119, 222, 16),
(2526, 119, 223, 17),
(2527, 119, 215, 18),
(2528, 119, 223, 19),
(2529, 119, 224, 20),
(2530, 119, 215, 21),
(2531, 119, 225, 22),
(2532, 119, 226, 23),
(2533, 119, 227, 24),
(2534, 119, 228, 25),
(2535, 119, 229, 26),
(2536, 119, 207, 27),
(2537, 119, 208, 28),
(2538, 119, 230, 29),
(2539, 119, 231, 30),
(2540, 119, 230, 31),
(2541, 119, 208, 32),
(2542, 119, 232, 33),
(2543, 119, 233, 34),
(2544, 119, 234, 35),
(2545, 119, 235, 36),
(2546, 119, 236, 37),
(2547, 119, 237, 38),
(2548, 119, 238, 39),
(2549, 119, 101, 40),
(2550, 119, 239, 41),
(2551, 119, 240, 42),
(2552, 119, 241, 43),
(2553, 119, 208, 44),
(2554, 119, 242, 45),
(2555, 119, 46, 46),
(2556, 119, 243, 47),
(2557, 119, 244, 48),
(2558, 119, 245, 49),
(2559, 119, 246, 50),
(2560, 119, 247, 51),
(2561, 119, 120, 52),
(2562, 119, 248, 53),
(2563, 119, 249, 54),
(2564, 119, 16, 55),
(2565, 119, 250, 56),
(2566, 119, 237, 57),
(2567, 119, 237, 58),
(2568, 119, 251, 59),
(2569, 119, 252, 60),
(2570, 119, 120, 61),
(2571, 119, 237, 62),
(2572, 119, 253, 63),
(2573, 119, 46, 64),
(2574, 119, 254, 65),
(2575, 119, 255, 66),
(2576, 119, 256, 67),
(2577, 119, 257, 68),
(2578, 119, 258, 69),
(2579, 119, 259, 70),
(2580, 119, 260, 71),
(2581, 119, 16, 72),
(2582, 119, 261, 73),
(2583, 119, 262, 74),
(2584, 119, 263, 75),
(2585, 119, 264, 76),
(2586, 119, 265, 77),
(2587, 119, 266, 78),
(2588, 119, 267, 79),
(2589, 119, 268, 80),
(2590, 119, 207, 81),
(2591, 119, 269, 82);

-- --------------------------------------------------------

--
-- Estrutura para tabela `submission_settings`
--

CREATE TABLE `submission_settings` (
  `submission_setting_id` bigint(20) UNSIGNED NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Localized data about submissions';

--
-- Despejando dados para a tabela `submission_settings`
--

INSERT INTO `submission_settings` (`submission_setting_id`, `submission_id`, `locale`, `setting_name`, `setting_value`) VALUES
(5, 4, '', 'userGroupId', '2'),
(6, 4, '', 'commentsForTheEditors', '<p>...</p>'),
(7, 5, '', 'userGroupId', '2'),
(8, 5, '', 'commentsForTheEditors', '<p>Isso é um teste, isso é um teste, de um teste...</p>'),
(9, 6, '', 'userGroupId', '14'),
(10, 6, '', 'commentsForTheEditors', '<p>Teste</p>\n<p> </p>'),
(13, 9, '', 'sectionId', '1'),
(14, 10, '', 'userGroupId', '2'),
(15, 10, '', 'commentsForTheEditors', '<p>Isso é um teste</p>'),
(16, 11, '', 'userGroupId', '2');

-- --------------------------------------------------------

--
-- Estrutura para tabela `subscriptions`
--

CREATE TABLE `subscriptions` (
  `subscription_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type_id` bigint(20) NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `membership` varchar(40) DEFAULT NULL,
  `reference_number` varchar(40) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A list of subscriptions, both institutional and individual, for journals that use subscription-based publishing.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `subscription_types`
--

CREATE TABLE `subscription_types` (
  `type_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `cost` double(8,2) NOT NULL,
  `currency_code_alpha` varchar(3) NOT NULL,
  `duration` smallint(6) DEFAULT NULL,
  `format` smallint(6) NOT NULL,
  `institutional` smallint(6) NOT NULL DEFAULT 0,
  `membership` smallint(6) NOT NULL DEFAULT 0,
  `disable_public_display` smallint(6) NOT NULL,
  `seq` double(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Subscription types represent the kinds of subscriptions that a user or institution may have, such as an annual subscription or a discounted subscription.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `subscription_type_settings`
--

CREATE TABLE `subscription_type_settings` (
  `subscription_type_setting_id` bigint(20) UNSIGNED NOT NULL,
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about subscription types, including localized properties such as names.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `temporary_files`
--

CREATE TABLE `temporary_files` (
  `file_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_size` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Temporary files, e.g. where files are kept during an upload process before they are moved somewhere more appropriate.';

--
-- Despejando dados para a tabela `temporary_files`
--

INSERT INTO `temporary_files` (`file_id`, `user_id`, `file_name`, `file_type`, `file_size`, `original_file_name`, `date_uploaded`) VALUES
(39, 1, 'jpgA197.tmp', 'image/jpeg', 1217122, 'DO VESTÍGIO A PROVA A TRAJETÓRIA DA PERÍCIA CRIMINAL DO RIO GRANDE DO NORTE_page-0001 (1).jpg', '2025-03-25 11:26:04'),
(41, 1, 'jpgB15B.tmp', 'image/jpeg', 3037877, 'DO VESTÍGIO A PROVA A TRAJETÓRIA DA PERÍCIA CRIMINAL DO RIO GRANDE DO NORTE_page-0001 (1).jpg', '2025-04-09 12:46:47'),
(42, 1, 'pngB5C9.tmp', 'image/png', 1681012, 'itep_logo.png', '2025-04-29 11:55:42');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usage_stats_institution_temporary_records`
--

CREATE TABLE `usage_stats_institution_temporary_records` (
  `usage_stats_temp_institution_id` bigint(20) UNSIGNED NOT NULL,
  `load_id` varchar(50) NOT NULL,
  `line_number` bigint(20) NOT NULL,
  `institution_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Temporary stats for views and downloads from institutions based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `usage_stats_total_temporary_records`
--

CREATE TABLE `usage_stats_total_temporary_records` (
  `usage_stats_temp_total_id` bigint(20) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `ip` varchar(64) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `line_number` bigint(20) NOT NULL,
  `canonical_url` varchar(255) NOT NULL,
  `issue_id` bigint(20) DEFAULT NULL,
  `issue_galley_id` bigint(20) DEFAULT NULL,
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) DEFAULT NULL,
  `representation_id` bigint(20) DEFAULT NULL,
  `submission_file_id` bigint(20) UNSIGNED DEFAULT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `file_type` smallint(6) DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `load_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Temporary stats totals based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `usage_stats_unique_item_investigations_temporary_records`
--

CREATE TABLE `usage_stats_unique_item_investigations_temporary_records` (
  `usage_stats_temp_unique_item_id` bigint(20) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `ip` varchar(64) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `line_number` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `representation_id` bigint(20) DEFAULT NULL,
  `submission_file_id` bigint(20) UNSIGNED DEFAULT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `file_type` smallint(6) DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `load_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Temporary stats on unique downloads based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `usage_stats_unique_item_requests_temporary_records`
--

CREATE TABLE `usage_stats_unique_item_requests_temporary_records` (
  `usage_stats_temp_item_id` bigint(20) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `ip` varchar(64) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `line_number` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `representation_id` bigint(20) DEFAULT NULL,
  `submission_file_id` bigint(20) UNSIGNED DEFAULT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `file_type` smallint(6) DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `load_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Temporary stats on unique views based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `url` varchar(2047) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `country` varchar(90) DEFAULT NULL,
  `locales` varchar(255) NOT NULL DEFAULT '[]',
  `gossip` text DEFAULT NULL,
  `date_last_email` datetime DEFAULT NULL,
  `date_registered` datetime NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_last_login` datetime DEFAULT NULL,
  `must_change_password` smallint(6) DEFAULT NULL,
  `auth_id` bigint(20) DEFAULT NULL,
  `auth_str` varchar(255) DEFAULT NULL,
  `disabled` smallint(6) NOT NULL DEFAULT 0,
  `disabled_reason` text DEFAULT NULL,
  `inline_help` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='All registered users, including authentication data and profile data.';

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`, `url`, `phone`, `mailing_address`, `billing_address`, `country`, `locales`, `gossip`, `date_last_email`, `date_registered`, `date_validated`, `date_last_login`, `must_change_password`, `auth_id`, `auth_str`, `disabled`, `disabled_reason`, `inline_help`) VALUES
(1, 'admin', '$2y$10$MXfUxS07BwajJOBjt9YLzecfm9K/rFYP3d7P5aZIzXbEsIVmFuAAC', 'nugecid@gmail.com', '', '', '', NULL, 'BR', '[\"es\",\"en\",\"pt_BR\"]', NULL, NULL, '2025-03-06 16:13:18', NULL, '2025-05-05 08:11:45', 0, NULL, NULL, 0, NULL, 1),
(2, 'gesiele', '$2y$10$OzhVu5GdgKcD1b2XzWiiuOWCxcq9dAlE4Rtud.7Udx4ZOHc.5/HSC', 'gesiele@itep.rn.gov.br', '', '', '', NULL, 'BR', '[]', NULL, NULL, '2025-03-07 13:34:06', NULL, '2025-03-11 09:45:05', 0, NULL, NULL, 0, NULL, 1),
(3, 'bianca', '$2y$10$L71azsDXL0HWq7YAmknsM.cPN5.x592Q2zeumyyEXcbDp9wiCSx8W', 'bianca@itep.rn.gov.br', '', '', '', NULL, 'BR', '[]', NULL, NULL, '2025-03-07 13:34:53', NULL, '2025-03-07 13:46:58', 0, NULL, NULL, 0, NULL, 1),
(4, 'teste', '$2y$10$/13V5q1VCwIuU5u1.g5y7.QA5Ya0h/cVw8dp6jGIMcPiaajeZOajG', 'teste@teste.com', '', '', '', NULL, 'BR', '[]', NULL, NULL, '2025-03-10 08:48:40', NULL, '2025-03-10 08:49:08', 0, NULL, NULL, 0, NULL, 1),
(5, 'gfarias', '$2y$10$nioVHCf9Z6yytm7BfcaaqenM/Ac1mBLTy6H6cm6Nrs9vsYenqgo2q', 'gesielefarias@hotmail.com', NULL, NULL, NULL, NULL, 'BR', '[]', NULL, NULL, '2025-03-18 10:39:10', NULL, '2025-03-18 10:39:11', NULL, NULL, NULL, 0, NULL, 1),
(6, 'biancapraca', '$2y$10$gWFC.UnYkHRzN7UIXb/BNu8BObOnUuy7QYcoxLLokGZ8FcGcGyKhW', 'mayarapraca@outlook.com', NULL, NULL, NULL, NULL, 'BR', '[]', NULL, NULL, '2025-03-18 10:40:23', NULL, '2025-03-18 10:40:23', NULL, NULL, NULL, 0, NULL, 1),
(7, 'kevin', '$2y$10$CGWSvU8iFl6h1IDZbsaxTuEl7HHcOeSEGQrpcr4dmReO6t4ZFao2e', 'kevin.borges.700@ufrn.edu.br', NULL, NULL, NULL, NULL, 'BR', '[]', NULL, NULL, '2025-04-04 11:11:39', NULL, '2025-04-10 13:11:36', NULL, NULL, NULL, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `user_groups`
--

CREATE TABLE `user_groups` (
  `user_group_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `is_default` smallint(6) NOT NULL DEFAULT 0,
  `show_title` smallint(6) NOT NULL DEFAULT 1,
  `permit_self_registration` smallint(6) NOT NULL DEFAULT 0,
  `permit_metadata_edit` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='All defined user roles in a context, such as Author, Reviewer, Section Editor and Journal Manager.';

--
-- Despejando dados para a tabela `user_groups`
--

INSERT INTO `user_groups` (`user_group_id`, `context_id`, `role_id`, `is_default`, `show_title`, `permit_self_registration`, `permit_metadata_edit`) VALUES
(1, 0, 1, 1, 1, 0, 0),
(2, 1, 16, 1, 1, 0, 1),
(3, 1, 16, 1, 1, 0, 1),
(4, 1, 16, 1, 1, 0, 1),
(5, 1, 17, 1, 1, 0, 1),
(6, 1, 17, 1, 1, 0, 0),
(7, 1, 4097, 1, 1, 0, 0),
(8, 1, 4097, 1, 1, 0, 0),
(9, 1, 4097, 1, 1, 0, 0),
(10, 1, 4097, 1, 1, 0, 0),
(11, 1, 4097, 1, 1, 0, 0),
(12, 1, 4097, 1, 1, 0, 0),
(13, 1, 4097, 1, 1, 0, 0),
(14, 1, 65536, 1, 1, 1, 0),
(15, 1, 65536, 1, 1, 0, 0),
(16, 1, 4096, 1, 1, 1, 0),
(17, 1, 1048576, 1, 1, 1, 0),
(18, 1, 2097152, 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `user_group_settings`
--

CREATE TABLE `user_group_settings` (
  `user_group_setting_id` bigint(20) UNSIGNED NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about user groups, including localized properties such as the name.';

--
-- Despejando dados para a tabela `user_group_settings`
--

INSERT INTO `user_group_settings` (`user_group_setting_id`, `user_group_id`, `locale`, `setting_name`, `setting_value`) VALUES
(1, 1, 'en', 'name', 'Site Admin'),
(2, 1, 'es', 'name', 'Administrador/a del sitio'),
(3, 1, 'pt_BR', 'name', 'Administrador do site'),
(4, 2, '', 'nameLocaleKey', 'default.groups.name.manager'),
(5, 2, '', 'abbrevLocaleKey', 'default.groups.abbrev.manager'),
(6, 2, 'en', 'abbrev', 'JM'),
(7, 2, 'en', 'name', 'Journal manager'),
(8, 2, 'es', 'abbrev', 'GR'),
(9, 2, 'es', 'name', 'Gestor/a de la revista'),
(10, 2, 'pt_BR', 'abbrev', 'GR'),
(11, 2, 'pt_BR', 'name', 'Gerente da revista'),
(12, 3, '', 'nameLocaleKey', 'default.groups.name.editor'),
(13, 3, '', 'abbrevLocaleKey', 'default.groups.abbrev.editor'),
(14, 3, 'en', 'abbrev', 'JE'),
(15, 3, 'en', 'name', 'Journal editor'),
(16, 3, 'es', 'abbrev', 'ER'),
(17, 3, 'es', 'name', 'Editor/a de la revista'),
(18, 3, 'pt_BR', 'abbrev', 'ER'),
(19, 3, 'pt_BR', 'name', 'Editor da revista'),
(20, 4, '', 'nameLocaleKey', 'default.groups.name.productionEditor'),
(21, 4, '', 'abbrevLocaleKey', 'default.groups.abbrev.productionEditor'),
(22, 4, 'en', 'abbrev', 'ProdE'),
(23, 4, 'en', 'name', 'Production editor'),
(24, 4, 'es', 'abbrev', 'CoProd'),
(25, 4, 'es', 'name', 'Coordinador/a de producción'),
(26, 4, 'pt_BR', 'abbrev', 'EP'),
(27, 4, 'pt_BR', 'name', 'Editor de Produção'),
(28, 5, '', 'nameLocaleKey', 'default.groups.name.sectionEditor'),
(29, 5, '', 'abbrevLocaleKey', 'default.groups.abbrev.sectionEditor'),
(30, 5, 'en', 'abbrev', 'SecE'),
(31, 5, 'en', 'name', 'Section editor'),
(32, 5, 'es', 'abbrev', 'ESec'),
(33, 5, 'es', 'name', 'Editor/a de sección'),
(34, 5, 'pt_BR', 'abbrev', 'ESeç'),
(35, 5, 'pt_BR', 'name', 'Editor de seção'),
(36, 6, '', 'nameLocaleKey', 'default.groups.name.guestEditor'),
(37, 6, '', 'abbrevLocaleKey', 'default.groups.abbrev.guestEditor'),
(38, 6, 'en', 'abbrev', 'GE'),
(39, 6, 'en', 'name', 'Guest editor'),
(40, 6, 'es', 'abbrev', 'EI'),
(41, 6, 'es', 'name', 'Editor/a invitado/a'),
(42, 6, 'pt_BR', 'abbrev', 'EConv'),
(43, 6, 'pt_BR', 'name', 'Editor convidado'),
(44, 7, '', 'nameLocaleKey', 'default.groups.name.copyeditor'),
(45, 7, '', 'abbrevLocaleKey', 'default.groups.abbrev.copyeditor'),
(46, 7, 'en', 'abbrev', 'CE'),
(47, 7, 'en', 'name', 'Copyeditor'),
(48, 7, 'es', 'abbrev', 'CE'),
(49, 7, 'es', 'name', 'Corrector/a de estilo'),
(50, 7, 'pt_BR', 'abbrev', 'ET'),
(51, 7, 'pt_BR', 'name', 'Editor de texto'),
(52, 8, '', 'nameLocaleKey', 'default.groups.name.designer'),
(53, 8, '', 'abbrevLocaleKey', 'default.groups.abbrev.designer'),
(54, 8, 'en', 'abbrev', 'Design'),
(55, 8, 'en', 'name', 'Designer'),
(56, 8, 'es', 'abbrev', 'Diseño'),
(57, 8, 'es', 'name', 'Diseñador/a'),
(58, 8, 'pt_BR', 'abbrev', 'DE'),
(59, 8, 'pt_BR', 'name', 'Designer'),
(60, 9, '', 'nameLocaleKey', 'default.groups.name.funding'),
(61, 9, '', 'abbrevLocaleKey', 'default.groups.abbrev.funding'),
(62, 9, 'en', 'abbrev', 'FC'),
(63, 9, 'en', 'name', 'Funding coordinator'),
(64, 9, 'es', 'abbrev', 'CF'),
(65, 9, 'es', 'name', 'Coordinador/a de financiación'),
(66, 9, 'pt_BR', 'abbrev', 'CF'),
(67, 9, 'pt_BR', 'name', 'Coordenador de Financiamento'),
(68, 10, '', 'nameLocaleKey', 'default.groups.name.indexer'),
(69, 10, '', 'abbrevLocaleKey', 'default.groups.abbrev.indexer'),
(70, 10, 'en', 'abbrev', 'IND'),
(71, 10, 'en', 'name', 'Indexer'),
(72, 10, 'es', 'abbrev', 'DOC'),
(73, 10, 'es', 'name', 'Documentalista'),
(74, 10, 'pt_BR', 'abbrev', 'IND'),
(75, 10, 'pt_BR', 'name', 'Indexador'),
(76, 11, '', 'nameLocaleKey', 'default.groups.name.layoutEditor'),
(77, 11, '', 'abbrevLocaleKey', 'default.groups.abbrev.layoutEditor'),
(78, 11, 'en', 'abbrev', 'LE'),
(79, 11, 'en', 'name', 'Layout Editor'),
(80, 11, 'es', 'abbrev', 'MAQ'),
(81, 11, 'es', 'name', 'Maquetador/a'),
(82, 11, 'pt_BR', 'abbrev', 'EL'),
(83, 11, 'pt_BR', 'name', 'Editor de Layout'),
(84, 12, '', 'nameLocaleKey', 'default.groups.name.marketing'),
(85, 12, '', 'abbrevLocaleKey', 'default.groups.abbrev.marketing'),
(86, 12, 'en', 'abbrev', 'MS'),
(87, 12, 'en', 'name', 'Marketing and sales coordinator'),
(88, 12, 'es', 'abbrev', 'MV'),
(89, 12, 'es', 'name', 'Coordinador/a de marketing y ventas'),
(90, 12, 'pt_BR', 'abbrev', 'CVM'),
(91, 12, 'pt_BR', 'name', 'Coordenador de Vendas e Marketing'),
(92, 13, '', 'nameLocaleKey', 'default.groups.name.proofreader'),
(93, 13, '', 'abbrevLocaleKey', 'default.groups.abbrev.proofreader'),
(94, 13, 'en', 'abbrev', 'PR'),
(95, 13, 'en', 'name', 'Proofreader'),
(96, 13, 'es', 'abbrev', 'CP'),
(97, 13, 'es', 'name', 'Corrector/a de pruebas'),
(98, 13, 'pt_BR', 'abbrev', 'LP'),
(99, 13, 'pt_BR', 'name', 'Leitor de Prova'),
(100, 14, '', 'nameLocaleKey', 'default.groups.name.author'),
(101, 14, '', 'abbrevLocaleKey', 'default.groups.abbrev.author'),
(102, 14, 'en', 'abbrev', 'AU'),
(103, 14, 'en', 'name', 'Author'),
(104, 14, 'es', 'abbrev', 'AU'),
(105, 14, 'es', 'name', 'Autor/a'),
(106, 14, 'pt_BR', 'abbrev', 'AU'),
(107, 14, 'pt_BR', 'name', 'Autor'),
(108, 15, '', 'nameLocaleKey', 'default.groups.name.translator'),
(109, 15, '', 'abbrevLocaleKey', 'default.groups.abbrev.translator'),
(110, 15, 'en', 'abbrev', 'Trans'),
(111, 15, 'en', 'name', 'Translator'),
(112, 15, 'es', 'abbrev', 'Trad'),
(113, 15, 'es', 'name', 'Traductor/a'),
(114, 15, 'pt_BR', 'abbrev', 'TR'),
(115, 15, 'pt_BR', 'name', 'Tradutor'),
(116, 16, '', 'nameLocaleKey', 'default.groups.name.externalReviewer'),
(117, 16, '', 'abbrevLocaleKey', 'default.groups.abbrev.externalReviewer'),
(118, 16, 'en', 'abbrev', 'R'),
(119, 16, 'en', 'name', 'Reviewer'),
(120, 16, 'es', 'abbrev', 'R'),
(121, 16, 'es', 'name', 'Revisor/a'),
(122, 16, 'pt_BR', 'abbrev', 'A'),
(123, 16, 'pt_BR', 'name', 'Avaliador'),
(124, 17, '', 'nameLocaleKey', 'default.groups.name.reader'),
(125, 17, '', 'abbrevLocaleKey', 'default.groups.abbrev.reader'),
(126, 17, 'en', 'abbrev', 'Read'),
(127, 17, 'en', 'name', 'Reader'),
(128, 17, 'es', 'abbrev', 'Lect'),
(129, 17, 'es', 'name', 'Lector/a'),
(130, 17, 'pt_BR', 'abbrev', 'LE'),
(131, 17, 'pt_BR', 'name', 'Leitor'),
(132, 18, '', 'nameLocaleKey', 'default.groups.name.subscriptionManager'),
(133, 18, '', 'abbrevLocaleKey', 'default.groups.abbrev.subscriptionManager'),
(134, 18, 'en', 'abbrev', 'SubM'),
(135, 18, 'en', 'name', 'Subscription Manager'),
(136, 18, 'es', 'abbrev', 'GSus'),
(137, 18, 'es', 'name', 'Gestor/a de suscripción'),
(138, 18, 'pt_BR', 'abbrev', 'GAssin'),
(139, 18, 'pt_BR', 'name', 'Gerente de assinatura');

-- --------------------------------------------------------

--
-- Estrutura para tabela `user_group_stage`
--

CREATE TABLE `user_group_stage` (
  `user_group_stage_id` bigint(20) UNSIGNED NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Which stages of the editorial workflow the user_groups can access.';

--
-- Despejando dados para a tabela `user_group_stage`
--

INSERT INTO `user_group_stage` (`user_group_stage_id`, `context_id`, `user_group_id`, `stage_id`) VALUES
(1, 1, 3, 1),
(2, 1, 3, 3),
(3, 1, 3, 4),
(4, 1, 3, 5),
(5, 1, 4, 4),
(6, 1, 4, 5),
(7, 1, 5, 1),
(8, 1, 5, 3),
(9, 1, 5, 4),
(10, 1, 5, 5),
(11, 1, 6, 1),
(12, 1, 6, 3),
(13, 1, 6, 4),
(14, 1, 6, 5),
(15, 1, 7, 4),
(16, 1, 8, 5),
(17, 1, 9, 1),
(18, 1, 9, 3),
(19, 1, 10, 5),
(20, 1, 11, 5),
(21, 1, 12, 4),
(22, 1, 13, 5),
(23, 1, 14, 1),
(24, 1, 14, 3),
(25, 1, 14, 4),
(26, 1, 14, 5),
(27, 1, 15, 1),
(28, 1, 15, 3),
(29, 1, 15, 4),
(30, 1, 15, 5),
(31, 1, 16, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `user_interests`
--

CREATE TABLE `user_interests` (
  `user_interest_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `controlled_vocab_entry_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Associates users with user interests (which are stored in the controlled vocabulary tables).';

--
-- Despejando dados para a tabela `user_interests`
--

INSERT INTO `user_interests` (`user_interest_id`, `user_id`, `controlled_vocab_entry_id`) VALUES
(1, 5, 88),
(2, 6, 89),
(3, 7, 144);

-- --------------------------------------------------------

--
-- Estrutura para tabela `user_settings`
--

CREATE TABLE `user_settings` (
  `user_setting_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about users, including localized properties like their name and affiliation.';

--
-- Despejando dados para a tabela `user_settings`
--

INSERT INTO `user_settings` (`user_setting_id`, `user_id`, `locale`, `setting_name`, `setting_value`) VALUES
(1, 1, 'pt_BR', 'familyName', ''),
(2, 1, 'pt_BR', 'givenName', 'admin'),
(3, 2, 'pt_BR', 'affiliation', ''),
(4, 2, 'pt_BR', 'biography', ''),
(5, 2, 'pt_BR', 'familyName', ''),
(6, 2, 'pt_BR', 'givenName', 'Gesiele'),
(7, 2, '', 'orcid', ''),
(8, 2, 'pt_BR', 'preferredPublicName', 'Gesiele'),
(9, 2, 'pt_BR', 'signature', ''),
(10, 3, 'pt_BR', 'affiliation', ''),
(11, 3, 'pt_BR', 'biography', ''),
(12, 3, 'pt_BR', 'familyName', ''),
(13, 3, 'pt_BR', 'givenName', 'Bianca'),
(14, 3, '', 'orcid', ''),
(15, 3, 'pt_BR', 'preferredPublicName', 'Bianca'),
(16, 3, 'pt_BR', 'signature', ''),
(17, 1, 'pt_BR', 'affiliation', ''),
(18, 1, 'pt_BR', 'signature', ''),
(19, 1, 'pt_BR', 'biography', ''),
(20, 1, '', 'orcid', ''),
(21, 1, 'pt_BR', 'preferredPublicName', 'Kevin'),
(22, 4, 'pt_BR', 'affiliation', ''),
(23, 4, 'pt_BR', 'biography', ''),
(24, 4, 'pt_BR', 'familyName', ''),
(25, 4, 'pt_BR', 'givenName', 'Teste'),
(26, 4, '', 'orcid', ''),
(27, 4, 'pt_BR', 'preferredPublicName', ''),
(28, 4, 'pt_BR', 'signature', ''),
(29, 5, 'pt_BR', 'affiliation', 'ITEP'),
(30, 5, 'pt_BR', 'familyName', 'da Silva'),
(31, 5, 'pt_BR', 'givenName', 'Gesiele'),
(32, 6, 'pt_BR', 'affiliation', 'UFRN'),
(33, 6, 'pt_BR', 'familyName', 'Praça da Cunha'),
(34, 6, 'pt_BR', 'givenName', 'Bianca Mayara'),
(35, 7, 'pt_BR', 'affiliation', 'ITEP'),
(36, 7, 'pt_BR', 'familyName', 'Borges'),
(37, 7, 'pt_BR', 'givenName', 'Kevin Patrick');

-- --------------------------------------------------------

--
-- Estrutura para tabela `user_user_groups`
--

CREATE TABLE `user_user_groups` (
  `user_user_group_id` bigint(20) UNSIGNED NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Maps users to their assigned user_groups.';

--
-- Despejando dados para a tabela `user_user_groups`
--

INSERT INTO `user_user_groups` (`user_user_group_id`, `user_group_id`, `user_id`) VALUES
(1, 1, 1),
(50, 2, 1),
(51, 3, 1),
(52, 4, 1),
(53, 5, 1),
(54, 6, 1),
(55, 7, 1),
(56, 8, 1),
(57, 9, 1),
(58, 10, 1),
(59, 11, 1),
(60, 12, 1),
(61, 13, 1),
(62, 14, 1),
(3, 14, 2),
(63, 15, 1),
(64, 16, 1),
(4, 16, 3),
(48, 16, 5),
(49, 16, 6),
(67, 16, 7),
(65, 17, 1),
(66, 18, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `versions`
--

CREATE TABLE `versions` (
  `version_id` bigint(20) UNSIGNED NOT NULL,
  `major` int(11) NOT NULL DEFAULT 0 COMMENT 'Major component of version number, e.g. the 2 in OJS 2.3.8-0',
  `minor` int(11) NOT NULL DEFAULT 0 COMMENT 'Minor component of version number, e.g. the 3 in OJS 2.3.8-0',
  `revision` int(11) NOT NULL DEFAULT 0 COMMENT 'Revision component of version number, e.g. the 8 in OJS 2.3.8-0',
  `build` int(11) NOT NULL DEFAULT 0 COMMENT 'Build component of version number, e.g. the 0 in OJS 2.3.8-0',
  `date_installed` datetime NOT NULL,
  `current` smallint(6) NOT NULL DEFAULT 0 COMMENT '1 iff the version entry being described is currently active. This permits the table to store past installation history for forensic purposes.',
  `product_type` varchar(30) DEFAULT NULL COMMENT 'Describes the type of product this row describes, e.g. "plugins.generic" (for a generic plugin) or "core" for the application itself',
  `product` varchar(30) DEFAULT NULL COMMENT 'Uniquely identifies the product this version row describes, e.g. "ojs2" for OJS 2.x, "languageToggle" for the language toggle block plugin, etc.',
  `product_class_name` varchar(80) DEFAULT NULL COMMENT 'Specifies the class name associated with this product, for plugins, or the empty string where not applicable.',
  `lazy_load` smallint(6) NOT NULL DEFAULT 0 COMMENT '1 iff the row describes a lazy-load plugin; 0 otherwise',
  `sitewide` smallint(6) NOT NULL DEFAULT 0 COMMENT '1 iff the row describes a site-wide plugin; 0 otherwise'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Describes the installation and upgrade version history for the application and all installed plugins.';

--
-- Despejando dados para a tabela `versions`
--

INSERT INTO `versions` (`version_id`, `major`, `minor`, `revision`, `build`, `date_installed`, `current`, `product_type`, `product`, `product_class_name`, `lazy_load`, `sitewide`) VALUES
(1, 1, 0, 0, 0, '2025-03-06 16:13:20', 1, 'plugins.metadata', 'dc11', '', 0, 0),
(2, 1, 0, 1, 0, '2025-03-06 16:13:20', 1, 'plugins.blocks', 'browse', 'BrowseBlockPlugin', 1, 0),
(3, 1, 0, 0, 0, '2025-03-06 16:13:20', 1, 'plugins.blocks', 'developedBy', 'DevelopedByBlockPlugin', 1, 0),
(4, 1, 0, 0, 0, '2025-03-06 16:13:20', 1, 'plugins.blocks', 'information', 'InformationBlockPlugin', 1, 0),
(5, 1, 0, 0, 0, '2025-03-06 16:13:20', 1, 'plugins.blocks', 'languageToggle', 'LanguageToggleBlockPlugin', 1, 0),
(6, 1, 0, 0, 0, '2025-03-06 16:13:20', 1, 'plugins.blocks', 'makeSubmission', 'MakeSubmissionBlockPlugin', 1, 0),
(7, 1, 1, 0, 0, '2025-03-06 16:13:20', 1, 'plugins.blocks', 'subscription', 'SubscriptionBlockPlugin', 1, 0),
(8, 1, 0, 0, 0, '2025-03-06 16:13:20', 1, 'plugins.gateways', 'resolver', '', 0, 0),
(9, 1, 3, 0, 0, '2025-03-06 16:13:20', 1, 'plugins.generic', 'acron', 'AcronPlugin', 1, 1),
(10, 1, 0, 0, 0, '2025-03-06 16:13:20', 1, 'plugins.generic', 'announcementFeed', 'AnnouncementFeedPlugin', 1, 0),
(11, 0, 1, 0, 0, '2025-03-06 16:13:20', 1, 'plugins.generic', 'citationStyleLanguage', 'CitationStyleLanguagePlugin', 1, 0),
(12, 3, 0, 0, 0, '2025-03-06 16:13:21', 1, 'plugins.generic', 'crossref', '', 0, 0),
(13, 1, 2, 0, 0, '2025-03-06 16:13:21', 1, 'plugins.generic', 'customBlockManager', 'CustomBlockManagerPlugin', 1, 0),
(14, 2, 0, 0, 0, '2025-03-06 16:13:21', 1, 'plugins.generic', 'datacite', '', 0, 0),
(15, 1, 0, 0, 0, '2025-03-06 16:13:21', 1, 'plugins.generic', 'driver', 'DRIVERPlugin', 1, 0),
(16, 1, 0, 0, 0, '2025-03-06 16:13:21', 1, 'plugins.generic', 'dublinCoreMeta', 'DublinCoreMetaPlugin', 1, 0),
(17, 1, 0, 0, 0, '2025-03-06 16:13:21', 1, 'plugins.generic', 'googleAnalytics', 'GoogleAnalyticsPlugin', 1, 0),
(18, 1, 1, 0, 0, '2025-03-06 16:13:21', 1, 'plugins.generic', 'googleScholar', 'GoogleScholarPlugin', 1, 0),
(19, 1, 0, 0, 0, '2025-03-06 16:13:21', 1, 'plugins.generic', 'htmlArticleGalley', 'HtmlArticleGalleyPlugin', 1, 0),
(20, 1, 0, 1, 0, '2025-03-06 16:13:21', 1, 'plugins.generic', 'lensGalley', 'LensGalleyPlugin', 1, 0),
(21, 1, 3, 4, 8, '2025-03-06 16:13:21', 1, 'plugins.generic', 'orcidProfile', 'OrcidProfilePlugin', 1, 0),
(22, 1, 0, 1, 0, '2025-03-06 16:13:21', 1, 'plugins.generic', 'pdfJsViewer', 'PdfJsViewerPlugin', 1, 0),
(23, 1, 0, 0, 1, '2025-03-06 16:13:21', 1, 'plugins.generic', 'recommendByAuthor', 'RecommendByAuthorPlugin', 1, 1),
(24, 1, 0, 0, 0, '2025-03-06 16:13:21', 1, 'plugins.generic', 'recommendBySimilarity', 'RecommendBySimilarityPlugin', 1, 1),
(25, 1, 2, 0, 0, '2025-03-06 16:13:21', 1, 'plugins.generic', 'staticPages', 'StaticPagesPlugin', 1, 0),
(26, 1, 0, 0, 0, '2025-03-06 16:13:21', 1, 'plugins.generic', 'tinymce', 'TinyMCEPlugin', 1, 0),
(27, 1, 0, 0, 0, '2025-03-06 16:13:21', 1, 'plugins.generic', 'usageEvent', '', 0, 0),
(28, 1, 0, 0, 0, '2025-03-06 16:13:21', 1, 'plugins.generic', 'webFeed', 'WebFeedPlugin', 1, 0),
(29, 1, 1, 0, 0, '2025-03-06 16:13:21', 1, 'plugins.importexport', 'doaj', '', 0, 0),
(30, 1, 0, 0, 0, '2025-03-06 16:13:21', 1, 'plugins.importexport', 'native', '', 0, 0),
(31, 1, 0, 0, 0, '2025-03-06 16:13:21', 1, 'plugins.importexport', 'pubmed', '', 0, 0),
(32, 1, 0, 0, 0, '2025-03-06 16:13:21', 1, 'plugins.importexport', 'users', '', 0, 0),
(33, 1, 0, 0, 0, '2025-03-06 16:13:21', 1, 'plugins.oaiMetadataFormats', 'dc', '', 0, 0),
(34, 1, 0, 0, 0, '2025-03-06 16:13:21', 1, 'plugins.oaiMetadataFormats', 'marc', '', 0, 0),
(35, 1, 0, 0, 0, '2025-03-06 16:13:21', 1, 'plugins.oaiMetadataFormats', 'marcxml', '', 0, 0),
(36, 1, 0, 0, 0, '2025-03-06 16:13:21', 1, 'plugins.oaiMetadataFormats', 'rfc1807', '', 0, 0),
(37, 1, 0, 0, 0, '2025-03-06 16:13:21', 1, 'plugins.paymethod', 'manual', '', 0, 0),
(38, 1, 0, 0, 0, '2025-03-06 16:13:21', 1, 'plugins.paymethod', 'paypal', '', 0, 0),
(39, 1, 0, 0, 0, '2025-03-06 16:13:21', 1, 'plugins.pubIds', 'urn', 'URNPubIdPlugin', 1, 0),
(40, 1, 0, 0, 0, '2025-03-06 16:13:21', 1, 'plugins.reports', 'articles', '', 0, 0),
(41, 1, 1, 0, 0, '2025-03-06 16:13:21', 1, 'plugins.reports', 'counterReport', '', 0, 0),
(42, 2, 0, 1, 0, '2025-03-06 16:13:21', 1, 'plugins.reports', 'reviewReport', '', 0, 0),
(43, 1, 0, 0, 0, '2025-03-06 16:13:21', 1, 'plugins.reports', 'subscriptions', '', 0, 0),
(44, 1, 0, 0, 0, '2025-03-06 16:13:21', 1, 'plugins.themes', 'default', 'DefaultThemePlugin', 1, 0),
(45, 3, 4, 0, 8, '2025-03-06 16:13:05', 1, 'core', 'ojs2', '', 0, 1),
(46, 3, 4, 0, 3, '2025-03-07 08:17:27', 1, 'plugins.themes', 'bootstrap3', 'BootstrapThreeThemePlugin', 1, 0),
(47, 1, 1, 2, 3, '2025-03-07 08:17:55', 1, 'plugins.themes', 'healthSciences', 'HealthSciencesThemePlugin', 1, 0),
(48, 1, 1, 2, 2, '2025-03-07 08:21:32', 1, 'plugins.themes', 'classic', 'ClassicThemePlugin', 1, 0),
(49, 1, 0, 1, 0, '2025-03-07 08:41:52', 1, 'plugins.generic', 'textEditorExtras', 'TextEditorExtrasPlugin', 1, 0),
(50, 0, 0, 0, 6, '2025-03-07 08:44:05', 1, 'plugins.generic', 'reviewReminder', '', 0, 0),
(51, 1, 0, 4, 1, '2025-03-11 11:09:55', 1, 'plugins.generic', 'customHeader', 'CustomHeaderPlugin', 1, 0),
(52, 1, 2, 0, 1, '2025-03-11 11:27:27', 1, 'plugins.generic', 'customLocale', 'CustomLocalePlugin', 1, 0),
(54, 1, 1, 2, 2, '2025-03-18 13:50:41', 1, 'plugins.themes', 'pragma', 'PragmaThemePlugin', 1, 0),
(55, 1, 1, 2, 3, '2025-03-18 13:51:03', 1, 'plugins.themes', 'immersion', 'ImmersionThemePlugin', 1, 0),
(56, 1, 0, 4, 0, '2025-03-18 13:51:33', 1, 'plugins.themes', 'defaultManuscript', 'DefaultManuscriptChildThemePlugin', 1, 0),
(57, 3, 0, 4, 0, '2025-03-18 13:51:52', 1, 'plugins.themes', 'material', 'MaterialThemePlugin', 1, 0),
(58, 2, 0, 4, 0, '2025-03-19 10:44:01', 1, 'plugins.generic', 'backup', 'BackupPlugin', 1, 0),
(59, 3, 4, 0, 1, '2025-03-19 10:46:50', 1, 'plugins.generic', 'allowedUploads', 'AllowedUploadsPlugin', 1, 0),
(60, 1, 0, 7, 3, '2025-03-19 11:11:48', 1, 'plugins.generic', 'jatsTemplate', 'JatsTemplatePlugin', 1, 0),
(61, 1, 2, 0, 0, '2025-03-19 11:13:51', 1, 'plugins.generic', 'sitesearch', 'SitesearchPlugin', 1, 0),
(62, 1, 2, 1, 1, '2025-03-19 11:20:23', 1, 'plugins.generic', 'browseBySection', 'BrowseBySectionPlugin', 1, 0),
(63, 1, 0, 7, 2, '2025-04-09 11:45:12', 1, 'plugins.importexport', 'quickSubmit', '', 0, 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `access_keys`
--
ALTER TABLE `access_keys`
  ADD PRIMARY KEY (`access_key_id`),
  ADD KEY `access_keys_user_id` (`user_id`),
  ADD KEY `access_keys_hash` (`key_hash`,`user_id`,`context`);

--
-- Índices de tabela `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`announcement_id`),
  ADD KEY `announcements_type_id` (`type_id`),
  ADD KEY `announcements_assoc` (`assoc_type`,`assoc_id`);

--
-- Índices de tabela `announcement_settings`
--
ALTER TABLE `announcement_settings`
  ADD PRIMARY KEY (`announcement_setting_id`),
  ADD UNIQUE KEY `announcement_settings_unique` (`announcement_id`,`locale`,`setting_name`),
  ADD KEY `announcement_settings_announcement_id` (`announcement_id`);

--
-- Índices de tabela `announcement_types`
--
ALTER TABLE `announcement_types`
  ADD PRIMARY KEY (`type_id`),
  ADD KEY `announcement_types_context_id` (`context_id`);

--
-- Índices de tabela `announcement_type_settings`
--
ALTER TABLE `announcement_type_settings`
  ADD PRIMARY KEY (`announcement_type_setting_id`),
  ADD UNIQUE KEY `announcement_type_settings_unique` (`type_id`,`locale`,`setting_name`),
  ADD KEY `announcement_type_settings_type_id` (`type_id`);

--
-- Índices de tabela `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_id`),
  ADD KEY `authors_user_group_id` (`user_group_id`),
  ADD KEY `authors_publication_id` (`publication_id`);

--
-- Índices de tabela `author_settings`
--
ALTER TABLE `author_settings`
  ADD PRIMARY KEY (`author_setting_id`),
  ADD UNIQUE KEY `author_settings_unique` (`author_id`,`locale`,`setting_name`),
  ADD KEY `author_settings_author_id` (`author_id`);

--
-- Índices de tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_path` (`context_id`,`path`),
  ADD KEY `category_context_id` (`context_id`),
  ADD KEY `category_context_parent_id` (`context_id`,`parent_id`),
  ADD KEY `category_parent_id` (`parent_id`);

--
-- Índices de tabela `category_settings`
--
ALTER TABLE `category_settings`
  ADD PRIMARY KEY (`category_setting_id`),
  ADD UNIQUE KEY `category_settings_unique` (`category_id`,`locale`,`setting_name`),
  ADD KEY `category_settings_category_id` (`category_id`);

--
-- Índices de tabela `citations`
--
ALTER TABLE `citations`
  ADD PRIMARY KEY (`citation_id`),
  ADD UNIQUE KEY `citations_publication_seq` (`publication_id`,`seq`),
  ADD KEY `citations_publication` (`publication_id`);

--
-- Índices de tabela `citation_settings`
--
ALTER TABLE `citation_settings`
  ADD PRIMARY KEY (`citation_setting_id`),
  ADD UNIQUE KEY `citation_settings_unique` (`citation_id`,`locale`,`setting_name`),
  ADD KEY `citation_settings_citation_id` (`citation_id`);

--
-- Índices de tabela `completed_payments`
--
ALTER TABLE `completed_payments`
  ADD PRIMARY KEY (`completed_payment_id`),
  ADD KEY `completed_payments_context_id` (`context_id`),
  ADD KEY `completed_payments_user_id` (`user_id`);

--
-- Índices de tabela `controlled_vocabs`
--
ALTER TABLE `controlled_vocabs`
  ADD PRIMARY KEY (`controlled_vocab_id`),
  ADD UNIQUE KEY `controlled_vocab_symbolic` (`symbolic`,`assoc_type`,`assoc_id`);

--
-- Índices de tabela `controlled_vocab_entries`
--
ALTER TABLE `controlled_vocab_entries`
  ADD PRIMARY KEY (`controlled_vocab_entry_id`),
  ADD KEY `controlled_vocab_entries_controlled_vocab_id` (`controlled_vocab_id`),
  ADD KEY `controlled_vocab_entries_cv_id` (`controlled_vocab_id`,`seq`);

--
-- Índices de tabela `controlled_vocab_entry_settings`
--
ALTER TABLE `controlled_vocab_entry_settings`
  ADD PRIMARY KEY (`controlled_vocab_entry_setting_id`),
  ADD UNIQUE KEY `c_v_e_s_pkey` (`controlled_vocab_entry_id`,`locale`,`setting_name`),
  ADD KEY `c_v_e_s_entry_id` (`controlled_vocab_entry_id`);

--
-- Índices de tabela `custom_issue_orders`
--
ALTER TABLE `custom_issue_orders`
  ADD PRIMARY KEY (`custom_issue_order_id`),
  ADD UNIQUE KEY `custom_issue_orders_unique` (`issue_id`),
  ADD KEY `custom_issue_orders_issue_id` (`issue_id`),
  ADD KEY `custom_issue_orders_journal_id` (`journal_id`);

--
-- Índices de tabela `custom_section_orders`
--
ALTER TABLE `custom_section_orders`
  ADD PRIMARY KEY (`custom_section_order_id`),
  ADD UNIQUE KEY `custom_section_orders_unique` (`issue_id`,`section_id`),
  ADD KEY `custom_section_orders_issue_id` (`issue_id`),
  ADD KEY `custom_section_orders_section_id` (`section_id`);

--
-- Índices de tabela `data_object_tombstones`
--
ALTER TABLE `data_object_tombstones`
  ADD PRIMARY KEY (`tombstone_id`),
  ADD KEY `data_object_tombstones_data_object_id` (`data_object_id`);

--
-- Índices de tabela `data_object_tombstone_oai_set_objects`
--
ALTER TABLE `data_object_tombstone_oai_set_objects`
  ADD PRIMARY KEY (`object_id`),
  ADD KEY `data_object_tombstone_oai_set_objects_tombstone_id` (`tombstone_id`);

--
-- Índices de tabela `data_object_tombstone_settings`
--
ALTER TABLE `data_object_tombstone_settings`
  ADD PRIMARY KEY (`tombstone_setting_id`),
  ADD UNIQUE KEY `data_object_tombstone_settings_unique` (`tombstone_id`,`locale`,`setting_name`),
  ADD KEY `data_object_tombstone_settings_tombstone_id` (`tombstone_id`);

--
-- Índices de tabela `dois`
--
ALTER TABLE `dois`
  ADD PRIMARY KEY (`doi_id`),
  ADD KEY `dois_context_id` (`context_id`);

--
-- Índices de tabela `doi_settings`
--
ALTER TABLE `doi_settings`
  ADD PRIMARY KEY (`doi_setting_id`),
  ADD UNIQUE KEY `doi_settings_unique` (`doi_id`,`locale`,`setting_name`),
  ADD KEY `doi_settings_doi_id` (`doi_id`);

--
-- Índices de tabela `edit_decisions`
--
ALTER TABLE `edit_decisions`
  ADD PRIMARY KEY (`edit_decision_id`),
  ADD KEY `edit_decisions_submission_id` (`submission_id`),
  ADD KEY `edit_decisions_editor_id` (`editor_id`),
  ADD KEY `edit_decisions_review_round_id` (`review_round_id`);

--
-- Índices de tabela `email_log`
--
ALTER TABLE `email_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `email_log_assoc` (`assoc_type`,`assoc_id`);

--
-- Índices de tabela `email_log_users`
--
ALTER TABLE `email_log_users`
  ADD PRIMARY KEY (`email_log_user_id`),
  ADD UNIQUE KEY `email_log_user_id` (`email_log_id`,`user_id`),
  ADD KEY `email_log_users_email_log_id` (`email_log_id`),
  ADD KEY `email_log_users_user_id` (`user_id`);

--
-- Índices de tabela `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`email_id`),
  ADD UNIQUE KEY `email_templates_email_key` (`email_key`,`context_id`),
  ADD KEY `email_templates_context_id` (`context_id`),
  ADD KEY `email_templates_alternate_to` (`alternate_to`);

--
-- Índices de tabela `email_templates_default_data`
--
ALTER TABLE `email_templates_default_data`
  ADD PRIMARY KEY (`email_templates_default_data_id`),
  ADD UNIQUE KEY `email_templates_default_data_unique` (`email_key`,`locale`);

--
-- Índices de tabela `email_templates_settings`
--
ALTER TABLE `email_templates_settings`
  ADD PRIMARY KEY (`email_template_setting_id`),
  ADD UNIQUE KEY `email_templates_settings_unique` (`email_id`,`locale`,`setting_name`),
  ADD KEY `email_templates_settings_email_id` (`email_id`);

--
-- Índices de tabela `event_log`
--
ALTER TABLE `event_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `event_log_user_id` (`user_id`),
  ADD KEY `event_log_assoc` (`assoc_type`,`assoc_id`);

--
-- Índices de tabela `event_log_settings`
--
ALTER TABLE `event_log_settings`
  ADD PRIMARY KEY (`event_log_setting_id`),
  ADD UNIQUE KEY `event_log_settings_unique` (`log_id`,`setting_name`,`locale`),
  ADD KEY `event_log_settings_log_id` (`log_id`),
  ADD KEY `event_log_settings_name_value` (`setting_name`(50),`setting_value`(150));

--
-- Índices de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`file_id`);

--
-- Índices de tabela `filters`
--
ALTER TABLE `filters`
  ADD PRIMARY KEY (`filter_id`),
  ADD KEY `filters_filter_group_id` (`filter_group_id`);

--
-- Índices de tabela `filter_groups`
--
ALTER TABLE `filter_groups`
  ADD PRIMARY KEY (`filter_group_id`),
  ADD UNIQUE KEY `filter_groups_symbolic` (`symbolic`);

--
-- Índices de tabela `filter_settings`
--
ALTER TABLE `filter_settings`
  ADD PRIMARY KEY (`filter_setting_id`),
  ADD UNIQUE KEY `filter_settings_unique` (`filter_id`,`locale`,`setting_name`),
  ADD KEY `filter_settings_id` (`filter_id`);

--
-- Índices de tabela `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`genre_id`),
  ADD KEY `genres_context_id` (`context_id`);

--
-- Índices de tabela `genre_settings`
--
ALTER TABLE `genre_settings`
  ADD PRIMARY KEY (`genre_setting_id`),
  ADD UNIQUE KEY `genre_settings_unique` (`genre_id`,`locale`,`setting_name`),
  ADD KEY `genre_settings_genre_id` (`genre_id`);

--
-- Índices de tabela `institutional_subscriptions`
--
ALTER TABLE `institutional_subscriptions`
  ADD PRIMARY KEY (`institutional_subscription_id`),
  ADD KEY `institutional_subscriptions_subscription_id` (`subscription_id`),
  ADD KEY `institutional_subscriptions_institution_id` (`institution_id`),
  ADD KEY `institutional_subscriptions_domain` (`domain`);

--
-- Índices de tabela `institutions`
--
ALTER TABLE `institutions`
  ADD PRIMARY KEY (`institution_id`),
  ADD KEY `institutions_context_id` (`context_id`);

--
-- Índices de tabela `institution_ip`
--
ALTER TABLE `institution_ip`
  ADD PRIMARY KEY (`institution_ip_id`),
  ADD KEY `institution_ip_institution_id` (`institution_id`),
  ADD KEY `institution_ip_start` (`ip_start`),
  ADD KEY `institution_ip_end` (`ip_end`);

--
-- Índices de tabela `institution_settings`
--
ALTER TABLE `institution_settings`
  ADD PRIMARY KEY (`institution_setting_id`),
  ADD UNIQUE KEY `institution_settings_unique` (`institution_id`,`locale`,`setting_name`),
  ADD KEY `institution_settings_institution_id` (`institution_id`);

--
-- Índices de tabela `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`issue_id`),
  ADD KEY `issues_journal_id` (`journal_id`),
  ADD KEY `issues_doi_id` (`doi_id`),
  ADD KEY `issues_url_path` (`url_path`);

--
-- Índices de tabela `issue_files`
--
ALTER TABLE `issue_files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `issue_files_issue_id` (`issue_id`);

--
-- Índices de tabela `issue_galleys`
--
ALTER TABLE `issue_galleys`
  ADD PRIMARY KEY (`galley_id`),
  ADD KEY `issue_galleys_issue_id` (`issue_id`),
  ADD KEY `issue_galleys_file_id` (`file_id`),
  ADD KEY `issue_galleys_url_path` (`url_path`);

--
-- Índices de tabela `issue_galley_settings`
--
ALTER TABLE `issue_galley_settings`
  ADD PRIMARY KEY (`issue_galley_setting_id`),
  ADD UNIQUE KEY `issue_galley_settings_unique` (`galley_id`,`locale`,`setting_name`),
  ADD KEY `issue_galley_settings_galley_id` (`galley_id`);

--
-- Índices de tabela `issue_settings`
--
ALTER TABLE `issue_settings`
  ADD PRIMARY KEY (`issue_setting_id`),
  ADD UNIQUE KEY `issue_settings_unique` (`issue_id`,`locale`,`setting_name`),
  ADD KEY `issue_settings_issue_id` (`issue_id`),
  ADD KEY `issue_settings_name_value` (`setting_name`(50),`setting_value`(150));

--
-- Índices de tabela `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- Índices de tabela `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `journals`
--
ALTER TABLE `journals`
  ADD PRIMARY KEY (`journal_id`),
  ADD UNIQUE KEY `journals_path` (`path`),
  ADD KEY `journals_issue_id` (`current_issue_id`);

--
-- Índices de tabela `journal_settings`
--
ALTER TABLE `journal_settings`
  ADD PRIMARY KEY (`journal_setting_id`),
  ADD UNIQUE KEY `journal_settings_unique` (`journal_id`,`locale`,`setting_name`),
  ADD KEY `journal_settings_journal_id` (`journal_id`);

--
-- Índices de tabela `library_files`
--
ALTER TABLE `library_files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `library_files_context_id` (`context_id`),
  ADD KEY `library_files_submission_id` (`submission_id`);

--
-- Índices de tabela `library_file_settings`
--
ALTER TABLE `library_file_settings`
  ADD PRIMARY KEY (`library_file_setting_id`),
  ADD UNIQUE KEY `library_file_settings_unique` (`file_id`,`locale`,`setting_name`),
  ADD KEY `library_file_settings_file_id` (`file_id`);

--
-- Índices de tabela `metrics_context`
--
ALTER TABLE `metrics_context`
  ADD PRIMARY KEY (`metrics_context_id`),
  ADD KEY `metrics_context_load_id` (`load_id`),
  ADD KEY `metrics_context_context_id` (`context_id`);

--
-- Índices de tabela `metrics_counter_submission_daily`
--
ALTER TABLE `metrics_counter_submission_daily`
  ADD PRIMARY KEY (`metrics_counter_submission_daily_id`),
  ADD UNIQUE KEY `msd_uc_load_id_context_id_submission_id_date` (`load_id`,`context_id`,`submission_id`,`date`),
  ADD KEY `msd_load_id` (`load_id`),
  ADD KEY `metrics_counter_submission_daily_context_id` (`context_id`),
  ADD KEY `metrics_counter_submission_daily_submission_id` (`submission_id`),
  ADD KEY `msd_context_id_submission_id` (`context_id`,`submission_id`);

--
-- Índices de tabela `metrics_counter_submission_institution_daily`
--
ALTER TABLE `metrics_counter_submission_institution_daily`
  ADD PRIMARY KEY (`metrics_counter_submission_institution_daily_id`),
  ADD UNIQUE KEY `msid_uc_load_id_context_id_submission_id_institution_id_date` (`load_id`,`context_id`,`submission_id`,`institution_id`,`date`),
  ADD KEY `msid_load_id` (`load_id`),
  ADD KEY `metrics_counter_submission_institution_daily_context_id` (`context_id`),
  ADD KEY `metrics_counter_submission_institution_daily_submission_id` (`submission_id`),
  ADD KEY `metrics_counter_submission_institution_daily_institution_id` (`institution_id`),
  ADD KEY `msid_context_id_submission_id` (`context_id`,`submission_id`);

--
-- Índices de tabela `metrics_counter_submission_institution_monthly`
--
ALTER TABLE `metrics_counter_submission_institution_monthly`
  ADD PRIMARY KEY (`metrics_counter_submission_institution_monthly_id`),
  ADD UNIQUE KEY `msim_uc_context_id_submission_id_institution_id_month` (`context_id`,`submission_id`,`institution_id`,`month`),
  ADD KEY `metrics_counter_submission_institution_monthly_context_id` (`context_id`),
  ADD KEY `metrics_counter_submission_institution_monthly_submission_id` (`submission_id`),
  ADD KEY `metrics_counter_submission_institution_monthly_institution_id` (`institution_id`),
  ADD KEY `msim_context_id_submission_id` (`context_id`,`submission_id`);

--
-- Índices de tabela `metrics_counter_submission_monthly`
--
ALTER TABLE `metrics_counter_submission_monthly`
  ADD PRIMARY KEY (`metrics_counter_submission_monthly_id`),
  ADD UNIQUE KEY `msm_uc_context_id_submission_id_month` (`context_id`,`submission_id`,`month`),
  ADD KEY `metrics_counter_submission_monthly_context_id` (`context_id`),
  ADD KEY `metrics_counter_submission_monthly_submission_id` (`submission_id`),
  ADD KEY `msm_context_id_submission_id` (`context_id`,`submission_id`);

--
-- Índices de tabela `metrics_issue`
--
ALTER TABLE `metrics_issue`
  ADD PRIMARY KEY (`metrics_issue_id`),
  ADD KEY `metrics_issue_load_id` (`load_id`),
  ADD KEY `metrics_issue_context_id` (`context_id`),
  ADD KEY `metrics_issue_issue_id` (`issue_id`),
  ADD KEY `metrics_issue_issue_galley_id` (`issue_galley_id`),
  ADD KEY `metrics_issue_context_id_issue_id` (`context_id`,`issue_id`);

--
-- Índices de tabela `metrics_submission`
--
ALTER TABLE `metrics_submission`
  ADD PRIMARY KEY (`metrics_submission_id`),
  ADD KEY `ms_load_id` (`load_id`),
  ADD KEY `metrics_submission_context_id` (`context_id`),
  ADD KEY `metrics_submission_submission_id` (`submission_id`),
  ADD KEY `metrics_submission_representation_id` (`representation_id`),
  ADD KEY `metrics_submission_submission_file_id` (`submission_file_id`),
  ADD KEY `ms_context_id_submission_id_assoc_type_file_type` (`context_id`,`submission_id`,`assoc_type`,`file_type`);

--
-- Índices de tabela `metrics_submission_geo_daily`
--
ALTER TABLE `metrics_submission_geo_daily`
  ADD PRIMARY KEY (`metrics_submission_geo_daily_id`),
  ADD UNIQUE KEY `msgd_uc_load_context_submission_c_r_c_date` (`load_id`,`context_id`,`submission_id`,`country`,`region`,`city`(80),`date`),
  ADD KEY `msgd_load_id` (`load_id`),
  ADD KEY `metrics_submission_geo_daily_context_id` (`context_id`),
  ADD KEY `metrics_submission_geo_daily_submission_id` (`submission_id`),
  ADD KEY `msgd_context_id_submission_id` (`context_id`,`submission_id`);

--
-- Índices de tabela `metrics_submission_geo_monthly`
--
ALTER TABLE `metrics_submission_geo_monthly`
  ADD PRIMARY KEY (`metrics_submission_geo_monthly_id`),
  ADD UNIQUE KEY `msgm_uc_context_submission_c_r_c_month` (`context_id`,`submission_id`,`country`,`region`,`city`(80),`month`),
  ADD KEY `metrics_submission_geo_monthly_context_id` (`context_id`),
  ADD KEY `metrics_submission_geo_monthly_submission_id` (`submission_id`),
  ADD KEY `msgm_context_id_submission_id` (`context_id`,`submission_id`);

--
-- Índices de tabela `navigation_menus`
--
ALTER TABLE `navigation_menus`
  ADD PRIMARY KEY (`navigation_menu_id`);

--
-- Índices de tabela `navigation_menu_items`
--
ALTER TABLE `navigation_menu_items`
  ADD PRIMARY KEY (`navigation_menu_item_id`);

--
-- Índices de tabela `navigation_menu_item_assignments`
--
ALTER TABLE `navigation_menu_item_assignments`
  ADD PRIMARY KEY (`navigation_menu_item_assignment_id`),
  ADD KEY `navigation_menu_item_assignments_navigation_menu_id` (`navigation_menu_id`),
  ADD KEY `navigation_menu_item_assignments_navigation_menu_item_id` (`navigation_menu_item_id`);

--
-- Índices de tabela `navigation_menu_item_assignment_settings`
--
ALTER TABLE `navigation_menu_item_assignment_settings`
  ADD PRIMARY KEY (`navigation_menu_item_assignment_setting_id`),
  ADD UNIQUE KEY `navigation_menu_item_assignment_settings_unique` (`navigation_menu_item_assignment_id`,`locale`,`setting_name`),
  ADD KEY `navigation_menu_item_assignment_settings_n_m_i_a_id` (`navigation_menu_item_assignment_id`);

--
-- Índices de tabela `navigation_menu_item_settings`
--
ALTER TABLE `navigation_menu_item_settings`
  ADD PRIMARY KEY (`navigation_menu_item_setting_id`),
  ADD UNIQUE KEY `navigation_menu_item_settings_unique` (`navigation_menu_item_id`,`locale`,`setting_name`),
  ADD KEY `navigation_menu_item_settings_navigation_menu_item_id` (`navigation_menu_item_id`);

--
-- Índices de tabela `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`note_id`),
  ADD KEY `notes_user_id` (`user_id`),
  ADD KEY `notes_assoc` (`assoc_type`,`assoc_id`);

--
-- Índices de tabela `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `notifications_context_id` (`context_id`),
  ADD KEY `notifications_user_id` (`user_id`),
  ADD KEY `notifications_context_id_user_id` (`context_id`,`user_id`,`level`),
  ADD KEY `notifications_context_id_level` (`context_id`,`level`),
  ADD KEY `notifications_assoc` (`assoc_type`,`assoc_id`),
  ADD KEY `notifications_user_id_level` (`user_id`,`level`);

--
-- Índices de tabela `notification_settings`
--
ALTER TABLE `notification_settings`
  ADD PRIMARY KEY (`notification_setting_id`),
  ADD UNIQUE KEY `notification_settings_unique` (`notification_id`,`locale`,`setting_name`),
  ADD KEY `notification_settings_notification_id` (`notification_id`);

--
-- Índices de tabela `notification_subscription_settings`
--
ALTER TABLE `notification_subscription_settings`
  ADD PRIMARY KEY (`setting_id`),
  ADD KEY `notification_subscription_settings_user_id` (`user_id`),
  ADD KEY `notification_subscription_settings_context` (`context`);

--
-- Índices de tabela `oai_resumption_tokens`
--
ALTER TABLE `oai_resumption_tokens`
  ADD PRIMARY KEY (`oai_resumption_token_id`),
  ADD UNIQUE KEY `oai_resumption_tokens_unique` (`token`);

--
-- Índices de tabela `plugin_settings`
--
ALTER TABLE `plugin_settings`
  ADD PRIMARY KEY (`plugin_setting_id`),
  ADD UNIQUE KEY `plugin_settings_unique` (`plugin_name`,`context_id`,`setting_name`),
  ADD KEY `plugin_settings_plugin_name` (`plugin_name`);

--
-- Índices de tabela `publications`
--
ALTER TABLE `publications`
  ADD PRIMARY KEY (`publication_id`),
  ADD KEY `publications_primary_contact_id` (`primary_contact_id`),
  ADD KEY `publications_section_id` (`section_id`),
  ADD KEY `publications_submission_id` (`submission_id`),
  ADD KEY `publications_doi_id` (`doi_id`),
  ADD KEY `publications_url_path` (`url_path`);

--
-- Índices de tabela `publication_categories`
--
ALTER TABLE `publication_categories`
  ADD PRIMARY KEY (`publication_category_id`),
  ADD UNIQUE KEY `publication_categories_id` (`publication_id`,`category_id`),
  ADD KEY `publication_categories_publication_id` (`publication_id`),
  ADD KEY `publication_categories_category_id` (`category_id`);

--
-- Índices de tabela `publication_galleys`
--
ALTER TABLE `publication_galleys`
  ADD PRIMARY KEY (`galley_id`),
  ADD KEY `publication_galleys_publication_id` (`publication_id`),
  ADD KEY `publication_galleys_submission_file_id` (`submission_file_id`),
  ADD KEY `publication_galleys_doi_id` (`doi_id`),
  ADD KEY `publication_galleys_url_path` (`url_path`);

--
-- Índices de tabela `publication_galley_settings`
--
ALTER TABLE `publication_galley_settings`
  ADD PRIMARY KEY (`publication_galley_setting_id`),
  ADD UNIQUE KEY `publication_galley_settings_unique` (`galley_id`,`locale`,`setting_name`),
  ADD KEY `publication_galley_settings_galley_id` (`galley_id`),
  ADD KEY `publication_galley_settings_name_value` (`setting_name`(50),`setting_value`(150));

--
-- Índices de tabela `publication_settings`
--
ALTER TABLE `publication_settings`
  ADD PRIMARY KEY (`publication_setting_id`),
  ADD UNIQUE KEY `publication_settings_unique` (`publication_id`,`locale`,`setting_name`),
  ADD KEY `publication_settings_name_value` (`setting_name`(50),`setting_value`(150)),
  ADD KEY `publication_settings_publication_id` (`publication_id`);

--
-- Índices de tabela `queries`
--
ALTER TABLE `queries`
  ADD PRIMARY KEY (`query_id`),
  ADD KEY `queries_assoc_id` (`assoc_type`,`assoc_id`);

--
-- Índices de tabela `query_participants`
--
ALTER TABLE `query_participants`
  ADD PRIMARY KEY (`query_participant_id`),
  ADD UNIQUE KEY `query_participants_unique` (`query_id`,`user_id`),
  ADD KEY `query_participants_query_id` (`query_id`),
  ADD KEY `query_participants_user_id` (`user_id`);

--
-- Índices de tabela `queued_payments`
--
ALTER TABLE `queued_payments`
  ADD PRIMARY KEY (`queued_payment_id`);

--
-- Índices de tabela `review_assignments`
--
ALTER TABLE `review_assignments`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `review_assignments_submission_id` (`submission_id`),
  ADD KEY `review_assignments_reviewer_id` (`reviewer_id`),
  ADD KEY `review_assignment_reviewer_round` (`review_round_id`,`reviewer_id`),
  ADD KEY `review_assignments_form_id` (`review_form_id`),
  ADD KEY `review_assignments_reviewer_review` (`reviewer_id`,`review_id`);

--
-- Índices de tabela `review_files`
--
ALTER TABLE `review_files`
  ADD PRIMARY KEY (`review_file_id`),
  ADD UNIQUE KEY `review_files_unique` (`review_id`,`submission_file_id`),
  ADD KEY `review_files_review_id` (`review_id`),
  ADD KEY `review_files_submission_file_id` (`submission_file_id`);

--
-- Índices de tabela `review_forms`
--
ALTER TABLE `review_forms`
  ADD PRIMARY KEY (`review_form_id`);

--
-- Índices de tabela `review_form_elements`
--
ALTER TABLE `review_form_elements`
  ADD PRIMARY KEY (`review_form_element_id`),
  ADD KEY `review_form_elements_review_form_id` (`review_form_id`);

--
-- Índices de tabela `review_form_element_settings`
--
ALTER TABLE `review_form_element_settings`
  ADD PRIMARY KEY (`review_form_element_setting_id`),
  ADD UNIQUE KEY `review_form_element_settings_unique` (`review_form_element_id`,`locale`,`setting_name`),
  ADD KEY `review_form_element_settings_review_form_element_id` (`review_form_element_id`);

--
-- Índices de tabela `review_form_responses`
--
ALTER TABLE `review_form_responses`
  ADD PRIMARY KEY (`review_form_response_id`),
  ADD KEY `review_form_responses_review_form_element_id` (`review_form_element_id`),
  ADD KEY `review_form_responses_review_id` (`review_id`),
  ADD KEY `review_form_responses_unique` (`review_form_element_id`,`review_id`);

--
-- Índices de tabela `review_form_settings`
--
ALTER TABLE `review_form_settings`
  ADD PRIMARY KEY (`review_form_setting_id`),
  ADD UNIQUE KEY `review_form_settings_unique` (`review_form_id`,`locale`,`setting_name`),
  ADD KEY `review_form_settings_review_form_id` (`review_form_id`);

--
-- Índices de tabela `review_rounds`
--
ALTER TABLE `review_rounds`
  ADD PRIMARY KEY (`review_round_id`),
  ADD UNIQUE KEY `review_rounds_submission_id_stage_id_round_pkey` (`submission_id`,`stage_id`,`round`),
  ADD KEY `review_rounds_submission_id` (`submission_id`);

--
-- Índices de tabela `review_round_files`
--
ALTER TABLE `review_round_files`
  ADD PRIMARY KEY (`review_round_file_id`),
  ADD UNIQUE KEY `review_round_files_unique` (`submission_id`,`review_round_id`,`submission_file_id`),
  ADD KEY `review_round_files_submission_id` (`submission_id`),
  ADD KEY `review_round_files_review_round_id` (`review_round_id`),
  ADD KEY `review_round_files_submission_file_id` (`submission_file_id`);

--
-- Índices de tabela `scheduled_tasks`
--
ALTER TABLE `scheduled_tasks`
  ADD PRIMARY KEY (`scheduled_task_id`),
  ADD UNIQUE KEY `scheduled_tasks_unique` (`class_name`);

--
-- Índices de tabela `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`section_id`),
  ADD KEY `sections_journal_id` (`journal_id`),
  ADD KEY `sections_review_form_id` (`review_form_id`);

--
-- Índices de tabela `section_settings`
--
ALTER TABLE `section_settings`
  ADD PRIMARY KEY (`section_setting_id`),
  ADD UNIQUE KEY `section_settings_unique` (`section_id`,`locale`,`setting_name`),
  ADD KEY `section_settings_section_id` (`section_id`);

--
-- Índices de tabela `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_pkey` (`session_id`),
  ADD KEY `sessions_user_id` (`user_id`);

--
-- Índices de tabela `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`site_id`);

--
-- Índices de tabela `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`site_setting_id`),
  ADD UNIQUE KEY `site_settings_unique` (`setting_name`,`locale`);

--
-- Índices de tabela `stage_assignments`
--
ALTER TABLE `stage_assignments`
  ADD PRIMARY KEY (`stage_assignment_id`),
  ADD UNIQUE KEY `stage_assignment` (`submission_id`,`user_group_id`,`user_id`),
  ADD KEY `stage_assignments_user_group_id` (`user_group_id`),
  ADD KEY `stage_assignments_user_id` (`user_id`),
  ADD KEY `stage_assignments_submission_id` (`submission_id`);

--
-- Índices de tabela `static_pages`
--
ALTER TABLE `static_pages`
  ADD PRIMARY KEY (`static_page_id`),
  ADD KEY `static_pages_context_id` (`context_id`);

--
-- Índices de tabela `static_page_settings`
--
ALTER TABLE `static_page_settings`
  ADD PRIMARY KEY (`static_page_setting_id`),
  ADD KEY `static_page_settings_static_page_id` (`static_page_id`);

--
-- Índices de tabela `subeditor_submission_group`
--
ALTER TABLE `subeditor_submission_group`
  ADD PRIMARY KEY (`subeditor_submission_group_id`),
  ADD UNIQUE KEY `section_editors_unique` (`context_id`,`assoc_id`,`assoc_type`,`user_id`,`user_group_id`),
  ADD KEY `subeditor_submission_group_context_id` (`context_id`),
  ADD KEY `subeditor_submission_group_user_id` (`user_id`),
  ADD KEY `subeditor_submission_group_user_group_id` (`user_group_id`),
  ADD KEY `subeditor_submission_group_assoc_id` (`assoc_id`,`assoc_type`);

--
-- Índices de tabela `submissions`
--
ALTER TABLE `submissions`
  ADD PRIMARY KEY (`submission_id`),
  ADD KEY `submissions_context_id` (`context_id`),
  ADD KEY `submissions_publication_id` (`current_publication_id`);

--
-- Índices de tabela `submission_comments`
--
ALTER TABLE `submission_comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `submission_comments_submission_id` (`submission_id`),
  ADD KEY `submission_comments_author_id` (`author_id`);

--
-- Índices de tabela `submission_files`
--
ALTER TABLE `submission_files`
  ADD PRIMARY KEY (`submission_file_id`),
  ADD KEY `submission_files_submission_id` (`submission_id`),
  ADD KEY `submission_files_file_id` (`file_id`),
  ADD KEY `submission_files_genre_id` (`genre_id`),
  ADD KEY `submission_files_uploader_user_id` (`uploader_user_id`),
  ADD KEY `submission_files_stage_assoc` (`file_stage`,`assoc_type`,`assoc_id`),
  ADD KEY `submission_files_source_submission_file_id` (`source_submission_file_id`);

--
-- Índices de tabela `submission_file_revisions`
--
ALTER TABLE `submission_file_revisions`
  ADD PRIMARY KEY (`revision_id`),
  ADD KEY `submission_file_revisions_submission_file_id` (`submission_file_id`),
  ADD KEY `submission_file_revisions_file_id` (`file_id`);

--
-- Índices de tabela `submission_file_settings`
--
ALTER TABLE `submission_file_settings`
  ADD PRIMARY KEY (`submission_file_setting_id`),
  ADD UNIQUE KEY `submission_file_settings_unique` (`submission_file_id`,`locale`,`setting_name`),
  ADD KEY `submission_file_settings_submission_file_id` (`submission_file_id`);

--
-- Índices de tabela `submission_search_keyword_list`
--
ALTER TABLE `submission_search_keyword_list`
  ADD PRIMARY KEY (`keyword_id`),
  ADD UNIQUE KEY `submission_search_keyword_text` (`keyword_text`);

--
-- Índices de tabela `submission_search_objects`
--
ALTER TABLE `submission_search_objects`
  ADD PRIMARY KEY (`object_id`),
  ADD KEY `submission_search_objects_submission_id` (`submission_id`);

--
-- Índices de tabela `submission_search_object_keywords`
--
ALTER TABLE `submission_search_object_keywords`
  ADD PRIMARY KEY (`submission_search_object_keyword_id`),
  ADD UNIQUE KEY `submission_search_object_keywords_unique` (`object_id`,`pos`),
  ADD KEY `submission_search_object_keywords_object_id` (`object_id`),
  ADD KEY `submission_search_object_keywords_keyword_id` (`keyword_id`);

--
-- Índices de tabela `submission_settings`
--
ALTER TABLE `submission_settings`
  ADD PRIMARY KEY (`submission_setting_id`),
  ADD UNIQUE KEY `submission_settings_unique` (`submission_id`,`locale`,`setting_name`),
  ADD KEY `submission_settings_submission_id` (`submission_id`);

--
-- Índices de tabela `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`subscription_id`),
  ADD KEY `subscriptions_journal_id` (`journal_id`),
  ADD KEY `subscriptions_user_id` (`user_id`),
  ADD KEY `subscriptions_type_id` (`type_id`);

--
-- Índices de tabela `subscription_types`
--
ALTER TABLE `subscription_types`
  ADD PRIMARY KEY (`type_id`),
  ADD KEY `subscription_types_journal_id` (`journal_id`);

--
-- Índices de tabela `subscription_type_settings`
--
ALTER TABLE `subscription_type_settings`
  ADD PRIMARY KEY (`subscription_type_setting_id`),
  ADD UNIQUE KEY `subscription_type_settings_unique` (`type_id`,`locale`,`setting_name`),
  ADD KEY `subscription_type_settings_type_id` (`type_id`);

--
-- Índices de tabela `temporary_files`
--
ALTER TABLE `temporary_files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `temporary_files_user_id` (`user_id`);

--
-- Índices de tabela `usage_stats_institution_temporary_records`
--
ALTER TABLE `usage_stats_institution_temporary_records`
  ADD PRIMARY KEY (`usage_stats_temp_institution_id`),
  ADD UNIQUE KEY `usitr_load_id_line_number_institution_id` (`load_id`,`line_number`,`institution_id`),
  ADD KEY `usi_institution_id` (`institution_id`);

--
-- Índices de tabela `usage_stats_total_temporary_records`
--
ALTER TABLE `usage_stats_total_temporary_records`
  ADD PRIMARY KEY (`usage_stats_temp_total_id`),
  ADD KEY `usage_stats_total_temporary_records_issue_id` (`issue_id`),
  ADD KEY `usage_stats_total_temporary_records_issue_galley_id` (`issue_galley_id`),
  ADD KEY `usage_stats_total_temporary_records_context_id` (`context_id`),
  ADD KEY `usage_stats_total_temporary_records_submission_id` (`submission_id`),
  ADD KEY `usage_stats_total_temporary_records_representation_id` (`representation_id`),
  ADD KEY `usage_stats_total_temporary_records_submission_file_id` (`submission_file_id`),
  ADD KEY `ust_load_id_context_id_ip` (`load_id`,`context_id`,`ip`);

--
-- Índices de tabela `usage_stats_unique_item_investigations_temporary_records`
--
ALTER TABLE `usage_stats_unique_item_investigations_temporary_records`
  ADD PRIMARY KEY (`usage_stats_temp_unique_item_id`),
  ADD KEY `usii_context_id` (`context_id`),
  ADD KEY `usii_submission_id` (`submission_id`),
  ADD KEY `usii_representation_id` (`representation_id`),
  ADD KEY `usii_submission_file_id` (`submission_file_id`),
  ADD KEY `usii_load_id_context_id_ip` (`load_id`,`context_id`,`ip`);

--
-- Índices de tabela `usage_stats_unique_item_requests_temporary_records`
--
ALTER TABLE `usage_stats_unique_item_requests_temporary_records`
  ADD PRIMARY KEY (`usage_stats_temp_item_id`),
  ADD KEY `usir_context_id` (`context_id`),
  ADD KEY `usir_submission_id` (`submission_id`),
  ADD KEY `usir_representation_id` (`representation_id`),
  ADD KEY `usir_submission_file_id` (`submission_file_id`),
  ADD KEY `usir_load_id_context_id_ip` (`load_id`,`context_id`,`ip`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `users_username` (`username`),
  ADD UNIQUE KEY `users_email` (`email`);

--
-- Índices de tabela `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`user_group_id`),
  ADD KEY `user_groups_user_group_id` (`user_group_id`),
  ADD KEY `user_groups_context_id` (`context_id`),
  ADD KEY `user_groups_role_id` (`role_id`);

--
-- Índices de tabela `user_group_settings`
--
ALTER TABLE `user_group_settings`
  ADD PRIMARY KEY (`user_group_setting_id`),
  ADD UNIQUE KEY `user_group_settings_unique` (`user_group_id`,`locale`,`setting_name`),
  ADD KEY `user_group_settings_user_group_id` (`user_group_id`);

--
-- Índices de tabela `user_group_stage`
--
ALTER TABLE `user_group_stage`
  ADD PRIMARY KEY (`user_group_stage_id`),
  ADD UNIQUE KEY `user_group_stage_unique` (`context_id`,`user_group_id`,`stage_id`),
  ADD KEY `user_group_stage_context_id` (`context_id`),
  ADD KEY `user_group_stage_user_group_id` (`user_group_id`),
  ADD KEY `user_group_stage_stage_id` (`stage_id`);

--
-- Índices de tabela `user_interests`
--
ALTER TABLE `user_interests`
  ADD PRIMARY KEY (`user_interest_id`),
  ADD UNIQUE KEY `u_e_pkey` (`user_id`,`controlled_vocab_entry_id`),
  ADD KEY `user_interests_user_id` (`user_id`),
  ADD KEY `user_interests_controlled_vocab_entry_id` (`controlled_vocab_entry_id`);

--
-- Índices de tabela `user_settings`
--
ALTER TABLE `user_settings`
  ADD PRIMARY KEY (`user_setting_id`),
  ADD UNIQUE KEY `user_settings_unique` (`user_id`,`locale`,`setting_name`),
  ADD KEY `user_settings_user_id` (`user_id`),
  ADD KEY `user_settings_locale_setting_name_index` (`setting_name`,`locale`);

--
-- Índices de tabela `user_user_groups`
--
ALTER TABLE `user_user_groups`
  ADD PRIMARY KEY (`user_user_group_id`),
  ADD UNIQUE KEY `user_user_groups_unique` (`user_group_id`,`user_id`),
  ADD KEY `user_user_groups_user_group_id` (`user_group_id`),
  ADD KEY `user_user_groups_user_id` (`user_id`);

--
-- Índices de tabela `versions`
--
ALTER TABLE `versions`
  ADD PRIMARY KEY (`version_id`),
  ADD UNIQUE KEY `versions_unique` (`product_type`,`product`,`major`,`minor`,`revision`,`build`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `access_keys`
--
ALTER TABLE `access_keys`
  MODIFY `access_key_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `announcements`
--
ALTER TABLE `announcements`
  MODIFY `announcement_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `announcement_settings`
--
ALTER TABLE `announcement_settings`
  MODIFY `announcement_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `announcement_types`
--
ALTER TABLE `announcement_types`
  MODIFY `type_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `announcement_type_settings`
--
ALTER TABLE `announcement_type_settings`
  MODIFY `announcement_type_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `authors`
--
ALTER TABLE `authors`
  MODIFY `author_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `author_settings`
--
ALTER TABLE `author_settings`
  MODIFY `author_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `category_settings`
--
ALTER TABLE `category_settings`
  MODIFY `category_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `citations`
--
ALTER TABLE `citations`
  MODIFY `citation_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `citation_settings`
--
ALTER TABLE `citation_settings`
  MODIFY `citation_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `completed_payments`
--
ALTER TABLE `completed_payments`
  MODIFY `completed_payment_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `controlled_vocabs`
--
ALTER TABLE `controlled_vocabs`
  MODIFY `controlled_vocab_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de tabela `controlled_vocab_entries`
--
ALTER TABLE `controlled_vocab_entries`
  MODIFY `controlled_vocab_entry_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;

--
-- AUTO_INCREMENT de tabela `controlled_vocab_entry_settings`
--
ALTER TABLE `controlled_vocab_entry_settings`
  MODIFY `controlled_vocab_entry_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;

--
-- AUTO_INCREMENT de tabela `custom_issue_orders`
--
ALTER TABLE `custom_issue_orders`
  MODIFY `custom_issue_order_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `custom_section_orders`
--
ALTER TABLE `custom_section_orders`
  MODIFY `custom_section_order_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `data_object_tombstones`
--
ALTER TABLE `data_object_tombstones`
  MODIFY `tombstone_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `data_object_tombstone_oai_set_objects`
--
ALTER TABLE `data_object_tombstone_oai_set_objects`
  MODIFY `object_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `data_object_tombstone_settings`
--
ALTER TABLE `data_object_tombstone_settings`
  MODIFY `tombstone_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `dois`
--
ALTER TABLE `dois`
  MODIFY `doi_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `doi_settings`
--
ALTER TABLE `doi_settings`
  MODIFY `doi_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `edit_decisions`
--
ALTER TABLE `edit_decisions`
  MODIFY `edit_decision_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de tabela `email_log`
--
ALTER TABLE `email_log`
  MODIFY `log_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de tabela `email_log_users`
--
ALTER TABLE `email_log_users`
  MODIFY `email_log_user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de tabela `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `email_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `email_templates_default_data`
--
ALTER TABLE `email_templates_default_data`
  MODIFY `email_templates_default_data_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=824;

--
-- AUTO_INCREMENT de tabela `email_templates_settings`
--
ALTER TABLE `email_templates_settings`
  MODIFY `email_template_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `event_log`
--
ALTER TABLE `event_log`
  MODIFY `log_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=261;

--
-- AUTO_INCREMENT de tabela `event_log_settings`
--
ALTER TABLE `event_log_settings`
  MODIFY `event_log_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=771;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `files`
--
ALTER TABLE `files`
  MODIFY `file_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de tabela `filters`
--
ALTER TABLE `filters`
  MODIFY `filter_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `filter_groups`
--
ALTER TABLE `filter_groups`
  MODIFY `filter_group_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `filter_settings`
--
ALTER TABLE `filter_settings`
  MODIFY `filter_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `genres`
--
ALTER TABLE `genres`
  MODIFY `genre_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `genre_settings`
--
ALTER TABLE `genre_settings`
  MODIFY `genre_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de tabela `institutional_subscriptions`
--
ALTER TABLE `institutional_subscriptions`
  MODIFY `institutional_subscription_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `institutions`
--
ALTER TABLE `institutions`
  MODIFY `institution_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `institution_ip`
--
ALTER TABLE `institution_ip`
  MODIFY `institution_ip_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `institution_settings`
--
ALTER TABLE `institution_settings`
  MODIFY `institution_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `issues`
--
ALTER TABLE `issues`
  MODIFY `issue_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `issue_files`
--
ALTER TABLE `issue_files`
  MODIFY `file_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `issue_galleys`
--
ALTER TABLE `issue_galleys`
  MODIFY `galley_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `issue_galley_settings`
--
ALTER TABLE `issue_galley_settings`
  MODIFY `issue_galley_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `issue_settings`
--
ALTER TABLE `issue_settings`
  MODIFY `issue_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=292;

--
-- AUTO_INCREMENT de tabela `journals`
--
ALTER TABLE `journals`
  MODIFY `journal_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `journal_settings`
--
ALTER TABLE `journal_settings`
  MODIFY `journal_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT de tabela `library_files`
--
ALTER TABLE `library_files`
  MODIFY `file_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `library_file_settings`
--
ALTER TABLE `library_file_settings`
  MODIFY `library_file_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `metrics_context`
--
ALTER TABLE `metrics_context`
  MODIFY `metrics_context_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `metrics_counter_submission_daily`
--
ALTER TABLE `metrics_counter_submission_daily`
  MODIFY `metrics_counter_submission_daily_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `metrics_counter_submission_institution_daily`
--
ALTER TABLE `metrics_counter_submission_institution_daily`
  MODIFY `metrics_counter_submission_institution_daily_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `metrics_counter_submission_institution_monthly`
--
ALTER TABLE `metrics_counter_submission_institution_monthly`
  MODIFY `metrics_counter_submission_institution_monthly_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `metrics_counter_submission_monthly`
--
ALTER TABLE `metrics_counter_submission_monthly`
  MODIFY `metrics_counter_submission_monthly_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `metrics_issue`
--
ALTER TABLE `metrics_issue`
  MODIFY `metrics_issue_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `metrics_submission`
--
ALTER TABLE `metrics_submission`
  MODIFY `metrics_submission_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `metrics_submission_geo_daily`
--
ALTER TABLE `metrics_submission_geo_daily`
  MODIFY `metrics_submission_geo_daily_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `metrics_submission_geo_monthly`
--
ALTER TABLE `metrics_submission_geo_monthly`
  MODIFY `metrics_submission_geo_monthly_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `navigation_menus`
--
ALTER TABLE `navigation_menus`
  MODIFY `navigation_menu_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `navigation_menu_items`
--
ALTER TABLE `navigation_menu_items`
  MODIFY `navigation_menu_item_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de tabela `navigation_menu_item_assignments`
--
ALTER TABLE `navigation_menu_item_assignments`
  MODIFY `navigation_menu_item_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT de tabela `navigation_menu_item_assignment_settings`
--
ALTER TABLE `navigation_menu_item_assignment_settings`
  MODIFY `navigation_menu_item_assignment_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `navigation_menu_item_settings`
--
ALTER TABLE `navigation_menu_item_settings`
  MODIFY `navigation_menu_item_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de tabela `notes`
--
ALTER TABLE `notes`
  MODIFY `note_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=277;

--
-- AUTO_INCREMENT de tabela `notification_settings`
--
ALTER TABLE `notification_settings`
  MODIFY `notification_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT de tabela `notification_subscription_settings`
--
ALTER TABLE `notification_subscription_settings`
  MODIFY `setting_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `oai_resumption_tokens`
--
ALTER TABLE `oai_resumption_tokens`
  MODIFY `oai_resumption_token_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `plugin_settings`
--
ALTER TABLE `plugin_settings`
  MODIFY `plugin_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT de tabela `publications`
--
ALTER TABLE `publications`
  MODIFY `publication_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `publication_categories`
--
ALTER TABLE `publication_categories`
  MODIFY `publication_category_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `publication_galleys`
--
ALTER TABLE `publication_galleys`
  MODIFY `galley_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `publication_galley_settings`
--
ALTER TABLE `publication_galley_settings`
  MODIFY `publication_galley_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `publication_settings`
--
ALTER TABLE `publication_settings`
  MODIFY `publication_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT de tabela `queries`
--
ALTER TABLE `queries`
  MODIFY `query_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `query_participants`
--
ALTER TABLE `query_participants`
  MODIFY `query_participant_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `queued_payments`
--
ALTER TABLE `queued_payments`
  MODIFY `queued_payment_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `review_assignments`
--
ALTER TABLE `review_assignments`
  MODIFY `review_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `review_files`
--
ALTER TABLE `review_files`
  MODIFY `review_file_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `review_forms`
--
ALTER TABLE `review_forms`
  MODIFY `review_form_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `review_form_elements`
--
ALTER TABLE `review_form_elements`
  MODIFY `review_form_element_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `review_form_element_settings`
--
ALTER TABLE `review_form_element_settings`
  MODIFY `review_form_element_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `review_form_responses`
--
ALTER TABLE `review_form_responses`
  MODIFY `review_form_response_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `review_form_settings`
--
ALTER TABLE `review_form_settings`
  MODIFY `review_form_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `review_rounds`
--
ALTER TABLE `review_rounds`
  MODIFY `review_round_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `review_round_files`
--
ALTER TABLE `review_round_files`
  MODIFY `review_round_file_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `scheduled_tasks`
--
ALTER TABLE `scheduled_tasks`
  MODIFY `scheduled_task_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `sections`
--
ALTER TABLE `sections`
  MODIFY `section_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `section_settings`
--
ALTER TABLE `section_settings`
  MODIFY `section_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `site`
--
ALTER TABLE `site`
  MODIFY `site_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `site_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `stage_assignments`
--
ALTER TABLE `stage_assignments`
  MODIFY `stage_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de tabela `static_pages`
--
ALTER TABLE `static_pages`
  MODIFY `static_page_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `static_page_settings`
--
ALTER TABLE `static_page_settings`
  MODIFY `static_page_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `subeditor_submission_group`
--
ALTER TABLE `subeditor_submission_group`
  MODIFY `subeditor_submission_group_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `submissions`
--
ALTER TABLE `submissions`
  MODIFY `submission_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `submission_comments`
--
ALTER TABLE `submission_comments`
  MODIFY `comment_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `submission_files`
--
ALTER TABLE `submission_files`
  MODIFY `submission_file_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de tabela `submission_file_revisions`
--
ALTER TABLE `submission_file_revisions`
  MODIFY `revision_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de tabela `submission_file_settings`
--
ALTER TABLE `submission_file_settings`
  MODIFY `submission_file_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de tabela `submission_search_keyword_list`
--
ALTER TABLE `submission_search_keyword_list`
  MODIFY `keyword_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

--
-- AUTO_INCREMENT de tabela `submission_search_objects`
--
ALTER TABLE `submission_search_objects`
  MODIFY `object_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT de tabela `submission_search_object_keywords`
--
ALTER TABLE `submission_search_object_keywords`
  MODIFY `submission_search_object_keyword_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2592;

--
-- AUTO_INCREMENT de tabela `submission_settings`
--
ALTER TABLE `submission_settings`
  MODIFY `submission_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `subscription_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `subscription_types`
--
ALTER TABLE `subscription_types`
  MODIFY `type_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `subscription_type_settings`
--
ALTER TABLE `subscription_type_settings`
  MODIFY `subscription_type_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `temporary_files`
--
ALTER TABLE `temporary_files`
  MODIFY `file_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de tabela `usage_stats_institution_temporary_records`
--
ALTER TABLE `usage_stats_institution_temporary_records`
  MODIFY `usage_stats_temp_institution_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usage_stats_total_temporary_records`
--
ALTER TABLE `usage_stats_total_temporary_records`
  MODIFY `usage_stats_temp_total_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=733;

--
-- AUTO_INCREMENT de tabela `usage_stats_unique_item_investigations_temporary_records`
--
ALTER TABLE `usage_stats_unique_item_investigations_temporary_records`
  MODIFY `usage_stats_temp_unique_item_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de tabela `usage_stats_unique_item_requests_temporary_records`
--
ALTER TABLE `usage_stats_unique_item_requests_temporary_records`
  MODIFY `usage_stats_temp_item_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `user_group_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `user_group_settings`
--
ALTER TABLE `user_group_settings`
  MODIFY `user_group_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT de tabela `user_group_stage`
--
ALTER TABLE `user_group_stage`
  MODIFY `user_group_stage_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de tabela `user_interests`
--
ALTER TABLE `user_interests`
  MODIFY `user_interest_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `user_settings`
--
ALTER TABLE `user_settings`
  MODIFY `user_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de tabela `user_user_groups`
--
ALTER TABLE `user_user_groups`
  MODIFY `user_user_group_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de tabela `versions`
--
ALTER TABLE `versions`
  MODIFY `version_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `access_keys`
--
ALTER TABLE `access_keys`
  ADD CONSTRAINT `access_keys_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `announcements_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `announcement_types` (`type_id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `announcement_settings`
--
ALTER TABLE `announcement_settings`
  ADD CONSTRAINT `announcement_settings_announcement_id_foreign` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`announcement_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `announcement_types`
--
ALTER TABLE `announcement_types`
  ADD CONSTRAINT `announcement_types_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `announcement_type_settings`
--
ALTER TABLE `announcement_type_settings`
  ADD CONSTRAINT `announcement_type_settings_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `announcement_types` (`type_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `authors`
--
ALTER TABLE `authors`
  ADD CONSTRAINT `authors_publication_id_foreign` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `authors_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `author_settings`
--
ALTER TABLE `author_settings`
  ADD CONSTRAINT `author_settings_author_id` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `category_settings`
--
ALTER TABLE `category_settings`
  ADD CONSTRAINT `category_settings_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `citations`
--
ALTER TABLE `citations`
  ADD CONSTRAINT `citations_publication` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `citation_settings`
--
ALTER TABLE `citation_settings`
  ADD CONSTRAINT `citation_settings_citation_id` FOREIGN KEY (`citation_id`) REFERENCES `citations` (`citation_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `completed_payments`
--
ALTER TABLE `completed_payments`
  ADD CONSTRAINT `completed_payments_context_id` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `completed_payments_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `controlled_vocab_entries`
--
ALTER TABLE `controlled_vocab_entries`
  ADD CONSTRAINT `controlled_vocab_entries_controlled_vocab_id_foreign` FOREIGN KEY (`controlled_vocab_id`) REFERENCES `controlled_vocabs` (`controlled_vocab_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `controlled_vocab_entry_settings`
--
ALTER TABLE `controlled_vocab_entry_settings`
  ADD CONSTRAINT `c_v_e_s_entry_id` FOREIGN KEY (`controlled_vocab_entry_id`) REFERENCES `controlled_vocab_entries` (`controlled_vocab_entry_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `custom_issue_orders`
--
ALTER TABLE `custom_issue_orders`
  ADD CONSTRAINT `custom_issue_orders_issue_id` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `custom_issue_orders_journal_id` FOREIGN KEY (`journal_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `custom_section_orders`
--
ALTER TABLE `custom_section_orders`
  ADD CONSTRAINT `custom_section_orders_issue_id` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `custom_section_orders_section_id` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `data_object_tombstone_oai_set_objects`
--
ALTER TABLE `data_object_tombstone_oai_set_objects`
  ADD CONSTRAINT `data_object_tombstone_oai_set_objects_tombstone_id` FOREIGN KEY (`tombstone_id`) REFERENCES `data_object_tombstones` (`tombstone_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `data_object_tombstone_settings`
--
ALTER TABLE `data_object_tombstone_settings`
  ADD CONSTRAINT `data_object_tombstone_settings_tombstone_id` FOREIGN KEY (`tombstone_id`) REFERENCES `data_object_tombstones` (`tombstone_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `dois`
--
ALTER TABLE `dois`
  ADD CONSTRAINT `dois_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `doi_settings`
--
ALTER TABLE `doi_settings`
  ADD CONSTRAINT `doi_settings_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `edit_decisions`
--
ALTER TABLE `edit_decisions`
  ADD CONSTRAINT `edit_decisions_editor_id` FOREIGN KEY (`editor_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `edit_decisions_review_round_id_foreign` FOREIGN KEY (`review_round_id`) REFERENCES `review_rounds` (`review_round_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `edit_decisions_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `email_log_users`
--
ALTER TABLE `email_log_users`
  ADD CONSTRAINT `email_log_users_email_log_id_foreign` FOREIGN KEY (`email_log_id`) REFERENCES `email_log` (`log_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `email_log_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `email_templates`
--
ALTER TABLE `email_templates`
  ADD CONSTRAINT `email_templates_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `email_templates_settings`
--
ALTER TABLE `email_templates_settings`
  ADD CONSTRAINT `email_templates_settings_email_id` FOREIGN KEY (`email_id`) REFERENCES `email_templates` (`email_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `event_log`
--
ALTER TABLE `event_log`
  ADD CONSTRAINT `event_log_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `event_log_settings`
--
ALTER TABLE `event_log_settings`
  ADD CONSTRAINT `event_log_settings_log_id` FOREIGN KEY (`log_id`) REFERENCES `event_log` (`log_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `filters`
--
ALTER TABLE `filters`
  ADD CONSTRAINT `filters_filter_group_id_foreign` FOREIGN KEY (`filter_group_id`) REFERENCES `filter_groups` (`filter_group_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `filter_settings`
--
ALTER TABLE `filter_settings`
  ADD CONSTRAINT `filter_settings_filter_id_foreign` FOREIGN KEY (`filter_id`) REFERENCES `filters` (`filter_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `genres`
--
ALTER TABLE `genres`
  ADD CONSTRAINT `genres_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `genre_settings`
--
ALTER TABLE `genre_settings`
  ADD CONSTRAINT `genre_settings_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `institutional_subscriptions`
--
ALTER TABLE `institutional_subscriptions`
  ADD CONSTRAINT `institutional_subscriptions_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `institutional_subscriptions_subscription_id` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`subscription_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `institutions`
--
ALTER TABLE `institutions`
  ADD CONSTRAINT `institutions_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `institution_ip`
--
ALTER TABLE `institution_ip`
  ADD CONSTRAINT `institution_ip_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `institution_settings`
--
ALTER TABLE `institution_settings`
  ADD CONSTRAINT `institution_settings_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `issues`
--
ALTER TABLE `issues`
  ADD CONSTRAINT `issues_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `issues_journal_id` FOREIGN KEY (`journal_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `issue_files`
--
ALTER TABLE `issue_files`
  ADD CONSTRAINT `issue_files_issue_id` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `issue_galleys`
--
ALTER TABLE `issue_galleys`
  ADD CONSTRAINT `issue_galleys_file_id` FOREIGN KEY (`file_id`) REFERENCES `issue_files` (`file_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `issue_galleys_issue_id` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `issue_galley_settings`
--
ALTER TABLE `issue_galley_settings`
  ADD CONSTRAINT `issue_galleys_settings_galley_id` FOREIGN KEY (`galley_id`) REFERENCES `issue_galleys` (`galley_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `issue_settings`
--
ALTER TABLE `issue_settings`
  ADD CONSTRAINT `issue_settings_issue_id` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `journals`
--
ALTER TABLE `journals`
  ADD CONSTRAINT `journals_current_issue_id_foreign` FOREIGN KEY (`current_issue_id`) REFERENCES `issues` (`issue_id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `journal_settings`
--
ALTER TABLE `journal_settings`
  ADD CONSTRAINT `journal_settings_journal_id` FOREIGN KEY (`journal_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `library_files`
--
ALTER TABLE `library_files`
  ADD CONSTRAINT `library_files_context_id` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `library_files_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `library_file_settings`
--
ALTER TABLE `library_file_settings`
  ADD CONSTRAINT `library_file_settings_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `library_files` (`file_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `metrics_context`
--
ALTER TABLE `metrics_context`
  ADD CONSTRAINT `metrics_context_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `metrics_counter_submission_daily`
--
ALTER TABLE `metrics_counter_submission_daily`
  ADD CONSTRAINT `msd_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `msd_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `metrics_counter_submission_institution_daily`
--
ALTER TABLE `metrics_counter_submission_institution_daily`
  ADD CONSTRAINT `msid_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `msid_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `msid_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `metrics_counter_submission_institution_monthly`
--
ALTER TABLE `metrics_counter_submission_institution_monthly`
  ADD CONSTRAINT `msim_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `msim_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `msim_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `metrics_counter_submission_monthly`
--
ALTER TABLE `metrics_counter_submission_monthly`
  ADD CONSTRAINT `msm_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `msm_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `metrics_issue`
--
ALTER TABLE `metrics_issue`
  ADD CONSTRAINT `metrics_issue_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `metrics_issue_issue_galley_id_foreign` FOREIGN KEY (`issue_galley_id`) REFERENCES `issue_galleys` (`galley_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `metrics_issue_issue_id_foreign` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `metrics_submission`
--
ALTER TABLE `metrics_submission`
  ADD CONSTRAINT `metrics_submission_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `metrics_submission_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_galleys` (`galley_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `metrics_submission_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `metrics_submission_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `metrics_submission_geo_daily`
--
ALTER TABLE `metrics_submission_geo_daily`
  ADD CONSTRAINT `msgd_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `msgd_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `metrics_submission_geo_monthly`
--
ALTER TABLE `metrics_submission_geo_monthly`
  ADD CONSTRAINT `msgm_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `msgm_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `navigation_menu_item_assignments`
--
ALTER TABLE `navigation_menu_item_assignments`
  ADD CONSTRAINT `navigation_menu_item_assignments_navigation_menu_id_foreign` FOREIGN KEY (`navigation_menu_id`) REFERENCES `navigation_menus` (`navigation_menu_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `navigation_menu_item_assignments_navigation_menu_item_id_foreign` FOREIGN KEY (`navigation_menu_item_id`) REFERENCES `navigation_menu_items` (`navigation_menu_item_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `navigation_menu_item_assignment_settings`
--
ALTER TABLE `navigation_menu_item_assignment_settings`
  ADD CONSTRAINT `assignment_settings_navigation_menu_item_assignment_id` FOREIGN KEY (`navigation_menu_item_assignment_id`) REFERENCES `navigation_menu_item_assignments` (`navigation_menu_item_assignment_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `navigation_menu_item_settings`
--
ALTER TABLE `navigation_menu_item_settings`
  ADD CONSTRAINT `navigation_menu_item_settings_navigation_menu_id` FOREIGN KEY (`navigation_menu_item_id`) REFERENCES `navigation_menu_items` (`navigation_menu_item_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `notification_settings`
--
ALTER TABLE `notification_settings`
  ADD CONSTRAINT `notification_settings_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`notification_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `notification_subscription_settings`
--
ALTER TABLE `notification_subscription_settings`
  ADD CONSTRAINT `notification_subscription_settings_context_foreign` FOREIGN KEY (`context`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notification_subscription_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `publications`
--
ALTER TABLE `publications`
  ADD CONSTRAINT `publications_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `publications_primary_contact_id` FOREIGN KEY (`primary_contact_id`) REFERENCES `authors` (`author_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `publications_section_id` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `publications_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `publication_categories`
--
ALTER TABLE `publication_categories`
  ADD CONSTRAINT `publication_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `publication_categories_publication_id_foreign` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `publication_galleys`
--
ALTER TABLE `publication_galleys`
  ADD CONSTRAINT `publication_galleys_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `publication_galleys_publication_id` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `publication_galleys_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`);

--
-- Restrições para tabelas `publication_galley_settings`
--
ALTER TABLE `publication_galley_settings`
  ADD CONSTRAINT `publication_galley_settings_galley_id` FOREIGN KEY (`galley_id`) REFERENCES `publication_galleys` (`galley_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `publication_settings`
--
ALTER TABLE `publication_settings`
  ADD CONSTRAINT `publication_settings_publication_id` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `query_participants`
--
ALTER TABLE `query_participants`
  ADD CONSTRAINT `query_participants_query_id_foreign` FOREIGN KEY (`query_id`) REFERENCES `queries` (`query_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `query_participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `review_assignments`
--
ALTER TABLE `review_assignments`
  ADD CONSTRAINT `review_assignments_review_form_id_foreign` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`),
  ADD CONSTRAINT `review_assignments_review_round_id_foreign` FOREIGN KEY (`review_round_id`) REFERENCES `review_rounds` (`review_round_id`),
  ADD CONSTRAINT `review_assignments_reviewer_id_foreign` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `review_assignments_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`);

--
-- Restrições para tabelas `review_files`
--
ALTER TABLE `review_files`
  ADD CONSTRAINT `review_files_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `review_assignments` (`review_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `review_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `review_form_elements`
--
ALTER TABLE `review_form_elements`
  ADD CONSTRAINT `review_form_elements_review_form_id` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `review_form_element_settings`
--
ALTER TABLE `review_form_element_settings`
  ADD CONSTRAINT `review_form_element_settings_review_form_element_id` FOREIGN KEY (`review_form_element_id`) REFERENCES `review_form_elements` (`review_form_element_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `review_form_responses`
--
ALTER TABLE `review_form_responses`
  ADD CONSTRAINT `review_form_responses_review_form_element_id_foreign` FOREIGN KEY (`review_form_element_id`) REFERENCES `review_form_elements` (`review_form_element_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `review_form_responses_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `review_assignments` (`review_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `review_form_settings`
--
ALTER TABLE `review_form_settings`
  ADD CONSTRAINT `review_form_settings_review_form_id` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `review_rounds`
--
ALTER TABLE `review_rounds`
  ADD CONSTRAINT `review_rounds_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`);

--
-- Restrições para tabelas `review_round_files`
--
ALTER TABLE `review_round_files`
  ADD CONSTRAINT `review_round_files_review_round_id_foreign` FOREIGN KEY (`review_round_id`) REFERENCES `review_rounds` (`review_round_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `review_round_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `review_round_files_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_journal_id` FOREIGN KEY (`journal_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sections_review_form_id` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `section_settings`
--
ALTER TABLE `section_settings`
  ADD CONSTRAINT `section_settings_section_id` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `stage_assignments`
--
ALTER TABLE `stage_assignments`
  ADD CONSTRAINT `stage_assignments_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stage_assignments_user_group_id` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stage_assignments_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `static_pages`
--
ALTER TABLE `static_pages`
  ADD CONSTRAINT `static_pages_context_id` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `static_page_settings`
--
ALTER TABLE `static_page_settings`
  ADD CONSTRAINT `static_page_settings_static_page_id` FOREIGN KEY (`static_page_id`) REFERENCES `static_pages` (`static_page_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `subeditor_submission_group`
--
ALTER TABLE `subeditor_submission_group`
  ADD CONSTRAINT `section_editors_context_id` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subeditor_submission_group_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subeditor_submission_group_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `submissions`
--
ALTER TABLE `submissions`
  ADD CONSTRAINT `submissions_context_id` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `submissions_publication_id` FOREIGN KEY (`current_publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `submission_comments`
--
ALTER TABLE `submission_comments`
  ADD CONSTRAINT `submission_comments_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `submission_comments_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `submission_files`
--
ALTER TABLE `submission_files`
  ADD CONSTRAINT `submission_files_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `submission_files_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `submission_files_source_submission_file_id_foreign` FOREIGN KEY (`source_submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `submission_files_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `submission_files_uploader_user_id_foreign` FOREIGN KEY (`uploader_user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `submission_file_revisions`
--
ALTER TABLE `submission_file_revisions`
  ADD CONSTRAINT `submission_file_revisions_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `submission_file_revisions_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `submission_file_settings`
--
ALTER TABLE `submission_file_settings`
  ADD CONSTRAINT `submission_file_settings_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `submission_search_objects`
--
ALTER TABLE `submission_search_objects`
  ADD CONSTRAINT `submission_search_object_submission` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `submission_search_object_keywords`
--
ALTER TABLE `submission_search_object_keywords`
  ADD CONSTRAINT `submission_search_object_keywords_keyword_id` FOREIGN KEY (`keyword_id`) REFERENCES `submission_search_keyword_list` (`keyword_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `submission_search_object_keywords_object_id_foreign` FOREIGN KEY (`object_id`) REFERENCES `submission_search_objects` (`object_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `submission_settings`
--
ALTER TABLE `submission_settings`
  ADD CONSTRAINT `submission_settings_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_journal_id` FOREIGN KEY (`journal_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subscriptions_type_id` FOREIGN KEY (`type_id`) REFERENCES `subscription_types` (`type_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subscriptions_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `subscription_types`
--
ALTER TABLE `subscription_types`
  ADD CONSTRAINT `subscription_types_journal_id` FOREIGN KEY (`journal_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `subscription_type_settings`
--
ALTER TABLE `subscription_type_settings`
  ADD CONSTRAINT `subscription_type_settings_type_id` FOREIGN KEY (`type_id`) REFERENCES `subscription_types` (`type_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `temporary_files`
--
ALTER TABLE `temporary_files`
  ADD CONSTRAINT `temporary_files_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `usage_stats_institution_temporary_records`
--
ALTER TABLE `usage_stats_institution_temporary_records`
  ADD CONSTRAINT `usi_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `usage_stats_total_temporary_records`
--
ALTER TABLE `usage_stats_total_temporary_records`
  ADD CONSTRAINT `ust_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ust_issue_galley_id_foreign` FOREIGN KEY (`issue_galley_id`) REFERENCES `issue_galleys` (`galley_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ust_issue_id_foreign` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ust_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_galleys` (`galley_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ust_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ust_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `usage_stats_unique_item_investigations_temporary_records`
--
ALTER TABLE `usage_stats_unique_item_investigations_temporary_records`
  ADD CONSTRAINT `usii_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `usii_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_galleys` (`galley_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `usii_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `usii_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `usage_stats_unique_item_requests_temporary_records`
--
ALTER TABLE `usage_stats_unique_item_requests_temporary_records`
  ADD CONSTRAINT `usir_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `usir_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_galleys` (`galley_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `usir_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `usir_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `user_group_settings`
--
ALTER TABLE `user_group_settings`
  ADD CONSTRAINT `user_group_settings_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `user_group_stage`
--
ALTER TABLE `user_group_stage`
  ADD CONSTRAINT `user_group_stage_context_id` FOREIGN KEY (`context_id`) REFERENCES `journals` (`journal_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_group_stage_user_group_id` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `user_interests`
--
ALTER TABLE `user_interests`
  ADD CONSTRAINT `user_interests_controlled_vocab_entry_id_foreign` FOREIGN KEY (`controlled_vocab_entry_id`) REFERENCES `controlled_vocab_entries` (`controlled_vocab_entry_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_interests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `user_settings`
--
ALTER TABLE `user_settings`
  ADD CONSTRAINT `user_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `user_user_groups`
--
ALTER TABLE `user_user_groups`
  ADD CONSTRAINT `user_user_groups_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_user_groups_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
