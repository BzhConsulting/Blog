--Manipulaton des NULLs
--Non-sargable
select
	...
from
	[Production].[Product] 
where 
	coalesce(Name, 'Adjust') = 'Adjust'

--Sargable 	
select
	... 
from	
	[Production].[Product]
where 
	(FullName = 'Adjust') 
or 
	(FullName is null)

--Recherche de String
--Non-sargable
SELECT 
	... 
from
	[Production].[Product] 
where 
	substring([Name],1,6) = 'Adjust'

--Sargable 		
SELECT 
	... 
from	
	[Production].[Product] 
where 
	name like 'Adjust%'	
	
--Comparaison numéric
--Non-sargable
SELECT 
	... 
from
	[Production].[Product] 
where 
	not safetystocklevel < 600

--Sargable
SELECT 
	... 
from
	[Production].[Product] 
where 
	safetystocklevel >= 600

	
--Comparaison numéric
--Non-sargable
SELECT 
	... 
from
	[Production].[Product] 
where 
	safetystocklevel in (800,1000)
--Sargable
SELECT 
	... 
from
	[Production].[Product] 
where 
	safetystocklevel = 800
union all 
select 
	... 
from
	[Production].[Product] 
where 
	safetystocklevel = 1000
