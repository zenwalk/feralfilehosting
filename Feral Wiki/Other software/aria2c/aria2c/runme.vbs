set service = GetObject ("winmgmts:")

for each Process in Service.InstancesOf ("Win32_Process")
	If Process.Name = "aria2c.exe" then
		wscript.echo "aria2c.exe is already running"
		wscript.quit
	End If
next
wscript.echo "aria2c.exe has been started"
CreateObject("Wscript.Shell").Run "aria2c.bat",0,True
wscript.quit