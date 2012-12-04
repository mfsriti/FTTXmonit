delimiter //

DROP PROCEDURE IF EXISTS findPredecessors//

CREATE PROCEDURE findPredecessors(cid VARCHAR(30))
BEGIN
	DECLARE _output TEXT DEFAULT '';
	DECLARE var TEXT;
	DECLARE var2 TEXT;
	DECLARE SQLStmt TEXT;
	
	SET var = cid;
	SET  _output = CONCAT('("',cid);
	iter: LOOP
	    SET var2 = (SELECT PredecessorId FROM Predecessors  WHERE ComponentId=var);
	    IF var2 IS NULL THEN
	    	LEAVE iter;
	    END IF;
		SET _output = CONCAT(_output,CONCAT('","', var2));
		SET var = var2;
	END loop iter;
	SET  _output = CONCAT(_output,'")');
	
	SET @SQLStmt = CONCAT('SELECT * FROM Components, componenttypes WHERE components.componentTypeId=componenttypes.componentTypeId AND ComponentId IN ', _output);
	PREPARE Stmt FROM @SQLStmt;
	EXECUTE Stmt;
	DEALLOCATE PREPARE Stmt;
	
	#select _output;
END //

delimiter ;

call findPredecessors('Cable30002');
