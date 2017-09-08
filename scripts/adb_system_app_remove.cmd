@rem %1 - package (com.flybbit.remotecontrol)


@set ADB_EXEC_BEFORE_COMMANDS[1]=echo Uninstalling  apk %1
@set ADB_EXEC_BEFORE_COMMANDS[2]=call %~dp0/adb_restart
@set ADB_EXEC_BEFORE_COMMANDS.length=2

@set ADB_EXEC_COMMANDS[1]=adb !ADB_EXEC_USETCP_OPT! devices
@set ADB_EXEC_COMMANDS[2]=adb !ADB_EXEC_USETCP_OPT! root
@set ADB_EXEC_COMMANDS[3]=adb !ADB_EXEC_USETCP_OPT! remount 
@set ADB_EXEC_COMMANDS[4]=adb !ADB_EXEC_USETCP_OPT! shell rm -rf /system/app/%1
@set ADB_EXEC_COMMANDS.length=5

@set ADB_EXEC_AFTER_COMMANDS[1]=echo DONE
@set ADB_EXEC_AFTER_COMMANDS.length=1

@call %~dp0/adb_exec
