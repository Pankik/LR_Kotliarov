-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 16 2021 г., 10:53
-- Версия сервера: 8.0.24
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kino`
--

-- --------------------------------------------------------

--
-- Структура таблицы `clienty`
--

CREATE TABLE `clienty` (
  `id` int NOT NULL,
  `FIO` varchar(255) DEFAULT NULL,
  `DataRozdenia` datetime DEFAULT NULL,
  `Adress` varchar(255) DEFAULT NULL,
  `Pol` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `filmy`
--

CREATE TABLE `filmy` (
  `id` int NOT NULL,
  `Kartinka` blob,
  `Imya` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Opisanie` varchar(255) DEFAULT NULL,
  `Stoimost` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `filmzanr`
--

CREATE TABLE `filmzanr` (
  `id` int NOT NULL,
  `idFilma` int DEFAULT NULL,
  `idZanra` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `prodavci`
--

CREATE TABLE `prodavci` (
  `id` int NOT NULL,
  `Foto` blob,
  `FIO` varchar(255) DEFAULT NULL,
  `Dolznost` varchar(255) DEFAULT NULL,
  `Zarplata` int DEFAULT NULL,
  `DataRozdenia` datetime DEFAULT NULL,
  `Adres` varchar(255) DEFAULT NULL,
  `Interesy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `VK` varchar(255) DEFAULT NULL,
  `GrupaKrovi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `RezusFactor` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `zakazy`
--

CREATE TABLE `zakazy` (
  `id` int NOT NULL,
  `idFilma` int DEFAULT NULL,
  `idclienta` int DEFAULT NULL,
  `idProdavca` int DEFAULT NULL,
  `DataZakaza` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `zanry`
--

CREATE TABLE `zanry` (
  `id` int NOT NULL,
  `Imya` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Opisanie` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `clienty`
--
ALTER TABLE `clienty`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `filmy`
--
ALTER TABLE `filmy`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `filmzanr`
--
ALTER TABLE `filmzanr`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idFilm` (`idFilma`),
  ADD KEY `idZanr` (`idZanra`);

--
-- Индексы таблицы `prodavci`
--
ALTER TABLE `prodavci`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `zakazy`
--
ALTER TABLE `zakazy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idFilm` (`idFilma`),
  ADD KEY `idProdavec` (`idProdavca`),
  ADD KEY `idclient` (`idclienta`);

--
-- Индексы таблицы `zanry`
--
ALTER TABLE `zanry`
  ADD PRIMARY KEY (`id`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `filmzanr`
--
ALTER TABLE `filmzanr`
  ADD CONSTRAINT `filmzanr_ibfk_1` FOREIGN KEY (`idFilma`) REFERENCES `filmy` (`id`),
  ADD CONSTRAINT `filmzanr_ibfk_2` FOREIGN KEY (`idZanra`) REFERENCES `zanry` (`id`);

--
-- Ограничения внешнего ключа таблицы `zakazy`
--
ALTER TABLE `zakazy`
  ADD CONSTRAINT `zakazy_ibfk_1` FOREIGN KEY (`idFilma`) REFERENCES `filmy` (`id`),
  ADD CONSTRAINT `zakazy_ibfk_2` FOREIGN KEY (`idProdavca`) REFERENCES `prodavci` (`id`),
  ADD CONSTRAINT `zakazy_ibfk_3` FOREIGN KEY (`idclienta`) REFERENCES `clienty` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
