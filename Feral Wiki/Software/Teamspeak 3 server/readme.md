
### Error on Start up

If Teamspeak is not giving you the privilege key on first run you will need to check the logs at:

~~~
~/private/teamspeaks/logs
~~~

And look for this error

~~~
Server() error while starting servermanager, error: instance check error
~~~

It means Teamspeak is detecting another users instance and will not let you run yours, do this command in SSH to confirm:

~~~
ps -e | grep ts3server
~~~

If you get any results that means there is another instance running.

Sadly, there is no workaround right now for this issue. Your options are:

**1:** Try to get a non for profit license or purchase an annual license: [http://sales.teamspeakusa.com/licensing.php](http://sales.teamspeakusa.com/licensing.php)

**2:** Consider this alternative Voip Client called Mumble: [Mumble client and murmur server](https://www.feralhosting.com/faq/view?question=227)

### Cogent IP issues

~~~
sed -i "s/voice_ip=.*/voice_ip=0.0.0.0/g" ~/private/teamspeak/ts3server.ini
sed -i "s/filetransfer_ip=.*/filetransfer_ip=0.0.0.0/g"
sed -i "s/query_ip=.*/query_ip=0.0.0.0/g"
bash ~/private/teamspeak/ts3server_startscript.sh stop
bash ~/private/teamspeak/ts3server_startscript.sh start
~~~

Run these commands and the problem will be fixed. Just some changes to the IP settings in the ts3server.ini file.

The script has also been updated in regards to this issue.

## Teamspeak 3 on Feral Slots.

 To install this software using a custom bash script connect to your slot using SSH. If you don't know how to do this [here is a basic guide](https://www.feralhosting.com/faq/view?question=12):

~~~
wget -qNO ~/teamspeak.sh http://git.io/rHYfHg
~~~

~~~
bash ~/teamspeak.sh
~~~

Once this script has been executed to completion once, one script is copied to your `~/bin` folder.

`~/teamspeak.sh` is copied to `~/bin/teamspeak`

Now you can simply type this from anywhere to execute the script: 

~~~
teamspeak
~~~

**Features:**

Installs and starts a new instance of 3.0.7.2

Sets up the ts3server.ini for the user automatically.

Detects previous version from installed to the same path or from the script and gives the choice to:

Kill the last known PID and delete the folders. A fresh install.

In place Upgrade. Overwrites the core files with new one. Leaves the sq DB and ts3server.ini intact.

**Post Script installation:**

The bash script creates a symbolic link to the main `ts3server_startscript.sh` in your `~/bin` directory.

Once teamspeak 3 has been installed using the bash script you can use these easy commands to control it:

~~~
ts3server start
ts3server stop
ts3server restart
~~~

Please see the rest of this FAQ for client set-up using your privilege key.

### Manual Installation steps:

We need the Linux Server amd64 3.0.*.*  which you can download manually and then upload to your server. Please just upload the zip to your server root/home folder to keep in line with the rest of the guide.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Teamspeak%203%20server/0.png)

[http://www.teamspeak.com/?page=downloads](http://www.teamspeak.com/?page=downloads)

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Teamspeak%203%20server/0.1.png)

**Or direct to the server using wget** (replace version number with the current version) 
I will try to keep the link updated but if it does not work check the version number of the latest Linux amd64 server and insert it into the url below in two places ...releases/`3.0.*.*`/team....amd64-`3.0.*.*`.tar.gz

~~~
wget -qNO teamspeak.tar.gz http://ftp.4players.de/pub/hosted/ts3/releases/3.0.7.2/teamspeak3-server_linux-amd64-3.0.7.2.tar.gz
~~~

using wget we download the latest version of the Linux amd64 server.

**If you uploaded the zip manually Start Here**

~~~
tar -xzf teamspeak.tar.gz -C ~/private
~~~

This commands will untar/extract the file we just downloaded using wget or uploaded manually

~~~
mv ~/private/teamspeak3-server_linux-amd64 ~/private/teamspeak
~~~

This will rename the extracted directory to something more manageable

~~~
nano ~/private/teamspeak/ts3server.ini
~~~

Copy and paste this code below then save and exit.

~~~
machine_id=
default_voice_port=port number between 10,000 and 30,000
voice_ip=0.0.0.0
licensepath=
filetransfer_port=port number between 30,000 and 50,000
filetransfer_ip=0.0.0.0
query_port=port number between 50,000 and 60,000
query_ip=0.0.0.0
query_ip_whitelist=query_ip_whitelist.txt
query_ip_blacklist=query_ip_blacklist.txt
dbplugin=ts3db_sqlite3
dbpluginparameter=
dbsqlpath=sql/
dbsqlcreatepath=create_sqlite/
dblogkeepdays=90
logpath=logs
logquerycommands=0
dbclientkeepdays=30
~~~

Press **CTRL+X** then **Y** to save and exit.

Do these commands. They will edit the required sections for you using random numbers.

~~~
sed -i "s|default_voice_port=.*|default_voice_port=$(shuf -i 6000-30000 -n 1)|g" ~/private/teamspeak/ts3server.ini
sed -i "s|filetransfer_port=.*|filetransfer_port=$(shuf -i 30001-50000 -n 1)|g" ~/private/teamspeak/ts3server.ini
sed -i "s|query_port=.*|query_port=$(shuf -i 50001-60000 -n 1)|g" ~/private/teamspeak/ts3server.ini
~~~

Your final file will look something like this.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Teamspeak%203%20server/3.png)

~~~
sed -i 's|COMMANDLINE_PARAMETERS="${2}"|COMMANDLINE_PARAMETERS="${2} inifile=ts3server.ini"|g' ~/private/teamspeak/ts3server_startscript.sh
~~~

Once you have done this type:

~~~
bash ~/private/teamspeak/ts3server_startscript.sh start
~~~

This will start the teamspeak server. IF you get a permission error check that you used the chmod command described earlier.

The Output should look like this.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Teamspeak%203%20server/4.png)

**It is very important you do not lose this information until you have entered it into the Teampseak Client. So copy ( by highlighting in putty ) and paste into a text editor of your choosing until we need it in a couple of steps**

Get the Hostname:Default_voice_port to use when connecting with this command.

~~~
echo "$(hostname):$(sed -n -e 's/default_voice_port=\(.*\)/\1/p' ~/private/teamspeak/ts3server.ini)"
~~~


Download and install the Teamspeak 3 client for your platform from: [http://www.teamspeak.com/?page=downloads](http://www.teamspeak.com/?page=downloads)

Once you have installed it run the app and click on connections.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Teamspeak%203%20server/4.5.png)

Enter you hostname and voice port from the command above. Other settings can be tweaked once you have become Server Query.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Teamspeak%203%20server/5.png)

On first connect you will see this. Copy and paste the privilege key that was printed in SSH when the teamspeak server was first run.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Teamspeak%203%20server/6.png)

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Teamspeak%203%20server/7.png)

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Teamspeak%203%20server/8.png)

If you see this then you have completed this guide.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Teamspeak%203%20server/9.png)

Notes: 

On a default installation your are limited to 32 clients. This is more than enough for a few friends and more. If you require more you can apply for a **Not for Profit License** and use up to 512 clients.

[Teamspeak Not for Profit License](http://forum.teamspeak.com/showthread.php/48339-How-to-obtain-a-Non-Profit-License-%28NPL%29-and-Increase-Your-Virtual-Servers-Slots)

If you cannot connect then check the logs  *******0.log** in **~/private/teamspeak/logs**. If you do not see the IP or ports you configured then to you have either not created the ts3server.ini properly or edited the start script correctly. Check over those steps again then stop the server and restart it.

To stop/restart the server for any reason you use the commands start / stop / restart

~~~
bash ~/private/teamspeak/ts3server_startscript.sh start
~~~

~~~
bash ~/private/teamspeak/ts3server_startscript.sh stop
~~~

~~~
bash ~/private/teamspeak/ts3server_startscript.sh restart
~~~




