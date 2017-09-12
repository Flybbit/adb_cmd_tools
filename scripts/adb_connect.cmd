@IF NOT DEFINED ADB_EXEC_HOST (		
	@goto:eof
)
@echo.
@echo adb connect %ADB_EXEC_HOST%
@adb connect %ADB_EXEC_HOST%	
