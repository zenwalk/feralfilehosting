
All accounts currently come with these features:

SSH (command-line access) - [Connecting with Putty on Windows](https://www.feralhosting.com/faq/view?question=12)
SFTP (secure file transfer) - [SFTP using Filezilla](https://www.feralhosting.com/faq/view?question=187)
FTP (insecure file transfer) - [FTP using Filezilla](https://www.feralhosting.com/faq/view?question=187)
HTTP / PHP / APACHE / A Valid SSL Domain - [Putting Your WWW Folder to Use](https://www.feralhosting.com/faq/view?question=20)

Available to install via the `Install Software` link in your [Account Manager](https://www.feralhosting.com/manager/) - [more info](https://www.feralhosting.com/faq/view?question=6)

rutorrent/rtorrent - [Selecting an rtorrent version](https://www.feralhosting.com/faq/view?question=202)
wtorrent/rtorrent
Deluge + Deluge Thin Client - [Deluge Daemon - Remote control with the local Thin client](https://www.feralhosting.com/faq/view?question=76)
Transmission + Transmission remote GUI - [Transmission and Transmission Remote GUI](https://www.feralhosting.com/faq/view?question=4)
MYSQL - [Using Mysql](https://www.feralhosting.com/faq/view?question=9)
OpenVPN - [Using Openvpn](https://www.feralhosting.com/faq/view?question=5)

**Q:** Can I install Deluge,rtorrent/rutorrent, rtorrent/wuTorrent and transmission or can I only use one?

A: You can install and use all four applications if you want. All software on the Install Software page can be installed at the same time and actively used. You can also run more than one instance of certain applications, like Deluge as well. Staff might not support or troubleshoot your second running instances though, but if they do it is at their discretion.

**Q:** Can I have my Slot IP changed.

A: If you can provide sufficient evidence to show that you justifiably need this, then you can open a ticket and provide the details of your case there.

**Q:** What OS is running on my slot or What version of linux us running on my slot

A: Your slot is running on Debian 7 Stable (wheezy)

This SSH command will show you your current Debian version

```
lsb_release -d
```

**Q:** OpenVPN - How many open and active connections can I have?

A: You can only have **1** active connection per OpenVPN server at any one time. This would usually mean one connected device at a time.

You can use [SSH tunnels](https://www.feralhosting.com/faq/view?question=37), as there is no limit on how many tunnels you can open and create.

**Q:** Disk quota - How can I check mine?

A: [Check your disk quota in SSH](https://www.feralhosting.com/faq/view?question=221) or use the provided Usage analyser in the manager [Usage](https://www.feralhosting.com/manager/slot/usage?) (note this URL might not take you to the right slot if you have more than one)

**Q:** What software or programs will Staff install on request for me, via tickets?

A: Feral do not support external or third party applications that they do not provide as part of their set-up. Though some things can be installed upon request.

1: [Packages Debian 7 stable (wheezy)](http://packages.debian.org/stable/) - You can make a request for versions of applications in this repository. You should provide your reasoning in the ticket (at the Staff's discretion).
 
2: Required dependencies of applications, such as Python libs. You should provide your reasoning in the ticket (at the Staff's discretion).

3: You can always raise a ticket and ask if you are unsure. This does not cover them installing or configuring applications for you. It is only for installing things that are part of the Debian stable repo, that are required for you to run your application.

**Q:** Can I share my account?

A: Feral only supports one user account. This means they will only provide and support one set of user credentials (your account username and password). If you wish to share these credentials you can, but you do so at your own risk. Anyone you share you SSH/SFTP/FTp pass with will have as much control/access to and over the slot as you do.

**1:** Recommended - Create limited and jailed users using this FAQ - [Installing an FTP daemon for extra accounts](https://www.feralhosting.com/faq/view?question=193) then share these credentials. This way they will never have total access to your slot.

**2:** Create them a public/private key pair that you can easily revoke so you do not have to share you main password - [Public Key Authentication for password-less login](https://www.feralhosting.com/faq/view?question=13). This still give them the same level of access that you have, but keys are simple to revoke.

**Q:** Can I use FTPS (also known as FTP-ES, FTP-SSL) on my feral slot.

A: Feral do not provide FTPS access as part of their set-up, only SFTP. You can however use this FAQ - [Installing an FTP daemon for extra accounts](https://www.feralhosting.com/faq/view?question=193) to set-up FTPS with limited users inside jailed directories.

**Q:** Is there test file for Cogent?

A: Yes, here it is [http://aphrodite.feralhosting.com/test.bin](http://aphrodite.feralhosting.com/test.bin)

**Q:** Deluge, how do I use plug-ins, RSS and or make torrents.

A: You will need to use the Thin client. Here is a FAQ on how to set up the thin client - [Deluge Daemon - Remote control with the local Thin client](https://www.feralhosting.com/faq/view?question=76)

**Q:** I have files with another service provider, can I bring them with me to Feral?

A: Yes, you can do this quite easily if you other provider has provided you with SSH access and rsync.

1: [Open a support ticket](https://www.feralhosting.com/manager/tickets/) and provide Staff with your SSH details for you old server and what files you want. They will then start the process of moving your files for you and keep you updated via the ticket.

2: You can move these files yourself if using this guide: [Transferring data from slot to slot](https://www.feralhosting.com/faq/view?question=117). The guide describes using rysnc to move files from one Feral slot to another during an upgrade. This method is identical in moving files from a non Feral server to a Feral server. 

Related FAQ: [Completing a data transfer](https://www.feralhosting.com/faq/view?question=122)

**Q:** Can I use public trackers with my Feral slot?

A: Feral supports and allows the use of public trackers. No need to ask or get permission.

**Q:** I want to upgrade or downgrade my slot what do i do?

A: To upgrade your slot please:

(1) Purchase the slot from our website. 
(2) Wait until you receive the slot. 
(3) Then open a ticket requesting a data transfer (optional).
(4) Request a refund on your current slot (optional).

This is the official Feral upgrade procedure. Any upgrade or downgrade involves the purchasing of a new physical slot. There is no way to expand or decrease your current slot specifications.

Open a ticket as soon as your purchased slot is allocated. This opens a dialogue between you and the staff and can deal with any issues that might be relevant, such as non payment of a slot and more. Staff are reasonable and friendly people, so don't be afraid to talk to them via the ticket with your concerns. Also be fair to them, don't leave things until the last minute.

Related FAQ: [Completing a data transfer](https://www.feralhosting.com/faq/view?question=122)
Related FAQ: [Using rsync to transfer files to a new slot](https://www.feralhosting.com/faq/view?question=117)
Related FAQ: [Slot Upgrades - Additional Disk Space or Speed Requirements](https://www.feralhosting.com/faq/view?question=33)
Related FAQ: [Late Payments](https://www.feralhosting.com/faq/view?question=8)

**Q:** Can I install my own software software?

A: Users do not have Root privileges so cannot use apt or packet managers to install software. In order to install software a user must install the program to their $HOME location, for example:

```
./configure --prefix=${HOME}/private/
```

The software may not always support this though, and it it not an issue the staff support. You can always jump on IRC and ask, maybe another user will be around willing to help.

Here is a [Generic Software Installation Guide](https://www.feralhosting.com/faq/view?question=195)

Here are some setup guides for software, check the FAQs for more:

[Git - How to Install](https://www.feralhosting.com/faq/view?question=206)
[Python - How to install](https://www.feralhosting.com/faq/view?question=204)
[Dropbox - How to install](https://www.feralhosting.com/faq/view?question=205)
[Java 1.7](https://www.feralhosting.com/faq/view?question=183)

Most pre-built binaries can be run directly from your slot.

If you require and dependencies that are part of the Debian Stable branch, open a ticket and ask staff if they can install them. This is something they will do for users, but they will not support the installation or maintenance of software that they have not provided.

**Q:** Upload Traffic - What happens if i go over my quota?

A: Your upload will be throttled to 1Mbits for Cogent and 10Mbits for OVH for the duration of that monthly cycle.

**Q:** What counts to my Upload quota or Usage allowance?

A: Anything that is leaving(OUT) your server is upload. So anything your server has to send to you, such as an FTP/SFTP download, is something that is leaving the server. Anything Incoming(IN) is not counted to this usage.

**SFTP: **

SFTP is the ideal and supported way to securely transfer data between the server and your home computer. SFTP is FTP over SSH. All Feral users have SSH access to their slots. 

`Feral does not use or support FTPS for file transfer.`

Here are a list of Windows and Mac FTP/SFTP clients

**Windows Free Solutions:**

[WinSCP client](http://winscp.net/eng/download.php) Recommended - FTP/SFTP/keyfiles/Custom Commands e.g. unrar/Putty integration/parallel downloads
[Filezilla Client](https://filezilla-project.org/download.php?type=client) FTP/SFTP/keyfiles/parallel downloads
[Bitkinex Client](http://www.bitkinex.com/download) FTP/SFTP/keyfiles/Putty integration/parallel downloads/Segmented downloads

**Mac Free Solutions:**

[Filezilla Client](https://filezilla-project.org/download.php?type=client) FTP/SFTP/keyfiles/parallel downloads

Related tutorial: [WinSCP: Performing Common Tasks (Creating Torrents, Unrar'ing, Symlinks, etc)](https://www.feralhosting.com/faq/view?question=27)
Related tutorial: [FTP / SFTP using Filezilla](https://www.feralhosting.com/faq/view?question=187)
Related tutorial: [Installing an FTP daemon for extra accounts](https://www.feralhosting.com/faq/view?question=193)
Related tutorial: [Automated Sync from SeedBox to Home](https://www.feralhosting.com/faq/view?question=153)

**FTP**

FTP is a second method for transferring files if SFTP is not available or slow. We recommend using the [FileZilla client](http://filezilla-project.org/download.php?type=client). It runs on all Major platforms. If you require more downloading power, please use a [multi-part](http://en.wikipedia.org/wiki/Download_acceleration) ftp client, like [CuteFTP Home or Pro](http://www.globalscape.com/downloads/). There is a [Mac version](http://www.globalscape.com/cuteftpmacpro/) of CuteFTP as well.

Related tutorial: [What to Do If FTP Speeds Are Slow](https://www.feralhosting.com/faq/view?question=28)

Sometimes SFTP is considerably slower than what is possible; if this is the case, try using FTP. If using a secure connection is paramount, connect using OpenVPN before FTP is used. Please see this [FAQ](https://www.feralhosting.com/faq/view?question=5). Macs usually have OpenVPN support built-in.

**SSH**

SSH is useful for complete control over your account and is used to help fix any problems. We recommend using the [PuTTy client](http://the.earth.li/~sgtatham/putty/latest/x86/putty-0.62-installer.exe) on Windows. On Macs, you can just use terminal or xterm.

Related tutorial: [Connecting with Putty on Windows](https://www.feralhosting.com/faq/view?question=12)
Related tutorial: [SSH Tunnels Basic - PuTTy](https://www.feralhosting.com/faq/view?question=37)
Related tutorial: [Setting up Public Key Authentication for Password-less Login](https://www.feralhosting.com/faq/view?question=13)
Related tutorial: [SSH Basics, SSH Tunnels and FTP to SFTP Bridges](https://www.feralhosting.com/faq/view?question=165)

**HTTP**

Alternatively, you can use your preferred browser or a download manager to download your files via HTTP.

With the purchase of a slot you are given two unique WWW urls for you to use.

username.servername.feralhosting.com   < https has a cert mismatch issue due to the name format.

servername.feralhosting.com/username/  < https has a valid and matching ssl certificate for Feral subdomains.

These URLs represent the same location with two ways to reaching it. The files in one will be the same files in the other and vice versa.

Related tutorial: [Putting Your WWW Folder to Use](https://www.feralhosting.com/faq/view?question=20)
Related tutorial: [Forcing HTTPS](https://www.feralhosting.com/faq/view?question=161)
Related tutorial: [Password Protect your WWW](https://www.feralhosting.com/faq/view?question=22)

**Extra Domains**

You also have the option of getting an extra domain. Please read more [here](https://www.feralhosting.com/faq/view?question=52).

You can host a free domain or a domain you already own.



