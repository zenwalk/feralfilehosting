Tired of seeing everything in the wrong timezone? irssi in particular annoyed me, so here's a fix for everyone.

To set your personal timezone on your slot for your user, use the following command.

	export TZ="/usr/share/zoneinfo/{zone-dir}/{zone-file}"

For example:

	export TZ="/usr/share/zoneinfo/Australia/Adelaide"

That will set the timezone until for this SSH session. 

To make it permanent, do this command to add it to your `~/.bashrc` file:

	echo 'export TZ="/usr/share/zoneinfo/{zone-dir}/{zone-file}"

*Don't forget to edit it to your timezone.*

For example:

	echo 'export TZ="/usr/share/zoneinfo/Europe/London"' >> ~/.bashrc

Then type this and press enter to reload your shell:

	bash

Restart bash/screen/session and your timezone will be updated. This command will show you the new timezone:

	date

If you are unsure of which timezone settings to use run this command:

	tzselect

And follow the prompts to find yours.



