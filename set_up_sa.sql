use master
go
ALTER LOGIN sa WITH PASSWORD = 'hongducct'
GO

SELECT name, is_disabled FROM sys.server_principals WHERE name = 'sa'

SELECT IS_SRVROLEMEMBER('sysadmin', 'sa')

ALTER LOGIN sa WITH CHECK_POLICY = OFF, CHECK_EXPIRATION = OFF;
