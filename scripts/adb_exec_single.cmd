@call %~dp0/utils/remove_quotes %1 adbCmd
@set ADB_EXEC_COMMANDS[1]=%adbCmd%
@set ADB_EXEC_COMMANDS.length=1

@call %~dp0/adb_exec