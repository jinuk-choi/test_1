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

-- 테이블 aa.comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `comment` (
  `b_idx` int(11) NOT NULL AUTO_INCREMENT,
  `b_name` varchar(50) DEFAULT NULL,
  `b_title` varchar(50) DEFAULT NULL,
  `b_content` varchar(50) DEFAULT NULL,
  `a_idx` int(11) NOT NULL,
  `b_redate` date DEFAULT current_timestamp(),
  PRIMARY KEY (`b_idx`),
  KEY `a_idx` (`a_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- 테이블 데이터 aa.comment:~16 rows (대략적) 내보내기
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` (`b_idx`, `b_name`, `b_title`, `b_content`, `a_idx`, `b_redate`) VALUES
	(1, '홍길동', 'ㅎㅇ', '안녕', 5, '2021-04-19'),
	(2, '베스', 'ㅎㅇ', '안녕', 5, '2021-04-22'),
	(3, '블루길', 'ㅎㅇ', '안녕', 5, '2021-04-11'),
	(4, '붕어', '잘가', 'ㅂㅂㅂㅂ', 6, '2021-04-18'),
	(5, '잉어', '가즈아', 'ㅇㅇ', 6, '2021-04-15'),
	(6, '메기', 'ㅎㅇ', '안녕', 6, '2021-04-19'),
	(7, '홍길동', 'ㅎㅇ', '하세', 6, '2021-04-19'),
	(8, '홍길동', 'ㅎㅇ', '안녀엉', 7, '2021-04-19'),
	(9, '홍길동', 'ㅂ2', '안녕', 7, '2021-04-19'),
	(10, '홍길동', 'ㅎㅇ', '안녕', 7, '2021-04-19'),
	(11, '홍길동', 'ㅂㅂ2', '안녕', 7, '2021-04-19'),
	(12, '엘컴터', '안녕', '잘가', 0, NULL),
	(13, '엘컴터', 'ㅇ', 'ㅇㅇ', 0, NULL),
	(14, '가즈아', '가자', '가즈아', 5, NULL),
	(15, '가물치', '잘가라', '잘가가', 5, NULL),
	(16, '향어', '오랜만', 'ㅂㅂ2', 5, '2021-04-19');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
