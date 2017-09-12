
@call %~dp0/remove_quotes %1 curlReadParams

@if "%curlReadParams%"=="" (
	@ECHO CURL_PARAMS config undefined
	@goto :EOF
)

@call %curlReadParams%


@if "%CURL_PARAMS.URL%"=="" (
	@ECHO CURL_PARAMS.URL undefined
	@goto:eof
)

@if "%CURL_PARAMS.METHOD%"=="" (
	@set CURL_PARAMS.METHOD=GET
)




@set url=%CURL_PARAMS.URL%


@if "!CURL_PARAMS[0].NAME!"=="" @goto exec


@set url=!url!?
@set i=0




:loop

@set pname=!CURL_PARAMS[%i%].NAME!

@if "!pname!"=="" @goto exec
@set pvalue=!CURL_PARAMS[%i%].VALUE!


@if %i% GTR 0 @set "url=!url!^^^&"



@set "url=!url!!pname!=!pvalue!"

@set /a i=%i%+1

@goto loop

:exec

@set %2=%CURL_PARAMS.METHOD%
@set %3=%url%