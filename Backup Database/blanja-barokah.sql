-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Sep 2020 pada 10.15
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blanja-barokah`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `nameCategory` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`id`, `nameCategory`) VALUES
(1, 'T-Shirt'),
(2, 'Shorts'),
(3, 'Jacket'),
(4, 'Pants');

-- --------------------------------------------------------

--
-- Struktur dari tabel `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL,
  `countItem` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `image` varchar(256) NOT NULL,
  `price` int(11) NOT NULL,
  `color` varchar(64) NOT NULL,
  `category` varchar(64) NOT NULL,
  `size` int(11) NOT NULL,
  `brand` varchar(256) NOT NULL,
  `author` varchar(64) NOT NULL,
  `rate` int(11) NOT NULL,
  `chat` varchar(256) NOT NULL,
  `condition` varchar(64) NOT NULL,
  `stock` int(11) NOT NULL,
  `description` text NOT NULL,
  `idCategory` int(11) NOT NULL,
  `idSeller` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `price`, `color`, `category`, `size`, `brand`, `author`, `rate`, `chat`, `condition`, `stock`, `description`, `idCategory`, `idSeller`) VALUES
(1, 'Men\'s formal suit - Black & White', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQj6deO2OE3dF_1tMehUn5IFkKhi3IJqI7aEw&usqp=CAU', 40000, 'black', 'man', 28, 'adidas', 'Zalora Cloth', 10, '', 'New', 10, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non magna rutrum, pellentesque augue eu, sagittis velit. Phasellus quis laoreet dolor. Fusce nec pharetra quam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Praesent sed enim vel turpis blandit imperdiet ac ac felis. Etiam tincidunt tristique placerat.', 1, 0),
(2, 'Woman\'s formal suit - Black & White', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQj6deO2OE3dF_1tMehUn5IFkKhi3IJqI7aEw&usqp=CAU', 80000, 'pink', 'woman', 24, 'nevada', 'Zalora Cloth', 10, '', 'New', 100, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non magna rutrum, pellentesque augue eu, sagittis velit. Phasellus quis laoreet dolor. Fusce nec pharetra quam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Praesent sed enim vel turpis blandit imperdiet ac ac felis. Etiam tincidunt tristique placerat.', 1, 1),
(3, 'Woman\'s formal suit - Black & White 2', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQj6deO2OE3dF_1tMehUn5IFkKhi3IJqI7aEw&usqp=CAU', 80000, 'red', 'woman', 27, 'nevada', 'Zalora Cloth', 10, '', 'New', 20, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non magna rutrum, pellentesque augue eu, sagittis velit. Phasellus quis laoreet dolor. Fusce nec pharetra quam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Praesent sed enim vel turpis blandit imperdiet ac ac felis. Etiam tincidunt tristique placerat.', 1, 1),
(4, 'Men\'s formal suit - Black & White 2', 'http://localhost:4000/uploads/1599668062484-jas1.jpg', 50000, 'white, black', 'man', 35, 'Nevada', 'Matahari', 10, '', 'New', 100, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non magna rutrum, pellentesque augue eu, sagittis velit. Phasellus quis laoreet dolor. Fusce nec pharetra quam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Praesent sed enim vel turpis blandit imperdiet ac ac felis. Etiam tincidunt tristique placerat.', 2, 1);
-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `image` varchar(256) NOT NULL,
  `gender` int(11) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `phoneNumber` int(11) NOT NULL,
  `storeName` varchar(64) NOT NULL,
  `storeDescription` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `address` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `roleId`, `name`, `email`, `image`, `gender`, `dateOfBirth`, `phoneNumber`, `storeName`, `storeDescription`, `password`, `address`) VALUES
(1, 1, 'barokah', 'barokah@gmail.com', '', 0, '0000-00-00', 2147483647, 'Barokah Shop', '', '$2a$10$RuSVcPqMgiZ96/oq7OYiCumWy12pknY8jdSfPojL7Dwb01oIuFyb6', ''),
(2, 2, 'putri', 'put@gmail.com', '', 0, '0000-00-00', 0, '', '', '$2a$10$TmcM42mdw6rXm8qgj1Dnh./8N/caYYoSmxGC9qOtXQAAnKGHfXI0u', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
