@set command=%1
@for /f "useback tokens=*" %%a in ('%command%') do @set command=%%~a
@set %2=%command%