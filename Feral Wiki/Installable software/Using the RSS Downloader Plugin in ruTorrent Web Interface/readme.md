**This software is now autoinstallable from the [software status page](https://www.feralhosting.com/heron/manager/software/).**

ruTorrent is a web-based user interface (webUI) for the popular bittorrent client rTorrent. You access it
through your browser from any computer connected to the internet. Apart from having an excellent, very much 
uTorrent-like user interface, it extends rTorrent's functionality considerably through the use of plugins. 
You will be able to create torrents, use rss feeds, delete torrents with data, choose custom locations for data, 
use labels, sort your torrents by label, tracker, ratio, name, state, peers, seeds, creation date, etc, and more.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/Using%20the%20RSS%20Downloader%20Plugin%20in%20ruTorrent%20Web%20Interface/1.jpg)

**Plugins**

On Feral servers ruTorrent is autoinstalled (using the Software Manager page) with a recommended set of plugins.

Explore all the [available plugins](http://code.google.com/p/rutorrent/wiki/Plugins). Should you wish to try any of them apart from those that came preinstalled with your ruTorrent, just upload them to **rutorrent/plugins** that is located inside your Default WWW location.

```
~/www/**username**.**servername**.feralhosting.com
```

**IMPORTANT: there should be a separate directory for each plugin inside [b]rutorrent/plugins**. To uninstall a plugin, just delete the whole dir with the plugin in it.[/b]

Currently available plugins (Feral recommended plugins appear in **bold**):

**1: RPC** — plugin for linking rtorrent and a web server (**required** for Feral);
**2: erasedata** — adds the "Delete with data" option to the context menu in the downloads area;
**3: darkpal** — a dark interface theme;
**4: choose** — adds a button to the new downloads dialog for comfortable navigation through the server file system;
**5: сreate** — adds a command for making torrents;
**6: trafic** — traffic registration subsystem;
**7: RSS** — RSS-feeds;
**8: edit** — real-time trackers list editing;
**9: throttle** — separate speed limits for download groups;
**10: retrackers** — automatically adds required re-trackers for new downloads;
**11: cookies** — allows to configure a set of cookies for trackers that require cookie-based authentication;
**12: search** — allows to customize search engines; [May give error "error: [21.01.2010 21:29:30] Error: torrent is doesn't passed to rTorrent."]
**13: scheduler** — configurable speed limits for downloading/uploading depending on hour of day and day of week;
**14: autotools** — automation functions (autolabel, automove);
**15: datadir** — allows to change data location on per torrent basis;
**16: tracklabels** — adds tracker autolabels to the categories pane;
**17: ratio** — separate ratio limits for download groups (requires rtorrent 0.8.5+);
**18: seedingtime** — additional column in the main view — shows date/time when a particular torrent finished downloading and started seeding (requires rtorrent 0.8.5+):

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/Using%20the%20RSS%20Downloader%20Plugin%20in%20ruTorrent%20Web%20Interface/2.jpg)

**Using the RSS Downloader Plugin**

```
**Please be very careful with this plugin**. Filters need to be setup correctly for it to download only 
what you want, and not everything in the feed. Errors in the setup may harm your ratio or, in the worst 
scenario, destroy it completely.

**Do test your setup properly before configuring the plugin to autodownload!**
Set up your filters and leave the plugin running for about a day, then examine the results and verify that 
your filters are actually filtering out the right stuff!
```

Click on the **RSS Downloader** button in the top toolbar. Add the URL of your feed. Add an alias for the feed — your feed will show up under this name in the RSS section of the left sidebar.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/Using%20the%20RSS%20Downloader%20Plugin%20in%20ruTorrent%20Web%20Interface/3.png)

Click **OK**. If your feed contains a pass key in its URL and your tracker does not require a cookie to access the feed, RSS Downloader will connect to the feed and display the most recent items. It will not download any **.torrents** at this point.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/Using%20the%20RSS%20Downloader%20Plugin%20in%20ruTorrent%20Web%20Interface/4.png)

Right-click on the feed alias in the left sidebar and choose **RSS Manager**.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/Using%20the%20RSS%20Downloader%20Plugin%20in%20ruTorrent%20Web%20Interface/5.png)

We need to configure at least one filter for the plugin to use with the feed. Click the **Add** button and give your filter a name. Let's say, we want to download everything in the feed.

Copy and paste the following line into the **Filter** field:

```
/()/i
```

Leave the **Exclude** field empty. From the RSS dropdown choose the alias of the feed the filter will be applied to (**SCC** in our case). Leave the directory field empty — RSS Downloader will download **.torrents** to the default location — **/rutorrent/torrents** — and load them from there. Be sure to tick **"Don't start the download automatically"** — at this moment we are just testing our filters. The **Label** field is optional — if filled out, downloaded .torrents will be auto-labeled using this value (useful for sorting jobs by label).

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/Using%20the%20RSS%20Downloader%20Plugin%20in%20ruTorrent%20Web%20Interface/6.png)

The **?** button allows you to test your filter in real time against the items in the feed. Click it, and RSS Downloader will respond with a number of matches, and highlight all matching items in the list.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/Using%20the%20RSS%20Downloader%20Plugin%20in%20ruTorrent%20Web%20Interface/7.png)

Our filter correctly matched 15 items out of the 15 currently available in the feed. Press **OK**. RSS Downloader should download all .torrents in the feed and add them as stopped to the queue. Verify it, and if everything is working as it should, return to **RSS Manager** and untick the **"Don't start the download automatically"** setting. Reload ruTorrent in your browser for the new settings to take effect.

**Do test your setup properly before configuring the plugin to autodownload! Set up your filters and leave the plugin running for about a day, then examine the results and verify that your filters are actually filtering out the right stuff!**

**ADVANCED SCENARIOS**

Download only .torrents with **VA-** in the name:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/Using%20the%20RSS%20Downloader%20Plugin%20in%20ruTorrent%20Web%20Interface/8.png)

Download only .torrents with the words **Pepe** or **Strict** or **Gypsy** in the name (use the pipe sign **|** to separate tokens):

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/Using%20the%20RSS%20Downloader%20Plugin%20in%20ruTorrent%20Web%20Interface/9.png)

Download only .torrents with the words **Pepe** or **Strict** or **Gypsy** in the name, but exclude anything with **2006** in the file name:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/Using%20the%20RSS%20Downloader%20Plugin%20in%20ruTorrent%20Web%20Interface/10.png)

Download only .torrents with the words weeds OR (prison AND break) OR (rescue AND me) OR heroes in the file name:

```
/(weeds|prison.*break|rescue.*me|heroes)/i
```

Please consult [this tutorial](ftp://feralhosting.com/rutorrent_pcre_tutorial_feralhosting.com.pdf) for a more detailed overview of the syntax and usage examples (thanks to user drunkpitbull).

**OTHER OBSERVATIONS**

If you auto-installed ruTorrent from the [software manager page](http://www.feralhosting.com/heron/manager/software/), the default feed update interval is set to 30 min. Should you wish to change this setting, connect to your slot via FTP/SFTP and edit the following file:

```
/home/username/www/.../rutorrent/plugins/rss/conf.php
```

Consult with your tracker regarding the minimum allowed rss poll interval on this specific tracker (the tracker's forum would be a good place to ask). Do not joke with it — your IP will most likely get banned by the tracker if you request the feed way too frequently.

**WAFFLES.FM**

Until further notice, Waffles.FM banned OVH IP ranges from accessing the website, while still allowing access to the tracker. You will thus be able to use your Feral box to download/upload stuff from/to Waffles.FM, but **you won't be able to access Waffles.FM website using Feral VPN / SSH tunnel or use Waffles.FM RSS feeds directly on your Feral box**. See [this guide](https://www.feralhosting.com/faq/view?question=39) for a possible workaround.




