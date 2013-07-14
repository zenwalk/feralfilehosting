How do I get OpenVPN to start and connect every time I log onto Windows 7 system? 

First you must setup OpenVPN correctly and according to this FAQ: [OpenVPN](https://www.feralhosting.com/faq/view?question=5)

After you have set up OpenVPN GUI properly, start by navigating to the Task Scheduler under Start->All Programs->Accessories->System Tools and double clicking to open the Task Scheduler.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/OpenVPN%20-%20start%20and%20connect%20everytime%20I%20log%20onto%20a%20Windows%207%20system/1.jpg)

Once the Task Scheduler launches, click on the Task Scheduler Library subheading on the left and click Create Task (not 'Create Basic Task') in the right window panel.

Another windows will pop up with the tabs GENERAL, TRIGGERS, ACTIONS, CONDITIONS, SETTINGS. 
Under the GENERAL tab, type in a name for the task like "OpenVPN" or whatever you want. 
Also make sure that you check the "Run with highest privileges" dialog box and that the drop down menu below that says "Configured for Windows Vista, Windows Server 2008"

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/OpenVPN%20-%20start%20and%20connect%20everytime%20I%20log%20onto%20a%20Windows%207%20system/2.jpg)

(note: if you change this last setting to configured for Windows 7 and Windows Server 2008 R2, you will not get a handy system tray icon when OpenVPN is connected)

Now move on to the next tab TRIGGERS. Click 'New' button to get another pop up window to configure.

For the "Begin the task" drop down menu, select 'At log on' and make sure the last dialog box for 'enable' is checked and then click 'OK'

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/OpenVPN%20-%20start%20and%20connect%20everytime%20I%20log%20onto%20a%20Windows%207%20system/3.jpg)

(note: If you are on a system that you don't need to log into, you may want to add multiple triggers to include 'at startup'! More on this later.)

Now goto the 'ACTIONS' tab and click 'New' button.

For 'Action' setting choose 'Start a program' and then browse to where the "openvpn-gui.exe" was installed.
(note: On Windows systems it is usually found here by default for:

x86 version:

```
C:\Program Files (x86)\OpenVPN\bin\openvpn-gui.exe
```

x64 version:

```
C:\Program Files\OpenVPN\bin\openvpn-gui.exe
```

After This you have to add the following line into the box labeled "Add arguments (optional):"

```
--connect client.ovpn --silent_connection 1
```

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/OpenVPN%20-%20start%20and%20connect%20everytime%20I%20log%20onto%20a%20Windows%207%20system/4.jpg)

(note: only the first argument is required, but the '--silent_connection 1' is nice because it keeps the GUI for OpenVPN from cluttering your screen while it runs its scripts)

Then click 'OK'

Under CONDITIONS Tab the only setting you should have to change is to check the box for "Start only if the following network connection is available:" and make it for 'Any connection'

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/OpenVPN%20-%20start%20and%20connect%20everytime%20I%20log%20onto%20a%20Windows%207%20system/5.jpg)

For the all those who like to live dangerous and either have no logon screen, or have it automatically set to enter your credentials when you boot into windows, you must also take the following some further steps to ensure OpenVPN will run automatically.

For all those who use a password protected logon screen that requires credentials to be entered, this is as far as you have to go.
Just click 'OK' to complete creating this task. Exit Task Scheduler, and log off and back into Windows to test it out. 
All should work like a charm.

Now for the rest of you that do not use login... Navigate to the SETTINGS

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/OpenVPN%20-%20start%20and%20connect%20everytime%20I%20log%20onto%20a%20Windows%207%20system/6.jpg)

Now make the following changes to these settings;

--Check the box for 'Allow task to be run on demand'
--Check the box for 'Run task as soon as possible after a scheduled start is missed'
--Check the box for 'If the task fails, restart every:' (set this to 1 minute)
--Set the Attempt to restart up to: 3 times
--(optional)-- you may uncheck 'Stop the task if it runs longer than:' or change the lenghth.
--Check the box for 'If the running task does not end when requested, force it to stop'

Leave the last box unchecked and do not change any other settings.

Now navigate back over to the TRIGGERS tab and add another entry by clicking new. 
Make this new trigger so that the task will also start when the computer is booted up, by changing thwe event to 'at startup'. (Those of you that use login do not need to worry about this)

Click OK and all done. You can test by either rebooting or logging off. 

(note: Those of you that choose this second option of not using a login will have approximately a one minute delay before you will see OpenVPN starting up in your system tray)
