@call %~dp0/remove_quotes %1 trimLeftCmd
@for /f "tokens=* delims= " %%a in ("%trimLeftCmd%") do @set trimLeftCmd=%%a
@set %2=%trimLeftCmd%


