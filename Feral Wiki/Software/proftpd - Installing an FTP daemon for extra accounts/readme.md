
### To set up your own SFTP or FTPS server with your own virtual users on your slot, follow this guide:

This bash script will perform the **basic setup** outlined in Steps 1 through 6 only. 

So if you use the bash script and complete it successfully you can continue from Step 7 of the FAQ.

```
wget -qNO ~/proftpd.sh http://git.io/nMVKJA && bash ~/proftpd.sh
```

### Step 1: Get the package and extract it:

```
mkdir -p ~/proftpd/etc/sftp/authorized_keys ~/proftpd/etc/keys ~/proftpd/ssl
wget -qNO proftpd.tar.gz ftp://ftp.proftpd.org/distrib/source/proftpd-1.3.4d.tar.gz
tar -xzf ~/proftpd.tar.gz -C ~/ && rm -f ~/proftpd.tar.gz
cd ~/proftpd-1.3.4d
```

### Step 2: Configure and then install it:

```
install_user=$(whoami) install_group=$(whoami) ./configure --prefix=$HOME/proftpd --enable-openssl --enable-dso --enable-nls --enable-ctrls --with-shared=mod_ratio:mod_readme:mod_sftp:mod_tls:mod_ban
make && make install
cd && rm -rf ~/proftpd-1.3.4d
```

### Step 3.1: Download and create some required configuration files we need:

Do these commands to download the preconfigured configuration files.

```
wget -qNO ~/proftpd/etc/proftpd.conf http://git.io/CbaIJQ
wget -qNO ~/proftpd/etc/sftp.conf http://git.io/SFHs5g
wget -qNO ~/proftpd/etc/ftps.conf http://git.io/ee86Hw
```

### Step 3.2: Optional Configuration:

Use these commands if you would like the conf files configured using SSH commands. Skip this section if you wish to do it manually.

Do these next commands to configure the `proftpd.conf`.

```
sed -i 's|/media/DiskID/home/my_username|'$HOME'|g' ~/proftpd/etc/proftpd.conf
sed -i 's|User my_username|User '$(whoami)'|g' ~/proftpd/etc/proftpd.conf
sed -i 's|Group my_username|Group '$(whoami)'|g' ~/proftpd/etc/proftpd.conf
sed -i 's|AllowUser my_username|AllowUser '$(whoami)'|g' ~/proftpd/etc/proftpd.conf
```

Do these next commands to configure the `sftp.conf`:

```
sed -i 's|/media/DiskID/home/my_username|'$HOME'|g' ~/proftpd/etc/sftp.conf
sed -i 's|Port 23001|Port '$(shuf -i 6000-50000 -n 1)'|g' ~/proftpd/etc/sftp.conf
sed -n -e 's/^Port\(.*\)/\1/p' ~/proftpd/etc/sftp.conf
```

Make a note of this port, This is your SFTP port.

Do these next commands to configure the `ftps.conf`:

```
sed -i 's|/media/DiskID/home/my_username|'$HOME'|g' ~/proftpd/etc/ftps.conf
sed -i 's|Port 23002|Port '$(shuf -i 6000-50000 -n 1)'|g' ~/proftpd/etc/ftps.conf
sed -n -e 's/^Port\(.*\)/\1/p' ~/proftpd/etc/ftps.conf
```

Make a note of this port, This is your FTPS port.

Once these commands have been completed the conf files have all been configured ready for use.

Continue with FAQ.

### Step 4: Generate some keys and certs:

Here you need to generate the SFTP keys and/or the SSL certs for FTPS

**For SFTP:**

Pass-phrases are optional. Proftpd asks for the pass-phrases when you start the daemon if there are any. 

**Copy and paste this command below.** It is required to create our SSH keys.

```
ssh-keygen -t rsa -f ~/proftpd/etc/keys/sftp_rsa && ssh-keygen -t dsa -f ~/proftpd/etc/keys/sftp_dsa
```

Press enter 4 times (no need to use pass-phrases)

**For FTPS:**

**Copy and paste this command below.** It is required to generate the SSL certificates we need for FTPS.

```
openssl req -new -x509 -nodes -days 365 -subj '/C=GB/ST=none/L=none/CN=none' -newkey rsa:2048 -keyout ~/proftpd/ssl/proftpd.key.pem -out ~/proftpd/ssl/proftpd.cert.pem
```

### Step 5: The Configuration files:

**Important note:** These configuration files just work. They do not need to changed to get the functionality described in this guide, apart from where you are directed to do so. 

They have been configured with 3 default **READ ONLY** jails:

```
private/rtorrent/data
private/deluge/data
private/transmission/data
```

They are **READ ONLY** by default, accessible to all non main users so all you need to do is create some standard users to use them. No edits to the configuration files are required. 

**Important note:** To use non default folders or restrict user access, please see the Jail section in `Step 8` of this FAQ for further information.

These configuration files have been set-up to work in a specific way. 

The `proftpd.conf` is home to the global settings that are loaded/included in both the `sftp.conf` and the `ftps.conf` when they are called. 

The `sftp.conf` and `ftps.conf` contain only protocol specific settings.

**Important Note:** These files have already been downloaded, if you used the bash script or followed the commands in `Step 1`, and configured, if you used the bash script or followed the steps in `Step 3.2`. 

For manual set-up or altering, they can be found in the `~/proftpd/etc/` of the installation directory, for example:`~/proftpd/etc/proftpd.conf`

### Manual Configuration (only if you did not use the bash script or skipped step 3.2)

#### proftpd.conf

In the Global Section of the `proftpd.conf`

```
User my_username
Group my_username
```

In the <Limit ALL> section of the `proftpd.conf` change `my_username` to your Feral username to give yourself a full access account. This is the `Main User` account.

```
AllowUser my_username
```

These are the partial line changes you want to change with your own path in the `proftpd.conf`

```
/media/DiskID/home/my_username
```

#### sftp.conf

Change the port to a different number (between 6000 and 50000)

```
Port 23001
```

These are the partial line changes you want to change with your own path in the `sftp.conf`

```
/media/DiskID/home/my_username
```

#### ftps.conf

Change the port to a different number (between 6000 and 50000)

```
Port 23002
```

These are the partial line changes you want to change with your own path in the `ftps.conf`

```
/media/DiskID/home/my_username
```

### Step 6: Create our main user with full access

This command below will automatically create a user using:

**1:** Your Feral slot username.

**2:** Your Feral slot user's `UID` and `GID`. 

**Important Note:** This user is already configured in the `proftpd.conf` for full access if you used the bash script or Step 3.2. 

Use this command to create the main user and enter a password when prompted.

```
~/proftpd/bin/ftpasswd --passwd --name $(whoami) --file ~/proftpd/etc/ftpd.passwd --uid $(id -u $(whoami)) --gid $(id -g $(whoami)) --home $HOME/ --shell /bin/false
```

**Important note:** This user (with your username) will not be jailed. This is a full access account. This is for your use and not public sharing.

**Explanation: using UID and GID:**

Do these commands in SSH, where `my_username` is your Feral username

```
id -u my_username
```

```
id -g my_username
```

For example:

```
id -u superguy
```

Returns:

```
1032
```

And then:

```
id -g superguy
```

Returns:

```
1032
```

This will give you **your** UID and GID, which in this example, are both **1032**. When creating a user if you provide the UID and GID listed from those commands you will have your full permissions when accessing the slot. The username does not matter as long as the UID and GID match. This is important for using some programs like WinSCP or when creating an account for yourself.

### Step 7: Creating new users and groups

These users, when created, are all **jailed by default** based on the configuration file settings.

There is a bash add user script (optional) linked near the end of this section. The users created with this script are also jailed by default.

**Important note:** You will get a directory listing error when connecting if your user's `HOME`, when created, does not match an existing jail path. You can get around this by manually specifying a remote path which is supported by most FTP programs. See Step 8 of this FAQ for more info.

**Important note:** There are three existing and default jail directories you can use without needing to edit the configuration files.

```
private/rtorrent/data
private/deluge/data
private/transmission/data
```

If you use one of these jail paths as your user's `HOME` or as a remote directory in your FTP program your user will already have access and get a successful directory listing when connecting.

### Creating or editing users in SSH using ftpasswd:

In the command below, replace `my_username` with the username of the user you want to add. Add your Jail path after `$HOME/`, for example `$HOME/private/jail`

```
~/proftpd/bin/ftpasswd --passwd --name my_username --file ~/proftpd/etc/ftpd.passwd --uid 5001 --gid 5001 --home $HOME/ --shell /bin/false
```

To change an existing user's password use this command, where `my_username` is the name of the user you wish to edit:

```
~/proftpd/bin/ftpasswd --passwd --name=my_username --change-password --file ~/proftpd/etc/ftpd.passwd
```

To delete an existing users use this command, where `my_username` is the name of the user you wish to remove:

```
~/proftpd/bin/ftpasswd --passwd --name=my_username  --delete-user --file ~/proftpd/etc/ftpd.passwd
```

Please see then end of this section for an easy way to add users using a bash script.

### Creating or editing groups in SSH using ftpasswd:

Now we can add that user to a group (optional):

In the command below, replace `my_username` with the username of the user you want to add to the group `proftpdgroup`. You can change `proftpdgroup` to another name. This new name will be the new group name the user is added to.

```
~/proftpd/bin/ftpasswd --group --name proftpdgroup --file ~/proftpd/etc/ftpd.group --gid 5001 --member my_username
```

Delete an existing group, where `my_group` is the name of the group you wish to remove:

```
~/proftpd/bin/ftpasswd --group --name my_group --delete-group --file ~/proftpd/etc/ftpd.group
```

### Create user bash script

```
wget -qNO ~/proftpdadduser.sh http://git.io/NGk2Aw
```

Then this command to execute it:

```
bash ~/proftpdadduser.sh
```

It will find the next available ID and then ask you for a name, or you can invoke it with a name.

You will need to:

**1:** Enter a username for your new user

**2:** Enter a relative path from the slot's root to the users `HOME`. Do not use `~/` in the path

**3:** Enter a password.

And that should be your new user created and ready to connect.

### Step 8: Jail your users:

**Important note:** Don't forget changes made to the` proftpd.conf`, `sftp.conf` and `ftps.conf` will require the proftpd running process to restarted for the changes to take effect. See `Step 9` for restart commands.

Inside the:

```
## Permissions
```

Section of the `proftpd.conf` you will find that three **READ ONLY** jails have already been set up. The `proftpd.conf` uses a **READ ONLY** jail for all users who are not specifically named with `AllowUser` inside the `<Limit ALL>`section. Any users you create will be jailed by default and restricted to only the default jails.

**Important note:** A user's HOME is the start location where they are placed upon connecting to the server. If they do not have a HOME that corresponds to an existing jail they will most like get a "Directory listing failed" or similar error. You can manually set these paths in most FTP programs, such as Filezilla (default remote directory) since having a HOME is not that important, as long as they have permission to access the remote directory set in your FTP program.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/proftpd%20-%20Installing%20an%20FTP%20daemon%20for%20extra%20accounts/remotedirectory.png)

One of the existing jail examples is for `private/rtorrent/data` so all you need to do is create a user whose `--home` is:

```
--home $HOME/private/rtorrent/data
```

When using the SSH command in the previous section.

Or if you are using the bash script, just do this when prompted for the users `HOME` path:

```
private/rtorrent/data
```

This way when they log in they will be put into this folder. If you don't give them a `--home` that corresponds to the configured jails they will get a blank listing and may not be able to navigate to the jail.

To add more jails look at the example described next to see how we do this.

### Adding or editing custom jails

**Step 1:** Choose or create a folder to lock them in (their HOME location). Then use the relative path to that folder in the commands below for `--home`. This is an optional step, but if their `HOME` corresponds to the jail path you wish to set for them, they will connect directly to their `HOME` folder by default, using an FTP client, with no need to manually specify the location.

```
~/proftpd/bin/ftpasswd --passwd --name my_username --file ~/proftpd/etc/ftpd.passwd --uid 5001 --gid 5001 --home $HOME/path/to/jail --shell /bin/false
```

For example:

```
~/proftpd/bin/ftpasswd --passwd --name my_username --file ~/proftpd/etc/ftpd.passwd --uid 5001 --gid 5001 --home $HOME/private/downloads/ --shell /bin/false
```

**Step2:** Edit your:

```
~/proftpd/etc/proftpd.conf
```

Then add the following. The example code below makes a **READ ONLY** jail some with SFTP specific commands.

You will notice there are already three existing and configured configured jails in the `proftpd.conf`

```
# Note: You need to specify a users root/home directory when using ftpasswd
<Directory /media/DiskID/home/my_username/private/downloads/>
# STAT LSTAT are specific to SFTP only. See below
<Limit STAT LSTAT DIRS READ>
AllowAll
</Limit>
</Directory>
```

### Using symlinks to other directories

If you want to be able to follow symlinks outside the allowed directory you will need to add a new `<Directory>` section for each folder inside the `proftpd.conf`, for example:

You have created a new folder called `proftpd_pub` in the root of your slot using this command:

```
mkdir -p ~/proftpd_pub
```

You have also created a special `completed` directory for your finished torrents opened in Deluge located at:

```
~/private/deluge/completed
```

You have then created this symlink to the Deluge completed directory inside the `proftpd_pub` directory like this:

```
ln -s ~/private/deluge/completed ~/proftpd_pub/downloads
```

To allow the jailed users access via the symlink you would need to add the following to `proftpd.conf` to give them read only access to both required directories.

```
<Directory /media/DiskID/home/username/proftpd_pub/>
# STAT LSTAT are specific to SFTP only. See below
<Limit STAT LSTAT DIRS READ>
AllowAll
</Limit>
</Directory>
#
<Directory /media/DiskID/home/username/private/deluge/completed/>
# STAT LSTAT are specific to SFTP only. See below
<Limit STAT LSTAT DIRS READ>
AllowAll
</Limit>
</Directory>
```

Then you will need to restart the proftpd running process for the changes to take effect.

### AllowAll or AllowUser

The use of `AllowAll` means that any non main user has read only access to the default jails in the default `proftpd.conf`. 

You can remove this and use `AllowUser` insted in this way:

```
<Directory/media/DiskID/home/username/private/deluge/completed/>
# STAT LSTAT are specific to SFTP only. See below
<Limit STAT LSTAT DIRS READ>
AllowUser my_username
</Limit>
</Directory>
```

In this example only `my_username` has read only access to this jail. You can add more than one user.

This will let you fine tune access to the jails.

### Make a jail writeable so users can upload.

To make a directory writeable so users can upload to it you would add `WRITE` permissions.

The default set-up is read only by default on all example jails using this set-up.

```
<Limit STAT LSTAT DIRS READ>
```

To make it so we can upload we simply need to add `WRITE` to the allowed permissions for this jail. So it becomes.

```
<Limit WRITE STAT LSTAT DIRS READ>
```

That is it, this jail is now writeable and users can upload. 

If you wanted to fine tune their upload permissions you would break down the `WRITE` permission into it component parts. What this means is that `WRITE` is a group of commands covering:

```
APPE, DELE, MKD, RMD, RNTO, STOR, STOU, XMKD, XRMD 
```

So instead of `WRITE` you could allow the specific permissions only.

Please see the Useful links section at the end of the FAQ for info on directives you can use in the proftpd.conf and the use of Limits.

### Step 9: Let's start ProFTPD:

**Important note:** If you make changes to the `proftpd.conf` you will need to restart it for these changes to take effect.

**Before you start proftpd make sure you have configured your jails. Configuration file changes require you restart proftpd to take effect.**

This is how you would have both sftp and ftps daemons running at the same time. You will need to run two separate instances of proftpd using different configurations using these commands.

**SFTP**

```
~/proftpd/sbin/proftpd -c ~/proftpd/etc/sftp.conf
```

**FTPS**

```
~/proftpd/sbin/proftpd -c ~/proftpd/etc/ftps.conf
```

**Important note:** You will see some errors here about PRIVS, but that is completely normal, you should be able to now FTP to the port defined in your configuration files.

If you see an error about truncated data on certain lines this is due to there being no new,blank line at the end of the relevant configuration files. You should not see this error with the configuration files included in this FAQ.

Do this command to see if it/they are running:

```
ps x | grep proftpd | grep -v grep
```

You will see one or more results like this:

```
4880 ?        Ss     0:00 proftpd: (accepting connections)
```

We are only interested in the results that end with:

```
proftpd: (accepting connections)
```

These are the actual SFTP and/or FTPS proftpd processes.

To kill the process so you can restart them use this:

```
kill -9 PID
```

Where PID is the number listed in the `ps x | grep proftpd | grep -v grep` command we used.

or 

```
killall -9 proftpd -u $(whoami)
```

To kill all processes.

### Crontab automatic restart on server reboot

To edit your crontab you must do this command:

```
crontab -e
```

Now all you need to do is add whichever of these lines you want to restart on a reboot:

**SFTP**

```
@reboot $HOME/proftpd/sbin/proftpd -c $HOME/proftpd/etc/sftp.conf
```

**FTPS**

```
@reboot $HOME/proftpd/sbin/proftpd -c $HOME/proftpd/etc/ftps.conf
```

Then press and hold `CTRL` then press `X` to save then press `Y` say yes and exit

### Step 10: Connecting to my Server

The process is the same as normal:

[FTP and SFTP basics - Filezilla](https://www.feralhosting.com/faq/view?question=187)

**Host**: server.feralhosting.com
**username**: whatever user names you created
**port**: as you defined in the config files.

### SFTP Public/Private Keys (optional)

The `sftp.conf` has been configured to accept and use key pairs. There is just one things you must do to make it work. You must convert it to `SSH RFC 4716` format. This is not as complicated as it sounds.

The `sftp.conf` has been configured to look for keyfiles already, all you need to do is:

**1:** Convert the public key to  `SSH RFC 4716` format.
**2:** Upload it to the `~/proftpd/etc/sftp/authorized_keys/` directory
**3:** Rename the file to match the username of the user it is authenticating. You can have multiple copies of the same files with different usernames.

It will then work the next time a user tries to authenticate using a matching private key-file.

**On Windows:**

If you are on Windows and you used [Puttygen](https://www.feralhosting.com/faq/view?question=13) to create your keyfile, just open it up in Puttygen and save the public key as shown, with no file extension.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/proftpd%20-%20Installing%20an%20FTP%20daemon%20for%20extra%20accounts/puttygen1.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/proftpd%20-%20Installing%20an%20FTP%20daemon%20for%20extra%20accounts/puttygen2.png)

Now upload this file **named after your proftpd user** to:

```
~/proftpd/etc/sftp/authorized_keys/
```

So for example, if the uploaded filed is named after `my_username` it will look like this after you have uploaded it.

```
~/proftpd/etc/sftp/authorized_keys/my_username
```

Then use this command in SSH to give all files in that directory 600 permissions.

```
find ~/proftpd/etc/sftp/authorized_keys/ -type f -exec chmod 600 {} \;
```

**On Unix:**

```
ssh-keygen -e -f /path/to/file
```

You might have to have only 1 key in a file for this command to work. See the note below.

For example:

```
ssh-keygen -e -f ~/.ssh/authorized_keys
```

**Important note:** I could only make it return the first line of multiple lines in this command. If anyone has a solutions to this please update the FAQ. I suggest using the command directly on the OpenSSH format private or public keys.

### Quick FAQs:

Q: I get permission errors uploading files or trying to change permissions.

A: This is disabled in the proftp.conf in the SITE CHMOD section. Use the `AllowUser Username` directive inside the Limit tags to overcome this on a per user basis

Q: "Failed to retrieve directory listing" and "Failed to parse returned path."

A: Your users Jail home must correspond to an existing Jail path. IF you have made changes to any of the conf files don't forget to restart proftpd as shown in Step 9

### Useful Links:

[Proftpd FAQ](http://www.proftpd.org/docs/faq/linked/faq.html)

[Howto index](http://www.proftpd.org/docs/howto/index.html)

[Limits](http://www.proftpd.org/docs/howto/Limit.html)
[Controls via mod_ctrls](http://www.proftpd.org/docs/howto/Controls.html)
[directives list](http://www.proftpd.org/docs/directives/linked/configuration.html)

[Core Modules](http://www.proftpd.org/docs/modules/index.html)
[Contrib Modules](http://www.proftpd.org/docs/contrib/index.html)

[example-conf](http://www.proftpd.org/docs/example-conf.html)



