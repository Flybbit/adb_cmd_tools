@IF NOT DEFINED ADB_EXEC_HOST (		
	@goto:eof
)
@echo.
@echo adb disconnect %ADB_EXEC_HOST%
@adb disconnect %ADB_EXEC_HOST%