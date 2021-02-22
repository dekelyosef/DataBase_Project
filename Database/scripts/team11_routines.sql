-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: team11
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping routines for database 'team11'
--
/*!50003 DROP PROCEDURE IF EXISTS `getAllCourses` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllCourses`()
BEGIN
SELECT DISTINCT `courses`.`course`
FROM `courses`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllCuisines` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllCuisines`()
BEGIN
SELECT DISTINCT `cuisines`.`cuisine`
FROM `cuisines`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCoursesByFoodID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCoursesByFoodID`(in p_id INT)
BEGIN
SELECT `courses`.`course`
FROM `courses`
WHERE `courses`.`food_id` LIKE (p_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCuisineByIngredient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCuisineByIngredient`(in p_ingredient VARCHAR(100))
BEGIN
SET @p_ingredient = CONCAT('%', p_ingredient, '%');
SELECT DISTINCT `cuisines`.`cuisine`
FROM `cuisines`
WHERE `cuisines`.`food_id` IN (SELECT DISTINCT `ingredients`.`food_id`
FROM `ingredients`
WHERE `ingredients`.`ingredient` LIKE @p_ingredient);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCuisinesByFoodID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCuisinesByFoodID`(in p_id INT)
BEGIN
SELECT `cuisines`.`cuisine`
FROM `cuisines`
WHERE `cuisines`.`food_id` LIKE (p_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getFoodByFoodID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getFoodByFoodID`(in p_id INT)
BEGIN
SELECT `food`.`name`, `food`.`total_time`, `food`.`rating`, `food`.`recipe`
FROM `food`
WHERE `food`.`food_id` LIKE (p_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getFoods` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getFoods`(
in p_cuisine VARCHAR(45),
in p_ingredients VARCHAR(300),
in p_without_ingredients VARCHAR(300),
in p_course VARCHAR(45),
in p_max_ingredients INT,
in p_time FLOAT,
in p_rating INT)
BEGIN

CALL splitToFive(p_ingredients, @p_1, @p_2, @p_3,@p_4,@p_5);
CALL splitToFiveWithout(p_without_ingredients, @p_w1, @p_w2, @p_w3, @p_w4, @p_w5);

SELECT DISTINCT `cuisines`.`food_id` FROM `cuisines`
		INNER JOIN `ingredients`
				ON `ingredients`.`food_id`=`cuisines`.`food_id`
		INNER JOIN `courses`
				ON `courses`.`food_id`= `cuisines`.`food_id`
		INNER JOIN `food` 
				ON `food`.`food_id`=`cuisines`.`food_id` 
		INNER JOIN 
					(SELECT `ing`.`food_id`, 
							GROUP_CONCAT(`ing`.`ingredient`) AS `ings`
						FROM `ingredients` `ing`
					GROUP BY `ing`.`food_id`) `i` ON `i`.`food_id`=`cuisines`.`food_id`
			WHERE IFNULL(`cuisines`.`cuisine`, "-1")=IFNULL(p_cuisine, IFNULL(`cuisines`.`cuisine`, "-1"))
		      AND IFNULL(`courses`.`course`,"-1")=IFNULL(p_course, IFNULL(`courses`.`course`,"-1"))
			  AND IFNULL(`food`.`total_time`,-1)<=IFNULL(p_time,IFNULL(`food`.`total_time`,-1))
			  AND IFNULL(`food`.`rating`,-1)>=IFNULL(p_rating,IFNULL(`food`.`rating`,-1))
			  AND `i`.`ings` LIKE @p_1
			  AND `i`.`ings` LIKE @p_2
			  AND `i`.`ings` LIKE @p_3
              AND `i`.`ings` LIKE @p_4
              AND `i`.`ings` LIKE @p_5
              AND `cuisines`.`food_id` NOT IN(SELECT DISTINCT `ingr`.`food_id`
												FROM `ingredients` `ingr`
												WHERE `ingr`.`ingredient` LIKE @p_w1 
                                                OR `ingr`.`ingredient` LIKE @p_w2
                                                OR `ingr`.`ingredient` LIKE @p_w3
                                                OR `ingr`.`ingredient` LIKE @p_w4 
												OR `ingr`.`ingredient` LIKE @p_w5)
GROUP BY `ingredients`.`food_id`
HAVING COUNT(`ingredients`.`ingredient`)<=
IFNULL(p_max_ingredients, COUNT(`ingredients`.`ingredient`));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getImageByFoodID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getImageByFoodID`(in p_id INT)
BEGIN
SELECT `images`.`image`
FROM `images`
WHERE `images`.`food_id` LIKE (p_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getIngredient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getIngredient`(in p_ingredient VARCHAR(100))
BEGIN
SET @p_ingredient = CONCAT('%', p_ingredient, '%');
SELECT `ingredient` FROM(
				SELECT DISTINCT `ing`.`ingredient` AS `ingredient`,
								ROW_NUMBER() OVER(ORDER BY `ing`.`food_id`) AS `rn`  
				FROM `ingredients` `ing`
				WHERE `ing`.`ingredient` LIKE @p_ingredient
				ORDER by `ing`.`food_id`) `rni`
 where `rni`.`rn` <21;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getIngredientsByFoodID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getIngredientsByFoodID`(in p_id INT)
BEGIN
SELECT `ingredients`.`ingredient`
FROM `ingredients`
WHERE `ingredients`.`food_id` LIKE (p_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `splitToFive` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `splitToFive`(
					IN p_ingredients varchar(300), 
                    OUT p_1 varchar(100),
                    OUT p_2 varchar(100),
                    OUT p_3 varchar(100),
                    OUT p_4 varchar(100),
                    OUT p_5 varchar(100))
BEGIN
	SET @v_next = p_ingredients;
	SET @p_value = SUBSTRING_INDEX(@v_next,';',1);
	SET @p_tmp = IF (CHAR_LENGTH(@p_value) = 0, "%%", CONCAT('%', @p_value, '%'));
    select @p_tmp into p_1;
	SET @p_nextlen = CHAR_LENGTH(@p_value);
	SET @v_next = INSERT(@v_next,1,@p_nextlen + 1,'');

	SET @p_value = SUBSTRING_INDEX(@v_next,';',1);
	SET @p_tmp = IF (CHAR_LENGTH(@p_value) = 0, "%%", CONCAT('%', @p_value, '%'));
	select @p_tmp into p_2;
	SET @p_nextlen = CHAR_LENGTH(@p_value);
	SET @v_next = INSERT(@v_next,1,@p_nextlen + 1,'');

	SET @p_value = SUBSTRING_INDEX(@v_next,';',1);
	SET @p_tmp = IF (CHAR_LENGTH(@p_value) = 0, "%%", CONCAT('%', @p_value, '%'));
    select @p_tmp into p_3;
	SET @p_nextlen = CHAR_LENGTH(@p_value);
	SET @v_next = INSERT(@v_next,1,@p_nextlen + 1,'');

	SET @p_value = SUBSTRING_INDEX(@v_next,';',1);
	SET @p_tmp = IF (CHAR_LENGTH(@p_value) = 0, "%%", CONCAT('%', @p_value, '%'));
    select @p_tmp into p_4;
	SET @p_nextlen = CHAR_LENGTH(@p_value);
	SET @v_next = INSERT(@v_next,1,@p_nextlen + 1,'');

	SET @p_value = SUBSTRING_INDEX(@v_next,';',1);
	SET @p_tmp = IF (CHAR_LENGTH(@p_value) = 0, "%%", CONCAT('%', @p_value, '%'));
    select @p_tmp into p_5;
	SET @p_nextlen = CHAR_LENGTH(@p_value);
	SET @v_next = INSERT(@v_next,1,@p_nextlen + 1,'');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `splitToFiveWithout` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `splitToFiveWithout`(
					IN without_ingredients varchar(300), 
                    OUT p_w1 varchar(100),
                    OUT p_w2 varchar(100),
                    OUT p_w3 varchar(100),
                    OUT p_w4 varchar(100),
                    OUT p_w5 varchar(100))
BEGIN
SET @v_next = without_ingredients;
	SET @p_value = SUBSTRING_INDEX(@v_next,';',1);
	SET @p_tmp = IF (CHAR_LENGTH(@p_value) = 0, "-1", CONCAT('%', @p_value, '%'));
    select @p_tmp into p_w1;
	SET @p_nextlen = CHAR_LENGTH(@p_value);
	SET @v_next = INSERT(@v_next,1,@p_nextlen + 1,'');

	SET @p_value = SUBSTRING_INDEX(@v_next,';',1);
	SET @p_tmp = IF (CHAR_LENGTH(@p_value) = 0, "-1", CONCAT('%', @p_value, '%'));
	select @p_tmp into p_w2;
	SET @p_nextlen = CHAR_LENGTH(@p_value);
	SET @v_next = INSERT(@v_next,1,@p_nextlen + 1,'');

	SET @p_value = SUBSTRING_INDEX(@v_next,';',1);
	SET @p_tmp = IF (CHAR_LENGTH(@p_value) = 0, "-1", CONCAT('%', @p_value, '%'));
    select @p_tmp into p_w3;
	SET @p_nextlen = CHAR_LENGTH(@p_value);
	SET @v_next = INSERT(@v_next,1,@p_nextlen + 1,'');

	SET @p_value = SUBSTRING_INDEX(@v_next,';',1);
	SET @p_tmp = IF (CHAR_LENGTH(@p_value) = 0, "-1", CONCAT('%', @p_value, '%'));
    select @p_tmp into p_w4;
	SET @p_nextlen = CHAR_LENGTH(@p_value);
	SET @v_next = INSERT(@v_next,1,@p_nextlen + 1,'');

	SET @p_value = SUBSTRING_INDEX(@v_next,';',1);
	SET @p_tmp = IF (CHAR_LENGTH(@p_value) = 0, "-1", CONCAT('%', @p_value, '%'));
    select @p_tmp into p_w5;
	SET @p_nextlen = CHAR_LENGTH(@p_value);
	SET @v_next = INSERT(@v_next,1,@p_nextlen + 1,'');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-12 10:42:33
