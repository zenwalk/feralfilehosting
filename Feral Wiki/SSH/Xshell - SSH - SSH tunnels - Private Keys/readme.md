
The guide follows a specific format for each section.

**1:** Force UTF-8

**2:** Basic hostname/server configuration

**3:** Basic authentication using a username and password

**4:** Using keyfiles to connect ( the guide assumes you have already created these as it does not explain how)

**5:** Creating SSH Tunnels.

**6:** SFTP Bridges where applicable.

**Important note:** You only need to use the stages that apply to what you want to do.  Complete only the steps that you require.

### Xshell 4  SSH Client (recommended by guide author) - xsssh

Xshell is a very good SSH client with many useful and advanced features such as tabbed sessions, saving passwords, themes and lots more all available for free for home/personal use.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/logo.png)

#### Download XShell - 

[Download XShell - email required](http://www.netsarang.com/download/down_xsh.html)

**Important note:** This guide assumes you have created a private key according to this FAQ if you need or want to use private keys to connect: [Setting up Public Key Authentication for Password-less Login](https://www.feralhosting.com/faq/view?question=13)

#### Topics covered:

- Connecting Via SSH using the default password
- Importing and using private key files for authorisation.
- Creating SSH tunnels.

#### Key Features :

- Saves Passwords and Key file Pass phrases
- Easily configure multiple SSH tunnels from a single GUI.
- Tabbed Gui
- Gui is feature rich with right click context options, theme changing and more
- Can be be used with [Xftp](http://www.netsarang.com/products/xfp_overview.html), an FTP/SFTP app by the same company, also free for home use.

#### Installing XShell

After you have Downloaded XShell 4, run the installer and make sure to select the correct license when installing:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/1.png)

The rest of the installer is very basic and you can safely use the default settings.

Once XShell is installed, run the application using the Desktop short cut created and you will see a window similar to this. Follow the instructions in the images:

Click on the `New` and then `Session` to open the Session Properties for our new session.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/2.png)

The very first thing we will do is force Unicode/UTF-8 for this session. Click on the `Terminal` Section and select `Unicode (UTF-8)` from the drop down menu.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/unicode.png)

### Server/Hostname configuration

Here we will configure the basic detail for connecting to our Feral server:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/3.png)

**Important note:** If you click OK now and then connect using the session, you can use XShell in the conventional (putty) way with your default password found in your Manager/Slot/Server page. You will be prompted for your username and password.

Continue with the FAQ if you want XShell to store your username and password, to use Private Keys and SSH tunnels.

#### Authentication using a Username and Password

XShell can store and save our username and password for the connection. This will mean it won't prompt your for your username or password when connecting.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/4.png)

Continue with the FAQ if you want to use Private Keys and SSH tunnels.

#### Authentication using a public/private key and Username

XShell can also manage your private keys for your sessions with a built in SSH key manager.

**Important note:** XShell uses the OpenSSH keyfile format. You will have to export your Putty PPK format keys using Puttygen to the OpenSSH format to use with XShell. please see the [Public Key Authentication for password-less login](https://www.feralhosting.com/faq/view?question=13) FAQ for how to do this. It is quite easy to do.

Select the Public Key option from the drop down menu, enter your username and then browse for a keyfile to use.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/privatekey.1.png)

If you do not have any keyfiles imported you will need to import your OpenSSH format keyfile into XShell.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/privatekey.2.png)

Browse to the location of you keyfile and then select it and click Open to import it.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/privatekey.3.png)

If your keyfile is passphrase protected you will need to enter this passphrase to import it.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/privatekey.4.png)

Once it is imported, select the keyfile and then click OK to use this keyfile.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/privatekey.5.png)

Now briefly look over the settings to make sure things they are correct. 

**Important note:** XShell can save and store your keyfiles passphrase at this stage.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/privatekey.6.png)

Continue with the FAQ if you to create and use SSH tunnels.

#### Creating our SSH tunnel

Select the SSH/Tunneling section. Then click on Add to begin creating a new tunnel

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/tunnel.1.png)

Select Dynamic (SOCKS4/5) from the drop down menu. Enter a port between 6000 and 60000. Give the tunnel and easy to remember name and then click OK to create it.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/tunnel.2.png)

You will now see that our tunnel has been created and is listed in the list.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/tunnel.3.png)

#### Finalizing the setup and connecting

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/final.1.png)

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/final.2.png)

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/final.3.png)

