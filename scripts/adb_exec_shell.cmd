@call %~dp0/utils/remove_quotes %1 shellCmd
@call %~dp0/adb_exec_single "adb !ADB_EXEC_USETCP_OPT! shell %shellCmd%"