
Feralstats plugin is a custom made plugin for ruTorrent. It works for existing Feral Hosting customers and was built by a customer [using the API](/api/).

The plugin shows how much external traffic and disk usage that has been used, and how close the usage is to the limit.

To install in [SSH](https://www.feralhosting.com/faq/view?question=12):

```
cd ~/www/$(whoami).$(hostname)/public_html/rutorrent/plugins/
wget -qO feralstats.zip http://git.io/nB1WyA
unzip -qo feralstats.zip && rm -f feralstats.zip
```
To upload using FTP:

**1:** Download [http://git.io/nB1WyA](http://git.io/nB1WyA)
**2:** Extract the archive.
**3:** Upload the feralstats directory (contained within the zip) to your rutorrent plugins directory located here:

```
~/www/username.server.feralhosting.com/public_html/rutorrent/plugins
```

To use:

**1:** After uploading, reload Rutorrent in your browser. Pressing CTLR + F5 will force a refresh.
**2:** Authenticate the tool in the lower left corner of ruTorrent, if it has not already authenticated.



