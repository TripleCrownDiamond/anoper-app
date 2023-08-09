-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 09 août 2023 à 01:14
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `c1954440c_anoperdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `arrondissements`
--

CREATE TABLE `arrondissements` (
  `idArrondissements` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `FkCommunes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `arrondissements`
--

INSERT INTO `arrondissements` (`idArrondissements`, `name`, `FkCommunes`) VALUES
(1, 'Banikoara', 1),
(2, 'Founougo', 1),
(3, 'Toura', 1),
(4, 'Soroko', 1),
(5, 'Somp&eacute;r&eacute;kou', 1),
(6, 'Ounet', 1),
(7, 'Kokiborou', 1),
(8, 'Kokey', 1),
(12, 'Goumori', 1),
(13, 'Gomparou', 1),
(14, 'Gogounou', 2),
(15, 'Bagou', 2),
(16, 'Gounarou', 2),
(17, 'Copargo', 8),
(18, 'Sompérékou', 1),
(24, 'Ouara', 2),
(25, 'Sori', 2),
(26, 'Zoungou-Pantrossi', 2),
(27, 'Angaradébou', 3),
(28, 'Bensékou', 3),
(29, 'Donwari', 3),
(30, 'Kandi I', 3),
(31, 'Kandi II', 3),
(32, 'Kandi III', 3),
(33, 'Kassakou', 3),
(34, 'Saah', 3),
(35, 'Sam', 3),
(36, 'Sonsoro', 3),
(37, 'Birni Lafia', 4),
(38, 'Bogo-Bogo', 4),
(39, 'Karimama', 4),
(40, 'Kompa', 4),
(41, 'Monsey', 4),
(42, 'Garou', 5),
(43, 'Guéné2', 5),
(44, 'Malanville', 5),
(45, 'Madécali', 5),
(46, 'Toumboutou', 5),
(47, 'Akiza', 42),
(48, 'Avlamè', 42),
(49, 'Cana I', 42),
(50, 'Cana II', 42),
(51, 'Domè', 42),
(52, 'Koussoukpa', 42),
(53, 'Kpokissa', 42),
(54, 'Massi', 42),
(55, 'Tanwé-Hessou', 42),
(56, 'Zogbodomey', 42),
(57, 'Zoukou', 42),
(58, 'Libantè', 6),
(59, 'Liboussou', 6),
(60, 'Lougou', 6),
(61, 'Segbana', 6),
(62, 'Sokotindji', 6),
(68, 'Brignamaro', 27),
(69, 'Firou', 27),
(70, 'Kérou', 27),
(71, 'Koabagou', 27),
(72, 'Boukoumbé', 25),
(73, 'Dipoli', 25),
(74, 'Korontière', 25),
(75, 'Kossoucoingou', 25),
(76, 'Manta', 25),
(77, 'Natta', 25),
(78, 'Tabota', 25),
(79, 'Cobly', 26),
(80, 'Datori', 26),
(81, 'Kountori', 26),
(82, 'Tapoga', 26),
(83, 'Birni', 28),
(84, 'Chabi-Couma', 28),
(85, 'Fô-Tancé', 28),
(86, 'Guilmaro', 28),
(87, 'Kouandé', 28),
(88, 'Oroukayo', 28),
(89, 'Dassari', 29),
(90, 'Gouandé', 29),
(91, 'Matéri', 29),
(92, 'Nodi', 29),
(93, 'Tantéga', 29),
(94, 'Tchianhoun-Cossi', 29),
(95, 'Kotopounga', 30),
(96, 'Kouaba', 30),
(97, 'Koundata', 30),
(98, 'Natitingou I', 30),
(99, 'Natitingou II', 30),
(100, 'Natitingou III', 30),
(101, 'Natitingou IV', 30),
(102, 'Perma', 30),
(103, 'Tchoumi-Tchoumi', 30),
(104, 'Gnémasson', 31),
(105, 'Péhunco', 31),
(106, 'Tobré', 31),
(107, 'Cotiakou', 32),
(108, 'N\'Dahonta', 32),
(109, 'Taiakou', 32),
(110, 'Tanguiéta', 32),
(111, 'Tanongou', 32),
(112, 'Kouarfa', 33),
(113, 'Tampégré', 33),
(114, 'Toucountouna', 33),
(115, 'Abomey-Calavi', 61),
(116, 'Akassato', 61),
(117, 'Godomey', 61),
(118, 'Glo-Djigbé', 61),
(119, 'Hêvié', 61),
(120, 'Kpanroun', 61),
(121, 'Ouèdo', 61),
(122, 'Togba', 61),
(123, 'Zinvié', 61),
(124, 'Agbanou', 62),
(125, 'Ahouannonzoun', 62),
(126, 'Allada', 62),
(127, 'Attogon', 62),
(128, 'Avakpa', 62),
(129, 'Ayou', 62),
(130, 'Hinvi', 62),
(131, 'Lissègazoun', 62),
(132, 'Lon-Agonmey', 62),
(133, 'Sekou', 62),
(134, 'Togoudo', 62),
(135, 'Tokpa-Avagoudo', 62),
(136, 'Aganmalomè', 63),
(137, 'Agbanto', 63),
(138, 'Agonkanmè', 63),
(139, 'Dédomè', 63),
(140, 'Dékanmè', 63),
(141, 'Kpomassè', 63),
(142, 'Sègbèya', 63),
(143, 'Sègbohouè', 63),
(144, 'Tokpa-Domè', 63),
(145, 'Avlékété', 64),
(146, 'Djègbadji', 64),
(147, 'Gakpé', 64),
(148, 'Houakpè-Daho', 64),
(149, 'Ouidah I', 64),
(150, 'Ouidah II', 64),
(151, 'Ouidah III', 64),
(152, 'Ouidah IV', 64),
(153, 'Pahou', 64),
(154, 'Savi', 64),
(155, 'Ahomey-Lokpo', 65),
(156, 'Dékanmey', 65),
(157, 'Ganvié I', 65),
(158, 'Ganvié II', 65),
(159, 'Houédo-Aguékon', 65),
(160, 'Sô-Ava', 65),
(161, 'Vekky', 65),
(162, 'Agué', 66),
(163, 'Colli-Agbamè', 66),
(164, 'Coussi', 66),
(165, 'Damè', 66),
(166, 'Djanglanmè', 66),
(167, 'Houègbo', 66),
(168, 'Kpomè', 66),
(169, 'Sè', 66),
(170, 'Sèhouè', 66),
(171, 'Toffo-Agué', 66),
(172, 'Avamè', 67),
(173, 'Azohouè-Aliho', 67),
(174, 'Azohouè-Cada', 67),
(175, 'Tori-Bossito', 67),
(176, 'Tori-Cada', 67),
(177, 'Tori-Gare', 67),
(178, 'Tori aïdohoue', 67),
(179, 'Tori acadjamè', 67),
(180, 'Adjan', 68),
(181, 'Dawè', 68),
(182, 'Djigbé', 68),
(183, 'Dodji-Bata', 68),
(184, 'Hèkanmé', 68),
(185, 'Koundokpoé', 68),
(186, 'Sèdjè-Dénou', 68),
(187, 'Sèdjè-Houégoudo', 68),
(188, 'Tangbo-Djevié', 68),
(189, 'Yokpo', 68),
(190, 'Zè', 68),
(191, 'Bembéréké', 11),
(192, 'Béroubouay', 11),
(193, 'Bouanri', 11),
(194, 'Gamia', 11),
(195, 'Ina', 11),
(201, 'Kalalé', 12),
(202, 'Basso', 12),
(203, 'Bouka', 12),
(204, 'Dérassi', 12),
(205, 'Dunkassa', 12),
(206, 'Péonga', 12),
(213, 'N\'Dali', 13),
(214, 'Bori', 13),
(215, 'Gbégourou', 13),
(216, 'Ouénou', 13),
(217, 'Sirarou', 13),
(218, 'Nikki', 14),
(219, 'Biro', 14),
(220, 'Gnonkourakali', 14),
(222, 'Sérékalé', 14),
(223, 'Suya', 14),
(224, 'Tasso', 14),
(230, '1er arrondissement de Parakou', 15),
(231, '2e arrondissement de Parakou', 15),
(232, '3e arrondissement de Parakou', 15),
(240, 'Pèrèrè', 16),
(241, 'Gninsy', 16),
(242, 'Guinagourou', 16),
(243, 'Kpané', 16),
(244, 'Pébié', 16),
(245, 'Sontou', 16),
(249, 'Sinendé', 17),
(250, 'Fô-Bourè', 17),
(251, 'Sèkèrè', 17),
(252, 'Sikki', 17),
(259, 'Tchaourou', 18),
(260, 'Alafiarou', 18),
(261, 'Bétérou', 18),
(262, 'Goro', 18),
(263, 'Kika', 18),
(264, 'Sanson', 18),
(265, 'Tchatchou', 18),
(277, 'Agoua', 19),
(278, 'Akpassi', 19),
(279, 'Atokoligbé', 19),
(280, 'Bantè', 19),
(281, 'Bobè', 19),
(282, 'Gouka', 19),
(283, 'Koko', 19),
(284, 'Lougba', 19),
(285, 'Pira', 19),
(286, 'Agoua', 19),
(287, 'Akpassi', 19),
(288, 'Atokoligbé', 19),
(289, 'Bantè', 19),
(290, 'Bobè', 19),
(291, 'Gouka', 19),
(292, 'Koko', 19),
(293, 'Lougba', 19),
(294, 'Pira', 19),
(295, 'Akofodjoulè', 20),
(296, 'Dassa I', 20),
(297, 'Dassa II', 20),
(298, 'Gbaffo', 20),
(299, 'Kerè', 20),
(300, 'Kpingni', 20),
(301, 'Lèma', 20),
(302, 'Paouignan', 20),
(303, 'Soclogbo', 20),
(304, 'Tré', 20),
(305, 'Akofodjoulè', 20),
(306, 'Dassa I', 20),
(307, 'Dassa II', 20),
(308, 'Gbaffo', 20),
(309, 'Kerè', 20),
(310, 'Kpingni', 20),
(311, 'Lèma', 20),
(312, 'Paouignan', 20),
(313, 'Soclogbo', 20),
(314, 'Tré', 20),
(315, 'Aklankpa', 21),
(316, 'Assanté', 21),
(317, 'Glazoué', 21),
(318, 'Gomè', 21),
(319, 'Kpakpaza', 21),
(320, 'Magoumi', 21),
(321, 'Ouèdèmè', 21),
(322, 'Sokponta', 21),
(323, 'Thio', 21),
(324, 'Zaffé', 21),
(325, 'Aklankpa', 21),
(326, 'Assanté', 21),
(327, 'Glazoué', 21),
(328, 'Gomè', 21),
(329, 'Kpakpaza', 21),
(330, 'Magoumi', 21),
(331, 'Ouèdèmè', 21),
(332, 'Sokponta', 21),
(333, 'Thio', 21),
(334, 'Zaffé', 21),
(335, 'Challa-Ogoi', 22),
(336, 'Djègbè', 22),
(337, 'Gbanlin', 22),
(338, 'Kémon', 22),
(339, 'Kilibo', 22),
(340, 'Laminou', 22),
(341, 'Odougba', 22),
(342, 'Ouèssè', 22),
(343, 'Toui', 22),
(344, 'Challa-Ogoi', 22),
(345, 'Djègbè', 22),
(346, 'Gbanlin', 22),
(347, 'Kémon', 22),
(348, 'Kilibo', 22),
(349, 'Laminou', 22),
(350, 'Odougba', 22),
(351, 'Ouèssè', 22),
(352, 'Toui', 22),
(353, 'Djaloukou', 23),
(354, 'Doumè', 23),
(355, 'Gobada', 23),
(356, 'Kpataba', 23),
(357, 'Lahotan', 23),
(358, 'Lèma', 23),
(359, 'Logozohè', 23),
(360, 'Monkpa', 23),
(361, 'Ottola', 23),
(362, 'Ouèssè', 23),
(363, 'Savalou-aga', 23),
(364, 'Savalou-agbado', 23),
(365, 'Savalou-attakè', 23),
(366, 'Tchetti', 23),
(367, 'Djaloukou', 23),
(368, 'Doumè', 23),
(369, 'Gobada', 23),
(370, 'Kpataba', 23),
(371, 'Lahotan', 23),
(372, 'Lèma', 23),
(373, 'Logozohè', 23),
(374, 'Monkpa', 23),
(375, 'Ottola', 23),
(376, 'Ouèssè', 23),
(377, 'Savalou-aga', 23),
(378, 'Savalou-agbado', 23),
(379, 'Savalou-attakè', 23),
(380, 'Tchetti', 23),
(381, 'Adido', 24),
(382, 'Bèssè', 24),
(383, 'Boni', 24),
(384, 'Kaboua', 24),
(385, 'Ofè', 24),
(386, 'Okpara', 24),
(387, 'Plateau', 24),
(388, 'Sakin', 24),
(389, 'Adido', 24),
(390, 'Bèssè', 24),
(391, 'Boni', 24),
(392, 'Kaboua', 24),
(393, 'Ofè', 24),
(394, 'Okpara', 24),
(395, 'Plateau', 24),
(396, 'Sakin', 24),
(397, 'Alédjo', 7),
(398, 'Bassila', 7),
(399, 'Manigri', 7),
(400, 'Pénéssoulou', 7),
(401, 'Alédjo', 7),
(402, 'Bassila', 7),
(403, 'Manigri', 7),
(404, 'Pénéssoulou', 7),
(405, 'Anandana', 8),
(406, 'Copargo', 8),
(407, 'Pabégou', 8),
(408, 'Singré', 8),
(409, 'Anandana', 8),
(410, 'Copargo', 8),
(411, 'Pabégou', 8),
(412, 'Singré', 8),
(413, 'Barei', 9),
(414, 'Bariénou', 9),
(415, 'Bélléfoungou', 9),
(416, 'Bougou', 9),
(417, 'Djougou I', 9),
(418, 'Djougou II', 9),
(419, 'Djougou III', 9),
(420, 'Kolokondé', 9),
(421, 'Onklou', 9),
(422, 'Patargo', 9),
(423, 'Pélébina', 9),
(424, 'Sérou', 9),
(425, 'Barei', 9),
(426, 'Bariénou', 9),
(427, 'Bélléfoungou', 9),
(428, 'Bougou', 9),
(429, 'Djougou I', 9),
(430, 'Djougou II', 9),
(431, 'Djougou III', 9),
(432, 'Kolokondé', 9),
(433, 'Onklou', 9),
(434, 'Patargo', 9),
(435, 'Pélébina', 9),
(436, 'Sérou', 9),
(437, 'Badjoudè', 10),
(438, 'Kondé', 10),
(439, 'Ouaké', 10),
(440, 'Sèmèrè I', 10),
(441, 'Sèmèrè II', 10),
(442, 'Tchalinga', 10),
(443, 'Badjoudè', 10),
(444, 'Kondé', 10),
(445, 'Ouaké', 10),
(446, 'Sèmèrè I', 10),
(447, 'Sèmèrè II', 10),
(448, 'Tchalinga', 10),
(449, 'Aplahoué', 43),
(450, 'Atomè', 43),
(451, 'Azovè', 43),
(452, 'Dekpo', 43),
(453, 'Godohou', 43),
(454, 'Kissamey', 43),
(455, 'Lonkly', 43),
(456, 'Adjintimey', 44),
(457, 'Bètoumey', 44),
(458, 'Djakotomey I', 44),
(459, 'Djakotomey II', 44),
(460, 'Gohomey', 44),
(461, 'Houègamey', 44),
(462, 'Kinkinhoué', 44),
(463, 'Kokohoué', 44),
(464, 'Kpoba', 44),
(465, 'Sokouhoué', 44),
(466, 'Ayomi', 45),
(467, 'Dèvè', 45),
(468, 'Honton', 45),
(469, 'Lokogohoué', 45),
(470, 'Madjrè', 45),
(471, 'Tota', 45),
(472, 'Totchagni', 45),
(473, 'Adjanhonmè', 46),
(474, 'Ahogbèya', 46),
(475, 'Aya-Hohoué', 46),
(476, 'Djotto', 46),
(477, 'Hondji', 46),
(478, 'Klouékanmè', 46),
(479, 'Lanta', 46),
(480, 'Tchikpé', 46),
(481, 'Adoukandji', 47),
(482, 'Ahondjinnako', 47),
(483, 'Ahomadegbe', 47),
(484, 'Banigbé', 47),
(485, 'Gnizounmè', 47),
(486, 'Hlassamè', 47),
(487, 'Lalo', 47),
(488, 'Lokogba', 47),
(489, 'Tchito', 47),
(490, 'Tohou', 47),
(491, 'Zalli', 47),
(492, 'Adjido', 48),
(493, 'Avédjin', 48),
(494, 'Doko', 48),
(495, 'Houédogli', 48),
(496, 'Missinko', 48),
(497, 'Tannou-Gola', 48),
(498, 'Toviklin', 48),
(499, '1er arrondissement de Cotonou', 60),
(500, '2e arrondissement de Cotonou', 60),
(501, '3e arrondissement de Cotonou', 60),
(502, '4e arrondissement de Cotonou', 60),
(503, '5e arrondissement de Cotonou', 60),
(504, '6e arrondissement de Cotonou', 60),
(505, '7e arrondissement de Cotonou', 60),
(506, '8e arrondissement de Cotonou', 60),
(507, '9e arrondissement de Cotonou', 60),
(508, '10e arrondissement de Cotonou', 60),
(509, '11e arrondissement de Cotonou', 60),
(510, '12e arrondissement de Cotonou', 60),
(511, '13e arrondissement de Cotonou', 60),
(512, '1er arrondissement de Cotonou', 60),
(513, '2e arrondissement de Cotonou', 60),
(514, '3e arrondissement de Cotonou', 60),
(515, '4e arrondissement de Cotonou', 60),
(516, '5e arrondissement de Cotonou', 60),
(517, '6e arrondissement de Cotonou', 60),
(518, '7e arrondissement de Cotonou', 60),
(519, '8e arrondissement de Cotonou', 60),
(520, '9e arrondissement de Cotonou', 60),
(521, '10e arrondissement de Cotonou', 60),
(522, '11e arrondissement de Cotonou', 60),
(523, '12e arrondissement de Cotonou', 60),
(524, '13e arrondissement de Cotonou', 60),
(525, 'Adohoun', 49),
(526, 'Atchannou', 49),
(527, 'Athiémé', 49),
(528, 'Dédékpoé', 49),
(529, 'Kpinnou', 49),
(530, 'Agbodji', 50),
(531, 'Badazoui', 50),
(532, 'Bopa', 50),
(533, 'Gbakpodji', 50),
(534, 'Lobogo', 50),
(535, 'Possotomè', 50),
(536, 'Yégodoé', 50),
(537, 'Agatogbo', 51),
(538, 'Akodéha', 51),
(539, 'Comè', 51),
(540, 'Ouèdèmè-Pédah', 51),
(541, 'Oumako', 51),
(542, 'Adjaha', 52),
(543, 'Agoué', 52),
(544, 'Avloh', 52),
(545, 'Djanglanmey', 52),
(546, 'Gbéhoué', 52),
(547, 'Grand-Popo', 52),
(548, 'Sazoué', 52),
(549, 'Dahé', 53),
(550, 'Doutou', 53),
(551, 'Honhoué', 53),
(552, 'Houéyogbé', 53),
(553, 'Sè', 53),
(554, 'Zoungbonou', 53),
(555, 'Agamé', 54),
(556, 'Houin', 54),
(557, 'Koudo', 54),
(558, 'Lokossa et Ouèdèmè', 54),
(559, 'Adjarra I', 69),
(560, 'Adjarra II', 69),
(561, 'Aglogbé', 69),
(562, 'Honvié', 69),
(563, 'Malanhoui', 69),
(564, 'Médédjonou', 69),
(565, 'Adjarra I', 69),
(566, 'Adjarra II', 69),
(567, 'Aglogbé', 69),
(568, 'Honvié', 69),
(569, 'Malanhoui', 69),
(570, 'Médédjonou', 69),
(571, 'Adjohoun', 70),
(572, 'Akpadanou', 70),
(573, 'Awonou', 70),
(574, 'Azowlissè', 70),
(575, 'Dèmè', 70),
(576, 'Gangban', 70),
(577, 'Kodè', 70),
(578, 'Togbota', 70),
(579, 'Adjohoun', 70),
(580, 'Akpadanou', 70),
(581, 'Awonou', 70),
(582, 'Azowlissè', 70),
(583, 'Dèmè', 70),
(584, 'Gangban', 70),
(585, 'Kodè', 70),
(586, 'Togbota', 70),
(587, 'Avagbodji', 71),
(588, 'Houédomè', 71),
(589, 'Zoungamè', 71),
(590, 'Akpro-Missérété', 72),
(591, 'Gomè-Sota', 72),
(592, 'Katagon', 72),
(593, 'Vakon', 72),
(594, 'Zodogbomey', 72),
(595, 'Avagbodji', 71),
(596, 'Houédomè', 71),
(597, 'Zoungamè', 71),
(598, 'Atchoukpa', 73),
(599, 'Avrankou', 73),
(600, 'Djomon', 73),
(601, 'Gbozounmè', 73),
(602, 'Kouty', 73),
(603, 'Ouanho', 73),
(604, 'Sado', 73),
(605, 'Akpro-Missérété', 72),
(606, 'Gomè-Sota', 72),
(607, 'Katagon', 72),
(608, 'Vakon', 72),
(609, 'Zodogbomey', 72),
(610, 'Affamè', 74),
(611, 'Atchonsa', 74),
(612, 'Bonou', 74),
(613, 'Damè-Wogon', 74),
(614, 'Houinviguè', 74),
(615, 'Atchoukpa', 73),
(616, 'Avrankou', 73),
(617, 'Djomon', 73),
(618, 'Gbozounmè', 73),
(619, 'Kouty', 73),
(620, 'Ouanho', 73),
(621, 'Sado', 73),
(622, 'Dangbo', 75),
(623, 'Dèkin', 75),
(624, 'Gbéko', 75),
(625, 'Houédomey', 75),
(626, 'Hozin', 75),
(627, 'Késsounou', 75),
(628, 'Zounguè', 75),
(629, 'Affamè', 74),
(630, 'Atchonsa', 74),
(631, 'Bonou', 74),
(632, 'Damè-Wogon', 74),
(633, 'Houinviguè', 74),
(634, '1er arrondissement', 76),
(635, '2e arrondissement', 76),
(636, '3e arrondissement', 76),
(637, '4e arrondissement', 76),
(638, '5e arrondissement', 76),
(639, 'Dangbo', 75),
(640, 'Dèkin', 75),
(641, 'Gbéko', 75),
(642, 'Houédomey', 75),
(643, 'Hozin', 75),
(644, 'Késsounou', 75),
(645, 'Zounguè', 75),
(646, 'Agblangandan', 77),
(647, 'Aholouyèmè', 77),
(648, 'Djèrègbè', 77),
(649, 'Ekpè', 77),
(650, 'Sèmè-Kpodji', 77),
(651, 'Tohouè', 77),
(652, '1er arrondissement', 76),
(653, '2e arrondissement', 76),
(654, '3e arrondissement', 76),
(655, '4e arrondissement', 76),
(656, '5e arrondissement', 76),
(657, 'Agblangandan', 77),
(658, 'Aholouyèmè', 77),
(659, 'Djèrègbè', 77),
(660, 'Ekpè', 77),
(661, 'Sèmè-Kpodji', 77),
(662, 'Tohouè', 77),
(663, 'Adja-Ouèrè', 55),
(664, 'Ikpinlè', 55),
(665, 'Kpoulou', 55),
(666, 'Massè', 55),
(667, 'Oko-Akarè', 55),
(668, 'Totonnoukon', 55),
(669, 'Adja-Ouèrè', 55),
(670, 'Ikpinlè', 55),
(671, 'Kpoulou', 55),
(672, 'Massè', 55),
(673, 'Oko-Akarè', 55),
(674, 'Totonnoukon', 55),
(675, 'Banigbé', 56),
(676, 'Daagbé', 56),
(677, 'Ifangni', 56),
(678, 'Ko-Koumolou', 56),
(679, 'Lagbé', 56),
(680, 'Tchaada', 56),
(681, 'Banigbé', 56),
(682, 'Daagbé', 56),
(683, 'Ifangni', 56),
(684, 'Ko-Koumolou', 56),
(685, 'Lagbé', 56),
(686, 'Tchaada', 56),
(687, 'Adakplamé', 57),
(688, 'Idigny', 57),
(689, 'Kpankou', 57),
(690, 'Kétou', 57),
(691, 'Odometa', 57),
(692, 'Okpometa', 57),
(693, 'Adakplamé', 57),
(694, 'Idigny', 57),
(695, 'Kpankou', 57),
(696, 'Kétou', 57),
(697, 'Odometa', 57),
(698, 'Okpometa', 57),
(699, 'Ahoyéyé', 58),
(700, 'Igana', 58),
(701, 'Issaba', 58),
(702, 'Pobè', 58),
(703, 'Towé', 58),
(704, 'Ahoyéyé', 58),
(705, 'Igana', 58),
(706, 'Issaba', 58),
(707, 'Pobè', 58),
(708, 'Towé', 58),
(709, 'Aguidi', 59),
(710, 'Ita-Djèbou', 59),
(711, 'Sakété I', 59),
(712, 'Sakété II', 59),
(713, 'Takon', 59),
(714, 'Yoko', 59),
(715, 'Aguidi', 59),
(716, 'Ita-Djèbou', 59),
(717, 'Sakété I', 59),
(718, 'Sakété II', 59),
(719, 'Takon', 59),
(720, 'Yoko', 59),
(721, 'Adja-Ouèrè', 55),
(722, 'Ikpinlè', 55),
(723, 'Kpoulou', 55),
(724, 'Massè', 55),
(725, 'Oko-Akarè', 55),
(726, 'Totonnoukon', 55),
(727, 'Adja-Ouèrè', 55),
(728, 'Ikpinlè', 55),
(729, 'Kpoulou', 55),
(730, 'Massè', 55),
(731, 'Oko-Akarè', 55),
(732, 'Totonnoukon', 55),
(733, 'Banigbé', 56),
(734, 'Daagbé', 56),
(735, 'Ifangni', 56),
(736, 'Ko-Koumolou', 56),
(737, 'Lagbé', 56),
(738, 'Tchaada', 56),
(739, 'Adakplamé', 57),
(740, 'Idigny', 57),
(741, 'Kpankou', 57),
(742, 'Kétou', 57),
(743, 'Odometa', 57),
(744, 'Okpometa', 57),
(745, 'Banigbé', 56),
(746, 'Daagbé', 56),
(747, 'Ifangni', 56),
(748, 'Ko-Koumolou', 56),
(749, 'Lagbé', 56),
(750, 'Tchaada', 56),
(751, 'Ahoyéyé', 58),
(752, 'Igana', 58),
(753, 'Issaba', 58),
(754, 'Pobè', 58),
(755, 'Towé', 58),
(756, 'Adakplamé', 57),
(757, 'Idigny', 57),
(758, 'Kpankou', 57),
(759, 'Kétou', 57),
(760, 'Odometa', 57),
(761, 'Okpometa', 57),
(762, 'Aguidi', 59),
(763, 'Ita-Djèbou', 59),
(764, 'Sakété I', 59),
(765, 'Sakété II', 59),
(766, 'Takon', 59),
(767, 'Yoko', 59),
(768, 'Ahoyéyé', 58),
(769, 'Igana', 58),
(770, 'Issaba', 58),
(771, 'Pobè', 58),
(772, 'Towé', 58),
(773, 'Aguidi', 59),
(774, 'Ita-Djèbou', 59),
(775, 'Sakété I', 59),
(776, 'Sakété II', 59),
(777, 'Takon', 59),
(778, 'Yoko', 59),
(779, 'Agbokpa', 34),
(780, 'Dètohou', 34),
(781, 'Djègbè', 34),
(782, 'Hounli', 34),
(783, 'Sèhoun', 34),
(784, 'Vidolè', 34),
(785, 'Zounzounmè', 34),
(786, 'Adahondjigon', 35),
(787, 'Adingningon', 35),
(788, 'Agbangnizoun', 35),
(789, 'Kinta', 35),
(790, 'Kpota', 35),
(791, 'Lissazounmè', 35),
(792, 'Sahé', 35),
(793, 'Siwé', 35),
(794, 'Tanvé', 35),
(795, 'Zoungoudo', 35),
(796, 'Agongointo', 36),
(797, 'Avogbanna', 36),
(798, 'Bohicon I', 36),
(799, 'Bohicon II', 36),
(800, 'Gnidjazoun', 36),
(801, 'Lissèzoun', 36),
(802, 'Ouassaho', 36),
(803, 'Passagon', 36),
(804, 'Saclo', 36),
(805, 'Sodohomè', 36),
(806, 'Adogbé', 37),
(807, 'Gounli', 37),
(808, 'Houéko', 37),
(809, 'Houen-Hounso', 37),
(810, 'Lainta-Cogbè', 37),
(811, 'Naogon', 37),
(812, 'Soli', 37),
(813, 'Zogba', 37),
(814, 'Agondji', 38),
(815, 'Agouna', 38),
(816, 'Dan', 38),
(817, 'Djidja', 38),
(818, 'Dohouimè', 38),
(819, 'Gobaix', 38),
(820, 'Monsourou', 38),
(821, 'Mougnon', 38),
(822, 'Oungbègamè', 38),
(823, 'Houto', 38),
(824, 'Setto', 38),
(825, 'Zoukon', 38),
(826, 'Dasso', 39),
(827, 'Ouinhi', 39),
(828, 'Sagon', 39),
(829, 'Tohoué', 39),
(830, 'Allahé', 41),
(831, 'Assalin', 41),
(832, 'Houngomey', 41),
(833, 'Kpakpamè', 41),
(834, 'Kpozoun', 41),
(835, 'Za-Kpota', 41),
(836, 'Za-Tanta', 41),
(837, 'Zèko', 41),
(838, 'Agonli-Houégbo', 40),
(839, 'Banamè', 40),
(840, 'N\'-Tan', 40),
(841, 'Dovi', 40),
(842, 'Kpédékpo', 40),
(843, 'Zagnanado', 40),
(844, 'Akiza', 42),
(845, 'Avlamè', 42),
(846, 'Cana I', 42),
(847, 'Cana II', 42),
(848, 'Domè', 42),
(849, 'Koussoukpa', 42),
(850, 'Kpokissa', 42),
(851, 'Massi', 42),
(852, 'Tanwé-Hessou', 42),
(853, 'Zogbodomey', 42),
(854, 'Zoukou', 42);

-- --------------------------------------------------------

--
-- Structure de la table `communes`
--

CREATE TABLE `communes` (
  `idCommunes` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `FkDepartements` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `communes`
--

INSERT INTO `communes` (`idCommunes`, `name`, `FkDepartements`) VALUES
(1, 'Banikoara', 1),
(2, 'Gogounou', 1),
(3, 'Kandi', 1),
(4, 'Karimama', 1),
(5, 'Malanville', 1),
(6, 'Segbana', 1),
(7, 'Bassila', 2),
(8, 'Copargo', 2),
(9, 'Djougou', 2),
(10, 'Ouaké', 2),
(11, 'Bembéréké', 3),
(12, 'Kalalé', 3),
(13, 'N\'Dali', 3),
(14, 'Nikki', 3),
(15, 'Parakou', 3),
(16, 'Pèrèrè', 3),
(17, 'Sinendé', 3),
(18, 'Tchaourou', 3),
(19, 'Bantè\r\n', 4),
(20, 'Dassa-Zoumè\r\n', 4),
(21, 'Glazoué\r\n', 4),
(22, 'Ouèssè\r\n', 4),
(23, 'Savalou\r\n', 4),
(24, 'Savè', 4),
(25, 'Boukoumbé\r\n', 5),
(26, 'Cobly\r\n', 5),
(27, 'Kérou\r\n', 5),
(28, 'Kouandé\r\n', 5),
(29, 'Matéri\r\n', 5),
(30, 'Natitingou\r\n', 5),
(31, 'Péhunco\r\n', 5),
(32, 'Tanguiéta\r\n', 5),
(33, 'Toucountouna', 5),
(34, 'Abomey', 6),
(35, 'Agbangnizoun\r\n', 6),
(36, 'Bohicon', 6),
(37, 'Covè', 6),
(38, 'Djidja', 6),
(39, 'Ouinhi', 6),
(40, 'Zagnanado', 6),
(41, 'Za-Kpota', 6),
(42, 'Zogbodomey', 6),
(43, 'Aplahoué', 7),
(44, 'Djakotomey', 7),
(45, 'Dogbo-Tota', 7),
(46, 'Klouékanmè', 7),
(47, 'Lalo', 7),
(48, 'Toviklin', 7),
(49, 'Athiémé\r\n', 8),
(50, 'Bopa', 8),
(51, 'Comè', 8),
(52, 'Grand-Popo', 8),
(53, 'Houéyogbé', 8),
(54, 'Lokossa', 8),
(55, 'Adja-Ouèrè', 9),
(56, 'Ifangni', 9),
(57, 'Kétou', 9),
(58, 'Pobè\r\n', 9),
(59, 'Sakété', 9),
(60, 'Cotonou', 10),
(61, 'Abomey-Calavi', 11),
(62, 'Allada', 11),
(63, 'Kpomassè', 11),
(64, 'Ouidah', 11),
(65, 'Sô-Ava', 11),
(66, 'Toffo', 11),
(67, 'Tori-Bossito', 11),
(68, 'Zè', 11),
(69, 'Adjarra', 12),
(70, 'Adjohoun', 12),
(71, 'Aguégués', 12),
(72, 'Akpro-Missérété', 12),
(73, 'Avrankou', 12),
(74, 'Bonou', 12),
(75, 'Dangbo', 12),
(76, 'Porto-Novo', 12),
(77, 'Sèmè-Kpodji', 12);

-- --------------------------------------------------------

--
-- Structure de la table `datas`
--

CREATE TABLE `datas` (
  `id` int(11) NOT NULL,
  `dateAdhesion` date DEFAULT NULL,
  `dateEnregistrement` date DEFAULT NULL,
  `departement` varchar(255) DEFAULT NULL,
  `udoper` varchar(255) NOT NULL,
  `commune` varchar(255) DEFAULT NULL,
  `arrondissement` varchar(255) DEFAULT NULL,
  `village` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `dateNaissance` date DEFAULT NULL,
  `lieuNaissance` varchar(255) DEFAULT NULL,
  `sexe` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `idcard` varchar(255) DEFAULT NULL,
  `numeroPiece` varchar(255) DEFAULT NULL,
  `dateExp` date DEFAULT NULL,
  `qrcodepath` varchar(255) DEFAULT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `idPicsPath` varchar(255) DEFAULT NULL,
  `cardNumber` varchar(255) DEFAULT NULL,
  `ovins` int(11) NOT NULL,
  `bovins` int(11) NOT NULL,
  `caprins` int(11) NOT NULL,
  `signaturePath` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `datas`
--

INSERT INTO `datas` (`id`, `dateAdhesion`, `dateEnregistrement`, `departement`, `udoper`, `commune`, `arrondissement`, `village`, `nom`, `prenom`, `dateNaissance`, `lieuNaissance`, `sexe`, `tel`, `idcard`, `numeroPiece`, `dateExp`, `qrcodepath`, `datetime`, `idPicsPath`, `cardNumber`, `ovins`, `bovins`, `caprins`, `signaturePath`) VALUES
(1, '1979-03-10', '2022-12-04', '5', '2', '42', '2', 'Cum ducimus volupta', 'Enim totam rerum por', 'Beatae voluptas inci', '2022-02-19', 'Cupidatat qui commod', 'M', '+1 (123) 437-5661', 'PermisDeConduire', 'Est veniam ex est l', '2018-07-29', 'images/1670163518.png', '2022-12-04 15:18:38', 'identitypics/2022-12-04 14:18:38ee_id_card_40x50mm.jpeg', '12901726', 46, 26, 92, 'images/2022-12-04 14:18:38BURNIN.png'),
(2, '1988-01-14', '2022-12-05', '11', '1', '68', '6', 'Ullamco voluptas inc', 'Quis anim commodo su', 'Temporibus ut ea eiu', '1994-08-15', 'Cumque alias sapient', 'F', '+1 (135) 896-2743', 'PermisDeConduire', 'Est quibusdam proid', '2004-11-18', 'images/1670247907.png', '2022-12-05 14:45:07', 'identitypics/2022-12-05 13:45:07ee_id_card_40x50mm.jpeg', '42742583', 81, 70, 82, 'images/2022-12-05 13:45:07benin-flag-xs.png'),
(3, '2018-06-14', NULL, '2', '2', '8', '17', 'Yabaga', 'MATCHI', 'Ali', '2000-01-01', 'P&eacute;hunco', 'M', '61858675', 'LEPI', '0725100', '2021-01-31', 'images/1670408276.png', '2022-12-07 11:17:56', 'identitypics/2022-12-07 11:17:56BASSAMBO Garba.jpg', '37438861', 3, 14, 0, 'images/2022-12-07 11:17:56Arrière plan 1.jpg'),
(4, '2018-06-14', NULL, '2', '2', '8', '17', 'Yabaga', 'MATCHI', 'Ali', '2000-01-01', 'P&eacute;hunco', 'M', '61858675', 'LEPI', '0725100', '2021-01-31', 'images/1670408666.png', '2022-12-07 11:24:26', 'identitypics/2022-12-07 11:24:2616704085780936408436505988339667.jpg', '87151107', 3, 14, 0, 'images/2022-12-07 11:24:2616704086238276990750598469413830.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `departements`
--

CREATE TABLE `departements` (
  `idDepartements` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `departements`
--

INSERT INTO `departements` (`idDepartements`, `name`) VALUES
(1, 'Alibori'),
(2, 'Donga'),
(3, 'Borgou'),
(4, 'Collines'),
(5, 'Atacora'),
(6, 'Zou'),
(7, 'Couffo'),
(8, 'Mono'),
(9, 'Plateau'),
(10, 'Littoral'),
(11, 'Atlantique'),
(12, 'Ouémé');

-- --------------------------------------------------------

--
-- Structure de la table `members`
--

CREATE TABLE `members` (
  `idMembers` int(11) NOT NULL,
  `dateAdhesion` date DEFAULT NULL,
  `idDepartement` int(11) DEFAULT NULL,
  `idCommune` int(11) DEFAULT NULL,
  `idArrondissement` int(11) DEFAULT NULL,
  `idUdoper` int(11) DEFAULT NULL,
  `village` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `dateNaissance` date DEFAULT NULL,
  `lieuNaissance` varchar(255) DEFAULT NULL,
  `sexe` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `idTypePieceIdentite` int(11) DEFAULT NULL,
  `numeroPiece` varchar(255) DEFAULT NULL,
  `photoPieceIdentite` varchar(255) DEFAULT NULL,
  `dateExpirationPieceIdentite` date DEFAULT NULL,
  `ovins` int(11) DEFAULT NULL,
  `bovins` int(11) DEFAULT NULL,
  `caprins` int(11) DEFAULT NULL,
  `photoMembre` varchar(255) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `signatureScan` varchar(255) DEFAULT NULL,
  `qrCodePath` varchar(255) DEFAULT NULL,
  `numeroCarteMembre` varchar(255) DEFAULT NULL,
  `date_time` datetime DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `members`
--

INSERT INTO `members` (`idMembers`, `dateAdhesion`, `idDepartement`, `idCommune`, `idArrondissement`, `idUdoper`, `village`, `nom`, `prenom`, `dateNaissance`, `lieuNaissance`, `sexe`, `tel`, `idTypePieceIdentite`, `numeroPiece`, `photoPieceIdentite`, `dateExpirationPieceIdentite`, `ovins`, `bovins`, `caprins`, `photoMembre`, `signature`, `signatureScan`, `qrCodePath`, `numeroCarteMembre`, `date_time`, `user_id`) VALUES
(1, '1989-10-31', 3, 11, 191, 2, 'Non neque architecto', 'Magnam dignissimos n', 'Id aspernatur molest', '2019-04-15', 'Consequat Odit qui ', 'Commodo et reiciendi', '56565656', 2, '13', '../files/photo_piece_identite/photo_piece_identite_64c2817c534ca.png', '2010-09-20', 86, 54, 75, '../files/photo_membre/photo_membre_64c2817c534a6.png', NULL, '../files/signature_scan/signature_scan_64c2817c534d7.png', '../files/qrcode/qrcode_64c2817c534ed.png', 'ANO050305', '2017-07-30 16:38:52', 13),
(3, '1998-07-19', 7, 43, 449, 2, 'Fugiat deserunt qui ', 'Omnis quam excepturi', 'Rerum esse voluptate', '1980-10-23', 'Sit ad laborum volup', 'Culpa sint rem beat', '56565656', 2, '61', '../files/photo_piece_identite/photo_piece_identite_64c285e22a5dc.png', '2001-01-12', 12, 17, 50, '../files/photo_membre/photo_membre_64c285e22a5bd.png', NULL, '../files/signature_scan/signature_scan_64c285e22a5eb.png', '../files/qrcode/qrcode_64c285e22a5f9.png', 'ANO617987', '2023-07-27 16:57:39', 16),
(4, '1975-11-05', 9, 55, 663, 2, 'Inventore nostrum au', 'Aperiam ratione veni', 'Commodi dolore velit', '1997-06-04', 'Ipsum do repudiandae', 'Veniam ad quis dele', '56565656', 2, '55', '../files/photo_piece_identite/photo_piece_identite_64c28654ab7aa.png', '2014-09-13', 53, 47, 97, '../files/photo_membre/photo_membre_64c28654ab78d.png', NULL, '../files/signature_scan/signature_scan_64c28654ab7b8.png', '../files/qrcode/qrcode_64c28654ab7c5.png', 'ANO126938', '2022-07-17 16:59:33', 13),
(7, '2018-08-17', 3, 11, 191, 4, 'Modi beatae fugiat ', 'Assumenda lorem labo', 'Adipisicing in aut a', '1990-12-08', 'Repellendus Ex ea f', 'Nobis pariatur Nihi', '56565656', 3, '9', '../files/photo_piece_identite/photo_piece_identite_64c404eec55dc.png', '1989-02-11', 99, 3, 5, '../files/photo_membre/photo_membre_64c404eec55a3.png', NULL, '../files/signature_scan/signature_scan_64c404eec55eb.png', '../files/qrcode/qrcode_64c404eec55f7.png', 'ANO492671', '2023-07-28 20:11:59', 13),
(10, '1985-12-09', 8, 49, 525, 2, 'Est aliquip nulla d', 'Ea nisi eiusmod dolo', 'Placeat blanditiis ', '2000-12-01', 'Est quia assumenda ', 'Beatae elit similiq', '56565656', 4, '40', '../files/photo_piece_identite/photo_piece_identite_64c4c13e18b1e.png', '1978-06-24', 74, 80, 20, '../files/photo_membre/photo_membre_64c4c13e18af5.png', NULL, '../files/signature_scan/signature_scan_64c4c13e18b2d.png', '../files/qrcode/qrcode_64c4c13e18b42.png', 'ANO992836', '2023-07-29 09:35:26', 13),
(11, '2019-03-06', 8, 49, 525, 2, 'Dolor minim anim sed', 'Distinctio Adipisic', 'Error quos tenetur o', '2015-11-14', 'Veniam sed deserunt', 'Laudantium quibusda', '56565656', 3, '67', '../files/photo_piece_identite/photo_piece_identite_64c4c7feed151.png', '1984-08-19', 73, 39, 5, '../files/photo_membre/photo_membre_64c4c7feed125.png', NULL, '../files/signature_scan/signature_scan_64c4c7feed162.png', '../files/qrcode/qrcode_64c4c7feed177.png', 'ANO219397', '2023-07-29 10:04:15', 13),
(13, '1998-09-12', 11, 61, 115, 3, 'Autem minima a volup', 'Suscipit qui ea quam', 'Culpa suscipit aut ', '1984-02-11', 'Natus tempora harum ', 'Eos dolor tempora cu', '56565656', 2, '63', '../files/photo_piece_identite/photo_piece_identite_64c8ca6128e91.png', '1970-02-07', 39, 73, 6, '../files/photo_membre/photo_membre_64c8ca6128e7b.png', NULL, '../files/signature_scan/signature_scan_64c8ca6128e9b.png', '../files/qrcode/qrcode_64c8ca6128ea6.png', 'ANO101714', '2023-08-01 11:03:29', 13),
(14, '2002-08-20', 4, 19, 277, 3, 'Et iure dolore sit f', 'Nihil praesentium vo', 'Vel maiores qui ut n', '1997-10-16', 'Ducimus aut blandit', 'Ut eius aut in autem', '56565656', 3, '99', '../files/photo_piece_identite/photo_piece_identite_64c8caa6ce163.png', '1994-12-10', 81, 13, 48, '../files/photo_membre/photo_membre_64c8caa6ce14c.png', NULL, '../files/signature_scan/signature_scan_64c8caa6ce16e.png', '../files/qrcode/qrcode_64c8caa6ce178.png', 'ANO800808', '2023-08-01 11:04:39', 13),
(15, '2023-07-31', 8, 49, 525, 3, 'Aut placeat distinc', 'Amet lorem cupidita', 'Ex quasi earum nisi ', '2014-06-01', 'Veniam quia blandit', 'Sed repudiandae fugi', '56565656', 4, '55', '../files/photo_piece_identite/photo_piece_identite_64c8fc406e6e7.png', '1986-10-16', 43, 49, 54, '../files/photo_membre/photo_membre_64c8fc406e6ca.png', NULL, '../files/signature_scan/signature_scan_64c8fc406e6f6.png', '../files/qrcode/qrcode_64c8fc406e705.png', 'ANO729181', '2023-08-01 14:36:17', 13),
(16, '2016-03-27', 12, 69, 559, 4, 'Consectetur cupidat', 'Consequatur veritat', 'Est numquam at deser', '1994-04-11', 'Quae ut voluptatem a', 'Quis deserunt dolore', '56565656', 3, '79', '../files/photo_piece_identite/photo_piece_identite_64c8fc672b3d1.png', '1984-09-19', 45, 84, 43, '../files/photo_membre/photo_membre_64c8fc672b3b6.png', NULL, '../files/signature_scan/signature_scan_64c8fc672b3e1.png', '../files/qrcode/qrcode_64c8fc672b3eb.png', 'ANO556800', '2023-08-01 14:36:55', 13),
(22, '1971-05-17', 1, 1, 1, 3, 'Sequi minus nihil es', 'Temporibus rerum com', 'Praesentium laboris ', '1991-01-07', 'Ad in blanditiis nih', 'Ut qui veritatis cum', '56565656', 1, '36', '../files/photo_piece_identite/photo_piece_identite_64d28c792c15a.png', '1999-04-13', 93, 19, 60, '../files/photo_membre/photo_membre_64d28c792c144.png', NULL, '../files/signature_scan/signature_scan_64d28c792c16a.png', '../files/qrcode/qrcode_64d28c792c171.png', 'ANO034250', '2023-08-08 20:42:01', 13),
(23, '2008-12-28', 7, 43, 449, 4, 'Eum consequat Dolor', 'Quia deserunt suscip', 'Obcaecati adipisicin', '1999-06-04', 'Enim autem consequat', 'Pariatur Omnis at o', '56565656', 3, '22', '../files/photo_piece_identite/photo_piece_identite_64d28cac66e01.png', '2000-10-12', 8, 100, 7, '../files/photo_membre/photo_membre_64d28cac66deb.png', NULL, '../files/signature_scan/signature_scan_64d28cac66e08.png', '../files/qrcode/qrcode_64d28cac66e0f.png', 'ANO242431', '2023-08-08 20:42:52', 13);

-- --------------------------------------------------------

--
-- Structure de la table `type_piece_identite`
--

CREATE TABLE `type_piece_identite` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `type_piece_identite`
--

INSERT INTO `type_piece_identite` (`id`, `type`) VALUES
(1, 'Carte Nationale d\'Identité'),
(2, 'Passeport'),
(3, 'Permis de Conduire'),
(4, 'Carte LEPI'),
(5, 'Acte de Naissance'),
(6, 'Témoignage');

-- --------------------------------------------------------

--
-- Structure de la table `udopers`
--

CREATE TABLE `udopers` (
  `idUdopers` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `udopers`
--

INSERT INTO `udopers` (`idUdopers`, `name`) VALUES
(1, 'Borgou Alibori'),
(2, 'Atacora Donga'),
(3, 'Zou Collines'),
(4, 'Mono Couffo'),
(5, 'Atlantique');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `date_inscription` timestamp NOT NULL DEFAULT current_timestamp(),
  `derniere_connexion` datetime DEFAULT NULL,
  `remember_me` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `telephone`, `password`, `admin`, `active`, `nom`, `prenom`, `date_inscription`, `derniere_connexion`, `remember_me`) VALUES
(13, 'gagbahungba2019@gmail.com', '67659717', '5f4dcc3b5aa765d61d8327deb882cf99', 0, 1, 'Agbahungba', 'Georgeo', '2023-07-23 13:18:59', '2023-08-08 16:26:47', 0),
(14, 'segoro@mailinator.com', '+1 (882) 162-1732', '5f4dcc3b5aa765d61d8327deb882cf99', 0, 1, 'Ab elit doloremque ', 'Dolorem excepturi te', '2023-07-23 13:27:59', '2023-07-23 16:32:03', 0),
(15, 'admin@anoper.bj', '00000000', 'b1813f306074427315b46b8a6867293f', 1, 1, 'Admin', 'ANOPER', '2023-07-23 14:10:11', '2023-07-23 16:07:38', 0),
(16, 'jube@mailinator.com', '+1 (731) 657-9723', '5f4dcc3b5aa765d61d8327deb882cf99', 0, 1, 'Enim aute illo verit', 'Quam dolores laborum', '2023-07-24 16:53:23', '2023-07-24 18:53:36', 0);

-- --------------------------------------------------------

--
-- Structure de la table `villages`
--

CREATE TABLE `villages` (
  `idVillage` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `FkArrondissements` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `arrondissements`
--
ALTER TABLE `arrondissements`
  ADD PRIMARY KEY (`idArrondissements`);

--
-- Index pour la table `communes`
--
ALTER TABLE `communes`
  ADD PRIMARY KEY (`idCommunes`);

--
-- Index pour la table `datas`
--
ALTER TABLE `datas`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `departements`
--
ALTER TABLE `departements`
  ADD PRIMARY KEY (`idDepartements`);

--
-- Index pour la table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`idMembers`),
  ADD KEY `idDepartement` (`idDepartement`),
  ADD KEY `idCommune` (`idCommune`),
  ADD KEY `idArrondissement` (`idArrondissement`),
  ADD KEY `idUdoper` (`idUdoper`),
  ADD KEY `idTypePieceIdentite` (`idTypePieceIdentite`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `type_piece_identite`
--
ALTER TABLE `type_piece_identite`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `udopers`
--
ALTER TABLE `udopers`
  ADD PRIMARY KEY (`idUdopers`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `villages`
--
ALTER TABLE `villages`
  ADD PRIMARY KEY (`idVillage`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `arrondissements`
--
ALTER TABLE `arrondissements`
  MODIFY `idArrondissements` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=855;

--
-- AUTO_INCREMENT pour la table `communes`
--
ALTER TABLE `communes`
  MODIFY `idCommunes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT pour la table `datas`
--
ALTER TABLE `datas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `departements`
--
ALTER TABLE `departements`
  MODIFY `idDepartements` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `members`
--
ALTER TABLE `members`
  MODIFY `idMembers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `type_piece_identite`
--
ALTER TABLE `type_piece_identite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `udopers`
--
ALTER TABLE `udopers`
  MODIFY `idUdopers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `villages`
--
ALTER TABLE `villages`
  MODIFY `idVillage` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `members_ibfk_1` FOREIGN KEY (`idDepartement`) REFERENCES `departements` (`idDepartements`),
  ADD CONSTRAINT `members_ibfk_2` FOREIGN KEY (`idCommune`) REFERENCES `communes` (`idCommunes`),
  ADD CONSTRAINT `members_ibfk_3` FOREIGN KEY (`idArrondissement`) REFERENCES `arrondissements` (`idArrondissements`),
  ADD CONSTRAINT `members_ibfk_4` FOREIGN KEY (`idUdoper`) REFERENCES `udopers` (`idUdopers`),
  ADD CONSTRAINT `members_ibfk_5` FOREIGN KEY (`idTypePieceIdentite`) REFERENCES `type_piece_identite` (`id`),
  ADD CONSTRAINT `members_ibfk_6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
