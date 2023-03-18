EXECUTE AS USER = 'Test'

SELECT * FROM fn_my_permissions ('Actor','object')
SELECT * FROM fn_my_permissions ('Adress_view','object')

EXEC sp_helprotect Adress_view
EXEC sp_helprotect Actor
EXEC sp_helprotect

REVERT




SELECT loginame, program_name, hostname, status FROM sys.sysprocesses