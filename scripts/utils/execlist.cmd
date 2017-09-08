@if not defined %1[1] goto:eof

@for /F "tokens=2 delims==" %%s in ('set %1[') do @(

	set command=%%s
	for /f "tokens=* delims= " %%a in ("!command!") do @(set command=%%a)
				               	
	if not "!command!"=="" 	(
				
		@echo.
		if "!command:~0,4!"=="echo" (			
			@echo		!command:~5,9999999999999999!
		) else (
                        @echo		Exec: !command!
			%%s			
			if "!command:~0,4!"=="adb " (
				if %ADB_EXEC_DELAY% GTR 0 (timeout %ADB_EXEC_DELAY% > NUL) 	
			)								
		)														
	)	
)