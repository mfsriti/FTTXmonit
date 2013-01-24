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

DROP PROCEDURE IF EXISTS findFDTIdInPredecessors//

CREATE PROCEDURE findFDTIdInPredecessors(cid VARCHAR(30))
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
	
	SET @SQLStmt = CONCAT('SELECT * FROM Components, componenttypes WHERE components.componentTypeId=componenttypes.componentTypeId AND componenttypes.componentTypeName="FDT" AND ComponentId IN ', _output);
	PREPARE Stmt FROM @SQLStmt;
	EXECUTE Stmt;
	DEALLOCATE PREPARE Stmt;
	
	#select _output;
END //

DROP PROCEDURE IF EXISTS findDeepSuccessors//

SET @@SESSION.max_sp_recursion_depth=20; //
CREATE PROCEDURE findDeepSuccessors(cid VARCHAR(30), OUT suc_ids TEXT)
BEGIN
	DECLARE suc_ids2 TEXT;
	DECLARE suc_id VARCHAR(30);
	DECLARE no_more_successors INT DEFAULT 0;
	DECLARE suc_cur CURSOR FOR SELECT SuccessorId FROM Successors  WHERE ComponentId=cid;
	DECLARE CONTINUE HANDLER FOR NOT FOUND
	SET  no_more_successors = 1;
	
	SET suc_ids = cid;
	OPEN  suc_cur;
	FETCH  suc_cur INTO suc_id;
	REPEAT
	    call findDeepSuccessors(suc_id, suc_ids2);
	    SET suc_ids = CONCAT(suc_ids,CONCAT('","', suc_ids2));
		FETCH  suc_cur INTO suc_id;
		UNTIL  no_more_successors = 1
	END REPEAT;
	CLOSE  suc_cur;	
END//

DROP PROCEDURE IF EXISTS findSuccessors//
CREATE PROCEDURE findSuccessors(cid VARCHAR(30))
BEGIN
	DECLARE SQLStmt TEXT;
	DECLARE _output TEXT DEFAULT '';
	
	call findDeepSuccessors(cid, _output);
	
	SET _output = CONCAT('("',_output);
	SET _output = CONCAT(_output,'")');
	
	SET @SQLStmt = CONCAT('SELECT * FROM Components, componenttypes WHERE components.componentTypeId=componenttypes.componentTypeId AND ComponentId IN ', _output);
	PREPARE Stmt FROM @SQLStmt;
	EXECUTE Stmt;
	DEALLOCATE PREPARE Stmt;
	#select _output;
END //

delimiter ;

call findSuccessors('Cable30002');
