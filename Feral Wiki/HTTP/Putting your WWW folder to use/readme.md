
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

[_h5ai directory indexer](http://larsjung.de/h5ai/)

The screenshot below illustrates the result:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Putting%20your%20WWW%20folder%20to%20use/h5ai.png)

Version 0.23 has a problem. This is a problem with the two url formats available at Feral. It will work with one
and not the other. To fix this you will need to use this custom version of v0.23 that works for both URL types at 
the same time.

To download _h5ai 0.23 (custom with dual url format fix) use these commands in ssh.

~~~
wget -qNO ~/h5ai.zip http://git.io/QdyWzg
unzip -qo ~/h5ai.zip -d ~/www/$(whoami).$(hostname)/public_html/
~~~

**For Apache only:**

Use this command to append the required entry to an existing `.htaccess` files or it will create one if needed.

~~~
echo -e '\nDirectoryIndex  index.html  index.php  /_h5ai/server/php/index.php' >> ~/www/$(whoami).$(hostname)/public_html/.htaccess
~~~

_h5ai will now be ready to use in your WWW. By default this works from the WWW root down. If you would like to make it specific to certain folders you need to edit the `.htaccess ` files and remove this:

~~~
DirectoryIndex  index.html  index.php  /_h5ai/server/php/index.php
~~~

Now inside the directory you want to use _h5ai create a `.htaccess` file and add the the line above you just removed. This will make it work for this folder and folders within.

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
killall -9 nginx php5-fpm -u $(whoami)
~~~

Once it has restarted the h5ai should be working.

### Contribute:

The repo for this custom file can be found here for users to check or to contribute to.

[https://github.com/feralhosting/h5ai_custom](https://github.com/feralhosting/h5ai_custom)



