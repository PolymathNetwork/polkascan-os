DROP PROCEDURE IF EXISTS AddIndexIfNotExists;
DELIMITER //
CREATE PROCEDURE AddIndexIfNotExists(
    IN dbName tinytext,
    IN tableName tinytext,
    IN indexName tinytext,
    IN indexFields text)
	BEGIN
		IF NOT EXISTS (
			SELECT * FROM information_schema.STATISTICS
			WHERE index_name=indexName
			and table_name=tableName
			and table_schema=dbName
			)
		THEN
			SET @ddl=CONCAT('CREATE INDEX `',indexName,'` ON `',dbName,'`.`',tableName,'` (',indexFields,')');
			PREPARE stmt FROM @ddl;
			EXECUTE stmt;
        END IF;
	END //
DELIMITER ;
