@call %~dp0/utils/remove_quotes %1 adbCmd
@set ADB_EXEC_COMMANDS[0]=%adbCmd%

@call %~dp0/adb_exec