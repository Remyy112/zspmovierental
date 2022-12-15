-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 15 Gru 2022, 12:56
-- Wersja serwera: 10.4.25-MariaDB
-- Wersja PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `wypozyczalnia`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(45) DEFAULT NULL,
  `movielist_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `categories`
--

INSERT INTO `categories` (`id`, `category`, `movielist_id`) VALUES
(1, 'Action', 1),
(2, 'Horror', 2),
(3, 'Comedy', 3),
(4, 'Dramat', 4),
(5, 'Romance', 5),
(6, 'Fantasy', 6),
(7, 'Thriller', 7),
(8, 'Mystery', 8);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `movieslist`
--

CREATE TABLE `movieslist` (
  `id` int(11) NOT NULL,
  `Title` varchar(45) DEFAULT NULL,
  `Author` varchar(45) DEFAULT NULL,
  `Category` varchar(45) DEFAULT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `movieslist`
--

INSERT INTO `movieslist` (`id`, `Title`, `Author`, `Category`, `users_id`) VALUES
(1, 'Morbius', 'Daniel Espinosa', 'Action', 1),
(2, 'American Psycho', 'Mary Harron', 'Horror', 2),
(3, 'Free guy', 'Shawn Levy', 'Comedy', 3),
(4, 'Joker', 'Todd Phillips', 'Dramat', 4),
(5, 'Cyrano', 'Joe Wright', 'Romance', 5),
(6, 'Black Adam', 'Jaume Collet-Serra', 'Fantasy', 6),
(7, 'Memory', 'Martin Campbell', 'Thriller', 7),
(8, 'Rebeka', 'Ben Wheatley', 'Mystery', 8);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `sname` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `isadmin` varchar(45) DEFAULT NULL,
  `rentalmovie` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `name`, `sname`, `username`, `email`, `password`, `isadmin`, `rentalmovie`) VALUES
(1, 'Bartosz', 'Roslaniec', 'CivicMaster', 'rosol2115@gmail.com', 'civic98', 'no', 'Morbius'),
(2, 'Tomek', 'Szczerba', 'bmwdriver112', 'tomaszczerba@gmail.com', 'e46driveR', 'no', 'American Psycho'),
(3, 'Cezary', 'Stranc', 'vwpoloKing', 'czarekpolo@gmail.com', 'Polonajlepszekochamje1', 'yes', 'Free guy'),
(4, 'Joachim', 'Jalowski', 'Traktorzysta', 'polskirolnik2115@gmail.com', 'Nizer303', 'no', 'Joker'),
(5, 'Fabian', 'Sucholas', 'OgTeemoMain', 'LoLMasterTeemo@gmail.com', 'BuffHeimerdinger9', 'yes', 'Cyrano'),
(6, 'Kasia', 'Strzała', 'Karrow11', 'strzala22@gmail.com', 'kasia1122', 'no', 'Black Adam'),
(7, 'Danuta', 'Rynna', 'danuta211pl', 'rynna16@gmail.com', 'rynna1111', 'no', 'Memory'),
(8, 'Alicja', 'Opelowska', 'OpelAla2', 'Opelowska@gmail.com', 'opelastra99', 'yes', 'Rebeka'),
(9, 'Mateusz', 'Bochniak', 'Fiestathebest', 'matiford@gmail.com', 'fordpl', 'no', NULL),
(10, 'Kacper', 'Bartkowiak', 'Opelenjoyer', 'Opelenjoyer@gmail.com', 'kochamopla', 'no', NULL);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`,`movielist_id`),
  ADD KEY `fk_category_movielist_idx` (`movielist_id`);

--
-- Indeksy dla tabeli `movieslist`
--
ALTER TABLE `movieslist`
  ADD PRIMARY KEY (`id`,`users_id`),
  ADD KEY `fk_movielist_users1_idx` (`users_id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `movieslist`
--
ALTER TABLE `movieslist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_category_movielist` FOREIGN KEY (`movielist_id`) REFERENCES `movieslist` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `movieslist`
--
ALTER TABLE `movieslist`
  ADD CONSTRAINT `fk_movielist_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
