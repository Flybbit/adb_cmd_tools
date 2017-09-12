@if (@CodeSection == @Batch) @then
@setlocal EnableDelayedExpansion

@call %~dp0/curl_read_params %1 method url
@cscript /nologo /e:jscript "%~f0" %method% "%url%"

@endlocal

@goto :EOF

@end // end batch / begin JScript chimera


if (WSH.Arguments(1)) {
	var x = WSH.CreateObject("Microsoft.XMLHTTP");

	x.open(WSH.Arguments(0), WSH.Arguments(1), true);
	x.setRequestHeader('User-Agent','XMLHTTP/1.0');
	x.send('');
	
	while (x.readyState != 4) WSH.Sleep(50);
}
