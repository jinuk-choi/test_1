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
  PRIMARY KEY (`a_idx`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- 테이블 데이터 aa.board:~12 rows (대략적) 내보내기
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` (`a_idx`, `a_writer`, `a_title`, `a_count`, `a_content`) VALUES
	(1, '홍길동', 'aaa', 0, 'ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ'),
	(2, '이길동', 'bbb', 2, 'ㄴㄴㄴ'),
	(3, '김김김', 'ccccc', 0, 'ㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷ'),
	(4, 'aa', 'abc', 5, 'ㅊㅊㅊㅊㅊㅊㅊㅊㅊㅊ'),
	(5, 'bbb', 'ddddd', 5, 'ㅇㅇ'),
	(6, 'cccc', 'eefsf', 5, 'ㅋㅋㅋㅋㅋ'),
	(7, 'ddddd', 'fefdsf', 5, 'ㅂㅂㅂㅂㅂㅂㅂ'),
	(8, 'eeeeee', 'dsfaef', 5, 'ㅅㅇㅇㅇ'),
	(9, 'gggggg', 'dsfaef', 5, 'ㅇㅇㅇ'),
	(10, 'hnngg', 'dsfaef', 5, 'ㅋㅋㅋ'),
	(11, 'zcc', 'sdfe', 5, 'ㅌㅌㅌ'),
	(12, 'dbbb', 'dfsdfs', 5, 'ㅍㅍㅍㅍㅍㅍ');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;

-- 테이블 aa.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `u_idx` int(10) NOT NULL AUTO_INCREMENT,
  `u_id` varchar(255) NOT NULL,
  `u_pw` varchar(255) NOT NULL,
  `u_name` varchar(255) NOT NULL,
  `u_tel` varchar(255) NOT NULL,
  `u_age` int(11) DEFAULT NULL,
  PRIMARY KEY (`u_idx`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- 테이블 데이터 aa.user:~15 rows (대략적) 내보내기
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
	(20, 'as4', '111', 'as4', '012', 14);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
