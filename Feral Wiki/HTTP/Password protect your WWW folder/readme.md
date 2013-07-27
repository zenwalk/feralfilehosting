
**Please see the end of the FAQ for nginx.**

### Htpasswd toolkit Bash script

This bash script provides some easy options to perform some common tasks.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/bashscript.png)

~~~
wget -qNO ~/htpasswdtk.sh http://git.io/eJySww && bash ~/htpasswdtk.sh
~~~

This script will also get the latest version and copy it to your `~/bin` directory and make it executable.
So after you have run it for the first time you can simply do:

~~~
htpasswdtk
~~~

From anywhere in a SSH session. The script will perform this check each time it is run. So run the script, exit and use the command:

~~~
htpasswdtk
~~~

Then you will be using the most current version.

### These are the basic steps to password protect a directory in SSH:

Please use a good password where the at least the first 8 characters are not easily guessable.

A combination of Letters, numbers and mixed case will be perfect, for example: **dHr6wY7l** and so on.

If you do not like using complex pass phrases please consider the use of a password manager such as [Keepass](http://keepass.info/),[Lastpass](http://lastpass.com/) or [1password](https://agilebits.com/onepassword)

**Contents of this Guide**

**Section 1:** Creating our .htaccess
**Section 2:** Creating our .htpasswd file
**Section 2.1** Changing my own password or that of other users.
**Section 3:** Password Protecting a Directory for Multiple Users
**Section 4:** Rutorrent Specific Info

### Password Protecting a Directory for a Single User or multiple users

It will be good to take a quick look at the fundamentals of this process to make it easier to break down and understand :

**1:** we create a file called a `.htaccess` in the folder we wish to protect on our server.

**Important note:** this effect is recursive. This means that a `.htaccess` will apply these rules to all directories **below** it. This means using more `.htaccess` files to create rules on a per folder or directory structure (from that folder down) basis.

**2:** a `.htaccess` file works in partnership with a `.htpasswd` file. our `.htaccess` must point to the correct location of this file (once we have created it)

**3:** We define the type of access we want and by who, in the `.htaccess` file.

**4:** We must give these users a password and add this to the `.htpasswd` file properly so that they are hashed. This needs to be done using SSH.

**5:** We give the files the correct permissions so they are safe to use.

**Some things to take note of and think about before we begin**

Password managers on Chrome and Opera do not access these types of AUTH by design when trying to auto fill/submit passwords. So you may have to type or use other means (such as auto type in KeePass)

It does not encrypt your traffic, you will need to use a link with HTTPS for that, [see this guide](https://www.feralhosting.com/faq/view?question=161). (makes sense to come back to this after you have completed this one.)

If you have installed rutorrent via the Software manager it created a `.htaccess` and `.htpasswd` for you, just for rutorrent. We are not going to use these files and they may conflict with ours at some point. Every time you re install rutorrent via the software manager this will happen. You can apply what you read here to these files if you wish. 

**Important note:** See Section 4 for rutorrent specific information regarding `.htaccess` and `.htpasswd` as this guide can be used to edit these files directly.

### Section 1: Creating our .htaccess

**Step 1:** [SSH to your Feral server](https://www.feralhosting.com/faq/view?question=165). First we need to navigate to the directory we want to protect. The file that will be protecting our default www directory is called `.htaccess` (please note the initial dot). It works in partnership with a file called `.htpasswd` in which the actual encrypted password is stored. Let's create the `.htaccess` first.

The First thing we should do is log in via SSH. [please see this guide for how to do this](https://www.feralhosting.com/faq/view?question=165)

~~~
cd ~/www/$(whoami).$(hostname)/public_html/
~~~

This will move us into the root of our WWW folder

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/1.png)

Now type:

~~~
nano -w .htaccess
~~~

This opens an existing file, in this case .htaccess, or creates the new file upon saving using a text editor called nano

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/1.5.png)

It will look something like this if you are doing this for the first time.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/2.png)

Now below is the info we are going to fill this file with but it it not ready yet. Open a text editor such as [NotePad ++](http://notepad-plus-plus.org/) and edit it to reflect your unique settings such as username and paths. This is information for ONE user, YOU. We will see how to add users later on in Section 3.

~~~
AuthUserFile /media/DISKID/home/USER/private/.htpasswd
AuthGroupFile /dev/null
AuthName "Secure Area"
AuthType Basic

<LIMIT GET PUT POST>
require user YOUR_USERNAME
</LIMIT>
~~~

**Important note:** Your full path may be a little different:

~~~
AuthUserFile /media/DISKID/USER/private/.htpasswd
~~~

Use this command in [SSH](https://www.feralhosting.com/faq/view?question=12) to check your path:

~~~
echo $HOME
~~~

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/3.5.png)

Once you have done this copy the text to your clipboard, then back in the SSH window press press `SHIFT + INS` (or right mouse-click in PuTTy or KiTTy) to paste it into your nano window

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/4.png)

As you can see, we are telling `.htaccess` 2 things: 

**1:** where to look for the file containing the password, in this case it is called `.htpasswd`

**2:** what user to authenticate with that password.

We are done with creating our `.htaccess` file. Press and hold `CTRL` then press `x` to save and exit nano. It will ask: Save modified buffer? Press `Y` to save changes, and then `ENTER` to confirm.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/5.png)

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/6.png)

We now need to change permissions on the file. Type:

~~~
chmod 600 .htaccess
~~~

As long as you are still in this public_html directory

The system will respond with a blank line.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/7.png)

That is it. You have successfully created you `.htaccess` file. Time to do the `.htpasswd`

**Final Notes for Section 1:**

I recommend you place the `.htaccess` file only INSIDE the folders you wish to protect, you can do this via FTP(SFTP). This will let you give free access to some folders in your WWW but hide any that contain this `.htaccess` we just created.This means anyone can access the WWW folder, but cannot access folders restricted by your `.htaccess`

**Important note:** To allow users access to only some folders and not others please see **Final Notes Section 3:**

To change our own password or other users inside an existing `.htpasswd` see Section 2.1

### Section 2: Creating our .htpasswd file

**Step 2:** Let's now create our `.htpasswd` file. First we navigate to the Directory where we want to store it (we configured it earlier in our `.htaccess` file):

~~~
cd ~/private
~~~

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/8.png)

**Now type:**

~~~
htpasswd -c .htpasswd USER_NAME
~~~

Use the same username that you configured earlier in `.htaccess`. The system will ask you to type in your desired password:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/8.5.png)

I suggest you use the same password Feral provided you in your Manager/Slot/Server page for Rutorrent if you installed it using **copy** then **shift + INS** (remember if you are using PuTTy or KiTTy and have the window selected a right click = paste) . 

You can use your own password, ( remember the info at the start of the guide about password managers and Chrome).

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/9.png)

Type it or Paste it but remember you will not see anything as you type or that you pasted, that is normal. Press **enter** You will be asked to re-type your password, after which `.htpasswd` will be created.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/10.png)

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/11.png)

We now need to change permissions on this file, too. Type:

~~~
chmod 600 .htpasswd
~~~

This will `chmod` a file by the name of `.htpasswd` to `600` in our current location, in this case that is `~/private`

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/12.png)

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/13.png)

Or this will also work from any location in SSH.

~~~
chmod 600 ~/private/.htpasswd 
~~~

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/22.png)

And this is it. Now open ruTorrent in your browser and see if it requires you to type in your username/password.

**Final Notes for Section 2:**

I recommend you place the `.htaccess` file only INSIDE the folders you wish to protect, you can do this via FTP(SFTP). This will let you give free access to some folder in your WWW but hide any that contain this `.htaccess` we just created.This means anyone can access the WWW folder, but cannot access folders restricted by your `.htaccess`

To allow users access to only some folders and not others please see the **Final Notes Section 3:** section

If you receive an **Internal Server Error** message when you try to access your page/directory, check for typing errors in your `.htaccess` file.

To un-protect a directory, delete the `.htaccess` and the `.htpasswd` files, or just rename the `.htaccess` file to `.htaccess_off`

**Section 2.1 Changing my own password or that of other users**

To change your own password inside an existing `.htpasswd` you must move(cd) to the location of `.htaccess` and use the `.htpasswd` command. Replace **username** in the below command for the name of the user you wish to change/update the password for.

~~~
htpasswd .htpasswd username
~~~

Assuming you have followed this guide and your .htpasswd is inside your ~/private directory so we can do this from any location in SSH, to change the password for `testuser`

~~~
htpasswd ~/private/.htpasswd testuser
~~~

This is just using a direct path to the file in the command rather than being inside the folder.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/13.1.png)

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/13.2.png)

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/13.3.png)

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/13.4.png)

**Section 3: Password Protecting a Directory for Multiple Users**

To give multiple users access to one or more directories we must do two things:

**1:** add a valid user name to the `.htaccess` protecting that directory as described in Section 1.

**2:** add their password to the `.htpasswd` as described in Section 2

Assuming you have followed the steps in this guide we will add a new user to our `.htaccess` and give them a password. 

**Step 1:** Edit the `.htaccess` file and add your user as shown here. You can do this using FTP(SFTP) or as shown in Section 1.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/14.png)

Now we must assign a password to each username added using the htpasswd command. This needs to be done in an SSH Terminal .

Open a SSH Terminal, connect to your slot and type this command (same command if you are already connected )

~~~
cd ~/private
~~~

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/15.png)

It will move us directly to the location of the `.htpasswd` no matter where we previously were.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/16.png)

Now we add passwords for new users **without using the -c** command. As shown in the images here for the user `guestuser`

Your commands should look something like this:

~~~
htpasswd .htpasswd guestuser
htpasswd .htpasswd anotheruser
~~~

**Important note:** Please note that it's important to create passwords for the users in the order specified in your `.htaccess` file, or else you will get a password verification error. !!

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/17.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/18.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/19.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Password%20protect%20your%20WWW%20folder/20.png)

**Final Notes Section 3:**

To deny a user access to a folder you do no have to delete them from the `.htpasswd`. All you have to do is remove their user name from the `.htaccess` in the folders you do not wish them access to, so for example.

~~~
<LIMIT GET PUT POST>
require user testuser
</LIMIT>
~~~

Only `testuser` will have access to this folder. other users will not even see it exists. When a user visits your WWW folder they will only see and access folders that have their username in the `.htaccess` using our configuration.

**Section 4: Rutorrent Specific Info**

The guide tells you everything you need to know in detail on how to change/create the settings/files you need. This is just to tell you where the relevant files if you wish to use the existing Rutorrent `.htaccess` and `.htpasswd`

The `.htaccess` is located here:

~~~
~/www/username.Server.feralhosting.com/public_html/rutorrent/.htaccess
~~~

The `.htpasswd` is located here.

~~~
~/www/username.Server.feralhosting.com/public_html/rutorrent/.htpasswd
~~~

**Final Notes for Section 4:**

You can change the rutorrent `.htaccess` to link to another `.htpasswd` of your choosing (one created in Section 2 for example) by editing the file as described in Section 1.

In this case the `.htpasswd` is stored within the WWW realm and not outside it (like the `.htpasswd` from Section 2 is). Moving this to somewhere outside the WWW is a good idea.

### nginx

nginx does not use `.htaccess` files. All settings are done in the configuration files.

All locations are relative to the WWW root which is always:

~~~
~/www/username.server.feralhosting.com/public_html/
~~~

Or if you added a VHost:

~~~
~/www/somesite.co.uk/public_html/
~~~

You nginx configuration files stored here:

~~~
~/.nginx/conf.d/000-default-server.d
~~~

Create a new conf file and enter this information, for example:

~~~
nano -w ~/.nginx/conf.d/000-default-server.d/links.conf
~~~

Then copy this information into it:

~~~
location /links {
    auth_basic "Please log in";
    auth_basic_user_file /media/DiskID/username/path/to/.htpasswd;
}
~~~

Where:

`/media/DiskID/username/path/to/.htpasswd` reflects the actual full path to your `.htpasswd`. You can use the method described in the Apache section of this FAQ to generate and manage your `.htpasswd` files.

The press and hold `CTRL` then press `x` to save. Press `y` to confirm.

For example, to password protect your server root you would do this:

~~~
location / {
    auth_basic "Please log in";
    auth_basic_user_file /media/DiskID/username/path/to/.htpasswd;
}
~~~

Where:

~~~
location /
~~~

Is specifying the server root and not a sub directory.

Then save the edits to the `links.conf` and restart ngnix for the settings to take effect.

~~~
killall -9 nginx php5-fpm -u $(whoami)
~~~

You will need to wait up to 5 minutes for it to restart. 

**Important note:** Please note you may need to clear your browser cache for changes to reflected in your current browser session.



