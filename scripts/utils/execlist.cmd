@set i=0

:loop
@if not defined %1[%i%]  goto:eof

@for /f "delims== tokens=2" %%j in ('set %1[%i%]') do @(
		
	@call %~dp0/trim_left "%%j" execListCommand
	if not "!execListCommand!"=="" 	(
				
		@echo.
		if "!execListCommand:~0,4!"=="echo" (			
			@echo		!execListCommand:~5,9999999999999999!
		) else (
                        @echo		Exec: !execListCommand!
			!execListCommand!
			if "!execListCommand:~0,4!"=="adb " (
				if %ADB_EXEC_DELAY% GTR 0 (timeout %ADB_EXEC_DELAY% > NUL) 	
			)								
		)														
	)	

)
@set /a i=%i%+1
@goto loop