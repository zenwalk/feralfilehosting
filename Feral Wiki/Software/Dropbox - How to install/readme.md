
### Download Dropbox to your server

This is a basic guide downloading and installing Dropbox onto your slot and syncing with an account.

In SSH do these commands. Use this faq if you do not know how to SSH into your slot: [SSH basics - Putty](https://www.feralhosting.com/faq/view?question=12)

```
mkdir -p ~/bin && bash
wget -qNO ~/dropbox.tar.gz "http://www.dropbox.com/download/?plat=lnx.x86_64" && tar -xzf dropbox.tar.gz
wget -qNO ~/bin/dropbox.py "http://www.dropbox.com/download?dl=packages/dropbox.py" && chmod 700 ~/bin/dropbox.py
rm -f ~/dropbox.tar.gz
```

### Linking to your dropbox account

If you're running Dropbox on your server for the first time you will have to interact with the process to get a special URL used to link your accounts. You'll then be asked to copy and paste the URL link into a web browser:

When you paste this link you will be asked to

**1:** Sign in or create a new account if you do not have one

Then

**2:** Add/Link your server to an existing account with a password confirmation.

Run these commands to link to your drop box account:

**Important note:** if you have already linked your account you can skip this command and use the start and send to background command below.

```
HOME=$HOME/ ~/.dropbox-dist/dropboxd
```

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Dropbox%20-%20How%20to%20install/firstrun.png)

Copy and paste the link into a browser and follow the instructions to link your account.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Dropbox%20-%20How%20to%20install/success.png)

Dropbox is now successfully installed and linked to your account. You are ready to start using it. You default dropbox folder is located at `~/Dropbox`

Close and kill this process by pressing, then holding, `CTRL` then press `c`. We needed to interact with the process to link our account but this step is now complete. So we want our terminal back and the process running as a background process.

We will now restart the daemon and send it to the background as process.

```
HOME=$HOME/ ~/.dropbox-dist/dropboxd &
```

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Dropbox%20-%20How%20to%20install/firstinstance.png)

And that is it. Dropbox is running in the background syncing your files.

### Multiple Dropbox accounts simultaneously

You can run multiple daemons linking different accounts at the same time.

First, you will need to create a folder where you want your alternate dropbox folder to be located.

The default dropbox is already using our `~/` or home directory so we need to specify another using the command below:

```
mkdir -p ~/dropbox2
```

Inside this folder the following command will create the `Dropbox` and `.dropbox` folders for this link.

Second we must now link this process to your other dropbox account. We specify the folder we created above as the new `HOME`:

**Important note:** if you have already linked your account you can skip this command and use the start and send to background command below.

```
HOME=$HOME/dropbox2 ~/.dropbox-dist/dropboxd
```

Now you will have to follow the same process as previously described to link this account. Once it is done close and kill this process by pressing, then holding, `CTRL` then press `c`.

Now restart is as a process in the background:

```
HOME=$HOME/dropbox2 ~/.dropbox-dist/dropboxd &
```

### Extra stuff:

**It is recommended you start the processes using the commands above.**  and only use the `dropbox.py` to complete other tasks.

We have already installed the Dropbox CLI (Command-line Interface) to your ~/bin directory ready for use.

```
dropbox.py help
```

Your new dropbox folder is located at:

```
~/Dropbox
```

Running Dropbox as a process:

```
dropbox.py start
```

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Dropbox%20-%20How%20to%20install/start.png)

You can get helpf or anyone of these arguments by doing this:

```
dropbox.py help something
```

For example:

```
dropbox.py help exclude
```

A list dropbox.py arguments, returned from the `dropbox.py help` command

```
 status       get current status of the dropboxd
 help         provide help
 puburl       get public url of a file in your dropbox
 stop         stop dropboxd
 running      return whether dropbox is running
 start        start dropboxd
 filestatus   get current sync status of one or more files
 ls           list directory contents with current sync status
 autostart    automatically start dropbox at login
 exclude      ignores/excludes a directory from syncing
 lansync      enables or disables LAN sync
```

### Useful Links

[Using_Dropbox_CLI](http://www.dropboxwiki.com/Using_Dropbox_CLI)



