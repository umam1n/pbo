-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 31, 2024 at 12:18 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movies_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `genre` varchar(100) NOT NULL,
  `duration` int(11) NOT NULL,
  `poster_url` varchar(255) NOT NULL,
  `synopsis` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `genre`, `duration`, `poster_url`, `synopsis`) VALUES
(1, 'The Shawshank Redemption', 'Drama', 142, 'https://via.placeholder.com/150?text=Shawshank', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.'),
(2, 'The Godfather', 'Crime, Drama', 175, 'https://resizing.flixster.com/9KjAgFsQic55HwYqIDTP_BajqOA=/620x336/v2/https://statcdn.fandango.com/MPX/image/NBCU_Fandango/422/535/thumb_8DDE349D-3FE0-43FA-B851-B29436A6E7B7.jpg', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.'),
(3, 'The Dark Knight', 'Action, Crime, Drama', 152, 'https://via.placeholder.com/150?text=Dark+Knight', 'When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham.'),
(4, 'Inception', 'Action, Adventure, Sci-Fi', 148, 'https://via.placeholder.com/150?text=Inception', 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.'),
(5, 'Fight Club', 'Drama', 139, 'https://via.placeholder.com/150?text=Fight+Club', 'An insomniac office worker and a devil-may-care soapmaker form an underground fight club that evolves into much more.'),
(6, 'Forrest Gump', 'Drama, Romance', 142, 'https://via.placeholder.com/150?text=Forrest+Gump', 'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama man with an IQ of 75.'),
(7, 'The Matrix', 'Action, Sci-Fi', 136, 'https://via.placeholder.com/150?text=Matrix', 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.'),
(8, 'Gladiator', 'Action, Adventure, Drama', 155, 'https://via.placeholder.com/150?text=Gladiator', 'A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.'),
(9, 'The Lord of the Rings: The Fellowship of the Ring', 'Adventure, Drama, Fantasy', 178, 'https://via.placeholder.com/150?text=LOTR+Fellowship', 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.'),
(10, 'Pulp Fiction', 'Crime, Drama', 154, 'https://via.placeholder.com/150?text=Pulp+Fiction', 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.'),
(11, 'Interstellar', 'Adventure, Drama, Sci-Fi', 169, 'https://via.placeholder.com/150?text=Interstellar', 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.'),
(12, 'The Lion King', 'Animation, Adventure, Drama', 88, 'https://via.placeholder.com/150?text=Lion+King', 'Lion prince Simba and his father are targeted by his bitter uncle, who wants to ascend the throne himself.'),
(13, 'Titanic', 'Drama, Romance', 195, 'https://via.placeholder.com/150?text=Titanic', 'A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.'),
(14, 'Avengers: Endgame', 'Action, Adventure, Drama', 181, 'https://via.placeholder.com/150?text=Avengers+Endgame', 'After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more to reverse Thanos\' actions and restore balance.'),
(15, 'The Avengers', 'Action, Adventure, Sci-Fi', 143, 'https://via.placeholder.com/150?text=Avengers', 'Earth\'s mightiest heroes must come together and learn to fight as a team if they are going to stop the mischievous Loki and his alien army from enslaving humanity.'),
(16, 'Star Wars: Episode IV - A New Hope', 'Action, Adventure, Fantasy', 121, 'https://via.placeholder.com/150?text=Star+Wars+IV', 'Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, a wookiee and two droids to save the galaxy from the Empire\'s world-destroying battle station, while also attempting to rescue Princess Leia.'),
(17, 'The Silence of the Lambs', 'Crime, Drama, Thriller', 118, 'https://via.placeholder.com/150?text=Silence+of+the+Lambs', 'A young F.B.I. cadet must receive the help of an incarcerated and manipulative cannibal killer to catch another serial killer, a madman who skins his victims.'),
(18, 'Saving Private Ryan', 'Drama, War', 169, 'https://via.placeholder.com/150?text=Saving+Ryan', 'Following the Normandy Landings, a group of U.S. soldiers go behind enemy lines to retrieve a paratrooper whose brothers have been killed in action.'),
(19, 'Joker', 'Crime, Drama, Thriller', 122, 'https://via.placeholder.com/150?text=Joker', 'In Gotham City, mentally troubled comedian Arthur Fleck is disregarded and mistreated by society.'),
(20, 'Parasite', 'Comedy, Drama, Thriller', 132, 'https://via.placeholder.com/150?text=Parasite', 'Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(1, 'user1', 'password123', 'user'),
(2, 'admin', 'adminpass', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `user_watch_history`
--

CREATE TABLE `user_watch_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `watched_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_watch_history`
--

INSERT INTO `user_watch_history` (`id`, `user_id`, `movie_id`, `watched_at`) VALUES
(1, 1, 2, '2024-12-30 22:23:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_watch_history`
--
ALTER TABLE `user_watch_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_watch_history`
--
ALTER TABLE `user_watch_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_watch_history`
--
ALTER TABLE `user_watch_history`
  ADD CONSTRAINT `user_watch_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_watch_history_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
