-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 08 2022 г., 09:05
-- Версия сервера: 5.6.38
-- Версия PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `UltronContentDB`
--

-- --------------------------------------------------------

--
-- Структура таблицы `CARDS`
--

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

CREATE TABLE `PAGES` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(2000) NOT NULL,
  `IMG_SRC` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `CARDS`
--
ALTER TABLE `CARDS`
  ADD CONSTRAINT `cards_ibfk_1` FOREIGN KEY (`ID_PAGE`) REFERENCES `PAGES` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
