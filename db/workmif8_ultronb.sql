-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Янв 17 2023 г., 21:50
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
(51, '', 63, '343ad8458753f1a5050474a17c6f04df.png', 'Заголовокe', NULL, 1, 1),
(52, '', 63, '42859974cefcc6a34601d9cf116a7083.png', 'Посмотрите видео  об Автоматизации', NULL, 2, 1),
(53, '', 64, '500f166feb0ade015549bc6654218eb3.png', 'Как работает автоматизация', NULL, 1, 1),
(54, '', 65, '3ddb957a6872d1c1946be73ac6a1a556.png', 'Разработка мета вселенной', '', 1, 1),
(55, '', 65, '2749ad18f6dc17d86480063566e18d36.png', 'Разработка мета вселенной2', '', 2, 1),
(56, '', 66, '0fcd4c2db8b9bfbd5946f70b7d4a7e44.png', 'Суть блокчейна, почему Ultron?', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `CARDS_CONTENT`
--
-- Создание: Янв 17 2023 г., 18:40
-- Последнее обновление: Янв 17 2023 г., 18:45
--

DROP TABLE IF EXISTS `CARDS_CONTENT`;
CREATE TABLE `CARDS_CONTENT` (
  `ID` int(11) NOT NULL,
  `VALUE` varchar(2000) NOT NULL,
  `TYPE` varchar(2000) NOT NULL,
  `POSITION` int(11) DEFAULT NULL,
  `VISIBLE` int(11) NOT NULL DEFAULT '1',
  `ID_CARD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `CARDS_CONTENT`
--

INSERT INTO `CARDS_CONTENT` (`ID`, `VALUE`, `TYPE`, `POSITION`, `VISIBLE`, `ID_CARD`) VALUES
(1, '{\"TITLE\" : \"Заголовок\", \"VALUE\" :\"Lorem ipsum dolor sit amet consectetur adipisicing elit.Blanditiis tempora provident sapiente adipisci molestias, officiis veritatis a earum alias error.\"}', 'TEXT3', 1, 1, 51),
(2, '{\"VALUE\" : \"text text\", \"IMG\": \"42859974cefcc6a34601d9cf116a7083.png\"}', 'ELEM_LIST', 10, 1, 51),
(3, '{\"VALUE\" : \"text text text\", \"IMG\": \"42859974cefcc6a34601d9cf116a7083.png\"}', 'ELEM_LIST', 11, 1, 51),
(4, 'https://www.youtube.com/watch?v=JRWw6jpKquo&list=RD1IyU3VXDAIk&index=4&ab_channel=CalebHyles', 'VIDEO', 12, 1, 51),
(5, '42859974cefcc6a34601d9cf116a7083.png', 'IMG1', 13, 1, 51),
(6, 'TEXT5', 'TEXT1', 14, 1, 51),
(7, 'f97106356826f54b04f6d730b1e6d907.png', 'IMG1', 14, 1, 51),
(8, '67d26e73a3eff9c641a81d0a4d0f1eaf.png', 'IMG2', 14, 1, 51),
(9, 'de65dc9c9d7740f9f82f01eecfe61dd3.png', 'IMG2', 14, 1, 51),
(10, '3d1c60a63151d06b2af549fe63d2b067.png', 'IMG2', 15, 1, 51),
(15, 'e577044372983faf38522472a8302b5b.png', 'IMG2', 9, 1, 51),
(16, 'dsfdsf', 'TEXT2', 8, 1, 51),
(17, 'TEXT1', 'TEXT1', 7, 1, 51),
(18, 'https://www.youtube.com/watch?v=JRWw6jpKquo&list=RD1IyU3VXDAIk&index=4&ab_channel=CalebHyles', 'VIDEO', 6, 1, 51),
(19, '{\"VALUE\" : \"text text\", \"IMG\": \"42859974cefcc6a34601d9cf116a7083.png\"}', 'ELEM_LIST', 5, 1, 51),
(20, '{\"VALUE\" : \"text text\", \"IMG\": \"42859974cefcc6a34601d9cf116a7083.png\"}', 'ELEM_LIST', 4, 1, 51),
(21, '{\"VALUE\" : \"text text\", \"IMG\": \"42859974cefcc6a34601d9cf116a7083.png\"}', 'ELEM_LIST', 3, 1, 51),
(22, '{\"VALUE\":\"text1\",\"IMG\":\"9edc0dc4c02a7c0189ed6cd632ed6303.png\"}', 'ELEM_LIST', 2, 1, 51),
(23, 'TEXT1', 'TITLE', NULL, 1, 51),
(24, 'TEXT1', 'SUBTITLE', 16, 1, 51),
(25, '[{\"COLUMN1\" : \"Текст11\", \"COLUMN2\" : \"Текст12\"},{\"COLUMN1\" : \"Текст21\",\"COLUMN2\" : \"Текст22\"},{\"COLUMN1\" : \"Текст31\",\"COLUMN2\" : \"Текст32\"},{\"COLUMN1\" : \"Текст41\",\"COLUMN2\" : \"Текст42\"}]', 'TABLE', 2, 1, 51);

-- --------------------------------------------------------

--
-- Структура таблицы `PAGES`
--
-- Создание: Янв 10 2023 г., 20:39
-- Последнее обновление: Янв 16 2023 г., 16:47
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
(63, 'с чего начать', '820634d5ec8d0d83de15bdda0881ba4d.png', 1, 1, 20),
(64, 'для продвижения', 'a0f2fb681ed5b84863f880826daa72a1.png', 2, 1, 21),
(65, 'РЕСУРСЫ ULTRON', 'b16d6969f8464d33e3d865634a2600e3.png', 3, 1, 22),
(66, 'Презентации ультрон', '6914d0a3e17e74e471731f54096cdf38.png', 4, 1, 23),
(70, 'Заголовок', 'ede957fe724ad2df2e9556c5b3e397e2.png', 5, 1, 27);

-- --------------------------------------------------------

--
-- Структура таблицы `PAGES_TYPE`
--
-- Создание: Янв 13 2023 г., 15:42
-- Последнее обновление: Янв 16 2023 г., 16:47
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
(27, NULL, 'e6171019e89a02a0c229424a81d79553.png', 4, '222');

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT для таблицы `CARDS_CONTENT`
--
ALTER TABLE `CARDS_CONTENT`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT для таблицы `PAGES`
--
ALTER TABLE `PAGES`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT для таблицы `PAGES_TYPE`
--
ALTER TABLE `PAGES_TYPE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

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
