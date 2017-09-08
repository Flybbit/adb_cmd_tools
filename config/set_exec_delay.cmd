@rem adb_exec calls this cmd every time at the very beginning

@rem ADB_NET_EXEC_DELAY and ADB_USB_EXEC_DELAY defines timeout aftere command execution
@rem for wifi and usb connection. wifi works more stable with delay (less "device not found" exceptions)
@rem ADB_USB_EXEC_DELAY exists just in case

@if NOT DEFINED ADB_NET_EXEC_DELAY (set ADB_NET_EXEC_DELAY=2)
@if NOT DEFINED ADB_USB_EXEC_DELAY (set ADB_USB_EXEC_DELAY=0)

@echo.
@echo ADB_NET_EXEC_DELAY = %ADB_NET_EXEC_DELAY%
@echo ADB_USB_EXEC_DELAY = %ADB_USB_EXEC_DELAY%
