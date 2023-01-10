-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Янв 11 2023 г., 00:22
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
-- Создание: Дек 29 2022 г., 15:37
--

DROP TABLE IF EXISTS `CARDS`;
CREATE TABLE `CARDS` (
  `ID` int(11) NOT NULL,
  `TITLE` varchar(2000) NOT NULL,
  `DESCRIPTION` varchar(2000) NOT NULL,
  `IMG_SRC` varchar(2000) NOT NULL,
  `VIDEO_SRC` varchar(2000) NOT NULL,
  `ID_PAGE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `PAGES`
--
-- Создание: Янв 10 2023 г., 20:39
-- Последнее обновление: Янв 10 2023 г., 21:18
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
(6, 'С ЧЕГО НАЧАТЬ', '1.png', 1, 1, NULL),
(7, 'ХОЧУ ВСТУПИТЬ', '2.png', 2, 1, NULL),
(8, 'ДЛЯ ПРОДВИЖЕНИЯ', '3.png', 3, 1, NULL),
(47, '213125432', 'c384a177cf4ae57898749e216375b3e9.jpg', 4, 1, NULL),
(48, 'Заголовок5', '7f053ab377965c8b46b6c806ee9f3ad6.png', 5, 1, NULL),
(49, 'Заголовок4', '8563ed01e5f5ed519c3e9dca632d3be9.jpg', 6, 1, NULL),
(50, 'Заголовок3', 'bcadd909157e8d4f9324f9fe29bc75c7.jpg', 7, 1, NULL),
(55, 'asdsa', '20c6d32dd086d202cab20bd061db2664.png', 8, 1, NULL),
(56, 'Топ консоль', '134355fcbc6145eed620d4f2738c28d0.jpg', 9, 1, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `PAGES_TYPE`
--
-- Создание: Янв 10 2023 г., 20:56
-- Последнее обновление: Янв 10 2023 г., 21:18
--

DROP TABLE IF EXISTS `PAGES_TYPE`;
CREATE TABLE `PAGES_TYPE` (
  `ID` int(11) NOT NULL,
  `SUBTITLE` varchar(2000) DEFAULT NULL,
  `IMG_SRC` varchar(2000) DEFAULT NULL,
  `TYPE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `PAGES_TYPE`
--

INSERT INTO `PAGES_TYPE` (`ID`, `SUBTITLE`, `IMG_SRC`, `TYPE`) VALUES
(3, NULL, NULL, 1),
(4, 'Новый подзаголовок', NULL, 2),
(5, 'Новый подзаголовок', NULL, 3),
(6, NULL, '0bc8eb3deb1fc7625e0fb0807594083a.png', 4);

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `PAGES`
--
ALTER TABLE `PAGES`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT для таблицы `PAGES_TYPE`
--
ALTER TABLE `PAGES_TYPE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `CARDS`
--
ALTER TABLE `CARDS`
  ADD CONSTRAINT `cards_ibfk_1` FOREIGN KEY (`ID_PAGE`) REFERENCES `PAGES` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `PAGES`
--
ALTER TABLE `PAGES`
  ADD CONSTRAINT `PAGES_ibfk_1` FOREIGN KEY (`ID_PAGE_TYPE`) REFERENCES `PAGES_TYPE` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
