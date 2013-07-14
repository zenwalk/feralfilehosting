SECTIONS

`1:` What it does
`2:` Installation
`3:` Post Installation
`4:` Notes

### 1: What it does ###

[Mollify](http://www.mollify.org/index.php)

Mollify is a web file manager for publishing and managing files hosted in a web server of your choice. Different users can have access to different files and directories and with different permissions.

`*` Works with private folders *(could not get Relay to consistently work with this)*
`*` Search files and folders
`*` Support for viewer and previewer plugins, allows extending supported types 
`*` Each user and group can have different folders published
`*` Customized notifications from different user events
`*` File actions available: download, rename, copy, move and delete
`*` Folder actions available: create, copy, move, rename and delete
`*` Extract archives
`*` File editing directly in browser
`*` Upload folders and dropbox

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Mollify%20-%20yet%20another%20web-based%20file%20manager/example.png)

### 2. Installation ###

`2.1:` Install MySQL from your [Install Software page](https://www.feralhosting.com/manager/slot/install?).

`2.2:` Move to the WWW root using this command via SSH

	cd ~/www/$(whoami).$(hostname)/public_html/

`2.3:` Download and unzip the file using wget and zip via SSH using this command 

	wget -qN http://mollify.googlecode.com/files/mollify_1.8.9.3.zip && unzip -qo mollify_1.8.9.3.zip

`2.4:` If not already present, create a file called `configuration.php` and place it within the directory you just created: 

	nano -w mollify/backend/configuration.php

To edit via shell. Don't forget to save.

`2.5.` Copy and paste the following into configuration.php

**If you are using mysql:** It is suggested you create a limited user following this faq [adminer](https://www.feralhosting.com/faq/view?question=116). This is an optional but recommended step, to create a limited user.

**If you are using mysql:** You can use your root and provided pass and Mollify will create the data base for you during installation

[Mollify using sqlite](http://pastebin.com/mEJMyk2E)

[Mollify using non mysql root user example](http://pastebin.com/5K2GCiw9)

[Mollify using mysql root user example](http://pastebin.com/3Vcw8Tc3)

`2.6:` After saving the` config.php`, visit the following link to complete your installation:

	http://user.server.feralhosting.com/mollify/backend/install/

So for example:

	http://john.zeus.feralhosting.com/mollify/backend/install/

*Make sure to note the initial username/password used.*

### 3. Post-Installation ###

In order to make the most out of Mollify, you'll need to create *Published Folders*, Users and Groups.  These can all be managed from within the Admin Pane and it is very straight forward.  You can link to anywhere within your Feral slot and the files will become accessible, even private folders. *Once created, make sure directories, groups and users are checked.*

Mollify also supports a plugin architecture.  You can get the plugins from their [download page](http://code.google.com/p/mollify/downloads/list).  

Download the plugins you want to install, extract them then upload to the following directories:

Plugins that start with `plugin` go in the  folder:

	/www/user.server.feralhosting.com/public_html/mollify/backend/plugin/

Plugins that begin with `viewer` go in the folder:

	/www/user.server.feralhosting.com/public_html/mollify/backend/plugin/FileViewerEditor/viewers/

NOTE: Using the Flowplayer plugin as an example, the downloaded file will be `viewer_flowplayer_1.0.zip`. Do not upload this extracted folder, but go inside and find the `Flowplayer` folder. That is the folder to be uploaded to the `viewer` directory.

    cd ~/www/$(whoami).$(hostname)/public_html/mollify/backend/plugin/FileViewerEditor/viewers/
    wget -qN http://mollify.googlecode.com/files/viewer_flowplayer_1.0.zip
    unzip -qo viewer_flowplayer_1.0.zip && rm -f viewer_flowplayer_1.0.zip

Once plugins are installed into their appropriate folders, [reference my pastebin configuration](http://pastebin.com/twzZae9t). 

Add the new information to your `configuration.php` file and save. Some changes require you to check for an update to the mysql database.  You can check for updates by going to:

	http(s)://user.server.feralhosting.com/mollify/update

Your configuration.php file should now look like this:

    <?php
        $CONFIGURATION_TYPE = "mysql";
        $DB_HOST = "";
        $DB_PORT = "";
        $DB_DATABASE = "DATABASE";
        $DB_USER = "root";
        $DB_PASSWORD = "xxxxx";
        $DB_SOCKET = "/media/xxx/home/xxx/private/mysql/socket";
        $DB_TABLE_PREFIX = "mollify_";
     
            $PLUGINS = array(
                    "FileViewerEditor" => array(
                            "viewers" => array(
                                    "Image" => array("gif", "png", "jpg"),
                                    "TextFile" => array("txt", "php", "html"),
                                    "JPlayer" => array("mp3"),
                                    "Divx" => array("avi", "mkv"),
                                //  "VLC" => array("mp4", "mkv", "avi")
                                    "FlowPlayer" => array("f4v", "flv", "mp4")
                            ),
                            "previewers" => array(
                                    "Image" => array("gif", "png", "jpg")
                            ),
                            "editors" => array(
                                    "TextFile" => array("txt")
                            ),
                    )
            );
    ?>

NOTE: The commenting out `//` in front of VLC under `$PLUGINS = array` is necessary.  When removing the `//` it will not load the Mollify page. Not sure why this is, but you may have different experiences with it.

After updating the configuration file and completing the settings in the Admin Pane, you can access Mollify by going to: `http(s)://server.feralhosting.com/user/mollify/`

### Section 4 Notes ###

`1:` Where you see `username` in directories/url's, insert your Feral username and where you see `server`, insert your server name.

`2:` Playing video files may require add-ons or plug-ins to be present in your browser, such as divx+, quicktime or java.

`3:` Under the Installation section, the $ are not necessary.



