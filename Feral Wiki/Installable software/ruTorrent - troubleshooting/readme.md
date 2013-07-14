
This software is called ruTorrent — do not confuse it with utorrent or rTorrent, these are all different things.

### ruTorrent Is Not a Bittorrent client

It is important that you understand that ruTorrent is not a bittorrent client, which is why **it cannot crash and cannot be restarted**.

ruTorrent is a web-based user interface (webUI) for [rTorrent](http://www.feralhosting.com/heron/faq/view?question=2) which **is** a bittorrent client. rTorrent runs quietly in shell and you do not get to see it most of the time unless you want to. You use your web browser to load ruTorrent — ruTorrent connects to rTorrent behind the scenes and shows you what goes on in rTorrent, your bittorrent client.

You might compare ruTorrent to a remote control, and rTorrent to a TV set.

Apart from having an excellent, very much uTorrent-like user interface, ruTorrent extends rTorrent's functionality considerably through the use of plugins. You will be able to create torrents, use rss feeds, delete torrents with data, choose custom locations for data, use labels, sort your torrents by label, tracker, ratio, name, state, peers, seeds, creation date, etc, and more.

### Plugins

On Feral servers ruTorrent is autoinstalled (using the Software Manager page) with a recommended set of plugins.

Explore all the [available plugins](http://code.google.com/p/rutorrent/wiki/Plugins). Should you wish to try any of them apart from those that came preinstalled with your ruTorrent, just upload them to `/rutorrent/plugins`.

### Troubleshooting

**ruTorrent fails to load and gets stuck showing the 'loading' spinner**

Clear your browser cache (also known as 'temporary files', not just history), restart your browser and reload ruTorrent, in this particular order.

If this doesn't work, one of your browser extensions/plugins may be conflicting with ruTorrent. Test ruTorrent in your browser's incognito/private browsing mode. If this works, try disabling your extensions/plugins one by one to see which is causing the conflict.

`AdBlock users on Eros:` AdBlock blocks what it thinks are ads coming from domains that match the `'/eros.` rule, which includes `eros.feralhosting.com`. This will stop ruTorrent loading correctly over HTTPS, causing it to look like [this](http://i.imgur.com/PLvPCy3.png). To prevent this, simply add `'*.feralhosting.com'` to your AdBlock exceptions list, or disable AdBlock.

**The 'could not connect to rTorrent — check if rTorrent is really running' error message in the logger**

This error means that ruTorrent failed to connect to rTorrent — rTorrent probably crashed.

In most cases rTorrent will be restarted by the system automatically within 10 minutes, after which you'll be able to load ruTorrent.

If after 10 minutes you are still unable to load ruTorrent, then something is preventing rTorrent from being restarted.

**To manually restart your client, please refer to the following faq: [Restarting rtorrent, Deluge, Transmission, or MySQL](/faq/view?question=158)**

**The 'Torrent was not passed to rTorrent' error**

This error mostly happens when the size of the .torrent you're trying to load using ruTorrent is too big. As a workaround, upload the .torrent via ftp/sftp to

```
~/private/rtorrent/watch
```

This folder is called a `watch` folder — any torrent you put there will be loaded automatically in rTorrent within seconds.

**Other:**

XMLRPC seconds.

**Request to rtorrent timed out / Various XMLRPC timeout errors / Trackers not auto-loading**

First try increasing the timeout amount under general prefernces

Unload and disable the httprpc plugin and/or the RPC plugin if you installed it.

XMLRPC Error: File exceedes the configured max file size. [start]

When you add a single file bigger then 150gb on rtorrent .9.x you got that error cause the max setting appears to have been depreciated at some point in the rtorrent codebase in the .9.x branch

to fix that just use, in the advanced options:

```
set_max_file_size=-1
```






