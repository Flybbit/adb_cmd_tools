@set ADB_EXEC_BEFORE_COMMANDS[1]=echo Rebooting device...
@set ADB_EXEC_BEFORE_COMMANDS[2]=call %~dp0/adb_restart
@set ADB_EXEC_BEFORE_COMMANDS.length=2

@set ADB_EXEC_COMMANDS[1]=adb devices
@set ADB_EXEC_COMMANDS[2]=adb !ADB_EXEC_USETCP_OPT! reboot
@set ADB_EXEC_COMMANDS.length=2

@set ADB_EXEC_AFTER_COMMANDS[1]=echo DONE
@set ADB_EXEC_AFTER_COMMANDS.length=1


@call %~dp0/adb_exec