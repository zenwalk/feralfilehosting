You will need to have Mysql already installed. You can do this from the [**Install Software** link in your Manager](https://www.feralhosting.com/manager/)

Current Version used in the Feral Installer = `5.6.12`

Our installation service will compile version `5.6.12` and place it in your account giving you complete control over it; normally the installation directory is 

~~~
~/private/mysql/
~~~

Which contains everything from error logs, binaries to the data directories.

The binaries are stored in:

~~~
~/private/mysql/bin
~~~

You can call them directly from there prefixing this to any command:

~~~
~/private/mysql/bin
~~~

Or add it to your PATH using this command:

~~~
echo 'PATH=~/private/mysql/bin:$PATH' >> ~/.bashrc
~~~

The run this command to reload your shell:

~~~
source ~/.bashrc
~~~

### Restarting Mysql

If for some reason MySQL crashes or goes down, you can restart it by logging in to [PuTTy](https://www.feralhosting.com/faq/view?question=12) and executing the command:

~~~
bash ~/private/mysql/launch.sh
~~~

### Editing the Configuration files

You can edit the configuration files to your needs but you are asked to remember that you are sharing the server resources with others. If your settings are too extreme and other users become affected Staff will intervene. So be cautious and mindful with these settings.

### Enable Networking

Networking has been disabled by default, within the configuration which means only a socket connection is available.

~~~
~/private/mysql/my.conf
~~~

You will need to comment out

~~~
skip-networking
~~~

In the `mysqld` section of the `my.conf` like this:

~~~
# skip-networking
~~~

Optional: This command will make the change to your `~/private/mysql/my.conf` for you.

~~~
sed -i 's/^skip-networking/# skip-networking/g' ~/private/mysql/my.conf
~~~

Take note of the port in the `mysqld` section of the `my.conf`

This command should show you, in SSH, the port from a default `my.conf`

~~~
sed -n '11p' ~/private/mysql/my.conf
~~~

And then restart mysql for this to take effect.

[Restarting - rtorrent - Deluge - Transmission - MySQL](https://www.feralhosting.com/faq/view?question=158)

### Using the Socket

The socket path will be displayed in your Slot Details page post installation:

~~~
/media/DiskID/username/private/mysql/socket
~~~

### Example using a socket with WordPress

[Wordpress basic set up](https://www.feralhosting.com/faq/view?question=211)

Here is an example if the Worpress configuration file post installation:

~~~
define('DB_HOST', ':/media/DiskID/home/username/private/mysql/socket');
~~~

**Important note:** In some cases you will need to prefix the `:` to the socket path in your web apps' installation. Sometimes you do not need to do this. This is entirely down to how the Web app is coded and not Feral.

In some cases this FAQ can be applied, though not all: [Mysql - Change php settings using htaccess](https://www.feralhosting.com/faq/view?question=213)

### Mysql Administration

We can set up [phpMyAdmin](http://www.phpmyadmin.net/) (for database administration) if requested via a ticket in the support section.

**Set-up phpMyAdmin** manually for easy and quick mysql administration using this FAQ: [phpmyadmin - MySQL Administration](https://www.feralhosting.com/faq/view?question=230)

**Set-up Adminer** manually for easy and quick mysql administration using this FAQ: [Adminer - MySQL administration](https://www.feralhosting.com/faq/view?question=116).

### Backup your MYSQL databases via SSH (crontab friendly)

Connect using SSH and run this command to backup a single (or multiple if you read on) databases of your choosing to folder you have created via ssh.

You must first edit this/these commands to reflect some personal details.

`DiskID:` Your disk ID from the full path.

`USERNAME:` Your Feral Username
 
`PASSWORD:` NO SPACES between the `-p` and the `PASSWORD`. Use your root mysql password found via your software page after installing mysql.

`YourDB1:` The name of the database you wish to backup.

`mysqlbak:` The location where you wish the file to be backup up to.

`YourDB1:` The name you wish the backed up file to have.

To quickly break down this command:

First we prefix the path to the binary , if it was not manually added to the PATH:

~~~
~/private/mysql/bin 
~~~

`&&` Signifies for the command to continue with the next command if the previous worked.

~~~
&&
~~~

Then we execute a backup command using the mysqldump binary and pass it some arguments and info. In this case the socket location, username and password for ROOT, Database to be backed up and then where we want the backup to be stored.

~~~
./mysqldump --socket=/media/DiskID/home/USERNAME/private/mysql/socket -u root -pPASSWORD YourDB1 > ~/mysqlbak/YourDB1
~~~

**Here is the full command.**

~~~
~/private/mysql/bin/./mysqldump --socket=/media/DiskID/home/USERNAME/private/mysql/socket -u root -pPASSWORD YourDB1 > ~/mysqlbak/YourDB1
~~~

In this second version we are backing up 2 Databases.

First I will break down the expanded version of the multiple backup command.

`&&` Signifies for the command to continue with the next command if the previous worked. It can be used to string multiple commands (more than two) as shown below.

~~~
&&
~~~

Then we add a clone of the first command minus the CD command. For example we are also backing up `YOURBD2` in this example so we append the previous command with.

~~~
./mysqldump --socket=/media/DiskID/home/USERNAME/private/mysql/socket -u root -pPASSWORD YourDB2 > ~/mysqlbak/YourDB2
~~~

Notice the `&&` in-between new commands and the new database backup command `YourDB2` appended to the first.

**Here is the full command.**

~~~
~/private/mysql/bin/./mysqldump --socket=/media/DiskID/home/USERNAME/private/mysql/socket -u root -pPASSWORD YourDB1 > ~/mysqlbak/YourDB1 && ./mysqldump --socket=/media/DiskID/home/USERNAME/private/mysql/socket -u root -pPASSWORD YourDB2 > ~/mysqlbak/YourDB2
~~~

You can add as many databases as you need by appending the new ones to the end of the command.



