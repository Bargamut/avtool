-- phpMyAdmin SQL Dump
-- version 4.0.5
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 07 2013 г., 05:32
-- Версия сервера: 5.1.71-community-log
-- Версия PHP: 5.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `avtool.dev`
--
CREATE DATABASE IF NOT EXISTS `avtool.dev` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `avtool.dev`;

-- --------------------------------------------------------

--
-- Структура таблицы `channels`
--

CREATE TABLE IF NOT EXISTS `channels` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID значения',
  `value` char(10) NOT NULL DEFAULT '1' COMMENT 'Значение',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Таблица количества каналов' AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `channels`
--

INSERT INTO `channels` (`id`, `value`) VALUES
(1, '1'),
(2, '4'),
(3, '8'),
(4, '10'),
(5, '16'),
(6, '32/48');

-- --------------------------------------------------------

--
-- Структура таблицы `distances`
--

CREATE TABLE IF NOT EXISTS `distances` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID значения',
  `value` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Значение',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Таблица расстояний' AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `distances`
--

INSERT INTO `distances` (`id`, `value`) VALUES
(1, 300),
(2, 500),
(3, 900),
(4, 1500),
(5, 2000),
(6, 2300);

-- --------------------------------------------------------

--
-- Структура таблицы `mountings`
--

CREATE TABLE IF NOT EXISTS `mountings` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID значения',
  `value` char(50) NOT NULL DEFAULT 'Внутри помещения' COMMENT 'Значение',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Таблица типов установок' AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `mountings`
--

INSERT INTO `mountings` (`id`, `value`) VALUES
(1, 'Внутри помещения'),
(2, 'Уличная');

-- --------------------------------------------------------

--
-- Структура таблицы `recievers`
--

CREATE TABLE IF NOT EXISTS `recievers` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID приёмника',
  `name` char(50) NOT NULL DEFAULT '0' COMMENT 'Название приёмника',
  `distance` char(50) NOT NULL COMMENT 'Расстояние',
  `video_type` char(50) NOT NULL COMMENT 'Тип камеры',
  `setting_type` char(50) NOT NULL COMMENT 'Тип настройки',
  `channels` char(50) NOT NULL COMMENT 'Количество каналов',
  `type` char(50) NOT NULL COMMENT 'Поддерживаемые типы передатчиков',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Таблица приёмников' AUTO_INCREMENT=21 ;

--
-- Дамп данных таблицы `recievers`
--

INSERT INTO `recievers` (`id`, `name`, `distance`, `video_type`, `setting_type`, `channels`, `type`) VALUES
(1, 'AVT-TRX101', '1', '1', '1', '1', '1'),
(2, 'AVT-TRX102', '1', '1', '1', '5', '1'),
(3, 'AVT-TRX103', '1', '1', '1', '1,5', '1'),
(4, 'AVT-TRX104', '1', '1', '1', '1', '1'),
(5, 'AVT-TRX105', '1', '1', '1', '1,5', '1'),
(6, 'AVT-TRX106', '1', '1', '1', '1', '1'),
(7, 'AVT-RX221\r\n', '1,2,3,4', '1', '2', '1,2,3,4,5,6', '1,2'),
(8, 'AVT-RX234\r\n', '1,2,3,4', '1', '2', '1,2,3,4,5,6', '1,2'),
(9, 'AVT-RX235I\r\n', '1,2,3,4', '1', '2', '1', '1,2'),
(10, 'AVT-RX237I\r\n', '1,2,3,4', '1', '2', '1', '1,2'),
(11, 'AVT-RX342\r\n', '1,2,3,4,5,6', '1', '3', '1,2,3,4,5,6', '1,3'),
(12, 'AVT-RX345\r\n', '1,2,3,4', '1', '3', '1,2,3,4,5,6', '1,3'),
(13, 'AVT-RX349I\r\n', '1,2,3,4,5,6', '1', '3', '1', '1,3'),
(14, 'AVT-RX350I\r\n', '1,2,3,4,5,6', '1', '3', '1', '1,3'),
(15, 'AVT-RX461\r\n', '1,2,3,4', '1', '2', '1,5', '4'),
(16, 'AVT-RX462\r\n', '1,2,3,4,5,6', '1', '3', '1', '4'),
(17, 'AVT-RX463\r\n', '1,2,3,4,5', '1', '2', '1,5', '4'),
(18, 'AVT-RX464\r\n', '1,2,3,4,5', '1', '3', '5', '4'),
(19, 'AVT-RX510\r\n', '1,2,3', '2', '3', '1,2,3,4,5,6', '1,2,3,4,5'),
(20, 'AVT-RX515\r\n', '1,2,3', '2', '3', '1,5', '1,2,3,4,5');

-- --------------------------------------------------------

--
-- Структура таблицы `settingtypes`
--

CREATE TABLE IF NOT EXISTS `settingtypes` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID значения',
  `value` char(50) NOT NULL DEFAULT 'Без настройки' COMMENT 'Значение',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Таблица типов настройки' AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `settingtypes`
--

INSERT INTO `settingtypes` (`id`, `value`) VALUES
(1, 'Без настройки'),
(2, 'Дискретная'),
(3, 'Плавная'),
(4, 'Автомат');

-- --------------------------------------------------------

--
-- Структура таблицы `transmitters`
--

CREATE TABLE IF NOT EXISTS `transmitters` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID передатчика',
  `name` char(50) NOT NULL COMMENT 'Название передатчика',
  `distance` char(50) NOT NULL COMMENT 'Расстояние',
  `voltage` char(50) NOT NULL COMMENT 'Напряжение источника питания',
  `mounting` char(50) NOT NULL COMMENT 'Тип установки',
  `temp_min` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Минимальная температура работы',
  `temp_max` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Максимальная температура работы',
  `type` char(50) NOT NULL COMMENT 'Поддерживаемые типы передатчиков',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Таблица передатчиков' AUTO_INCREMENT=20 ;

--
-- Дамп данных таблицы `transmitters`
--

INSERT INTO `transmitters` (`id`, `name`, `distance`, `voltage`, `mounting`, `temp_min`, `temp_max`, `type`) VALUES
(1, 'AVT-TRX101\r\n', '1,2,3,4', '1', '1', -40, 70, '1,2,3,5'),
(2, 'AVT-TRX103\r\n', '1,2,3,4', '1', '1', -40, 70, '1,2,3,5'),
(3, 'AVT-TRX104\r\n', '1,2,3,4', '1', '1', -40, 70, '1,2,3,5'),
(4, 'AVT-TRX105\r\n', '1,2,3,4', '1', '1', -40, 70, '1,2,3,5'),
(5, 'AVT-TRX106\r\n', '1,2,3,4', '1', '1', -40, 70, '1,2,3,5'),
(6, 'AVT-TX221\r\n', '1,2,3,4', '2', '1', 0, 70, '2,5'),
(7, 'AVT-TX225\r\n', '1,2,3,4', '2', '1', 0, 70, '2,5'),
(8, 'AVT-TX234\r\n', '1,2,3,4', '2', '1', 0, 70, '2,5'),
(9, 'AVT-TX234(W)\r\n', '1,2,3,4', '2', '1', -40, 70, '2,5'),
(10, 'AVT-TX345\r\n', '', '2,3', '1', 0, 70, '3,5'),
(11, 'AVT-TX345(W)\r\n', '', '2,3', '1', -40, 70, '3,5'),
(12, 'AVT-TX346I\r\n', '', '2,3', '2', 0, 70, '3,5'),
(13, 'AVT-TX346I(W)\r\n', '', '2,3', '2', -40, 70, '3,5'),
(14, 'AVT-TX347I\r\n', '1,2,3,4', '4', '2', 0, 70, '3,5'),
(15, 'AVT-TX347I(W)\r\n', '1,2,3,4', '4', '2', -40, 70, '3,5'),
(16, 'AVT-TX461\r\n', '1,2,3,4', '2,3', '1', 0, 70, '4,5'),
(17, 'AVT-TX461(W)\r\n', '1,2,3,4', '2,3', '1', -40, 70, '4,5'),
(18, 'AVT-TX466\r\n', '1,2,3,4', '2', '1', 0, 70, '4,5'),
(19, 'AVT-TX466(W)\r\n', '1,2,3,4', '2', '1', -40, 70, '4,5');

-- --------------------------------------------------------

--
-- Структура таблицы `types`
--

CREATE TABLE IF NOT EXISTS `types` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID типа',
  `value` char(50) NOT NULL COMMENT 'Название типа',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Типы устройств' AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `types`
--

INSERT INTO `types` (`id`, `value`) VALUES
(1, 'Passiv'),
(2, 'Pro'),
(3, 'Plus'),
(4, 'Delog'),
(5, 'Automat');

-- --------------------------------------------------------

--
-- Структура таблицы `videotypes`
--

CREATE TABLE IF NOT EXISTS `videotypes` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Id значения',
  `value` char(50) NOT NULL DEFAULT 'Любая аналоговая' COMMENT 'Значение',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Таблица типов камер' AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `videotypes`
--

INSERT INTO `videotypes` (`id`, `value`) VALUES
(1, 'Любая аналоговая'),
(2, 'Цветная');

-- --------------------------------------------------------

--
-- Структура таблицы `voltages`
--

CREATE TABLE IF NOT EXISTS `voltages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `value` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Таблица питания' AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `voltages`
--

INSERT INTO `voltages` (`id`, `value`) VALUES
(1, 0),
(2, 12),
(3, 24),
(4, 220);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
