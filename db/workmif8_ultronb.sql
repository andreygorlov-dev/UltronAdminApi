-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Янв 25 2023 г., 21:07
-- Версия сервера: 5.7.21-20-beget-5.7.21-20-1-log
-- Версия PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `workmif8_ultronb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `CARDS`
--
-- Создание: Янв 17 2023 г., 17:09
-- Последнее обновление: Янв 25 2023 г., 17:19
--

DROP TABLE IF EXISTS `CARDS`;
CREATE TABLE `CARDS` (
  `ID` int(11) NOT NULL,
  `TITLE` varchar(2000) NOT NULL,
  `ID_PAGE` int(11) NOT NULL,
  `IMG_SRC_PREVIEW` varchar(2000) NOT NULL,
  `TITLE_PREVIEW` varchar(2000) NOT NULL,
  `SRC` varchar(2000) DEFAULT NULL,
  `POSITION` int(11) NOT NULL,
  `VISIBILITY` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `CARDS`
--

INSERT INTO `CARDS` (`ID`, `TITLE`, `ID_PAGE`, `IMG_SRC_PREVIEW`, `TITLE_PREVIEW`, `SRC`, `POSITION`, `VISIBILITY`) VALUES
(62, '', 83, '73e865c7beba86d8bb1a5c138076bf6f.png', 'Посмотрите видео  об Автоматизации', NULL, 1, 1),
(63, '', 83, '0f04078911a6196b8b76d610060a034b.png', 'gjgjkhgjgj', NULL, 2, 1),
(64, '', 83, '53d40d375e9c634129cf4f40cececfba.png', 'Презентации Ultron', NULL, 3, 1),
(66, '', 84, 'ad79cc90b844e8ae8e34dd4e363f48e6.png', 'РЕГИСТРАЦИЯ И ОПЛАТА МОНЕТ', NULL, 1, 1),
(67, '', 84, '5a78265302d6385280ef83b888b76b5c.png', 'Как вывести USDT на кошелек', NULL, 2, 1),
(68, '', 84, '6a24536b8feacdca5c0e3daddd38409f.png', 'Обзор кабинета Mavie.Global ', NULL, 3, 1),
(69, '', 84, '92f9f9f61384d71e08dd3612b7a5e3ba.png', 'Club Balance: Как он работает', NULL, 4, 1),
(70, '', 84, '64d8145aa8f97a9be42beac7091d81d8.png', 'Частые вопросы и ответы', NULL, 5, 1),
(71, '', 84, '59cd870642a9a6df03763f5f8499dc22.png', 'Как отключить авто стейкинг', NULL, 6, 1),
(72, '', 86, '945c7cbbbcce31802b6c786a94cd0972.png', '1', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `CARDS_CONTENT`
--
-- Создание: Янв 25 2023 г., 16:08
-- Последнее обновление: Янв 25 2023 г., 17:12
--

DROP TABLE IF EXISTS `CARDS_CONTENT`;
CREATE TABLE `CARDS_CONTENT` (
  `ID` int(11) NOT NULL,
  `VALUE` varchar(2000) NOT NULL,
  `TYPE` varchar(2000) NOT NULL,
  `POSITION` int(11) DEFAULT NULL,
  `VISIBILITY` int(11) NOT NULL DEFAULT '1',
  `ID_CARD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `CARDS_CONTENT`
--

INSERT INTO `CARDS_CONTENT` (`ID`, `VALUE`, `TYPE`, `POSITION`, `VISIBILITY`, `ID_CARD`) VALUES
(42, 'ffff', 'TITLE', NULL, 1, 62),
(52, '{\"TITLE\":\"geageag\",\"VALUE\":\"geahaeyheah\"}', 'TEXT3', 2, 1, 62),
(55, 'https://www.youtube.com/watch?v=tUGd_kf3E1Q', 'VIDEO', 1, 1, 62),
(56, 'gelalgelakgkealgklaekg', 'TEXT1', 3, 1, 62),
(58, 'gelalgelakgkealgklaekg', 'TEXT1', 4, 1, 62);

-- --------------------------------------------------------

--
-- Структура таблицы `DOCUMENTS`
--
-- Создание: Янв 25 2023 г., 17:30
-- Последнее обновление: Янв 25 2023 г., 18:03
--

DROP TABLE IF EXISTS `DOCUMENTS`;
CREATE TABLE `DOCUMENTS` (
  `ID` int(11) NOT NULL,
  `TITLE` varchar(2000) NOT NULL,
  `IMG_SRC` varchar(2000) NOT NULL,
  `FILE_SRC` varchar(2000) NOT NULL,
  `POSITION` int(11) NOT NULL,
  `VISIBILITY` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `DOCUMENTS`
--

INSERT INTO `DOCUMENTS` (`ID`, `TITLE`, `IMG_SRC`, `FILE_SRC`, `POSITION`, `VISIBILITY`) VALUES
(2, 'тест добавление', '95d7cb878b8091e6ed85dd9476c229d4.png', '8ae3febca7e347e3d04b5b68ead81649.pdf', 1, 1),
(4, 'тест добавление 3', '9b7e8ccba059db209f4919c66af8319e.png', '02387dd6313d272a0cf83531e753033c.pdf', 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `PAGES`
--
-- Создание: Янв 10 2023 г., 20:39
-- Последнее обновление: Янв 25 2023 г., 02:10
--

DROP TABLE IF EXISTS `PAGES`;
CREATE TABLE `PAGES` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(2000) NOT NULL,
  `IMG_SRC` varchar(2000) NOT NULL,
  `POSITION` int(11) NOT NULL,
  `VISIBILITY` int(1) NOT NULL DEFAULT '1',
  `ID_PAGE_TYPE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `PAGES`
--

INSERT INTO `PAGES` (`ID`, `NAME`, `IMG_SRC`, `POSITION`, `VISIBILITY`, `ID_PAGE_TYPE`) VALUES
(83, 'С чего начать', 'dde2b4239bacb0e5e5bc13408ecc7dba.png', 1, 1, 34),
(84, 'ХОЧУ ВСТУПИТЬ', 'd5f40352403b3e29f434c51c04a5ae07.png', 2, 1, 35),
(85, 'ДЛЯ ПРОДВИЖЕНИЯ', '2c1617720a67977bc92883d6e159bc0d.png', 3, 1, NULL),
(86, 'Раздел Х', 'dece45aa68de809bfa340ef69a1f6c52.png', 4, 1, 36);

-- --------------------------------------------------------

--
-- Структура таблицы `PAGES_TYPE`
--
-- Создание: Янв 13 2023 г., 15:42
-- Последнее обновление: Янв 25 2023 г., 02:10
--

DROP TABLE IF EXISTS `PAGES_TYPE`;
CREATE TABLE `PAGES_TYPE` (
  `ID` int(11) NOT NULL,
  `SUBTITLE` varchar(2000) DEFAULT NULL,
  `IMG_SRC` varchar(2000) DEFAULT NULL,
  `TYPE` int(11) NOT NULL,
  `TITLE` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `PAGES_TYPE`
--

INSERT INTO `PAGES_TYPE` (`ID`, `SUBTITLE`, `IMG_SRC`, `TYPE`, `TITLE`) VALUES
(3, NULL, NULL, 1, ''),
(4, 'Новый подзаголовок', NULL, 2, ''),
(5, 'Новый подзаголовок', NULL, 3, ''),
(6, NULL, '0bc8eb3deb1fc7625e0fb0807594083a.png', 4, ''),
(7, 'попук', NULL, 2, 'пук'),
(8, 'Куку', NULL, 2, 'Куку'),
(9, NULL, '5439869397ee13ddfa29881a2f612b00.png', 4, 'Куку2'),
(10, '', '0bc8eb3deb1fc7625e0fb0807594083a.png', 4, 'Куку2'),
(11, 'eaaaaa', NULL, 2, 'gaega'),
(12, 'eaaaaa', NULL, 2, 'gaega'),
(13, NULL, NULL, 1, 'eagaeg'),
(14, '21455125', NULL, 3, 'geagaeg'),
(15, '', NULL, 2, ''),
(16, NULL, '4b7e4b5a0d22aef3d2e233d15aeb7617.', 4, ''),
(17, '', NULL, 3, ''),
(18, 'уууу', NULL, 2, 'нос'),
(19, NULL, NULL, 1, 'ыыыы'),
(20, 'Изучите внимательно, ведь старт всегда самое важное!', NULL, 2, 'С ЧЕГО НАЧАТЬ?'),
(21, NULL, NULL, 1, 'для продвижения'),
(22, NULL, '0cd11d694d117dda48013a62e33944c5.', 4, 'РЕСУРСЫ ULTRON'),
(23, 'Здесь мы собрали информацию о компании Ultron и маркетингового агентства Mavie.', NULL, 3, 'презентации ультрон'),
(24, NULL, '900f8ded95d61e059e85cf58ab7e0c4e.', 4, 'geagaeg'),
(25, NULL, 'ca89458652ec80bce24b887c076cb461.', 4, 'geag'),
(26, NULL, '', 4, '222'),
(27, NULL, 'e6171019e89a02a0c229424a81d79553.png', 4, '222'),
(28, '', NULL, 3, ''),
(29, NULL, 'b63b436751bef57bd7c39a6d84e1a460.png', 4, 'Раздел 1й'),
(30, 'Подзаголовок', NULL, 2, 'ввожу заголовок'),
(31, 'rshrsh', NULL, 3, 'grsh'),
(32, NULL, '5560949505cbf7ff87d2589e02c373bb.png', 4, 'hrshrsh'),
(33, NULL, '4d34d5d157c2edfe90bb2e97197b5063.png', 4, 'eageag'),
(34, 'Изучите внимательно, ведь старт всегда самое важное!', NULL, 2, 'С чего начать?'),
(35, NULL, NULL, 1, 'Хочу вступить'),
(36, NULL, NULL, 1, '? Разделы ли ?');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `CARDS`
--
ALTER TABLE `CARDS`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `cards_ibfk_1` (`ID_PAGE`);

--
-- Индексы таблицы `CARDS_CONTENT`
--
ALTER TABLE `CARDS_CONTENT`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_CARD` (`ID_CARD`);

--
-- Индексы таблицы `DOCUMENTS`
--
ALTER TABLE `DOCUMENTS`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `PAGES`
--
ALTER TABLE `PAGES`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_PAGE_TYPE` (`ID_PAGE_TYPE`);

--
-- Индексы таблицы `PAGES_TYPE`
--
ALTER TABLE `PAGES_TYPE`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `CARDS`
--
ALTER TABLE `CARDS`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT для таблицы `CARDS_CONTENT`
--
ALTER TABLE `CARDS_CONTENT`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT для таблицы `DOCUMENTS`
--
ALTER TABLE `DOCUMENTS`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `PAGES`
--
ALTER TABLE `PAGES`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT для таблицы `PAGES_TYPE`
--
ALTER TABLE `PAGES_TYPE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `CARDS`
--
ALTER TABLE `CARDS`
  ADD CONSTRAINT `cards_ibfk_1` FOREIGN KEY (`ID_PAGE`) REFERENCES `PAGES` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `CARDS_CONTENT`
--
ALTER TABLE `CARDS_CONTENT`
  ADD CONSTRAINT `CARDS_CONTENT_ibfk_1` FOREIGN KEY (`ID_CARD`) REFERENCES `CARDS` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `PAGES`
--
ALTER TABLE `PAGES`
  ADD CONSTRAINT `PAGES_ibfk_1` FOREIGN KEY (`ID_PAGE_TYPE`) REFERENCES `PAGES_TYPE` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
