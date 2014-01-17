DELIMITER $$

-- DROP PROCEDURE IF EXISTS `p_allot_package_timely`$$

CREATE  PROCEDURE p_allot_package_timely()
BEGIN

	DECLARE done INT DEFAULT 0;

	DECLARE t_assign_id INT;
	DECLARE t_userId VARCHAR(32);
	DECLARE t_assignorId VARCHAR(32);
	DECLARE t_businessId INT;
	DECLARE t_quantity INT;
	DECLARE t_durationMonths INT;
	DECLARE t_createTime DATETIME;
	DECLARE t_effectiveType CHAR(1);
	DECLARE t_status CHAR(1);
	DECLARE t_usedMonths INT;

	DECLARE cur_allot_immediate CURSOR FOR SELECT id,userId,assignorId,businessId,quantity,durationMonths,createTime,effectiveType,STATUS,usedMonths FROM t_user_assign_package WHERE effectiveType ='1' AND STATUS ='1' AND usedMonths=0;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;


	OPEN cur_allot_immediate;


	REPEAT
		FETCH cur_allot_immediate INTO t_assign_id,t_userId,t_assignorId,t_businessId,t_quantity,t_durationMonths,t_createTime,t_effectiveType,t_status,t_usedMonths;

		IF NOT done THEN
			INSERT INTO t_user_apply_package(userId,assignorId,yearMonth,businessId,assignQuantity,usedQuantity,remark) VALUES(t_userId,t_assignorId,DATE_FORMAT(NOW(),'%Y%m'),businessId,t_quantity,0,NULL);
			IF t_durationMonths = 1 THEN
				UPDATE t_user_assign_package SET usedMonths =1,STATUS='2' WHERE id = t_assign_id;
			ELSE
				UPDATE t_user_assign_package SET usedMonths =1 WHERE id = t_assign_id;
			END IF;
		END IF;

	UNTIL done END REPEAT;

	CLOSE cur_allot_immediate;

END$$

DELIMITER ;

-- --------------------------------------------------------------------------
 SET GLOBAL event_scheduler = ON;
-- SET @@global.event_scheduler = ON;
-- SET GLOBAL event_scheduler = 1;
-- SET @@global.event_scheduler = 1;
DELIMITER $$

-- SET GLOBAL event_scheduler = ON$$     -- required for event to execute but not create

CREATE	EVENT e_allot_package_timely

ON SCHEDULE


	   EVERY 10 MINUTE

DO
	BEGIN
	   CALL p_allot_package_timely();
	END$$

DELIMITER ;
---------------------------------------------------------------------------------------------


DELIMITER $$

USE `d12315`$$

DROP PROCEDURE IF EXISTS `p_allot_package_monthly`$$

CREATE DEFINER=`root`@`%` PROCEDURE `p_allot_package_monthly`()
BEGIN
	DECLARE done INT DEFAULT 0;
	DECLARE t_assign_id INT;
	DECLARE t_userId VARCHAR(32);
	DECLARE t_assignorId VARCHAR(32);
	DECLARE t_businessId INT;
	DECLARE t_quantity INT;
	DECLARE t_durationMonths INT;
	DECLARE t_createTime DATETIME;
	DECLARE t_effectiveType CHAR(1);
	DECLARE t_status CHAR(1);
	DECLARE t_usedMonths INT;
	DECLARE cur_allot_immediate CURSOR FOR SELECT id,userId,assignorId,businessId,quantity,durationMonths,createTime,effectiveType,STATUS,usedMonths FROM t_user_assign_package WHERE STATUS ='1'  AND ( (effectiveType > 0 AND usedMonths >0) OR effectiveType ='2');
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
	OPEN cur_allot_immediate;
	REPEAT
		FETCH cur_allot_immediate INTO t_assign_id,t_userId,t_assignorId,t_businessId,t_quantity,t_durationMonths,t_createTime,t_effectiveType,t_status,t_usedMonths;

		IF NOT done THEN
			-- INSERT INTO t_user_apply_package(userId,assignorId,yearMonth,businessId,assignQuantity,usedQuantity,remark) VALUES(t_userId,t_assignorId,DATE_FORMAT(NOW(),'%Y%m'),businessId,t_quantity,0,NULL);
			IF t_durationMonths = 1 THEN
				UPDATE t_user_assign_package SET usedMonths =1,STATUS='2' WHERE id = t_assign_id;
				INSERT INTO t_user_apply_package(userId,assignorId,yearMonth,businessId,assignQuantity,usedQuantity,remark) VALUES(t_userId,t_assignorId,DATE_FORMAT(NOW(),'%Y%m'),businessId,t_quantity,0,NULL);
			ELSE
				IF (t_durationMonths = -1) OR (t_usedMonths < t_durationMonths) THEN
					UPDATE t_user_assign_package SET usedMonths =usedMonths+1 WHERE id = t_assign_id;
					INSERT INTO t_user_apply_package(userId,assignorId,yearMonth,businessId,assignQuantity,usedQuantity,remark) VALUES(t_userId,t_assignorId,DATE_FORMAT(NOW(),'%Y%m'),businessId,t_quantity,0,NULL);
				ELSE

					UPDATE t_user_assign_package SET STATUS='2' WHERE id = t_assign_id;

				END IF;
			END IF;
		END IF;
	UNTIL done END REPEAT;

	CLOSE cur_allot_immediate;
    END$$

DELIMITER ;

---------------------------------------------------------------------------------------------

DELIMITER $$

-- SET GLOBAL event_scheduler = ON$$     -- required for event to execute but not create

	CREATE	EVENT e_allot_package_monthly

		ON SCHEDULE   EVERY 1 MONTH STARTS  '2014-01-01 00:00:00'
		-- date_add(date_add(date_sub(curdate(),interval day(curdate())-1 day),interval 1 month),interval 1 hour)

		DO
		BEGIN
			CALL p_allot_package_monthly();
		END$$

DELIMITER ;