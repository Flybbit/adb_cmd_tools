@rem %1 - package (com.flybbit.remotecontrol)
@rem %2 - path to apk
@rem %3 - apk name in sys folder

@if Not Exist %2 (
	@echo on
	echo File does not exist %2
	goto:eof
)

@set ADB_EXEC_BEFORE_COMMANDS[0]=echo Pushing apk %1 to /system/app ...
@set ADB_EXEC_BEFORE_COMMANDS[1]=call %~dp0/adb_restart

@set ADB_EXEC_COMMANDS[0]=adb !ADB_EXEC_USETCP_OPT! devices
@set ADB_EXEC_COMMANDS[1]=adb !ADB_EXEC_USETCP_OPT! root
@set ADB_EXEC_COMMANDS[2]=adb !ADB_EXEC_USETCP_OPT! remount 
@set ADB_EXEC_COMMANDS[3]=adb !ADB_EXEC_USETCP_OPT! shell rm -rf /system/app/%3
@set ADB_EXEC_COMMANDS[4]=adb !ADB_EXEC_USETCP_OPT! push %2 /system/app/%3
@set ADB_EXEC_COMMANDS[5]=adb !ADB_EXEC_USETCP_OPT! reboot

@set ADB_EXEC_AFTER_COMMANDS[0]=echo DONE

@call %~dp0/adb_exec
