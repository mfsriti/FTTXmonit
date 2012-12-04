-- DELETE FROM Successors WHERE SuccessorID IN (SELECT ComponentID FROM Components WHERE ComponentTypeId=5009) OR ComponentID IN (SELECT ComponentID FROM Components WHERE ComponentTypeId=5009);
-- DELETE FROM Predecessors WHERE PredecessorID IN (SELECT ComponentID FROM Components WHERE ComponentTypeId=5009) OR ComponentID IN (SELECT ComponentID FROM Components WHERE ComponentTypeId=5009);
-- DELETE FROM Components WHERE ComponentId IN (SELECT ComponentId FROM (SELECT s.ComponentID FROM Successors s, Components c WHERE s.ComponentID NOT LIKE "FDT%" and s.SuccessorId=c.ComponentID and c.ComponentTypeId=5009) AS T1
--                                             UNION 
--                                            SELECT ComponentId FROM (SELECT s.SuccessorID FROM Successors s, Components c WHERE s.SuccessorID NOT LIKE "FDT%" and s.ComponentID=c.ComponentID and c.ComponentTypeId=5009) AS T2
--                                             );

DELETE FROM Components WHERE ComponentId IN (SELECT ComponentId FROM (SELECT ComponentID FROM Successors WHERE ComponentID NOT LIKE "FDT%" and SuccessorId LIKE "Splice%") AS T1
                                             UNION 
                                             SELECT SuccessorID FROM (SELECT SuccessorID FROM Successors WHERE SuccessorID NOT LIKE "FDT%" and ComponentID LIKE "Splice%") AS T2
                                             );

DELETE FROM Components WHERE ComponentTypeId=5009;

INSERT INTO Components(ComponentID, ComponentTypeId, Size) VALUES('Cable0009', 5004, 288);
INSERT INTO Successors VALUES('FDT163','Cable0009');INSERT INTO Predecessors VALUES('Cable0009','FDT163');
INSERT INTO GPSPoints VALUES('Cable0009', 24.799333*1000000, 46.712351*1000000, 0);
INSERT INTO GPSPoints VALUES('Cable0009', 24.799028*1000000, 46.712502*1000000, 1);
INSERT INTO Components(ComponentID, Latitude, Longitude, ComponentTypeId, CoordX, CoordY) VALUES('Splice0001', 24.799028*1000000, 46.712502*1000000, 5009, 0, 0);
INSERT INTO Successors VALUES('Cable0009','Splice0001');INSERT INTO Predecessors VALUES('Splice0001','Cable0009');


INSERT INTO Components(ComponentID, ComponentTypeId, Size) VALUES('Cable0010', 5004, 144);
INSERT INTO Successors VALUES('Splice0001','Cable0010');INSERT INTO Predecessors VALUES('Cable0010','Splice0001');
INSERT INTO GPSPoints VALUES('Cable0010', 24.799028*1000000, 46.712502*1000000, 0);
INSERT INTO GPSPoints VALUES('Cable0010', 24.798804*1000000, 46.712606*1000000, 1);
INSERT INTO GPSPoints VALUES('Cable0010', 24.798767*1000000, 46.712508*1000000, 2);
INSERT INTO Components(ComponentID, Latitude, Longitude, ComponentTypeId, CoordX, CoordY) VALUES('Splice0002', 24.798767*1000000, 46.712508*1000000, 5009, 0, 0);
INSERT INTO Successors VALUES('Cable0010','Splice0002');INSERT INTO Predecessors VALUES('Splice0002','Cable0010');

INSERT INTO Components(ComponentID, ComponentTypeId, Size) VALUES('Cable0011', 5004, 144);
INSERT INTO Successors VALUES('Splice0002','Cable0011');INSERT INTO Predecessors VALUES('Cable0011','Splice0002');
INSERT INTO GPSPoints VALUES('Cable0011', 24.798767*1000000, 46.712508*1000000, 0);
INSERT INTO GPSPoints VALUES('Cable0011', 24.797883*1000000, 46.710489*1000000, 1);

INSERT INTO Components(ComponentID, ComponentTypeId, Size) VALUES('Cable0012', 5004, 144);
INSERT INTO Successors VALUES('Splice0001','Cable0012');INSERT INTO Predecessors VALUES('Cable0012','Splice0001');
INSERT INTO GPSPoints VALUES('Cable0012', 24.799028*1000000, 46.712502*1000000, 0);
INSERT INTO GPSPoints VALUES('Cable0012', 24.798222*1000000, 46.712891*1000000, 1);
INSERT INTO Components(ComponentID, Latitude, Longitude, ComponentTypeId, CoordX, CoordY) VALUES('Splice0003', 24.798222*1000000, 46.712891*1000000, 5009, 0, 0);
INSERT INTO Successors VALUES('Cable0012','Splice0003');INSERT INTO Predecessors VALUES('Splice0003','Cable0012');

INSERT INTO Components(ComponentID, ComponentTypeId, Size) VALUES('Cable0013', 5004, 144);
INSERT INTO Successors VALUES('Splice0003','Cable0013');INSERT INTO Predecessors VALUES('Cable0013','Splice0003');
INSERT INTO GPSPoints VALUES('Cable0013', 24.798222*1000000, 46.712891*1000000, 0);
INSERT INTO GPSPoints VALUES('Cable0013', 24.797375*1000000, 46.710935*1000000, 1);

INSERT INTO Components(ComponentID, ComponentTypeId, Size) VALUES('Cable0014', 5004, 288);
INSERT INTO Successors VALUES('FDT163','Cable0014');INSERT INTO Predecessors VALUES('Cable0014','FDT163');
INSERT INTO GPSPoints VALUES('Cable0014', 24.799333*1000000, 46.712351*1000000, 0);
INSERT INTO GPSPoints VALUES('Cable0014', 24.799442*1000000, 46.712298*1000000, 1);
INSERT INTO Components(ComponentID, Latitude, Longitude, ComponentTypeId, CoordX, CoordY) VALUES('Splice0004', 24.799442*1000000, 46.712298*1000000, 5009, 0, 0);
INSERT INTO Successors VALUES('Cable0014','Splice0004');INSERT INTO Predecessors VALUES('Splice0004','Cable0014');


INSERT INTO Components(ComponentID, ComponentTypeId, Size) VALUES('Cable0015', 5004, 144);
INSERT INTO Successors VALUES('Splice0004','Cable0015');INSERT INTO Predecessors VALUES('Cable0015','Splice0004');
INSERT INTO GPSPoints VALUES('Cable0015', 24.799442*1000000, 46.712298*1000000, 0);
INSERT INTO GPSPoints VALUES('Cable0015', 24.799915*1000000, 46.712040*1000000, 1);
INSERT INTO GPSPoints VALUES('Cable0015', 24.799878*1000000, 46.711941*1000000, 2);
INSERT INTO Components(ComponentID, Latitude, Longitude, ComponentTypeId, CoordX, CoordY) VALUES('Splice0005', 24.799878*1000000, 46.711941*1000000, 5009, 0, 0);
INSERT INTO Successors VALUES('Cable0015','Splice0005');INSERT INTO Predecessors VALUES('Splice0005','Cable0015');

INSERT INTO Components(ComponentID, ComponentTypeId, Size) VALUES('Cable0016', 5004, 144);
INSERT INTO Successors VALUES('Splice0005','Cable0016');INSERT INTO Predecessors VALUES('Cable0016','Splice0005');
INSERT INTO GPSPoints VALUES('Cable0016', 24.799878*1000000, 46.711941*1000000, 0);
INSERT INTO GPSPoints VALUES('Cable0016', 24.799070*1000000, 46.710031*1000000, 1);

INSERT INTO Components(ComponentID, ComponentTypeId, Size) VALUES('Cable0017', 5004, 144);
INSERT INTO Successors VALUES('Splice0004','Cable0017');INSERT INTO Predecessors VALUES('Cable0017','Splice0004');
INSERT INTO GPSPoints VALUES('Cable0017', 24.799442*1000000, 46.712298*1000000, 0);
INSERT INTO GPSPoints VALUES('Cable0017', 24.800482*1000000, 46.711737*1000000, 1);
INSERT INTO Components(ComponentID, Latitude, Longitude, ComponentTypeId, CoordX, CoordY) VALUES('Splice0006', 24.800482*1000000, 46.711737*1000000, 5009, 0, 0);
INSERT INTO Successors VALUES('Cable0017','Splice0006');INSERT INTO Predecessors VALUES('Splice0006','Cable0017');

INSERT INTO Components(ComponentID, ComponentTypeId, Size) VALUES('Cable0018', 5004, 144);
INSERT INTO Successors VALUES('Splice0006','Cable0018');INSERT INTO Predecessors VALUES('Cable0018','Splice0006');
INSERT INTO GPSPoints VALUES('Cable0018', 24.800482*1000000, 46.711737*1000000, 0);
INSERT INTO GPSPoints VALUES('Cable0018', 24.799664*1000000, 46.709795*1000000, 1);

