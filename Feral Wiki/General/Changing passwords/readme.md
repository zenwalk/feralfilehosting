
### www.feralhosting.com website

To change your password for the www.feralhosting.com website and Account Manager, please use this method: 

[Recover account](https://www.feralhosting.com/heron/recover-account)

### Installable Software:

To change passwords for some of the applications, please see below. A few of these methods will require you to use the command-line. You can use the [SSH Guide basics](https://www.feralhosting.com/faq/view?question=12) to connect.

### Deluge Web Gui password

To change the Deluge Web Gui password:

**1:** Login to the Web Gui using the details in your Software Status page
**2:** Click on `Preferences`
**3:** Click on `Interface` in the menu that opens up
**4:** Enter your old password
**5:** Enter the new password you wish to use!

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/General/Changing%20passwords/deluge.png)

### Transmission Password

To change the password in Transmission, you will need to stop it with this command:

```
killall transmission-daemon
```

Then edit the file:

```
 ~/.config/transmission-daemon/settings.json
```

You need to edit a setting called:

```
rpc-password
```

Transmission will automatically be restarted every 10 minutes of the hour (so on the 10th, 20th minute and so on)

**Important note:** Make sure you finish editing the file before it starts back otherwise things might not work.

### wTorrent Password

If you simply want to reset your wTorrent password, you can request a reinstall from the [Install Software page in your manager](https://www.feralhosting.com/manager/) to get a new system-generated password for your wTorrent web interface. 

If you want to set a custom password, you can change the wTorrent password by selecting **Admin** at the top then creating a new user with a new password with administrator privileges, you can then delete the old user.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/General/Changing%20passwords/wtorrent.png) 

If you have forgotten any changed passwords you will need to delete this folder:

```
~/www/$(whoami).$(hostname)/public_html/wtorrent/
```

Then reinstall it from the [Install Software](https://www.feralhosting.com/manager/) page in your Account Manager, you will then get a new username and password.

This should not affect rTorrent unless you have modified it yourself.

### Rutorrent Web Gui Password

**Important Note:** Please also see this FAQ: [Password protect your WWW folder](https://www.feralhosting.com/faq/view?question=22)

If you simply want to reset your Rutorrent password, you can request a reinstall from the [**Install Software** page in your manager](https://www.feralhosting.com/manager/) to get a new system-generated password for your Rutorrent web interface. If you want to set a custom password for your Rutorrent Web Gui, you will need to [connect to your slot with putty](https://www.feralhosting.com/heron/faq/view?question=12), and make changes to the `.htpasswd` file, using the `htpasswd` program. You cannot just edit the `.htpasswd` file directly, because it stores the passwords hashed (or scrambled) for security.

By default, when rutorrent is auto-installed from the [Install Software page in your manager](https://www.feralhosting.com/manager/), it places the `.htpasswd` file in the rutorrent folder.

To use htpasswd, you need to execute the following set of commands in the shell:

```
cd ~/www/$(whoami).$(hostname)/public_html/rutorrent/
```

This will transfer you to the `/rutorrent` directory on the server where the `.htpasswd` file for rutorrent resides by default.

Now execute:

```
htpasswd -s .htpasswd username
```

**Important note:** Replace `username` with your Feral username. This will prompt to update the password for this user if they exist instead of creating a new one.

At this point, you will be prompted to enter your new password, and then verify.

If you get the following error, it means that the location of your .htpasswd file is not where you specified:

```
htpasswd: cannot modify file /home/username/.htpasswd; use '-c' to create it
```

Then please adjust the command line accordingly:

```
htpasswd -cs ~/private/.htpasswd username newpassword
```

You can get more info about the htpasswd command by typing `htpasswd` without any options. It will then display the options and switches you can use.

### Shell (SSH), FTP, and SFTP Passwords

Changing the default shell access password complicates things for the support team when you need their
help. You will need to include your new password with every support ticket. If you are just looking to
simplify your login procedure in PuTTY, consider [setting up publickey authentication](https://www.feralhosting.com/faq/view?question=13).

FTP and your SFTP password can be changed by logging in via PuTTY and typing this command:

```
passwd
```

You should then see on-screen prompts asking you for your current and new passwords.

If you don't remember your originally assigned password, please go to the [Slot Details](https://www.feralhosting.com/manager/slot/?) for your slot, and it will be listed there.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/General/Your%20Feral%20slot%20is%20active%20-%20Part%201%20-%20The%20Account%20Manager/02%20slot%20detail%201.png)






