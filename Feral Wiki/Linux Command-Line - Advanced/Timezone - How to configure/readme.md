
Tired of seeing everything in the wrong timezone? irssi in particular annoyed me, so here's a fix for everyone.

To set your personal timezone on your slot for your user, use the following command.

~~~
export TZ="/usr/share/zoneinfo/{zone-dir}/{zone-file}"
~~~

For example:

~~~
export TZ="/usr/share/zoneinfo/Australia/Adelaide"
~~~

That will set the timezone until for this SSH session. 

To make it permanent, you can modify and use this command in SSH:

~~~
echo 'export TZ="/usr/share/zoneinfo/{zone-dir}/{zone-file}" >> ~/.bashrc
~~~

**Important note:** Don't forget to edit it to match your timezone first.

For example:

~~~
echo 'export TZ="/usr/share/zoneinfo/Europe/London"' >> ~/.bashrc
~~~

Then type this and press enter to reload your shell:

~~~
source ~/.bashrc
~~~

Restart bash/screen/session and your timezone will be updated. 

This command will show you the timezone:

~~~
date
~~~

If you are unsure of which timezone settings to use run this command:

~~~
tzselect
~~~

And follow the prompts to find yours.



