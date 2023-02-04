-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Фев 04 2023 г., 20:51
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
-- Последнее обновление: Фев 03 2023 г., 11:14
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
(64, '', 83, '6aae5a0e562990350da31dd97aba1a1f.png', 'Почему стоит зайти в ULTRON?', NULL, 2, 1),
(66, '', 84, 'ad79cc90b844e8ae8e34dd4e363f48e6.png', 'РЕГИСТРАЦИЯ И ОПЛАТА МОНЕТ', NULL, 1, 1),
(67, '', 84, '5a78265302d6385280ef83b888b76b5c.png', 'Как вывести USDT на кошелек', NULL, 2, 1),
(68, '', 84, '6a24536b8feacdca5c0e3daddd38409f.png', 'Обзор кабинета Mavie.Global ', NULL, 3, 1),
(69, '', 84, '92f9f9f61384d71e08dd3612b7a5e3ba.png', 'Club Balance: Как он работает', NULL, 4, 1),
(70, '', 84, '64d8145aa8f97a9be42beac7091d81d8.png', 'Частые вопросы и ответы', NULL, 5, 1),
(71, '', 84, '59cd870642a9a6df03763f5f8499dc22.png', 'Как отключить авто стейкинг', NULL, 6, 1),
(74, '', 83, 'e5c26814f25bd605e4449042c267ea22.png', 'Презентация №1 - Суть блокчейна', NULL, 3, 1),
(75, '', 83, '384dcb79c879068cfc6a9fcaa3ac9d21.png', 'Презентация №2 - Эко система', NULL, 4, 1),
(76, '', 83, 'db3906e59a89d59e492380f13e087115.png', 'Презентация №3 - Как зарабатывать', NULL, 5, 1),
(77, '', 83, '9f038d5963aa95298031f69fbfd4fe2b.png', 'Презентация №4 - промоушены', NULL, 6, 1),
(78, '', 83, '4f08de020801392fd4894c1e8d8f5489.png', 'Презентация №5 - Вебинары', NULL, 7, 1),
(80, '', 89, 'c1b262df5ff579fd6e2b0220e6d7622a.png', 'как работает автоматизация', NULL, 1, 1),
(81, '', 89, '44b5acfd7e229c45af098f9edd66dad8.png', 'автоматизация с чего начать', NULL, 2, 1),
(82, '', 89, 'ea5db6cf9e42816d0584fea01b07fea9.png', 'продающие посты', NULL, 3, 1),
(83, '', 90, '893252d06518cba3e44e188851eac084.png', 'Разработка мета вселенной', '', 1, 1),
(84, '', 90, '0e078c5b4ac92d3f0060254906dbfaf9.png', 'Сайт блокчейна Ultron', '', 2, 1),
(85, '', 90, '537dad7911b808bfa6c188cbd5956c93.png', 'GitHub код блокчейна', '', 3, 1),
(86, '', 90, '9103b43bc4e859006170c98b08ecf9f3.png', 'Биржа UltronSwap', '', 4, 1),
(87, '', 90, '26ac252de2a3e75cc094b4fd38a36bd1.png', 'Сайт маркетинга', '', 5, 1),
(88, '', 90, 'f1b0d6d85700e30b649f5bc979f2fad0.png', 'Explorer ULX', '', 6, 1),
(89, '', 90, 'da2c8c6c19efc7b66231d93eee3afdeb.png', 'geageag', 'https://devilprado2.youtrack.cloud/agiles/131-4/current?issue=ult-15', 7, 1),
(91, '', 93, '18c288a1ef1429b5fbaced588648a21e.png', '2', NULL, 1, 1),
(92, '', 93, '03ae28c8260c7683a7fd3bbbfcb95ac1.jpg', '123', NULL, 2, 1),
(93, '', 87, '5e58a37bbd945888c51254321d3d4093.png', 'UltronSwap Собственная биржа', 'https://ultronswap.com/', 1, 1),
(94, '', 88, '5c93990726c951f84445a80a8811428d.png', 'Тестовая ссылка', 'https://ultronswap.com/', 1, 1),
(95, '', 94, '90602140fed74dc76d7684d2c211eaad.png', 'Страница 1', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `CARDS_CONTENT`
--
-- Создание: Янв 25 2023 г., 16:08
-- Последнее обновление: Фев 03 2023 г., 11:16
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
(67, 'https://youtu.be/pCjRgRu3xZk', 'VIDEO', 1, 1, 62),
(68, 'Почему стоит зайти в ULtron?', 'TITLE', 1, 1, 64),
(69, 'Любые крупные структуры строятся на старте проекта, когда о нем знают мало людей. ', 'TEXT2', 2, 1, 64),
(70, 'Доходы в первые полугода можно делать максимально большие, особенно в бинарном маркетинге как на блокчейне Ultron + правильный подход.', 'TEXT1', 3, 1, 64),
(71, 'На старте в подобных бинарных маркетингах -  огромные переливы по от активных лидеров. Как правило когда человек получает результат в виде перелива, то ему легко дальше работать в проекте.', 'TEXT1', 4, 1, 64),
(72, 'Тут же переливы даже без проплаты, а это очень мощный инструмент о котором поговорим на нашем маркетинговом канале.', 'TEXT1', 5, 1, 64),
(73, 'df10b8c86db54237a640a061fbc9ad2b.png', 'IMG2', 6, 1, 64),
(74, 'Проанализировав проект Ultron наша команда увидела большую идею, которая даст блокчейну Ultron жизнь на десятилетия.', 'TEXT1', 7, 1, 64),
(77, ' Суть проекта: Блокчейн Ultron 1-го уровня, такой как Eth, Solana, Cordano, Polygon, Fantom, Bnb на котором можно делать сотни разных разработок.', 'TEXT2', 8, 1, 64),
(78, 'Обратите внимание команда более 32 человек, также есть медийные личности.', 'TEXT1', 9, 1, 64),
(79, 'Сейчас мы выходим из крипто зимы и люди активно начинают заходить в крипто проекты. Это проект поможет проработать годы, а точнее как в компании заложено - стейкинг на 5 лет, это создаёт ещё 1 источник дохода на годы.', 'TEXT1', 10, 1, 64),
(80, '{\"VALUE\":\"grwgrwrgwrgrwg\",\"IMG\":\"93e1b0a1858fa573c32e8a5920555472.png\"}', 'ELEM_LIST', 1, 1, 66),
(83, '{\"VALUE\":\"u0443u043fu0444u0443u043f\",\"IMG\":\"74d38558630a5a7c974d1646e34a3af6.png\"}', 'ELEM_LIST', 11, 1, 64),
(84, 'Суть блокчейна, почему ultron?', 'TITLE', 1, 1, 74),
(85, 'https://youtu.be/v5_LMjIccoY', 'VIDEO', 2, 1, 74),
(86, 'На рынок вышел новый блокчейн 1-го уровня, такой как  Eth, Solana, Cordano, Polygon, Fantom, Bnb на котором можно делать тысячи разных разработок.', 'TEXT2', 3, 1, 74),
(87, 'это система блокчейна ultron', 'TITLE', 1, 1, 75),
(88, 'https://youtu.be/R31iDU07RG4', 'VIDEO', 2, 1, 75),
(89, 'Узнайте о команде, которая сформированная вокруг блокчейна Ultron.', 'TEXT2', 3, 1, 75),
(91, 'некоторые большие направления блокчейна делегированы отдельным компаниям, которые специалисты в теме.', 'TEXT1', 4, 1, 75),
(92, 'как зарабатывать usdt в mavie', 'TITLE', 1, 1, 76),
(93, 'https://youtu.be/pXeRSh9LhY0', 'VIDEO', 2, 1, 76),
(94, 'промоушены для первопроходцев', 'TITLE', 1, 1, 77),
(95, 'https://youtu.be/AnMbW5adJTg', 'VIDEO', 2, 1, 77),
(96, 'При покупке хаба с монетами Ulx вы получаете еще долю в мета вселенной которую готовит компания Devla ', 'TEXT2', 3, 1, 77),
(97, 'Вебинары с руководителями', 'TITLE', 1, 1, 78),
(98, 'https://youtu.be/6Hzh5WGHHrg', 'VIDEO', 2, 1, 78),
(99, '13.09.2022 Прошло мероприятие с участием топ лидера Малик с оборотом сети более 10кк$', 'TEXT2', 3, 1, 78),
(100, 'https://youtu.be/Ts1TXN6OYhg', 'VIDEO', 4, 1, 78),
(102, ' https://youtu.be/swWbDfL1Bzw', 'VIDEO', 5, 1, 78),
(103, '{\"VALUE\":\"u041fu0440u0438u0432u0435u0442 u043cu0438u0440\",\"IMG\":\"66f7aedf8389eece63e4868f70408d1a.png\"}', 'ELEM_LIST', 12, 1, 64),
(104, '{\"VALUE\":\"u0420u0443u0441u0441u043au0438u0439\",\"IMG\":\"0ce10dc3bbc1cf4594518921c3b25a83.png\"}', 'ELEM_LIST', 13, 1, 64),
(106, '{\"VALUE\":\"u0420u0443u0441u0441u043au0438u0439\",\"IMG\":\"46b7421d11aab2bc8d7b9d4c8940265f.png\"}', 'ELEM_LIST', 14, 1, 64),
(107, '{\"VALUE\":\"u0420u0443u0441u0441u043au0438u0439\",\"IMG\":\"575c509282b178cb993a8b8c1eeb6fea.png\"}', 'ELEM_LIST', 15, 1, 64),
(108, '{\"VALUE\":\"Русский\",\"IMG\":\"127d48d8bd6140a7a25f54242a6f4a85.png\"}', 'ELEM_LIST', 16, 1, 64),
(109, '{\"VALUE\":\"Привет мир\",\"IMG\":\"06d7a417467e88ba45141d19576e6516.png\"}', 'ELEM_LIST', 17, 1, 64),
(115, '{\"TITLE\":\"123\",\"VALUE\":\"456\"}', 'TEXT3', 1, 1, 91),
(116, 'https://youtu.be/InROXQNU-YE', 'VIDEO', 2, 1, 91),
(117, 'вапролдчсмитукенгшукенгш', 'TEXT2', 3, 1, 91),
(121, '{\"header\":\"geag\",\"text\":\"eagaeg\",\"link_value\":\"https://www.youtube.com/watch?v=xGmmGPCdmdo\"}', 'LINK', 18, 1, 64),
(122, 'Наша акция', 'TITLE', 1, 1, 95),
(123, 'условия 30% скидка', 'SUBTITLE', 2, 1, 95),
(124, 'https://www.youtube.com/watch?v=DYMZCSoCNZI', 'VIDEO', 3, 1, 95);

-- --------------------------------------------------------

--
-- Структура таблицы `CARDS_CONTENT_MAVIE`
--
-- Создание: Фев 04 2023 г., 15:58
--

DROP TABLE IF EXISTS `CARDS_CONTENT_MAVIE`;
CREATE TABLE `CARDS_CONTENT_MAVIE` (
  `ID` int(11) NOT NULL,
  `VALUE` varchar(2000) NOT NULL,
  `TYPE` varchar(2000) NOT NULL,
  `POSITION` int(11) DEFAULT NULL,
  `VISIBILITY` int(11) NOT NULL DEFAULT '1',
  `ID_CARD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `CARDS_MAVIE`
--
-- Создание: Фев 04 2023 г., 15:55
--

DROP TABLE IF EXISTS `CARDS_MAVIE`;
CREATE TABLE `CARDS_MAVIE` (
  `ID` int(11) NOT NULL,
  `TITLE` varchar(2000) NOT NULL,
  `ID_PAGE` int(11) NOT NULL,
  `IMG_SRC_PREVIEW` varchar(2000) NOT NULL,
  `TITLE_PREVIEW` varchar(2000) NOT NULL,
  `SRC` varchar(2000) DEFAULT NULL,
  `POSITION` int(11) NOT NULL,
  `VISIBILITY` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `DOCUMENTS`
--
-- Создание: Янв 25 2023 г., 17:30
-- Последнее обновление: Фев 01 2023 г., 15:56
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
(7, 'ultron lightpaper', '1c3b2845853b0ef0e405b3e7be913d99.png', '5beba06a6d0df9e05624eb4b1558170c.pdf', 2, 0),
(8, 'ultron whitepaper', '271a052c1fa0f50616f8b71a803ffdea.png', '606f480949ddd232c0983c49c3beb763.pdf', 3, 1),
(9, 'Tokenomics', 'ad467d4eed6392e3804d49c8efe0c95d.png', '56b26d87a2c53f4a16b9c5a0fb3c0f1d.pdf', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `DOCUMENTS_MAVIE`
--
-- Создание: Фев 04 2023 г., 15:52
-- Последнее обновление: Фев 04 2023 г., 16:21
--

DROP TABLE IF EXISTS `DOCUMENTS_MAVIE`;
CREATE TABLE `DOCUMENTS_MAVIE` (
  `ID` int(11) NOT NULL,
  `TITLE` varchar(2000) NOT NULL,
  `IMG_SRC` varchar(2000) NOT NULL,
  `FILE_SRC` varchar(2000) NOT NULL,
  `POSITION` int(11) NOT NULL,
  `VISIBILITY` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `DOCUMENTS_MAVIE`
--

INSERT INTO `DOCUMENTS_MAVIE` (`ID`, `TITLE`, `IMG_SRC`, `FILE_SRC`, `POSITION`, `VISIBILITY`) VALUES
(1, 'тест добавление 4', 'e6550e8447c880a3db6b5d4d85f20f38.png', '53b7a9600449ee45b8b453218a616f10.pdf', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `PAGES`
--
-- Создание: Янв 10 2023 г., 20:39
-- Последнее обновление: Фев 03 2023 г., 11:16
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
(87, 'Биржи', '0304ff7e69e1e55c2eb52773e086f973.png', 5, 1, 42),
(88, 'Аналитика', '93e1daf409671cd1701bc0e22307f1a9.png', 6, 1, 43),
(89, 'Для продвижения', '446da247a4d6d4c838cb8c5f80a08ec7.png', 3, 1, 38),
(90, 'Ресурсы ultron', '1804976f428e9c84455b281830ba37b4.png', 4, 1, 39),
(93, 'новый разде', '82fa6971894fcda96e4297e8c2f9e41c.png', 7, 0, 41),
(94, 'Раздел 1', 'a1f69be3f4b70928141b34b69fea2afa.png', 8, 0, 44);

-- --------------------------------------------------------

--
-- Структура таблицы `PAGES_MAVIE`
--
-- Создание: Фев 04 2023 г., 15:58
-- Последнее обновление: Фев 04 2023 г., 17:40
--

DROP TABLE IF EXISTS `PAGES_MAVIE`;
CREATE TABLE `PAGES_MAVIE` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(2000) NOT NULL,
  `IMG_SRC` varchar(2000) NOT NULL,
  `POSITION` int(11) NOT NULL,
  `VISIBILITY` int(1) NOT NULL DEFAULT '1',
  `ID_PAGE_TYPE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `PAGES_MAVIE`
--

INSERT INTO `PAGES_MAVIE` (`ID`, `NAME`, `IMG_SRC`, `POSITION`, `VISIBILITY`, `ID_PAGE_TYPE`) VALUES
(1, 'asdsa', '8bfbdaa7b8fcb33fb8304deac5660433.png', 1, 1, 1),
(2, 'geageag', '35333b69d3f1b72dbb2bc0a2e647b7ca.png', 2, 1, 2),
(3, 'geageag', '45e02198ce5b656d3eab10ba93f52298.png', 3, 1, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `PAGES_TYPE`
--
-- Создание: Янв 13 2023 г., 15:42
-- Последнее обновление: Фев 03 2023 г., 11:14
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
(36, NULL, NULL, 1, '? Разделы ли ?'),
(37, 'Узнайте подробнее', NULL, 3, 'продвижение'),
(38, 'Подготовьтесь основательно!', NULL, 2, 'Для продвижения'),
(39, NULL, '4125cff6100a14f62951435356f9178a.png', 4, 'ресурсы ultron'),
(40, 'Подзаголовок', NULL, 2, 'Заголовок'),
(41, NULL, NULL, 1, '1'),
(42, NULL, '54870444a7b6eb5eac53832f78068fbc.png', 4, 'биржи'),
(43, NULL, '50bfa614698720ce22d00879dd00a8c6.png', 4, 'Аналитика'),
(44, 'Тут пробуем собирать ', NULL, 2, 'Тип страницы');

-- --------------------------------------------------------

--
-- Структура таблицы `PAGES_TYPE_MAVIE`
--
-- Создание: Фев 04 2023 г., 15:52
-- Последнее обновление: Фев 04 2023 г., 17:40
--

DROP TABLE IF EXISTS `PAGES_TYPE_MAVIE`;
CREATE TABLE `PAGES_TYPE_MAVIE` (
  `ID` int(11) NOT NULL,
  `SUBTITLE` varchar(2000) DEFAULT NULL,
  `IMG_SRC` varchar(2000) DEFAULT NULL,
  `TYPE` int(11) NOT NULL,
  `TITLE` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `PAGES_TYPE_MAVIE`
--

INSERT INTO `PAGES_TYPE_MAVIE` (`ID`, `SUBTITLE`, `IMG_SRC`, `TYPE`, `TITLE`) VALUES
(1, NULL, NULL, 1, 'geageag'),
(2, '2ggg', NULL, 2, 'rhshsrh'),
(3, 'geag', NULL, 2, 'eagaeg');

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
-- Индексы таблицы `CARDS_CONTENT_MAVIE`
--
ALTER TABLE `CARDS_CONTENT_MAVIE`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CARDS_CONTENT_MAVIE_ibfk_1` (`ID_CARD`);

--
-- Индексы таблицы `CARDS_MAVIE`
--
ALTER TABLE `CARDS_MAVIE`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_PAGE` (`ID_PAGE`);

--
-- Индексы таблицы `DOCUMENTS`
--
ALTER TABLE `DOCUMENTS`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `DOCUMENTS_MAVIE`
--
ALTER TABLE `DOCUMENTS_MAVIE`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `PAGES`
--
ALTER TABLE `PAGES`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_PAGE_TYPE` (`ID_PAGE_TYPE`);

--
-- Индексы таблицы `PAGES_MAVIE`
--
ALTER TABLE `PAGES_MAVIE`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_PAGE_TYPE` (`ID_PAGE_TYPE`);

--
-- Индексы таблицы `PAGES_TYPE`
--
ALTER TABLE `PAGES_TYPE`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `PAGES_TYPE_MAVIE`
--
ALTER TABLE `PAGES_TYPE_MAVIE`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `CARDS`
--
ALTER TABLE `CARDS`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT для таблицы `CARDS_CONTENT`
--
ALTER TABLE `CARDS_CONTENT`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT для таблицы `CARDS_CONTENT_MAVIE`
--
ALTER TABLE `CARDS_CONTENT_MAVIE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `CARDS_MAVIE`
--
ALTER TABLE `CARDS_MAVIE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `DOCUMENTS`
--
ALTER TABLE `DOCUMENTS`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `DOCUMENTS_MAVIE`
--
ALTER TABLE `DOCUMENTS_MAVIE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `PAGES`
--
ALTER TABLE `PAGES`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT для таблицы `PAGES_MAVIE`
--
ALTER TABLE `PAGES_MAVIE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `PAGES_TYPE`
--
ALTER TABLE `PAGES_TYPE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT для таблицы `PAGES_TYPE_MAVIE`
--
ALTER TABLE `PAGES_TYPE_MAVIE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- Ограничения внешнего ключа таблицы `CARDS_CONTENT_MAVIE`
--
ALTER TABLE `CARDS_CONTENT_MAVIE`
  ADD CONSTRAINT `CARDS_CONTENT_MAVIE_ibfk_1` FOREIGN KEY (`ID_CARD`) REFERENCES `CARDS_MAVIE` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `CARDS_MAVIE`
--
ALTER TABLE `CARDS_MAVIE`
  ADD CONSTRAINT `CARDS_MAVIE_ibfk_1` FOREIGN KEY (`ID_PAGE`) REFERENCES `PAGES_MAVIE` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `PAGES`
--
ALTER TABLE `PAGES`
  ADD CONSTRAINT `PAGES_ibfk_1` FOREIGN KEY (`ID_PAGE_TYPE`) REFERENCES `PAGES_TYPE` (`ID`);

--
-- Ограничения внешнего ключа таблицы `PAGES_MAVIE`
--
ALTER TABLE `PAGES_MAVIE`
  ADD CONSTRAINT `PAGES_MAVIE_ibfk_1` FOREIGN KEY (`ID_PAGE_TYPE`) REFERENCES `PAGES_TYPE_MAVIE` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
