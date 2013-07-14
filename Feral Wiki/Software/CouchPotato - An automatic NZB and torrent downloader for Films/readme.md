### Prerequisites

If you used this guide for Pyton 2.7.4 - [Python - How to install](https://www.feralhosting.com/faq/view?question=204) Couchpotato won't start. It is a bug with pysqlite and i have not fixed it yet.
Using the slots included python 2.6 works.

You need to SSH into your slot to complete this guide. If you don't know how to do this, [here is a basic guide](https://www.feralhosting.com/faq/view?question=12).

You also need to have Git installed on your slot. If you haven't done that, [here is a basic guide](https://www.feralhosting.com/faq/view?question=206).

### Installation

**1: Download the CouchPotato source to your home directory**

```
git clone https://github.com/RuudBurger/CouchPotatoServer.git ~/.couchpotato && mkdir ~/.couchpotato/ssl
```

**HTTPS - To use https you will have to generate your own certificates**

After you have git cloned Couchpotatocopy and paste this command to generate your certificates to use https.

```
openssl req -new -x509 -nodes -days 365 -subj '/C=GB/ST=none/L=none/CN=none'  -newkey rsa:2048 -keyout ~/.couchpotato/ssl/couch.key.pem -out ~/.couchpotato/ssl/couch.cert.pem
```

Your certificates are generated to `~/.couchpotato/ssl/`

**2: Create a basic configuration file**

By default, CouchPotato will listen on port 5050. In order to stop conflicts, we need to use a custom port. To set this before the first run, we need to create a very basic configuration file ourselves.

Copy and paste the command in the pastebin link to create and configure the settings.conf. It will generate a random port for you and link to your SSL cert and key.

It is a big command but it does everything we need in one go. You port will be randomly generated and then printed in the terminal for you to see.

[pastebin: settings.conf](http://pastebin.com/YEjkJZ7N)

**Make a note of this port, you will need it later.**

If you get an error message about the address already being in use, just pick another port, and update the configuration file.

**3: Run the CouchPotato Wizard**

First we are going to run it to see if it works and do some basic setup. After that we will stop it then start it as a daemon in the background.

```
python ~/.couchpotato/CouchPotato.py
```

If all goes well you will see nothing after you press enter.

You should now be able to access CouchPotato in your browser at:

```
https://server.feralhosting.com:YOUR_PORT
```

Using https the port generated above.

**4: Set a username and password**

Make sure to set a username and password. This is important, otherwise anyone can get access, and automatically start downloads on your slot.

**5: Set the directory to download the NZB/torrent to**

Under Downloaders, the default option is Black Hole, which will just download the NZB/torrent to a folder. You should set the directory to wherever your client watches.

By default, that should be:

```
~/private/client/watch
```

Make sure to replace **client** with whichever client you use.

CouchPotato also has support for other clients, such as Transmission, which allows it to interact directly with the client, but information for these isn't be included here.

**6: Complete the rest of the wizard**

Fill in any sites that you are a member of. 

Enabling renaming is optional, and isn't covered in this FAQ.

When everything is completed, hit the big green button at the bottom of the page.

**7: Restart CouchPotato as a daemon**

Now that CouchPotato is running successfully on your slot, you should run it as a daemon. Stop the current process by pressing and holding `CTRL` then press `C`. This will exit the program and return your shell.

Now restart it as a daemon using this command:

```
python ~/.couchpotato/CouchPotato.py --daemon
```

CouchPotato is now completely installed, and ready to use.

### Optional Configuration

Important Note: This section is limited to the `username.server.feralhosting.com` URL format.

**Accessing CouchPotato via a custom URL**

By default, the URL to access CouchPotato is:

```
https://userername.server.feralhosting.com:YOUR_PORT
```

It's possible to change this to a more meaningful URL, such as 

```
https://userername.server.feralhosting.com/couchpotato/
```

**Create a custom Apache configuration**

Replace **YOUR_PORT** below with which ever port you picked.

[Using a text editor](https://www.feralhosting.com/faq/view?question=219)

or using SSH:

```
mkdir -p ~/.apache2/conf.d
cat >> ~/.apache2/conf.d/couch.conf << EOF
```

Now paste and edit these commands. Press enter to go to a new line. The last line "EOF" closes and saves the document when you type it and press enter..

```
Include /etc/apache2/mods-available/proxy.load
Include /etc/apache2/mods-available/proxy_http.load

<Location /couchpotato/>
  ProxyPass http://localhost:YOUR_PORT/couchpotato/
  ProxyPassReverse http://localhost:YOUR_PORT/couchpotato/
</Location>
EOF
```

Get your generated port using this command:

**Tell CouchPotato to use this new URL**

In your web browser, go to your CouchPotato homepage, and access the settings via the **Cog** menu at the top right. Make sure the **Show advanced settings** checkbox is selected, and then set the **urlbase** field to **couchpotato**. Wait a couple of seconds for this to save.

**Restart CouchPotato and Apache**

In order for these new settings to be used, we need to restart both CouchPotato and Apache.

```
pkill -f CouchPotato
python ~/.couchpotato/CouchPotato.py --daemon
/usr/sbin/apache2ctl restart
```

**Access CouchPotato via the new URL**

You can now access CouchPotato via the following URL

```
http://username.server.feralhosting.com:PORT/couchpotato/
```

If it doesn't immediately load, give it a bit of time, as the python daemon can often take a while to start listening to requests from Apache.



