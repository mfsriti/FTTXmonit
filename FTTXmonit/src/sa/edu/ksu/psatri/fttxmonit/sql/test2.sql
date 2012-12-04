with recursive temp_table (compId,predId) AS
(
select a.ComponentId, a.PredecessorID
from predecessors a
where a.ComponentId = 'Cable30002'
UNION ALL
select b.ComponentId, b.PredecessorId
from predecessors b, temp_table c
where c.PredecessorId = b.ComponentId
)