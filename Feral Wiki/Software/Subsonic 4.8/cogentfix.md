- The file in question is here by default: `~/private/subsonic/subsonic.sh`
- The part we need to fix: `SUBSONIC_HOST=`

### Step 1. Do these commands in SSH. The location assumes you used the script to install subsonic. ###

Do this to find yours:

Step 1: Find where your subsonic.sh is.

	find . -type f -name 'subsonic.sh'

Step 2: Find how your subsonic.sh got edited

If in a different location to the default, edit the path of the commands below.

	cat ~/private/subsonic/subsonic.sh | grep SUBSONIC_HOST= -m 1

Step 3: These three commands should cover most cases.

If in a different location to the default, edit the path of the commands below.

	sed -i 's/SUBSONIC_HOST=$(hostname -i)/SUBSONIC_HOST=0.0.0.0/g' ~/private/subsonic/subsonic.sh
	sed -i 's/SUBSONIC_HOST=$(hostname)/SUBSONIC_HOST=0.0.0.0/g' ~/private/subsonic/subsonic.sh
	sed -i 's/SUBSONIC_HOST=$(curl -s icanhazip.com)/SUBSONIC_HOST=0.0.0.0/g' ~/private/subsonic/subsonic.sh

Step 4: Check it worked

If in a different location to the default, edit the path of the commands below.

	cat ~/private/subsonic/subsonic.sh | grep SUBSONIC_HOST= -m 1

It should look like this now

	SUBSONIC_HOST=0.0.0.0

Step2. Restart subsonic using the rsk script

	subsonicrsk

or

	bash ~/bin/subsonicrsk

Kill subsonic then start it directly

	killall -9 java
	bash ~/private/subsonic/subsonic.sh