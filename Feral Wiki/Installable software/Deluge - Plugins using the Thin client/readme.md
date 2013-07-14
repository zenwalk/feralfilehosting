
This article walks through adding a plugin for deluge using a thinclient.

Installing plugins in a deluge thinclient

This walkthrough will demonstrate how to install plugins for deluge using the 'YaRSS2' plugin as an example. 

**Step 1:** Install deluge on your slot

**Step 2:** Install deluge on your local computer

**Step 3:** Setup Remote Control with the Thin Client using the wiki article [Deluge Daemon - Remote control with the local Thin client ](https://www.feralhosting.com/faq/view?question=76)

**Step 4:** Connect to your hosting slot using putty and run the command 'python --version' to get the python version running. Make a note of $VERSION

Step 5: Download the plugin for your feral hosting slot. Go to http://dev.deluge-torrent.org/wiki/Plugins/YaRSS2 and click on the "Download" link, taking note of which plugin to download (it will end in $VERSION.egg). Put that somewhere easy to find on your local computer.

Step 6: Connect to your feral hosted deluge in your thinclient

Step 7: Install the plugin by selecting 'Edit' -> 'Plugins' -> 'Install Plugin'. Locate the appropriate plugin for linux that you have downloaded and select it. Click 'Apply' in the preference dialog. The plugins pane should refresh listing the plugin. Tick the plugin to enable it and select apply. The plugin should appear as a preference.

Step 8: Select the plugin in the preferences and configure it.



