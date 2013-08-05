
The guide follows a specific format for each section.

**1:** Force UTF-8

**2:** Basic hostname/server configuration

**3:** Basic authentication using a username and password

**4:** Using keyfiles to connect ( the guide assumes you have already created these as it does not explain how)

**5:** Creating SSH Tunnels.

**6:** SFTP Bridges where applicable.

**Important note:** You only need to use the stages that apply to what you want to do.

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

#### INFORMATION

It is important to note that completing the whole guide is not Required to use XShell to connect to your slot.

#### Key Features :

- Saves Passwords and Key file Pass phrases
- Easily configure multiple SSH tunnels from a single GUI.
- Tabbed Gui
- Gui is feature rich with right click context options, theme changing and more
- Can be be used with [Xftp](http://www.netsarang.com/products/xfp_overview.html), an FTP/SFTP app by the same company, also free for home use.

#### Getting started

After you have Downloaded and Installed XShell 4, make sure to select the correct license when installing:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/1.png)

Once installed run the application and you will see a window similar to this. Follow the instructions in the images. 

So click on the `New Session` icon to open the Session Properties.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/2.png)

The very first thing we will do is force Unicode/UTF-8 for this session.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/unicode.png)

### Server/Hostname configuration

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/3.png)

**Important note:** If you click OK now and then connect using the session, you can use XShell in the conventional (putty) way with your default password found in your Manager/Slot/Server page. You will be prompted for your username and password.

#### Authentication using a Username and Password

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/4.png)

#### Authentication using a public/private key and Username

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/privatekey.1.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/privatekey.2.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/privatekey.3.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/privatekey.4.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/privatekey.5.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/privatekey.6.png)

#### Creating our SSH tunnel

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/tunnel.1.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/tunnel.2.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/tunnel.3.png)

#### Finalizing the setup and connecting

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/final.1.png)

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/final.2.png)

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Xshell%20-%20SSH%20-%20SSH%20tunnels%20-%20Private%20Keys/final.3.png)

