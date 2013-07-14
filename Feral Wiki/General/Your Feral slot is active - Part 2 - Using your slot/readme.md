
Your server is a remote device. What does this mean? It means that your Feral slot is totally separate from your physical location. Like a computer in another person's house. This is often where people get confused, regarding what is done on their home devices and what the server does. I will do my best to make it as easy to understand as possible, so that at the end, hopefully, you have a clear picture of how this whole seedslot thing works. 

Let us look at the difference in physical locations.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral Wiki/General/Your Feral slot is active - Part 2 - Using your slot/01 location 1.png)

When you buy a slot from Feral it will be activated and created on a server in the Cogent datacenter in London, UK. 

No matter where in the world you are, you will be connecting to this location when you directly access your slot's features. 

All *outgoing* traffic from your Feral Slot originates from this London location.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral Wiki/General/Your Feral slot is active - Part 2 - Using your slot/01 location 2.png)

So how do I do stuff? Well, it is actually quite easy once you understand the basic concepts. Your slot is another device in another place and Feral's set-up provides you with the tools and services you need to manage it remotely.

### Web Gui

A Web Gui is provided for rutorrent, deluge and transmission to remotely control the applications running on the server.

So how do I get torrents downloading and uploading on my slot, and not on my home devices?

First you would need to have installed one or more of the applications discussed in [Part 1](https://www.feralhosting.com/faq/view?question=134) of this FAQ.

Then you would access your slot's Web Gui from your local devices using a Web browser like Firefox.

You would usually download a torrent file directly to your local machine and then upload it/open it in the Web Gui of your choice. The Web Gui will then communicate this to the running processes on your server. The running processes, for example rtorrent, will then communicate with trackers and peers directly from the server.

Here is a breakdown of using a Web Gui.

**1:** Visit a torrent site and find a torrent file or a magnet link
**2:** Download and save the torrent file to your local device (do not open it directly with another program, like uTorrent) or copy the magnet URL
**3:** Visit the Web Gui of the application you installed, for example rutorrent.
**4:** Follow the Steps shown below to add this torrent in the Web Gui so that it is passed to rtorrent running on your slot.

**Important note:** This is where people often get confused. You will need to download torrent files to your device first and then upload them to the Web Gui. 

There are ways to bypass this step, of first downloading to your local machine, such as using: 

[Browser addons for Firefox](https://addons.mozilla.org/en-us/firefox/addon/bittorrent-webui-120685/) 
[Extension for Chrome](https://www.feralhosting.com/faq/view?question=146)
[Deluge Thin Client](https://www.feralhosting.com/faq/view?question=76)
[Transmission Remote Gui](https://www.feralhosting.com/faq/view?question=4)

These methods are not covered in this FAQ but once you have the idea you can make use of them. For this FAQ we are doing things in the default way as per the default set-up.

Here is a brief overview of how using the Web Gui works so that you can better understand what it means to you and how it works.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral Wiki/General/Your Feral slot is active - Part 2 - Using your slot/02 webgui.png)

As the image shows, the Web Gui interacts with the processes running on the server and that allows you to do things like add torrents and magnet links. The running processes will then deal directly with your tracker and peers.

This means you can turn off your PC and it will not affect the running processes such as rtorrent or deluge. They run on your server and you are only interacting with them using the Web Gui. Closing the Web Gui or turning off you PC will not stop theses programs from working.

### Rutorrent Web Gui

**Important note:** Rutorrent (Gui) is blamed for causing rtorrent (the actual program) to crash and become unstable when dealing with large number of active torrents. In this case it is recommended to only use rtorrent (SSH) for managing your torrents. This means you should avoid using the Gui with large volumes of files and active torrents.

[ruTorrent](http://code.google.com/p/rutorrent/) is a front-end for the popular Bittorrent client [rTorrent](http://libtorrent.rakshasa.no/). It uses the power of the rtorrent back-end combined with the Web interface from utorrent for one powerful combination. rtorrent is a very powerful client, and comes preconfigured with settings. The default settings work fine so you should only troubleshoot by changing the settings as a last resort. Rutorrent comes with a number of plug-ins installed that expand what rutorrent can do. rtorrent without a Web Gui can handle thousands of torrents and is highly stable.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral Wiki/General/Your Feral slot is active - Part 2 - Using your slot/03 rutorrent 1.png)

In the navigation menu on the top left of Rutorrent click on the Globe.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral Wiki/General/Your Feral slot is active - Part 2 - Using your slot/03 rutorrent 2.png)

Now you will get this window. Here you browse for the torrent files you downloaded to your local machine from your Torrent site.

**Related tutorial:** [Selecting an rtorrent version](https://www.feralhosting.com/faq/view?question=202)

**Related tutorial:** [Restarting - rtorrent - Deluge - Transmission - MySQL](https://www.feralhosting.com/faq/view?question=158)

**Related tutorial:** [ruTorrent - Troubleshooting](https://www.feralhosting.com/faq/view?question=100)

**Related tutorial:** [Using rTorrent (Advanced) and Troubleshooting Common Errors](https://www.feralhosting.com/faq/view?question=2) 

**Related tutorial:** [Feralstats plugin for ruTorrent](https://www.feralhosting.com/faq/view?question=126)

### Deluge Web Gui

Deluge is a fully fledged BitTorrent client that aggressively downloads content from peers. It provides it's own Web interface to control access. Deluge is the other client we recommend. Deluge is great for initially seeding your downloads or uploads because of its peering strategy. For seeding, Deluge is a great choice, however, its limited to 1000 open files (most torrents contain multiple files) therefore it is not well suited to seeding many torrents, about 250 torrents (this is an average of 4 files per torrent). 

**Important Note:** Plug ins do not work with the Web Gui, you will need to use the [Deluge Thin Client](https://www.feralhosting.com/faq/view?question=76).

In the deluge Web Gui you must first connect to the deluge daemon.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral Wiki/General/Your Feral slot is active - Part 2 - Using your slot/04 deluge 1.png)

Once you have done that you will be able to control deluge and start uploading or downloading.

Click on "Add" in the navigation bar.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral Wiki/General/Your Feral slot is active - Part 2 - Using your slot/04 deluge 2.png)

Now select the type of torrent, file or magnet URL you would like to upload.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral Wiki/General/Your Feral slot is active - Part 2 - Using your slot/04 deluge 3.png)

**Related tutorial:** [Restarting - rtorrent - Deluge - Transmission - MySQL](https://www.feralhosting.com/faq/view?question=158)

**Related tutorial:** [Troubleshooting Deluge](https://www.feralhosting.com/faq/view?question=62)

**Related tutorial:** [Deluge Thin Client](https://www.feralhosting.com/faq/view?question=76)

### Transmission Web Gui

Transmission is a fast, easy, and free multi-platform BitTorrent client that comes with a Web interface. While not the preferred client of those offered, transmission's interface is simple and easy to understand. Transmission works well for low numbers of torrents, less than 100, and can be used at most private trackers. Please be aware, some trackers may not support transmission or the version we use.  

In the transmission Web Gui you click on the Folder icon to add a torrent or magnet link.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral Wiki/General/Your Feral slot is active - Part 2 - Using your slot/05 transmission 1.png)

Now provide the file or URL of the torrent you wish to open.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral Wiki/General/Your Feral slot is active - Part 2 - Using your slot/05 transmission 2.png)

**Related tutorial:** [Restarting - rtorrent - Deluge - Transmission - MySQL](https://www.feralhosting.com/faq/view?question=158)

**Related tutorial:** [Transmission Remote Gui](https://www.feralhosting.com/faq/view?question=4)

### Remote Clients

You can also control some of the server software as if it was installed on your PC in some cases using these programs.

**Rutorrent, Deluge and Transmission:** you can run [Transdroid](http://www.transdroid.org/) (requires Java)

**Deluge only:** you can also run the [Thin Client](https://www.feralhosting.com/faq/view?question=76). Recommended for Deluge, requires you install Deluge first using the Install Software link in your manager.

**Transmission only:** you can also run [Transmission Remote Gui](https://www.feralhosting.com/faq/view?question=4)

Here is a brief overview of how SSH works.

### SSH

SSH stands for **Secure Shell**, and is a command line interface to interact with your slot. You can move, copy, delete, archive and create files, among other things, on your slot through SSH. Learning the basics of SSH will save you time and help you be more efficient. SSH gives you control over the device as if you were controlling it locally. This means that you can send commands and control applications. SSH is a pretty powerful feature that will let you do cool things like install software and stuff, but that is covered in other FAQS. We recommend using the [SSH guide basics - PuTTy](https://www.feralhosting.com/faq/view?question=12) FAQ to get started.

Here is a brief overview of how using the SSH works so you can better understand what it means to you and when you might need to use it.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral Wiki/General/Your Feral slot is active - Part 2 - Using your slot/06 ssh.png)

Using SSH is an important part of using your slot as it will give you a great deal of control and flexibility over managing it.

**Related tutorial:**  [SSH guide basics - PuTTy](https://www.feralhosting.com/faq/view?question=12)

**Related tutorial:**  [SSH guide basics - Mac](https://www.feralhosting.com/faq/view?question=217)

**Related tutorial:**  [Public Key Authentication for password-less login](https://www.feralhosting.com/faq/view?question=13)

### SSH Tunnels

All slots allow the user to connect using SSH and create something called an SSH Tunnel. This will allow you to **selectively** route all traffic from applications through your server.

When using SSH tunnels you will use an SSH client like Putty to create a local SOCKS 5 proxy and then tell your applications to use this proxy to connect to the internet. Any program that has proxy settings can be use with an SSH tunnel.

Though there are some technical differences between how an SSH tunnel and OpenVPN work the end result is pretty much the same. Except with an SSH tunnel you can create as many tunnels as you need, on different machines, whilst only routing what you need through the server and not everything that passes through your network adapter. This can be useful when you only want to route certain things, like utorrent.

Here is a picture showing the basic concepts of using SSH tunnels with your slot.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral Wiki/General/Your Feral slot is active - Part 2 - Using your slot/07 sshtunnel.png)

**Related tutorial:**  [SSH tunnels basics - Putty and setting a Socks proxy](https://www.feralhosting.com/faq/view?question=37)

**Related tutorial:**  [SSH tunnels - MyEnTunnel 3.5 using Plink and setting a Socks proxy](https://www.feralhosting.com/faq/view?question=79)

**Related tutorial:**  [SSH guide Super - SSH basics - SSH tunnels - FTP to SFTP bridges](https://www.feralhosting.com/faq/view?question=165)

### OpenVPN

A VPN can help mask your identity, in the form of your ISP assigned IP address, when browsing, it does not alone make you completely anonymous in the way they are often marketed.

There is also distinction between privacy and anonymity that is quite an important one.

Privacy is nobody seeing what you do, but potentially knowing who you are.
Privacy is a person’s right to control access to his or her personal information.

Anonymity is nobody knowing who you are, but potentially seeing what you do.
Anonymity is a condition in which an individual’s true identity is unknown.

Traffic leaving and returning to the server behaves as normal. This means you should still uses `https` where possible and maintain good browsing practices. A VPN does wave a magical wand and make you a [super secret squirrel](http://i.imgur.com/ZlUEvSU.jpg).

All slots can install OpenVPN Server so that users can use OpenVPN supporting software (clients) to route all their local traffic through their feral slot via the OpenVPN server.

**Important note:** Each OpenVPN installation is limited to a **single open connection** at any one time. You cannot have multiple OpenVPN clients establish an open connection to your Feral OpenVPN server at the same time. So this means only one device behind a firewall/router would be able to connect directly to and through the Feral slot OpenVPN server. Some routers will allow you to configure and connect to the OpenVPN server from directly within the router set-up allowing all users behind to connect via the Feral Slot OpenVPN server.

OpenVPN is basically a way to have the benefits of LAN access from a remote location and it encrypts traffic at the driver level. In regards to the Feral set-up there are no particular benefits to using OpenVPN over using an SSH tunnel, except where special needs or requirements demand it. For example some applications do not support using a proxy, like rtorrent.

An OpenVPN connection will use a specially installed network adapter (a TUN/TAP adapter) to force all your network traffic through the slot's OpenVPN server. This means every program on your Computer will go through the Feral slot and the server will be the point of origin for your traffic to the rest of the world.

This can cause some issues with geographically aware services like banking, Paypal and email and there is no easy way to deal with this short of closing the VPN connection

While it is possible to have [multiple OpenVPN tunnels on a single machine](http://openvpn.net/index.php/open-source/faq/79-client/283-can-i-run-multiple-openvpn-tunnels-on-a-single-machine.html) it is not part of the default Feral set-up and therefore not part of this FAQ. In the default scenario you would usually only establish a single tunnel at anyone time on a device. So you would switch between VPN's from different providers rather than use them simultaneously.

Here is a picture showing the basic concept of using OpenVPN with your slot.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral Wiki/General/Your Feral slot is active - Part 2 - Using your slot/07 openvpn.png)

**Related tutorial:**  [OpenVPN - How to connect to your vpn](https://www.feralhosting.com/faq/view?question=5)

**Related tutorial:**  [OpenVPN - Connect on Android 4.0 and up - using OpenVPN Connect](https://www.feralhosting.com/faq/view?question=220)

### FTP / SFTP / SSH Access

Once you have downloaded some stuff, you have a few options on how to manage that data.

**FTP/SFTP** using applications like Filezilla, Bitkinex, Winscp, LFTP and many more.

**WWW via HTTP or HTTPS** via an Apache Web server where you can access your files and other Web apps, like the Web Gui for Rutorrent or Deluge.

Here you will find the username, password and host you need to FTP, SFTP or SSH into your slot.
		
### FTP

FTP stands for **File Transfer Protocol** and can be used to transfer files from your slot to your home computer or elsewhere. Most, if not all clients are capable of using FTP.

FTP port is 21

[FTP and SFTP basics - Filezilla](https://www.feralhosting.com/faq/view?question=187)
			
### SFTP - Recommended

SFTP stands for **Secure File Transfer Protocol** and is similar to FTP, with the addition of encryption. SFTP is the Recommended way to securely transfer data between the server and your home computer. 

We recommend using the these applications on Windows.

[WinSCP client](http://winscp.net/eng/download.php), 
[Bitkinex](http://www.bitkinex.com/ftp/client/bitkinex323.exe)
[Filezilla](http://filezilla-project.org/download.php)

For Mac, we recommend:

[Cyberduck](http://cyberduck.ch/)
[Filezilla](http://filezilla-project.org/download.php)

Other, better solutions like [Interarchy](http://nolobe.com/interarchy/) are not free so not recommended.

**Related tutorial:**  [FTP and SFTP basics - Filezilla](https://www.feralhosting.com/faq/view?question=187)
**Related tutorial:**  [WinSCP - usage - performing common tasks - creating torrents - unrar - symlinks and more](https://www.feralhosting.com/faq/view?question=27)
**Related tutorial:**  [What to do if FTP speeds are slow](https://www.feralhosting.com/faq/view?question=28)
**Related tutorial:**  [What is multisegmented downloading - how does it help](https://www.feralhosting.com/faq/view?question=182)

### FTPS/SFTP and jailed/limited users.

If you would like to share access to your slot but not share the credentials Feral provided. (see [Using your account - common questions](https://www.feralhosting.com/faq/view?question=14) this FAQ for more info on sharing your account) you will have to manually install and configure this software according to this FAQ:

[Installing an FTP daemon for extra accounts](https://www.feralhosting.com/faq/view?question=193)

### WWW/HTTP Access

To full take advantage of your WWW you will need to follow some of the Staff and user created guides in the FAQs.

All slots have access to:

[Mysql 5.6.12](http://dev.mysql.com/downloads/mysql/) - requires installation from the Install software page.
[Apache 2.2.22-13](http://packages.debian.org/wheezy/apache2)
[php5 5.4.4-14](http://packages.debian.org/wheezy/php5)

With these you can easily make use of the WWW folder for various purpose, for example:

[Putting your WWW folder to use](https://www.feralhosting.com/faq/view?question=20)
[Password protect your WWW folder](https://www.feralhosting.com/faq/view?question=22)
[Host a virtual host on your Feral slot](https://www.feralhosting.com/faq/view?question=52)
[Ajaxplorer 5 - Basic setup](https://www.feralhosting.com/faq/view?question=222)
[Wordpress - Basic setup](https://www.feralhosting.com/faq/view?question=211)
[Using Mysql](https://www.feralhosting.com/faq/view?question=9)
				
And that is it for this FAQ. It has covered the basics and you should be well on your way to downloading some Linux Distributions!

Don't forget to Search  the FAQs for answers to problems and things to do. The search is not that great so use `CTRL` and `F` in a browser and search to the words that match your query.



