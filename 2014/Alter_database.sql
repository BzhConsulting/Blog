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

/*Modification du fichier data*/
ALTER DATABASE 
   AdventureWorks2012_old
MODIFY FILE 
   (NAME= N'AdventureWorks2012_Data', 
   NEWNAME= N'AdventureWorks2012_Data_old')
GO
/*Modification du fichier de log*/
ALTER DATABASE 
   AdventureWorks2012_old
MODIFY FILE 
   (NAME=N'AdventureWorks2012_log',
   NEWNAME= N'AdventureWorks2012_old_log')
   
USE [master]
GO
EXEC master.dbo.sp_detach_db
   @dbname = ‘AdventureWorks2012_old’
GO

USE master
GO
sp_configure 'show advanced options'
GO
/* 0 = Disabled , 1 = Enabled */
sp_configure 'xp_cmdshell', 1
GO
RECONFIGURE WITH OVERRIDE
GO
USE [master]
GO
EXEC xp_cmdshell 'RENAME "d:\AdventureWorks2012\AdventureWorks2012_Data.mdf",
"AdventureWorks2012_old_data.mdf"'
GO
EXEC xp_cmdshell 'RENAME "d:\AdventureWorks2012\AdventureWorks2012_old_log.ldf",
"AdventureWorks2012_old_log.ldf"'
GO