-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.4-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- aa 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `aa` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `aa`;

-- 테이블 aa.board 구조 내보내기
CREATE TABLE IF NOT EXISTS `board` (
  `a_idx` int(10) NOT NULL AUTO_INCREMENT,
  `a_writer` varchar(255) NOT NULL,
  `a_title` varchar(255) NOT NULL,
  `a_count` int(10) NOT NULL,
  `a_content` text DEFAULT NULL,
  `a_group` int(11) DEFAULT NULL,
  `a_order` int(11) DEFAULT NULL,
  `a_depth` int(11) DEFAULT NULL,
  `a_date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`a_idx`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- 테이블 데이터 aa.board:~25 rows (대략적) 내보내기
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` (`a_idx`, `a_writer`, `a_title`, `a_count`, `a_content`, `a_group`, `a_order`, `a_depth`, `a_date`) VALUES
	(1, '1', '1', 1, '1', 1, 1, 1, '2021-04-23 11:39:53'),
	(6, 'cccc', 'eefsf', 5, 'ㅋㅋㅋㅋㅋ', 6, 5, 2, '2021-04-23 09:50:09'),
	(7, 'ddddd', 'fefdsf', 5, 'ㅂㅂㅂㅂㅂㅂㅂ', 6, 2, 2, '2021-04-23 09:50:10'),
	(8, 'eeeeee', 'dsfaef', 5, 'ㅅㅇㅇㅇ', 6, 1, 2, '2021-04-23 09:50:10'),
	(9, 'gggggg', 'dsfaef', 5, 'ㅇㅇㅇ', 6, 3, 3, '2021-04-23 09:50:11'),
	(10, 'hnngg', 'dsfaef', 5, 'ㅋㅋㅋ', 6, 4, 4, '2021-04-23 09:50:11'),
	(11, 'zcc', 'sdfe', 5, 'ㅌㅌㅌ', 6, NULL, NULL, '2021-04-23 09:50:12'),
	(12, 'dbbb', 'dfsdfs', 5, 'ㅍㅍㅍㅍㅍㅍ', 6, NULL, NULL, '2021-04-23 09:50:12'),
	(13, '홍길동', 'aaa', 0, 'ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ', 6, NULL, NULL, '2021-04-23 09:50:14'),
	(14, '이길동', 'bbb', 2, 'ㄴㄴㄴ', 6, NULL, NULL, '2021-04-23 09:50:13'),
	(15, 'aa', 'abc', 5, 'ㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊ', 6, NULL, NULL, '2021-04-23 09:50:14'),
	(16, 'aa', 'abc', 5, 'ㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊ', 6, NULL, NULL, '2021-04-23 09:50:15'),
	(17, 'aa', 'abc', 5, 'ㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊ', 6, NULL, NULL, '2021-04-23 09:50:15'),
	(18, 'eeeeee', 'dsfaef', 5, 'ㅅㅇㅇㅇ', 6, NULL, NULL, '2021-04-23 09:50:18'),
	(19, 'eeeeee', 'dsfaef', 5, 'ㅅㅇㅇㅇ', 6, NULL, NULL, '2021-04-23 09:50:19'),
	(20, 'eeeeee', 'zcxvxcv', 5, 'ㅅㅇㅇㅇ', 6, NULL, NULL, '2021-04-23 09:50:19'),
	(21, 'zdf', 'dsfaef', 5, 'ㅅㅇㅇㅇ', 6, NULL, NULL, '2021-04-23 09:50:20'),
	(22, 'eeeeee', 'dsfaef', 5, 'dddfsfsd', 6, NULL, NULL, '2021-04-23 09:50:20'),
	(23, 'zdf', 'dfsfc', 5, 'ㅅㅇㅇㅇ', 6, NULL, NULL, '2021-04-23 09:50:21'),
	(24, 'eeeeee', 'dsfaef', 5, 'ㅅㅇㅇㅇ', 6, NULL, NULL, '2021-04-23 09:50:22'),
	(25, 'zdfzds', 'cxzvd', 5, 'ccc', 6, NULL, NULL, '2021-04-23 09:50:22'),
	(42, '수정하기', '수정할래', 0, '수정할래요', 6, NULL, NULL, '2021-04-23 09:50:23'),
	(43, '수정할래2', '수정', 0, '수저저얼', 6, NULL, NULL, '2021-04-23 09:50:23'),
	(44, '가자', '가즈아', 0, '가자', 6, NULL, NULL, '2021-04-23 10:05:51');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;

-- 테이블 aa.comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `comment` (
  `b_idx` int(11) NOT NULL AUTO_INCREMENT,
  `u_idx` varchar(50) NOT NULL,
  `b_title` varchar(50) DEFAULT NULL,
  `b_content` varchar(50) DEFAULT NULL,
  `a_idx` int(11) NOT NULL,
  PRIMARY KEY (`b_idx`),
  KEY `a_idx` (`a_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- 테이블 데이터 aa.comment:~10 rows (대략적) 내보내기
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` (`b_idx`, `u_idx`, `b_title`, `b_content`, `a_idx`) VALUES
	(6, '3', 'ㅎㅇ', '안녕ㅇㅇ', 6),
	(8, '4', 'ㅎㅇ', NULL, 7),
	(44, '4', NULL, 'ㄴㄴ', 18),
	(45, '4', NULL, 'ㅍㄹㄹ', 18),
	(77, '3', NULL, 'ㅇㅇㅇㅇㅇㅇㅇ', 5),
	(78, '4', NULL, 'ㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹ', 5),
	(79, '3', NULL, 'sadsaf', 5),
	(80, '4', NULL, 'sdfdsf', 6),
	(81, '4', NULL, 'ㅎㅎ', 6),
	(82, '4', NULL, '오어라러', 5);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

-- 테이블 aa.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `u_idx` int(10) NOT NULL AUTO_INCREMENT,
  `u_id` varchar(255) NOT NULL,
  `u_pw` varchar(255) NOT NULL,
  `u_name` varchar(255) NOT NULL,
  `u_tel` varchar(255) NOT NULL,
  `u_age` int(11) DEFAULT NULL,
  PRIMARY KEY (`u_idx`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- 테이블 데이터 aa.user:~40 rows (대략적) 내보내기
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`u_idx`, `u_id`, `u_pw`, `u_name`, `u_tel`, `u_age`) VALUES
	(3, 'a', '111', '김떙땡', '010-1111-1111', 200),
	(4, 'b', '222', '이모씨', '010-2222-2222', 37),
	(5, 'ccc', '34343', '강하다', '010-2121-3232', 58),
	(6, 'dfdf', '545', '홍길동', '010-2898-4767', 44),
	(7, 'zyzy', '252d', '대한민국', '010-4747-3634', 88),
	(10, 'wew', 'qqqq', '박찬호', '010-7777-3232', 23),
	(11, 'a1', '5555', '강호동', '090-4343-4444', 32),
	(12, 'b1', '1111', '박길동', '090-3333-7777', 49),
	(13, 'bb1', '2222', '고길동', '090-4444-6666', 61),
	(14, 'cc3', 'c1c1', '최길동', '090-1111-3333', 74),
	(15, 'aaaa', '1234', 'asdf', '1234-1234-4123', 34),
	(16, 'lcomputer', '1234', '엘컴퓨터', '1111-1111-1111', 34),
	(17, 'lcomputer12345', '1234', '엘컴터222', '010-5555-5555', 15),
	(18, 'as2', '111', 'as2', '010', 12),
	(19, 'as3', '111', 'as3', '011', 13),
	(20, 'as4', '111', 'as4', '012', 14),
	(21, 'a', '111', '김떙땡', '010-1111-1111', 200),
	(22, 'a', '111', '김떙땡', '010-1111-1111', 200),
	(23, 'a', '111', '김떙땡', '010-1111-1111', 200),
	(24, 'a', '111', '김떙땡', '010-1111-1111', 200),
	(25, 'a', '111', '김떙땡', '010-1111-1111', 200),
	(26, 'a', '111', '김떙땡', '010-1111-1111', 200),
	(27, 'a', '111', '김떙땡', '010-1111-1111', 200),
	(28, 'a', '111', '김떙땡', '010-1111-1111', 200),
	(29, 'a', '111', '김떙땡', '010-1111-1111', 200),
	(30, 'a', '111', '김떙땡', '010-1111-1111', 200),
	(31, 'a', '111', '김떙땡', '010-1111-1111', 200),
	(32, 'a', '111', '김떙땡', '010-1111-1111', 200),
	(33, 'a', '111', '김떙땡', '010-1111-1111', 200),
	(34, 'a', '111', '김떙땡', '010-1111-1111', 200),
	(35, 'a', '111', '김떙땡', '010-1111-1111', 200),
	(36, 'a', '111', '김떙땡', '010-1111-1111', 200),
	(37, 'a', '111', '김떙땡', '010-1111-1111', 200),
	(38, 'a', '111', '김떙땡', '010-1111-1111', 200),
	(39, 'a', '111', '김떙땡', '010-1111-1111', 200),
	(40, 'a', '111', '김떙땡', '010-1111-1111', 200),
	(41, 'a', '111', '김떙땡', '010-1111-1111', 200),
	(42, 'a', '111', '김떙땡', '010-1111-1111', 200),
	(43, 'cju7942', '1234', '최진욱', '010-5555-5555', 31),
	(44, '1556', '111', '안녕하세', '111-111-111', 11);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
