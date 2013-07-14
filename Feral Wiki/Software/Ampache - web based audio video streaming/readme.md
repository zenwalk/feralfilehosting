**First:** go to the software install page for feralhosting at: [Install Software](https://www.feralhosting.com/manager/slot/install).

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Worpress/installmysql.png)

**NOTE:** MYSQL can take up to 15 minutes to install as it is compiled upon request of installation so please be patient.

In SSH do these commands. Use this faq if you do not know how to SSH into your slot: [SSH basics - Putty](https://www.feralhosting.com/faq/view?question=12)

Ampache has a new home on [github](https://github.com/ampache/ampache/)

### Installing Ampache on Feral slots.

You will need your Mysql details to complete this FAQ.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Ampache%20-%20web%20based%20audio%20video%20streaming/mysqlsocket.png)

### The bash script

This bash script uses Ampache master from github and also applies some default configuration settings.

- fixes ffmpeg path to use new updated static binary built 05.22.2013
- enables debug and logging and creates folders and modifies paths.
- enables transcoding
- bumps memory limit to 512 and creates a supporting .htaccess since ampache cannot override this setting itself.
- changes minimum bitrate to 192

```
wget -qNO ~/ampache.sh http://git.io/wESU5A
```

Then execute this command:

```
bash ~/ampache.sh
```

You must change this setting once you have access to the web interface for transcoding to work:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Ampache%20-%20web%20based%20audio%20video%20streaming/streaming.png)

### Ampache manual installation

SSH into your slot and do these commands.

```
wget -qNO ~/ampache.zip https://github.com/ampache/ampache/archive/master.zip
mkdir -p ~/www/$(whoami).$(hostname)/public_html/ampache && mkdir -p ~/ampache/ffmpeg && mkdir -p ~/ampache/log
unzip -qo ~/ampache.zip -d ~/www/$(whoami).$(hostname)/public_html && rm -f ~/ampache.zip
cp -fr ~/www/$(whoami).$(hostname)/public_html/ampache-master/. ~/www/$(whoami).$(hostname)/public_html/ampache
rm -rf ~/www/$(whoami).$(hostname)/public_html/ampache-master
wget -qNO ~/ffmpeg.tar.gz  https://bitbucket.org/feralhosting/feralfiles/downloads/ffmpeg.static.64bit.2013-05-22.tar.gz
tar -xzf ~/ffmpeg.tar.gz -C ~/ampache/ffmpeg && rm -f ~/ffmpeg.tar.gz
```

After this is done you navigate to this folder on your web browser, should be like:

```
http://username.server.feralhosting.com/ampache/
```

Now you should come to a page where it should check so all your settings are OK, should say OK with a green text on all points there. Then you just press start configuration.

Now you come to the page where you need the information from your MySQL page on the feralhosting page. You need your root password and the socket in order to make this work.

MySQL hostname should be the socket, so it should be something like:

```
/media/c0d7/home/user/private/mysql/socket
```

The MySQL administrative password should be the password you got on the same page as your socket, then fill in the rest as you want to have it.
Fill in root as username and the password you had on the next page. Press write config and you should get this back.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Ampache%20-%20web%20based%20audio%20video%20streaming/stage1.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Ampache%20-%20web%20based%20audio%20video%20streaming/stage2.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Ampache%20-%20web%20based%20audio%20video%20streaming/stage22.png)

Press "Proceed to step 3". Create the admin account for your Ampache server, then go next and you should be finished with the setting up part.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Ampache%20-%20web%20based%20audio%20video%20streaming/stage3.png)

Login with your admin account, to add where you keep your music you press "add catalog", then navigate to the directory in which you keep all your music on your server via SSH. write "pwd" while in this directory. You should get the full filepath back, such as "/media/c0d7/home/user/private/rtorrent/data" , you fill this in under Path. and then write whatever you want under the catalog name (this is useful if you got your music sorted on your seedbox etc... Then it should say catalog created.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Ampache%20-%20web%20based%20audio%20video%20streaming/login.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Ampache%20-%20web%20based%20audio%20video%20streaming/streaming.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Ampache%20-%20web%20based%20audio%20video%20streaming/catalogue.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Ampache%20-%20web%20based%20audio%20video%20streaming/cataloguecreated.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Ampache%20-%20web%20based%20audio%20video%20streaming/player.png)

### Transcoding and ffmpeg

The commands at the start enable transcoding and fix the path if you followed the faq and did them before generating the ampache.cfg.php. If you did not do them before generating your main cfg file, you can do them manually.

Transcoding is not turned on by default and we are also presented with another issue. The ffmpeg version on the slots will not work. In the first set of commands an updated static binary was downloaded and extracted to `~/ffmpeg/`

You must change this setting once you have access to the web interface for transcoding to work:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Ampache%20-%20web%20based%20audio%20video%20streaming/streaming.png)

You must change the transcode_cmd path to reflect this new location. It can be any where you want the binary, i just used `~/ffmpeg`. This

```
;transcode_cmd = "ffmpeg -i %FILE%"
```

becomes:

```
;transcode_cmd = "/full/path/to/static/build/ffmpeg -i %FILE%"
```

Also and specifically, these lines need to all be uncommented. 

The log folder has been created as `~/ampache/log` . you need to use a full path in the **ampache.cfg.php**.

```
;debug = "false"
;log_path = "/var/log/ampache"
```

Here are the transcode settings that need to be changed or or uncommented

```
;transcode_m4a = allowed
;transcode_flac = required
;transcode_mp3 = allowed
;transcode_cmd = "ffmpeg -i %FILE%"
;encode_target = mp3
;encode_args_mp3 = "-vn -b:a %SAMPLE%K -c:a libmp3lame -f mp3 pipe:1"
;encode_args_ogg = "-vn -b:a %SAMPLE%K -c:a libvorbis -f ogg pipe:1"
```

Here is the transcode section of the ampache.cfg.php for reference:

```
;######################################################
; These are commands used to transcode non-streaming
; formats to the target file type for streaming. 
; This can be useful in re-encoding file types that don't stream
; very well, or if your player doesn't support some file types.
;
; 'Downsampling' will also use these commands.
;
; To state the bleeding obvious, any programs referenced in the transcode
; commands must be installed, in the web server's search path (or referenced
; by their full path), and executable by the web server.

; Input type selection
; TYPE is the extension. 'allowed' certifies that transcoding works properly for
; this input format. 'required' further forbids the direct streaming of a format
; (e.g. if you store everything in FLAC, but don't want to ever stream that.)
; transcode_TYPE         = {allowed|required|false}
; DEFAULT: false
;transcode_m4a      = allowed
;transcode_flac     = required
;transcode_mp3      = allowed

; Default output format
; DEFAULT: none
;encode_target = mp3

; Override the default output format on a per-type basis
; encode_target_TYPE = TYPE
; DEFAULT: none
;encode_target_flac = ogg

; Command configuration. Substitutions will be made as follows:
; %FILE% => filename
; %SAMPLE% => target sample rate
; You can do fancy things like VBR, but consider whether the consequences are
; acceptable in your environment.

; Master transcode command
; transcode_cmd should be a single command that supports multiple file types,
; such as ffmpeg or avconv. It's still possible to make a configuration that's
; equivalent to the old default, but if you find that necessary you should be
; clever enough to figure out how on your own.
; DEFAULT: none
;transcode_cmd = "ffmpeg -i %FILE%"
;transcode_cmd = "avconv -i %FILE%"
;transocde_cmd = "/usr/bin/neatokeen %FILE%"

; Specific transcode commands
; It shouldn't be necessary in most cases, but you can override the transcode
; command for specific source formats.  It still needs to accept the 
; encoding arguments, so the easiest approach is to use your normal command as
; a clearing-house.
; transcode_cmd_TYPE = TRANSCODE_CMD
;transcode_cmd_mid = "timidity -Or -o – %FILE% | ffmpeg -f s16le -i pipe:0"

; encode_args_TYPE = TRANSCODE_CMD_ARGS
;encode_args_mp3 = "-vn -b:a %SAMPLE%K -c:a libmp3lame -f mp3 pipe:1"
;encode_args_ogg = "-vn -b:a %SAMPLE%K -c:a libvorbis -f ogg pipe:1"

;######################################################
```




