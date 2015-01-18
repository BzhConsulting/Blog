use[master]
GO

alter database 
  AdventureWorks2012 
set 
  SINGLE_USER 
with 
  rollback immediate
GO

alter database 
  AdventureWorks2012 
modify 
  name = AdventureWorks2012_old
GO

alter database 
  AdventureWorks2012_old 
set 
  MULTI_USER
GO