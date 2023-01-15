-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Янв 15 2023 г., 21:28
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
-- Создание: Янв 15 2023 г., 18:01
-- Последнее обновление: Янв 15 2023 г., 18:27
--

DROP TABLE IF EXISTS `CARDS`;
CREATE TABLE `CARDS` (
  `ID` int(11) NOT NULL,
  `TITLE` varchar(2000) NOT NULL,
  `DESCRIPTION` varchar(2000) NOT NULL,
  `IMG_SRC` varchar(2000) NOT NULL,
  `VIDEO_SRC` varchar(2000) NOT NULL,
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

INSERT INTO `CARDS` (`ID`, `TITLE`, `DESCRIPTION`, `IMG_SRC`, `VIDEO_SRC`, `ID_PAGE`, `IMG_SRC_PREVIEW`, `TITLE_PREVIEW`, `SRC`, `POSITION`, `VISIBILITY`) VALUES
(25, 'Заголовок тест', 'Описание тест', 'c560ade1a9ae4640559a90cb81f9a9f0683e06e9cc9d33767da08d0361548481.jpg', 'https://www.youtube.com/watch?v=LIT4I2Rd82E&ab_channel=%D0%9F%D0%9E%D0%96%D0%98%D0%9B%D0%9E%D0%99%D0%90%D0%9B%D0%95%D0%9A%D0%A1%D0%95%D0%99', 6, 'c560ade1a9ae4640559a90cb81f9a9f0683e06e9cc9d33767da08d0361548481.jpg', 'Заголовок превью тест', 'https://www.youtube.com/watch?v=LIT4I2Rd82E&ab_channel=%D0%9F%D0%9E%D0%96%D0%98%D0%9B%D0%9E%D0%99%D0%90%D0%9B%D0%95%D0%9A%D0%A1%D0%95%D0%99', 1, 1),
(26, 'Заголовок тест', 'Описание тест', 'c560ade1a9ae4640559a90cb81f9a9f0683e06e9cc9d33767da08d0361548481.jpg', 'https://www.youtube.com/watch?v=LIT4I2Rd82E&ab_channel=%D0%9F%D0%9E%D0%96%D0%98%D0%9B%D0%9E%D0%99%D0%90%D0%9B%D0%95%D0%9A%D0%A1%D0%95%D0%99', 6, 'c560ade1a9ae4640559a90cb81f9a9f0683e06e9cc9d33767da08d0361548481.jpg', 'Заголовок превью тест', 'https://www.youtube.com/watch?v=LIT4I2Rd82E&ab_channel=%D0%9F%D0%9E%D0%96%D0%98%D0%9B%D0%9E%D0%99%D0%90%D0%9B%D0%95%D0%9A%D0%A1%D0%95%D0%99', 4, 1),
(27, 'Заголовок тест', 'Описание тест', 'c560ade1a9ae4640559a90cb81f9a9f0683e06e9cc9d33767da08d0361548481.jpg', 'https://www.youtube.com/watch?v=LIT4I2Rd82E&ab_channel=%D0%9F%D0%9E%D0%96%D0%98%D0%9B%D0%9E%D0%99%D0%90%D0%9B%D0%95%D0%9A%D0%A1%D0%95%D0%99', 6, 'c560ade1a9ae4640559a90cb81f9a9f0683e06e9cc9d33767da08d0361548481.jpg', 'Заголовок превью тест', 'https://www.youtube.com/watch?v=LIT4I2Rd82E&ab_channel=%D0%9F%D0%9E%D0%96%D0%98%D0%9B%D0%9E%D0%99%D0%90%D0%9B%D0%95%D0%9A%D0%A1%D0%95%D0%99', 5, 1),
(28, 'Заголовок тест', 'Описание тест', 'c560ade1a9ae4640559a90cb81f9a9f0683e06e9cc9d33767da08d0361548481.jpg', 'https://www.youtube.com/watch?v=LIT4I2Rd82E&ab_channel=%D0%9F%D0%9E%D0%96%D0%98%D0%9B%D0%9E%D0%99%D0%90%D0%9B%D0%95%D0%9A%D0%A1%D0%95%D0%99', 6, 'c560ade1a9ae4640559a90cb81f9a9f0683e06e9cc9d33767da08d0361548481.jpg', 'Заголовок превью тест', 'https://www.youtube.com/watch?v=LIT4I2Rd82E&ab_channel=%D0%9F%D0%9E%D0%96%D0%98%D0%9B%D0%9E%D0%99%D0%90%D0%9B%D0%95%D0%9A%D0%A1%D0%95%D0%99', 6, 1),
(29, 'Заголовок тест', 'Описание тест', 'c560ade1a9ae4640559a90cb81f9a9f0683e06e9cc9d33767da08d0361548481.jpg', 'https://www.youtube.com/watch?v=LIT4I2Rd82E&ab_channel=%D0%9F%D0%9E%D0%96%D0%98%D0%9B%D0%9E%D0%99%D0%90%D0%9B%D0%95%D0%9A%D0%A1%D0%95%D0%99', 6, 'c560ade1a9ae4640559a90cb81f9a9f0683e06e9cc9d33767da08d0361548481.jpg', 'Заголовок превью тест', 'https://www.youtube.com/watch?v=LIT4I2Rd82E&ab_channel=%D0%9F%D0%9E%D0%96%D0%98%D0%9B%D0%9E%D0%99%D0%90%D0%9B%D0%95%D0%9A%D0%A1%D0%95%D0%99', 7, 1),
(39, '', '', '', '', 6, 'b3e9389d104d48b4b715508939819491.png', 'Заголовок Превью 1', 'https://www.youtube.com/watch?v=DbrVDMPFoTc&ab_channel=PolinaPoliakova', 8, 1),
(40, '', '', '', '', 6, '28d8191a0eb68e0cf5b49c772ea31499.png', 'Заголовок Превью 1', 'https://www.youtube.com/watch?v=DbrVDMPFoTc&ab_channel=PolinaPoliakova', 3, 1),
(41, '', '', '', '', 6, '5deef7499067ae2ba5edd771e1882c8f.png', 'Заголовок Превью 2', 'https://www.youtube.com/watch?v=DbrVDMPFoTc&ab_channel=PolinaPoliakova', 2, 1),
(42, '', '', '', '', 6, '4d5d6f2231eff3d6fa0b9713d8d13d11.png', '', '', 9, 1),
(43, '', '', '', '', 6, '16ddc3beea2c259195c26ced7b0e4f23.png', 'Загоgeag2ловок', '', 10, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `PAGES`
--
-- Создание: Янв 10 2023 г., 20:39
-- Последнее обновление: Янв 15 2023 г., 17:56
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
(6, 'С ЧЕГО НАЧАТЬ', '1.png', 1, 1, 10),
(7, 'ХОЧУ ВСТУПИТЬ', '2.png', 2, 1, 12),
(8, 'ДЛЯ ПРОДВИЖЕНИЯ', '3.png', 3, 1, 13),
(47, '213125432', 'c384a177cf4ae57898749e216375b3e9.jpg', 4, 1, NULL),
(48, 'Заголовок5', '7f053ab377965c8b46b6c806ee9f3ad6.png', 5, 1, 5),
(49, 'Заголовок4', '8563ed01e5f5ed519c3e9dca632d3be9.jpg', 8, 1, 7),
(57, 'Заголовок23', '8cfeed8030ba56b314727ec1d0c65c54.jpg', 7, 1, NULL),
(58, 'Заголовок232', 'a0455acd17c9ad0ab3f9d2c332f6f804.jpg', 6, 1, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `PAGES_TYPE`
--
-- Создание: Янв 13 2023 г., 15:42
-- Последнее обновление: Янв 15 2023 г., 16:33
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
(13, NULL, NULL, 1, 'eagaeg');

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT для таблицы `PAGES`
--
ALTER TABLE `PAGES`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT для таблицы `PAGES_TYPE`
--
ALTER TABLE `PAGES_TYPE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
