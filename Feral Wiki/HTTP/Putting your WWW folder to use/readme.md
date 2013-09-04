
All plans come with a public folder that you can access via your web browser. By default anyone can view the files (including Google) displayed in there. 

If you follow the rest of this guide please be sure to [protect your files with a password](https://www.feralhosting.com/faq/view?question=22). The login and password for this folder will be separate from your other details and can be setup to allow access to multiple users.

There are various useful and interesting ways to make use of this WWW folder, shown in some of the other FAQs in this section. In this FAQ we are going to focus on simplicity.

### Let's get started 

Your `public_html` folder is located here:

~~~
~/www/username.servername.feralhosting.com/public_html
~~~

An easy way to execute SSH commands in this folder is to use this command:

~~~
 ~/www/$(whoami).$(hostname)/public_html/
~~~

This command will work for everyone to automatically find your username and servername and will be used through this FAQ.

### Prevent search indexing - robots.txt

To prevent indexing by search engines use this command.

~~~
echo -e 'User-agent: *\nDisallow: /' > ~/www/$(whoami).$(hostname)/public_html/robots.txt
~~~
[http://www.robotstxt.org/robotstxt.html](http://www.robotstxt.org/robotstxt.html)

### Creating Symbolic links

In SSH do these commands. Use this faq if you do not know how to SSH into your slot: [SSH basics - Putty](https://www.feralhosting.com/faq/view?question=12)

First we create a directory that will be home to our custom links in this guide.

~~~
mkdir -p ~/www/$(whoami).$(hostname)/public_html/links
~~~

This will create a folder called `links` inside your WWW folder.

Here are some examples of how you would create symlinks to make folders available.

The format of the symbolic link command is like this:

~~~
ln -s ~/the/folder/or/file/i/want/linked/to ~/the/destination/of/the/shortcut/and/the/name
~~~

#### rtorrent data symbolic link

~~~
ln -s ~/private/rtorrent/data/ ~/www/$(whoami).$(hostname)/public_html/links/rtorrent_data
~~~

Please make sure this is the correct path to your rTorrent your data folder if different from the default location.

#### Tranmission default data folder

~~~
ln -s ~/private/transmission/data/ ~/www/$(whoami).$(hostname)/public_html/links/transmission_data
~~~

Please make sure this is the correct path to your Transmission your data folder if different from the default location

#### Deluge default data folder

~~~
ln -s ~/private/deluge/data/ ~/www/$(whoami).$(hostname)/public_html/links/deluge_data
~~~

Please make sure this is the correct path to your Deluge your data folder if different from the default location

Now visit your WWW `links` folder in your browser, click on the newly created symbolic links, and you should be able to see a nice index of whatever files are inside the folders you have just linked to. Now you can use a browser or a download manager to download your stuff.

### Optional

[h5ai directory indexer](http://larsjung.de/h5ai/)

**Important note:** The main `_h5ai` directory does not like being anywhere else except the server root. To only apply the indexing to certain directories please use the options described below. Do not try to install the actual `_h5ai` directory to a sub directory.

The screen shot below illustrates the result:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Putting%20your%20WWW%20folder%20to%20use/h5ai.png)

Version 0.24 has a problem. This is a problem with the two URL formats available at Feral. It will work with one
and not the other. To fix this you will need to use this custom version of 0.24 that works for both URL types at 
the same time.

To download _h5ai 0.24 (custom with dual url format fix) use these commands in SSH.

~~~
wget -qO ~/h5ai.zip http://git.io/RG-BpQ
unzip -qo ~/h5ai.zip -d ~/www/$(whoami).$(hostname)/public_html/
~~~

**For Apache only:**

Use this command to append the required entry to an existing `.htaccess` files or it will create one if needed.

~~~
echo -e '\nDirectoryIndex  index.html  index.php  /_h5ai/server/php/index.php' >> ~/www/$(whoami).$(hostname)/public_html/.htaccess
~~~

_h5ai will now be ready to use in your WWW. By default this works from the WWW root down. 

If you would like to make it specific to certain folders you need to edit the `.htaccess ` files and remove this:

~~~
DirectoryIndex  index.html  index.php  /_h5ai/server/php/index.php
~~~

Then, inside the directory you want to use _h5ai create either:

1: Create a `.htaccess` file if there is not one present, or add the line to it 

2: Add the line to any existing `.htaccess` files. This will make it work for this folder and folders within.

**For nginx only:**

Create a new file located here:

~~~
~/.nginx/conf.d/000-default-server.d/
~~~

Called:

~~~
h5ai.conf
~~~

Add this to the file and then save:

~~~
location / {
    index  index.html  index.php  /_h5ai/server/php/index.php;
}
~~~

Now restart nginx using this command:

~~~
killall -9 -u $(whoami) nginx php5-fpm
~~~

Once it has restarted the h5ai should be working.

### h5ai custom directory with nginx that is not password protected

For a specific directory only, you can change the location in the `h5ai.conf` if the directory you want to use is not already password protected:

**Important note:** The location is relative to your WWW root. Make sure the location exists in your WWW.

For example we can edit the `h5ai.conf` to this:

~~~
location /links {
index  index.html  index.php  /_h5ai/server/php/index.php;
}
~~~

Then restart nginx:

~~~
killall -9 -u $(whoami) nginx php5-fpm
~~~

### h5ai custom directory with nginx that is also password protected 

If the directory you want to use h5ai with is already password protected then you must merge the changes into the `.conf` for that location and then remove the `h5ai.conf` or nginx won't restart:

So for example we edit the `links.conf` to be like this:

~~~
location /links {
index  index.html  index.php /_h5ai/server/php/index.php;
auth_basic "Please log in";
auth_basic_user_file /path/to/the/.htpasswd;
}
~~~

Then delete the `h5ai.conf` and then restart nginx:

~~~
killall -9 -u $(whoami) nginx php5-fpm
~~~

### Contribute:

The repo for this custom file can be found here for users to check or to contribute to.

[https://github.com/feralhosting/h5ai_custom](https://github.com/feralhosting/h5ai_custom)



