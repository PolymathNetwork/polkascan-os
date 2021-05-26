DROP PROCEDURE IF EXISTS AddColumnIfNotExists;
DELIMITER //
CREATE PROCEDURE AddColumnIfNotExists(
    IN dbName tinytext,
    IN tableName tinytext,
    IN fieldName tinytext,
    IN fieldDef text)
	BEGIN
		IF NOT EXISTS (
			SELECT * FROM information_schema.COLUMNS
			WHERE column_name=fieldName
			and table_name=tableName
			and table_schema=dbName
			)
		THEN
			SET @ddl=CONCAT('ALTER TABLE `',dbName,'`.`',tableName,'` ADD COLUMN ',fieldName,' ',fieldDef);
			PREPARE stmt FROM @ddl;
			EXECUTE stmt;
        END IF;
	END //
DELIMITER ;
