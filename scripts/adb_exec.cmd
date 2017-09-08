@setlocal EnableDelayedExpansion

@rem	!ADB_EXEC_USETCP_OPT! in commands depends on ADB_EXEC_HOST variable. if ADB_EXEC_HOST is defined - ADB_EXEC_USETCP_OPT == -e

@rem USAGE:

@rem	set ADB_EXEC_HOST=192.168.1.11:5555			(optional if ADB_EXEC_HOST not defined - connect using usb)
@rem 	set ADB_EXEC_BEFORE_COMMANDS[1]=adb_restart
@rem	set ADB_EXEC_BEFORE_COMMANDS.length=1


@rem 	set ADB_EXEC_COMMANDS[1]=adb devices
@rem 	set ADB_EXEC_COMMANDS[2]=adb !ADB_EXEC_USETCP_OPT! shell am startservice -S -W -n com.flybbit.remotecontrol/com.flybbit.remotecontrol.ScreenOnServ
@rem	set ADB_EXEC_COMMANDS[3]=adb !ADB_EXEC_USETCP_OPT! shell am start -S -W -n com.pas.webcam/com.pas.webcam.Rolling
@rem	set ADB_EXEC_COMMANDS.length=3

@rem 	set ADB_EXEC_AFTER_COMMANDS[1]=echo DONE
@rem	set ADB_EXEC_AFTER_COMMANDS.length=1

@rem	adb_exec



@call %~dp0/../config/set_exec_delay

@IF DEFINED ADB_EXEC_HOST (
	@SET ADB_EXEC_USETCP_OPT=-e
	@SET ADB_EXEC_DELAY=%ADB_NET_EXEC_DELAY%
) ELSE (
	@SET ADB_EXEC_USETCP_OPT=
	@SET ADB_EXEC_DELAY=%ADB_USB_EXEC_DELAY%
)

@call %~dp0/utils/execlist ADB_EXEC_BEFORE_COMMANDS

@call %~dp0/adb_connect

@call %~dp0/utils/execlist ADB_EXEC_COMMANDS

@call %~dp0/adb_disconnect

@call %~dp0/utils/execlist ADB_EXEC_AFTER_COMMANDS

