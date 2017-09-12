@set ADB_EXEC_BEFORE_COMMANDS[0]=echo Rebooting device...
@set ADB_EXEC_BEFORE_COMMANDS[1]=call %~dp0/adb_restart

@set ADB_EXEC_COMMANDS[0]=adb devices
@set ADB_EXEC_COMMANDS[1]=adb !ADB_EXEC_USETCP_OPT! reboot

@set ADB_EXEC_AFTER_COMMANDS[0]=echo DONE


@call %~dp0/adb_exec