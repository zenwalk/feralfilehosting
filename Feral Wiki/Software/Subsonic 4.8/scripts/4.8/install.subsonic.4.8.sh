#!/bin/bash
# Install Subsonic
#
scriptversion="1.5.7"
scriptname="subsonic.4.8.sh"
subsonicversion="4.8"
madsonicversion="5.0 Beta5 Build 3600"
javaversion="1.7 Update 25"
#
# Bobtentpeg 01/30/2013
# randomessence 04/24/2013
#
# * * * * * bash -l ~/bin/subsonicron
#
# wget -qO ~/subsonic.4.8.sh http://git.io/aFIIXg && bash ~/subsonic.4.8.sh
#
############################
## Version History Starts ##
############################
# 
# v 1.0.0
# v 1.0.1 subsonic 4.8 and code
# v 1.0.2 Added an if statement to check for a successful java command. Lots of little echo statements, sleeps and extra comments.
# v 1.0.3 Fixed some typos and made wget silent
# v 1.1.0 Added a prompt for media path, added locale settings and folders links transcode, playlist, Podcasts
# v 1.1.1 Added more comments and expanded and indented the layout to be easier to break down to follow and update.
# v 1.1.2 Added and if statement: detection of Subsonic @ ~/private/subsonic and killing of java processes. Prompts user to allow automated removal.
# v 1.1.3 Changed subsonic command to be silent and to create a pidfile containing the PID using --quiet and --pidfile
# v 1.1.4 Added the creation a start / kill / restart script generated from the pidfile to the directory ~/.
# v 1.1.5 randomessence promises to be better at actually documenting changes through versions.
# v 1.1.6 Added option to quit or continue after removal or previous version. In effect an un-installer.
# v 1.1.7 killall java 2> /dev/null and if java -version 2> /dev/null
# v 1.1.8 kill 2> /dev/null added to custom script echoes where relevant
# v 1.1.9 Opening text with some basic info.
# v 1.2.0 Lots of little tweaks. Mostly visuals and code layout.
# v 1.2.1 no more back ticks and updated custom scripts generation to echo url and PID
# v 1.2.2 host ip is not literally set in the subsonic.sh now. uses $(hostname -i) instead. Restart scripts unified into a single script.
# v 1.2.3 simplified the removal phase and add dev/null where needed
# v 1.2.4 --quiet and --pidfile removed from commands and added directly to the subsonic.sh so they are set no matter how subsonic is started.
# v 1.2.5 subsonic4.8.sh and subsonicrsk.sh copied to the ~/bin directory as subsonic4.8 and subsonicrsk respectively . It is created if not existing and chmod to 700 as part of the scripts process.
# v 1.2.6 The rsk is no longer dependent on the http variables so it can be created before the installer runs. Moved to top with option to exit after scripts are generated and moved.
# v 1.2.7 Indented the thing properly and a few other clean up bits.
# v 1.2.8 rsk prints a bit more useful info on run to be helpful. main script colors tweaked.
# v 1.2.9 Some visuals tweaks and more dev null calls.
# v 1.3.0 $(hostname -i) replaced for $(hostname)
# v 1.3.1 Tweaked self updater
# v 1.3.2 Further tweaks to the updater
# v 1.3.3 Changed the order in which the updater and rsk take place.
# v 1.3.4 Readability
# v 1.3.5 Updater tweaked again
# v 1.3.6 Sed commands. more precise and fixed pidfile duplicate entry.
# v 1.3.7 Removed excess dev nulls. Refined un-install section
# v 1.3.8 Unneeded sleep commands removed.
# v 1.3.9 Updater reworked. downloads the script, checks using difference then creates an runs a second script to update the ~/subsonic.sh if needed.
# v 1.4.0 Script templates updated. updater script added to proper place. echoes and sleeps tweaked.
# v 1.4.1 Lots of blank echo and other visual tweaks
# v 1.4.2 rsk now uses "ps -U $(whoami) | grep java" instead. main script prints PID along with URLs.
# v 1.4.3 cd and bash to return to the home then reload the shell
# v 1.4.4 subsonic uses $(curl -s icanhazip.com) now. It works.
# v 1.4.6 There was no need to even specify a port.The default 0.0.0.0 overcomes the issues. Credits: ozymandias IRC.
# v 1.4.7 Updater tweaks
# v 1.4.8 killall java 2> /dev/null replaced with killall -9 java -u $(whoami) 2> /dev/null
# v 1.5.0 option to install Madsonic.
# v 1.5.1 removed cd command. Updated sed commands to visually easier to read. Various layout tweaks.
# v 1.5.2 Debian stable (wheezy) stock Java does not play nice, so rather than check for it, we just install an updated Java.
# v 1.5.3 Java installation must reload the shell or Subsonic will run using the stock java, which is broken.
# v 1.5.4 added the creation of a small ~/bin script that a user can call in crontab to restart at reboot. it checks to see it the PID is already running.
# v 1.5.5 RSK updateda and various readability tweaks
# v 1.5.6 Madsonic 5.0 Beta4 Build 3560 with custom Audioffmpeg and ffmpeg. Some hardcoded things changed to variables for easier updating of the script
# v 1.5.7 updated subsonic version. Add an option to update installtion.
#
############################
### Version History Ends ###
############################
#
############################
###### Variable Start ######
############################
#
# Sets a random port between 6000-50000 for http
http=$(shuf -i 6000-50000 -n 1)
# Defines https as + 1 from http
https=$(expr 1 + $http)
# Defines the submemory memory variable
submemory="512"
# Gets the Java version from the last time this scrip installed Java
installedjavaversion=$(cat ~/private/java/javaversion 2> /dev/null)
# Checks if the Java path was already added to the ~/.bashrc
bashrcpath=$(sed -n '/PATH=~\/private\/java\/bin:\$PATH/p' ~/.bashrc 2> /dev/null)
# Some variable links for subsonic
subsonicfv="https://sourceforge.net/projects/subsonic/files/subsonic/4.8/subsonic-4.8-standalone.tar.gz"
subsonicfvs="subsonic-4.8-standalone.tar.gz"
sffmpegfv="https://bitbucket.org/feralhosting/feralfiles/downloads/ffmpeg.static.64bit.2013-06-14.tar.gz"
sffmpegfvs="ffmpeg.static.64bit.2013-06-14.tar.gz"
# Some variable links for madsonic
madsonicfv="https://bitbucket.org/feralhosting/feralfiles/downloads/5.0.3600.beta5XE-standalone.zip"
madsonicfvs="5.0.3600.beta5XE-standalone.zip"
# Madsonic custom ffmpeg with Audioffmpeg
mffmpegfvc="https://bitbucket.org/feralhosting/feralfiles/downloads/ffmpeg.2013-08-28.zip"
mffmpegfvcs="ffmpeg.2013-08-28.zip"
#
############################
####### Variable End #######
############################
#
############################
####### Script Start #######
############################
#
###### Self Updater Starts
#
mkdir -p $HOME/bin
#
if [ ! -f  $HOME/subsonic.4.8.sh ]
then
    wget -qO $HOME/subsonic.4.8.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Subsonic%204.8/scripts/4.8/install.subsonic.4.8.sh
fi
if [ ! -f  $HOME/bin/subsonic.4.8 ]
then
    wget -qO $HOME/bin/subsonic.4.8 https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Subsonic%204.8/scripts/4.8/install.subsonic.4.8.sh
fi
#
wget -qO $HOME/000subsonic.4.8.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Subsonic%204.8/scripts/4.8/install.subsonic.4.8.sh
#
if ! diff -q $HOME/000subsonic.4.8.sh $HOME/subsonic.4.8.sh > /dev/null 2>&1
then
    echo '#!/bin/bash
    wget -qO $HOME/subsonic.4.8.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Subsonic%204.8/scripts/4.8/install.subsonic.4.8.sh
    wget -qO $HOME/bin/subsonic.4.8 https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Subsonic%204.8/scripts/4.8/install.subsonic.4.8.sh
    bash $HOME/subsonic.4.8.sh
    exit 1' > $HOME/111subsonic.4.8.sh
    bash $HOME/111subsonic.4.8.sh
    exit 1
fi
if ! diff -q $HOME/000subsonic.4.8.sh $HOME/bin/subsonic.4.8 > /dev/null 2>&1
then
    echo '#!/bin/bash
    wget -qO $HOME/subsonic.4.8.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Subsonic%204.8/scripts/4.8/install.subsonic.4.8.sh
    wget -qO $HOME/bin/subsonic.4.8 https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Subsonic%204.8/scripts/4.8/install.subsonic.4.8.sh
    bash $HOME/subsonic.4.8.sh
    exit 1' > $HOME/222subsonic.4.8.sh
    bash $HOME/222subsonic.4.8.sh
    exit 1
fi
#
echo
echo -e "Hello $(whoami), you have the latest version of the" "\033[36m""$scriptname""\e[0m" "script. This script version is:" "\033[31m""$scriptversion""\e[0m"
echo
echo -e "The version of the" "\033[33m""Subsonic""\e[0m" "server being used in this script is:" "\033[31m""$subsonicversion""\e[0m"
echo -e "The version of the" "\033[33m""Madsonic""\e[0m" "server being used in this script is:" "\033[31m""$madsonicversion""\e[0m"
echo -e "The version of the" "\033[33m""Java""\e[0m" "being used in this script is:" "\033[31m""$javaversion""\e[0m"
if [[ -f ~/private/subsonic/.version ]]
then
    echo
    echo -e "Your currently installed version is:" "\033[32m""$(sed -n '1p' ~/private/subsonic/.version)""\e[0m"
fi    
echo
#
rm -f $HOME/000subsonic.4.8.sh $HOME/111subsonic.4.8.sh $HOME/222subsonic.4.8.sh $HOME/294857.sh $HOME/6273846.sh
chmod -f 700 ~/bin/subsonic.4.8
### Self Updater ends
#
#############################
#### subsonicrsk starts  ####
#############################
#
# This section MUST be escaped properly using backslash when adding to it.
echo -e "#!/bin/bash
#
httpport=\$(sed -n -e 's/SUBSONIC_PORT=\([0-9]\+\)/\1/p' ~/private/subsonic/subsonic.sh 2> /dev/null)
httpsport=\$(sed -n -e 's/SUBSONIC_HTTPS_PORT=\([0-9]\+\)/\1/p' ~/private/subsonic/subsonic.sh 2> /dev/null)
#
# v 1.2.0  Kill Start Restart Script generated by the subsonic installer script
#
echo
echo -e \"\\\033[33m1:\\\e[0m This is the process PID:\\\033[32m\$(cat ~/private/subsonic/subsonic.4.8.sh.PID 2> /dev/null)\\\e[0m used the last time \\\033[36m~/private/subsonic/subsonic.sh\\\e[0m was started.\"
echo
echo -e \"\\\033[33m2:\\\e[0m These are the URLs and ports Subsonic/Madsonic is configured to use:\"
echo
echo -e \"\\\033[31mHTTP\\\e[0m last accessible at \\\033[31mhttp://\$(hostname)\\\e[0m:\\\033[33m\$httpport\\\e[0m\"
echo -e \"\\\033[32mHTTPS\\\e[0m last accessible at \\\033[32mhttps://\$(hostname)\\\e[0m:\\\033[33m\$httpsport\\\e[0m\"
echo
echo -e \"\\\033[33m3:\\\e[0m Running instances checks:\"
echo
echo -e \"Checking to see, specifically, if the \\\033[32m\$(cat ~/private/subsonic/subsonic.4.8.sh.PID 2> /dev/null)\\\e[0m is running\"
echo -e \"\\\033[32m\"
if [ -z \"\$(ps -p \$(cat ~/private/subsonic/subsonic.4.8.sh.PID 2> /dev/null) --no-headers 2> /dev/null)\" ]
then
    echo -e \"Nothing to show.\"
    echo -e \"\\\e[0m\"
else
    ps -p \$(cat ~/private/subsonic/subsonic.4.8.sh.PID 2> /dev/null) --no-headers 2> /dev/null
    echo -e \"\\\e[0m\"
fi
if [ \"\$(ps -U \$(whoami) | grep -c java)\" -gt \"1\" ]
then
    echo -e \"There are currently \\\033[31m\$(ps -U \$(whoami) | grep -c java 2> /dev/null)\\\e[0m running Java processes.\"
    echo -e \"\\\033[31mWarning:\\\e[0m \\\033[32mSubsonic or Madsonic might not load or be unpredicatable with multiple instances running.\\\e[0m\"
    echo -e \"\\\033[33mIf there are multiple Subsonic or Madsonic processes please use the killall by using option [a] then use the restart option.\\\e[0m\"
    echo -e \"\\\033[31m\"
    ps -U \$(whoami) | grep java
    echo -e \"\\\e[0m\"
fi
echo -e \"\\\033[33m4:\\\e[0m Options for killing and restarting Subsonic or Madsonic:\"
echo
echo -e \"\\\033[36mKill PID only\\\e[0m \\\033[31m[y]\\\e[0m \\\033[36mKillall java processes\\\e[0m \\\033[31m[a]\\\e[0m \\\033[36mSkip to restart (where you can quit the script)\\\e[0m \\\033[31m[r]\\\e[0m\"
echo
read -ep \"Please press one of these options [y] or [a] or [r] and press enter: \"  confirm
echo
if [[ \$confirm =~ ^[Yy]\$ ]]
then
    kill -9 \$(cat ~/private/subsonic/subsonic.4.8.sh.PID 2> /dev/null) 2> /dev/null
    echo -e \"The process PID:\\\033[31m\$(cat ~/private/subsonic/subsonic.4.8.sh.PID 2> /dev/null)\\\e[0m that was started by the installer or custom scripts has been killed.\"
    echo
    echo -e \"Checking to see if the PID:\\\033[32m\$(cat ~/private/subsonic/subsonic.4.8.sh.PID 2> /dev/null)\\\e[0m is running:\\\e[0m\"
    echo -e \"\\\033[32m\"
    if [ -z \"\$(ps -p \$(cat ~/private/subsonic/subsonic.4.8.sh.PID 2> /dev/null) --no-headers 2> /dev/null)\" ]
    then
        echo -e \"Nothing to show, job done.\"
        echo -e \"\\\e[0m\"
    else
        ps -p \$(cat ~/private/subsonic/subsonic.4.8.sh.PID 2> /dev/null) --no-headers 2> /dev/null
        echo -e \"\\\e[0m\"
    fi
elif [[ \$confirm =~ ^[Aa]\$ ]]; then
    killall -9 -u \$(whoami) java 2> /dev/null
    echo -e \"\\\033[31mAll java processes have been killed\\\e[0m\"
    echo
    echo -e \"\\\033[33mChecking for open java processes:\\\e[0m\"
    echo -e \"\\\033[32m\"
    if [ -z \"\$(ps -U \$(whoami) | grep java 2> /dev/null)\" ]
    then
        echo -e \"Nothing to show, job done.\"
        echo -e \"\\\e[0m\"
    else
        ps -U \$(whoami) | grep java
        echo -e \"\\\e[0m\"
    fi
else
    echo -e \"Skipping to restart or quit\"
    echo
fi
if [ -f ~/private/subsonic/subsonic.sh ]; then
    read -ep \"Would you like to restart subsonic? [r] reload the kill features? [l] or quit the script? [q]: \"  confirm
    echo
    if [[ \$confirm =~ ^[Rr]\$ ]]; then
        if [ -z \"\$(ps -p \$(cat ~/private/subsonic/subsonic.4.8.sh.PID 2> /dev/null) --no-headers 2> /dev/null)\" ]
        then
            bash ~/private/subsonic/subsonic.sh
            echo -e \"Started Subsonic at PID:\\\033[31m\$(cat ~/private/subsonic/subsonic.4.8.sh.PID 2> /dev/null)\\\e[0m\"
            echo
            echo -e \"\\\033[31mHTTP\\\e[0m Accessible at \\\033[31mhttp://\$(hostname)\\\e[0m:\\\033[33m\$httpport\\\e[0m\"
            echo -e \"\\\033[32mHTTPS\\\e[0m Accessible at \\\033[32mhttps://\$(hostname)\\\e[0m:\\\033[33m\$httpsport\\\e[0m\"
            echo -e \"\\\033[32m\"
            if [ -z \"\$(ps -p \$(cat ~/private/subsonic/subsonic.4.8.sh.PID 2> /dev/null) --no-headers 2> /dev/null)\" ]
            then
                echo -e \"Nothing to show, job done.\"
                echo -e \"\\\e[0m\"
            else
                ps -p \$(cat ~/private/subsonic/subsonic.4.8.sh.PID 2> /dev/null) --no-headers 2> /dev/null
                echo -e \"\\\e[0m\"
            fi
            exit 1
        else
            echo -e \"Subsonic with the PID:\\\033[32m\$(cat ~/private/subsonic/subsonic.4.8.sh.PID 2> /dev/null)\\\e[0m is already running. Kill it first then restart\"
            echo
            read -ep \"Would you like to restart the RSK script? [y] reload it? [q] or quit the script?: \"  confirmrsk
            echo
            if [[ \$confirmrsk =~ ^[Yy]\$ ]]
            then
                bash ~/bin/subsonicrsk
            fi
            exit 1
        fi
    elif [[ \$confirm =~ ^[Ll]\$ ]]
    then
        echo -e \"\\\033[31mReloading subsonicrsk to access kill features.\\\e[0m\"
        echo
        bash ~/bin/subsonicrsk
    else
        echo This script has done its job and will now exit.
        echo
        exit 1
    fi
else
    echo
    echo -e \"The \\\033[31m~/private/subsonic/subsonic.sh\\\e[0m does not exist.\"
    echo -e \"please run the \\\033[31m~/subsonic.4.8.sh\\\e[0m to install and configure subsonic\"
    exit 1
fi" > ~/bin/subsonicrsk
#
#############################
##### subsonicrsk ends  #####
#############################
#
#############################
#### subsonicron starts  ####
#############################
#
echo '#!/bin/bash
echo "$(date +"%H:%M on the %d.%m.%y")" >> subsonicrun.log
if [[ -z "$(ps -p $(cat ~/private/subsonic/subsonic.4.8.sh.PID) --no-headers)" ]]
then
    bash ~/private/subsonic/subsonic.sh
else
    exit 1
fi' > ~/bin/subsonicron
#
#############################
##### subsonicron ends  #####
#############################
#
chmod -f 700 ~/bin/subsonicrsk
chmod -f 700 ~/bin/subsonicron
# Make the ~/bin/subsonicrsk and ~/bin/subsonicron files we created executable
#
echo -e "The" "\033[36m""~/bin/subsonicrsk""\e[0m" "has been updated."
echo
read -ep "Do you want to continue with the installer? [y] or quit now? [n] : " confirm
echo
# A check if the user wants to exit or continue after updating the scripts.
#
###### Installer Starts here
#
if [[ $confirm =~ ^[Yy]$ ]]
then
# exit option after scripts have been updated in case they just wanted a newer rsk.
    echo -e "\033[31m""User Notice:""\e[0m" "\033[33m""This is a user supported script. Please don't expect or ask staff to support this directly.\nTo get support you can jump on IRC and ask other users for help.\nAll critical bugs should be reported and bug fixes or improvements are welcomed and encouraged.""\e[0m"
    echo
    # A user notice regarding what support is available for this script and how to contribute.
    sleep 2
    ###### Install Java 1.7 Start
    if [ "$installedjavaversion" != "$javaversion" ]
    then
        echo "Please wait a moment while java is installed"
        wget -qO ~/java.tar.gz http://javadl.sun.com/webapps/download/AutoDL?BundleId=78697
        tar -xzf ~/java.tar.gz 
        cp -rf ~/jre1.7.0_25/. ~/private/java/
        rm -f ~/java.tar.gz
        rm -rf ~/jre1.7.0_25
        if [ -z "$bashrcpath" ]; then
            echo -e '\nPATH=~/private/java/bin:$PATH' >> ~/.bashrc
        fi
        echo "$javaversion" > ~/private/java/javaversion
        # we create a custom Java version file for comparison so the installer only runs once
        echo -e "\033[31m""Important:""\e[0m" "Java" "\033[32m""$javaversion""\e[0m" "has been installed to" "\033[36m""~/private/java""\e[0m"
        echo
        echo -e "This Script needs to exit for the Java changes to take effect. Please restart the Script using this command:"
        echo
        echo 'bash ~/subsonic.4.8.sh'
        echo
        bash
        exit 1
    fi
    ### Install Java 1.7 end
    if [ ! -d ~/private/subsonic/ ]; then
        read -ep "Install Subsonic [s] or install Madsonic [m]: "  whichversion
        echo
        if [[ $whichversion =~ ^[Ss]$ ]]
        then
            # Checks to see if the directory ~/private/subsonic/ exists. If NOT it does the then. If it is found it does the else.
            echo -e "Congratulations," "\033[31m""Java is installed""\e[0m"". Continuing with the installation."
            sleep 1
            echo
            # An echo telling the user that Java is already installed.
            #
            echo -e "Path" "\033[36m""~/private/subsonic/""\e[0m" "created. Moving to next step."
            mkdir -p ~/private/subsonic/transcode
            mkdir -p ~/private/subsonic/playlists
            mkdir -p ~/private/subsonic/Podcasts
            echo -n "$subsonicfvs" > ~/private/subsonic/.version
            echo
            # Creates some directories we need for configuring the start-up script
            #
            echo -e "\033[32m""$subsonicfvs""\e[0m" "Is downloading now."
            wget -qO ~/private/subsonic/subsonic.tar.gz $subsonicfv
            echo -e "\033[36m""$subsonicfvs""\e[0m" "Has been downloaded and renamed to" "\033[36m""subsonic.tar.gz\e[0m"
            # Gets the latest version of subsonic from sourceforge. Currently at 4.8
            #
            echo -e "\033[36m""subsonic.tar.gz""\e[0m" "Is unpacking now."
            tar -xzf ~/private/subsonic/subsonic.tar.gz -C ~/private/subsonic/
            echo -e "\033[36m""subsonic.tar.gz""\e[0m" "Has been unpacked to" "\033[36m""~/private/subsonic/\e[0m"
            # Unpack this this version from its tar.gz archive to the ~/private/subsonic/ directory
            #
            rm -f ~/private/subsonic/subsonic.tar.gz
            sleep 1
            echo
            # tidy up
            #
            echo -e "\033[32m""$sffmpegfvs""\e[0m" "Is downloading now."
            wget -qO ~/private/subsonic/transcode/ffmpeg.tar.gz $sffmpegfv
            echo -e "\033[36m""$sffmpegfvs""\e[0m" "Has been downloaded and renamed to" "\033[36m""ffmpeg.tar.gz\e[0m"
            # Downloads a perma hosted version of ffmpeg static and renames it to ffmpeg.tar.gz. Dated at 14/06/2013
            #
            echo -e "\033[36m""$sffmpegfvs""\e[0m" "Is being unpacked now."
            tar -xzf ~/private/subsonic/transcode/ffmpeg.tar.gz -C ~/private/subsonic/transcode/
            chmod -f 700 ~/private/subsonic/transcode/ffmpeg
            echo -e "\033[36m""$sffmpegfvs""\e[0m" "Has been unpacked to" "\033[36m~/private/subsonic/transcode/\e[0m"
            # Unpacks this static ffmpeg binary from its tar.gz archive to ~/private/subsonic/transcode/
            #
            rm -f ~/private/subsonic/transcode/ffmpeg.tar.gz
            sleep 1
            echo
            # tidy up
            #
            echo -e "\033[32m""Copying over a local version of lame.""\e[0m"
            cp -f /usr/local/bin/lame ~/private/subsonic/transcode/ 2> /dev/null
            chmod -f 700 ~/private/subsonic/transcode/lame
            echo -e "Lame copied to" "\033[36m""~/private/subsonic/transcode/\e[0m"
            sleep 1
            echo
            # copies over the local version of lame to ~/private/subsonic/transcode/
            #
            echo -e "\033[32m""Copying over a local version of flac.""\e[0m"
            cp -f /usr/bin/flac ~/private/subsonic/transcode/ 2> /dev/null
            chmod -f 700 ~/private/subsonic/transcode/flac
            echo -e "Flac copied to" "\033[36m""~/private/subsonic/transcode/""\e[0m"
            sleep 1
            echo
            # copies over the local version of flac to ~/private/subsonic/transcode/
            #
            echo -e "\033[31m""Configuring the start-up script.""\e[0m"
            echo -e "\033[35m""User input is required for this next step:""\e[0m"
            echo -e "\033[33m""Note on user input:""\e[0m" "It is OK to use a relative path like:" "\033[33m""~/private/rtorrent/data""\e[0m"
            #
            sed -i 's|SUBSONIC_HOME=/var/subsonic|SUBSONIC_HOME=~/private/subsonic|g' ~/private/subsonic/subsonic.sh
            sed -i "s/SUBSONIC_PORT=4040/SUBSONIC_PORT=$http/g" ~/private/subsonic/subsonic.sh
            sed -i "s/SUBSONIC_HTTPS_PORT=0/SUBSONIC_HTTPS_PORT=$https/g" ~/private/subsonic/subsonic.sh
            sed -i "s/SUBSONIC_MAX_MEMORY=150/SUBSONIC_MAX_MEMORY=$submemory/g" ~/private/subsonic/subsonic.sh
            sed -i '0,/SUBSONIC_PIDFILE=/s|SUBSONIC_PIDFILE=|SUBSONIC_PIDFILE=~/private/subsonic/subsonic.4.8.sh.PID|g' ~/private/subsonic/subsonic.sh
            # Edit the mains settings.
            #
            read -ep "Enter the path to your media or leave blank and press enter to skip: " path
            sed -i "s|SUBSONIC_DEFAULT_MUSIC_FOLDER=/var/music|SUBSONIC_DEFAULT_MUSIC_FOLDER=$path|g" ~/private/subsonic/subsonic.sh
            sed -i 's|SUBSONIC_DEFAULT_PODCAST_FOLDER=/var/music/Podcast|SUBSONIC_DEFAULT_PODCAST_FOLDER=~/private/subsonic/Podcast|g' ~/private/subsonic/subsonic.sh
            sed -i 's|SUBSONIC_DEFAULT_PLAYLIST_FOLDER=/var/playlist|SUBSONIC_DEFAULT_PLAYLIST_FOLDER=~/private/subsonic/playlists|g' ~/private/subsonic/subsonic.sh
            # Edit the paths
            #
            sed -i 's/quiet=0/quiet=1/g' ~/private/subsonic/subsonic.sh
            # Set the process to be quiet
            #
            sed -i "22 i export LC_ALL=en_GB.UTF-8\n" ~/private/subsonic/subsonic.sh
            sed -i '22 i export LANG=en_GB.UTF-8' ~/private/subsonic/subsonic.sh
            sed -i '22 i export LANGUAGE=en_GB.UTF-8' ~/private/subsonic/subsonic.sh
            # Add some locale settings in case they are not set already to work with UTF characters
            #
            echo
            echo -e "\033[31m""Start-up script successfully configured.""\e[0m"
            #
            #
            echo "Executing the start-up script now."
            #
            #
            bash ~/private/subsonic/subsonic.sh
            # starts subsonic using the pre configured subsonic.sh
            #
            echo -e "A restart/start/kill script has been created at:" "\033[35m""~/bin/subsonicrsk""\e[0m"
            #
            echo -e "\033[32m""Subsonic is now started, use the links below to access it. Don't forget to set path to FULL path to you music folder in the gui.""\e[0m"
            sleep 1
            # Job done echo
            #
            echo
            echo -e "\033[31m""HTTP""\e[0m" "is accessible at" "\033[31m""http://$(hostname)""\e[0m"":""\033[33m""$(sed -n -e 's/SUBSONIC_PORT=\([0-9]\+\)/\1/p' ~/private/subsonic/subsonic.sh 2> /dev/null)""\e[0m"
            echo -e "HTTPS uses a custom but invalid subsonic.org cert and not one from Feral. It is safe to accept."
            echo -e "\033[32m""HTTPS""\e[0m" "is accessible at" "\033[32m""https://$(hostname)""\e[0m"":""\033[33m""$(sed -n -e 's/SUBSONIC_HTTPS_PORT=\([0-9]\+\)/\1/p' ~/private/subsonic/subsonic.sh 2> /dev/null)""\e[0m"
            echo
            echo -e "Subsonic started at PID:" "\033[31m""$(cat ~/private/subsonic/subsonic.4.8.sh.PID 2> /dev/null)""\e[0m"
            echo
            # urls are printed for the user to select.
            bash
            exit 1
        elif [[ $whichversion =~ ^[Mm]$ ]]
        then 
            echo -e "Congratulations," "\033[31m""Java is installed""\e[0m"". Continuing with the installation."
            sleep 1
            echo
            # An echo telling the user that Java is already installed.
            #
            echo -e "Path" "\033[36m""~/private/subsonic/""\e[0m" "created. Moving to next step."
            mkdir -p ~/private/subsonic/transcode
            mkdir -p ~/private/subsonic/playlists
            mkdir -p ~/private/subsonic/Podcast
            mkdir -p ~/private/subsonic/Incoming
            mkdir -p ~/private/subsonic/playlist-export
            echo -n "$madsonicfvs" > ~/private/subsonic/.version
            echo
            # Creates some directories we need for configuring the start-up script
            #
            echo -e "\033[32m""$madsonicfvs""\e[0m" "Is downloading now."
            wget -qO ~/private/subsonic/madsonic.zip $madsonicfv
            echo -e "\033[36m""$madsonicfvs""\e[0m" "Has been downloaded and renamed to" "\033[36m""madsonic.zip\e[0m"
            # Gets the latest version of subsonic from sourceforge. Currently at 4.8
            #
            echo -e "\033[36m""madsonic.zip""\e[0m" "Is unpacking now."
            unzip -qo ~/private/subsonic/madsonic.zip -d ~/private/subsonic
            echo -e "\033[36m""madsonic.zip""\e[0m" "Has been unpacked to" "\033[36m""~/private/subsonic/\e[0m"
            # Unpack this this version from its tar.gz archive to the ~/private/subsonic/ directory
            #
            rm -f ~/private/subsonic/madsonic.zip
            sleep 1
            echo
            # tidy up
            #
            echo -e "\033[32m""$mffmpegfvcs""\e[0m" "Is downloading now."
            wget -qO ~/private/subsonic/transcode/ffmpeg.zip $mffmpegfvc
            echo -e "\033[36m""$mffmpegfvcs""\e[0m" "Has been downloaded and renamed to" "\033[36m""ffmpeg.tar.gz\e[0m"
            # Downloads a perma hosted version of ffmpeg static and renames it to ffmpeg.tar.gz. Dated at 04/24/2013
            #
            echo -e "\033[36m""$mffmpegfvcs""\e[0m" "Is being unpacked now."
            unzip -qo ~/private/subsonic/transcode/ffmpeg.zip -d ~/private/subsonic/transcode/
            chmod -f 700 ~/private/subsonic/transcode/Audioffmpeg ~/private/subsonic/transcode/ffmpeg
            # cp -f ~/private/subsonic/transcode/ffmpeg ~/private/subsonic/transcode/Audioffmpeg 2> /dev/null
            echo -e "\033[36m""$mffmpegfvcs""\e[0m" "Has been unpacked to" "\033[36m~/private/subsonic/transcode/\e[0m"
            # Unpacks this static ffmpeg binary from its tar.gz archive to ~/private/subsonic/transcode/
            #
            rm -f ~/private/subsonic/transcode/ffmpeg.zip
            sleep 1
            echo
            # tidy up
            #
            echo -e "\033[32m""Copying over a local version of lame.""\e[0m"
            cp -f /usr/local/bin/lame ~/private/subsonic/transcode/ 2> /dev/null
            chmod -f 700 ~/private/subsonic/transcode/lame
            echo -e "Lame copied to" "\033[36m""~/private/subsonic/transcode/\e[0m"
            sleep 1
            echo
            # copies over the local version of lame to ~/private/subsonic/transcode/
            #
            echo -e "\033[32m""Copying over a local version of Flac.""\e[0m"
            cp -f /usr/bin/flac ~/private/subsonic/transcode/ 2> /dev/null
            chmod -f 700 ~/private/subsonic/transcode/flac
            echo -e "Flac copied to" "\033[36m""~/private/subsonic/transcode/""\e[0m"
            sleep 1
            echo
            # copies over the local version of Flac to ~/private/subsonic/transcode/
            #
            echo -e "\033[31m""Configuring the start-up script.""\e[0m"
            echo -e "\033[35m""User input is required for this next step:""\e[0m"
            echo -e "\033[33m""Note on user input:""\e[0m" "It is OK to use a relative path like:" "\033[33m""~/private/rtorrent/data""\e[0m"
            #
            sed -i 's|SUBSONIC_HOME=/var/subsonic|SUBSONIC_HOME=~/private/subsonic|g' ~/private/subsonic/subsonic.sh
            sed -i "s/SUBSONIC_PORT=4040/SUBSONIC_PORT=$http/g" ~/private/subsonic/subsonic.sh
            sed -i "s/SUBSONIC_HTTPS_PORT=0/SUBSONIC_HTTPS_PORT=$https/g" ~/private/subsonic/subsonic.sh
            sed -i "s/SUBSONIC_MAX_MEMORY=200/SUBSONIC_MAX_MEMORY=$submemory/g" ~/private/subsonic/subsonic.sh
            sed -i '0,/SUBSONIC_PIDFILE=/s|SUBSONIC_PIDFILE=|SUBSONIC_PIDFILE=~/private/subsonic/subsonic.4.8.sh.PID|g' ~/private/subsonic/subsonic.sh
            # Edit the mains settings.
            #
            read -ep "Enter the path to your media or leave blank and press enter to skip: " path
            sed -i "s|SUBSONIC_DEFAULT_MUSIC_FOLDER=/var/media|SUBSONIC_DEFAULT_MUSIC_FOLDER=$path|g" ~/private/subsonic/subsonic.sh
            sed -i 's|SUBSONIC_DEFAULT_PODCAST_FOLDER=/var/media/Podcast|SUBSONIC_DEFAULT_PODCAST_FOLDER=~/private/subsonic/Podcast|g' ~/private/subsonic/subsonic.sh
            sed -i 's|SUBSONIC_DEFAULT_PLAYLIST_FOLDER=/var/media/playlist|SUBSONIC_DEFAULT_PLAYLIST_FOLDER=~/private/subsonic/playlists|g' ~/private/subsonic/subsonic.sh
            sed -i 's|SUBSONIC_DEFAULT_UPLOAD_FOLDER=/var/media/Incoming|SUBSONIC_DEFAULT_UPLOAD_FOLDER=~/private/subsonic/Incoming|g' ~/private/subsonic/subsonic.sh
            sed -i 's|SUBSONIC_DEFAULT_PLAYLIST_EXPORT_FOLDER=/var/media/playlist-export|SUBSONIC_DEFAULT_PLAYLIST_EXPORT_FOLDER=~/private/subsonic/playlist-export|g' ~/private/subsonic/subsonic.sh
            # Edit the paths
            #
            sed -i 's/quiet=0/quiet=1/g' ~/private/subsonic/subsonic.sh
            # Set the process to be quiet
            #
            sed -i "22 i export LC_ALL=en_GB.UTF-8\n" ~/private/subsonic/subsonic.sh
            sed -i '22 i export LANG=en_GB.UTF-8' ~/private/subsonic/subsonic.sh
            sed -i '22 i export LANGUAGE=en_GB.UTF-8' ~/private/subsonic/subsonic.sh
            # Add some locale settings in case they are not set already to work with UTF characters
            #
            echo
            echo -e "\033[31m""Start-up script successfully configured.""\e[0m"
            #
            #
            echo "Executing the start-up script now."
            #
            #
            bash ~/private/subsonic/subsonic.sh
            # starts subsonic using the pre configured subsonic.sh
            #
            echo -e "A restart/start/kill script has been created at:" "\033[35m""~/bin/subsonicrsk""\e[0m"
            #
            echo -e "\033[32m""Madsonic is now started, use the links below to access it. Don't forget to set path to FULL path to you music folder in the gui.""\e[0m"
            sleep 1
            # Job done echo
            #
            echo
            echo -e "\033[31m""HTTP""\e[0m" "is accessible at" "\033[31m""http://$(hostname)""\e[0m"":""\033[33m""$(sed -n 's/SUBSONIC_PORT=\([0-9]\+\)/\1/p' ~/private/subsonic/subsonic.sh 2> /dev/null)""\e[0m"
            echo -e "HTTPS uses a custom but invalid subsonic.org cert and not one from Feral. It is safe to accept."
            echo -e "\033[32m""HTTPS""\e[0m" "is accessible at" "\033[32m""https://$(hostname)""\e[0m"":""\033[33m""$(sed -n 's/SUBSONIC_HTTPS_PORT=\([0-9]\+\)/\1/p' ~/private/subsonic/subsonic.sh 2> /dev/null)""\e[0m"
            echo
            echo -e "Madsonic started at PID:" "\033[31m""$(cat ~/private/subsonic/subsonic.4.8.sh.PID 2> /dev/null)""\e[0m"
            echo
            # urls and warnings are printed for the user to select and read.
            bash
            exit 1
        else
            echo -e "No such option, exiting"
            echo
            bash
            exit 1
        fi
    else
        echo -e "\033[31m""Subsonic appears to already be installed.""\e[0m" "Please kill the PID:" "\033[33m""$(cat ~/private/subsonic/subsonic.4.8.sh.PID 2> /dev/null)""\e[0m" "if it is running and delete the" "\033[36m""~/private/subsonic directory""\e[0m"
        echo
        read -ep "Would you like me to kill Java (all Java processes) and remove the directories for you? [y] or update your installation [u] quit now [q]: "  confirm
        if [[ $confirm =~ ^[Yy]$ ]]
        then
            echo
            echo "Killing all Java processes."
            killall -9 -u $(whoami) java 2> /dev/null
            echo -e "\033[31m" "Done""\e[0m"
            sleep 1
            echo "Removing ~/private/subsonic"
            rm -rf ~/private/subsonic
            echo -e "\033[31m" "Done""\e[0m"
            sleep 1
            echo "Removing RSK scripts if present."
            rm -f ~/subsonicstart.sh
            rm -f ~/subsonicrestart.sh
            rm -f ~/subsonickill.sh
            rm -f ~/subsonicrsk.sh
            rm -f ~/bin/subsonicrsk
            rm -f ~/bin/subsonicron
            # legacy removals
            echo -e "\033[31m" "Done""\e[0m"
            sleep 1
            echo "Finalising removal."
            rm -rf ~/private/subsonic
            echo -e "\033[31m" "Done and Done""\e[0m"
            echo
            sleep 1
            read -ep "Would you like you relaunch the installer [y] or quit [q]: "  confirm
            if [[ $confirm =~ ^[Yy]$ ]]
            then
                echo
                echo -e "\033[32m" "Relaunching the installer.""\e[0m"
                if [ -f ~/subsonic.4.8.sh ]; then
                    bash ~/subsonic.4.8.sh
                else
                    wget -qO ~/subsonic.4.8.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/Subsonic%204.8/scripts/4.8/install.subsonic.4.8.sh
                    bash ~/subsonic.4.8.sh
                fi
            else
                exit 1
            fi
        elif [[ $confirm =~ ^[Uu]$ ]]
        then
            read -ep "Would you like to update Subsonic [s] or Madsonic [m]: "  confirmupdate
            echo
            if [[ $confirmupdate =~ ^[Ss]$ ]]
            then
                echo -e "Subsonic is being updated. This will only take a moment."
                echo
                killall -9 -u $(whoami) java 2> /dev/null
                mkdir -p ~/sonictmp
                wget -qO ~/subsonic.tar.gz $subsonicfv
                tar -xzf ~/subsonic.tar.gz -C ~/sonictmp
                rm -f ~/sonictmp/subsonic.sh
                cp -rf ~/sonictmp/. ~/private/subsonic/
                wget -qO ~/subffmpeg.tar.gz $sffmpegfv
                tar -xzf ~/subffmpeg.tar.gz -C ~/private/subsonic/transcode
                chmod -f 700 ~/private/subsonic/transcode/ffmpeg
                echo -n "$subsonicfvs" > ~/private/subsonic/.version
                rm -rf ~/subsonic.tar.gz ~/subffmpeg.tar.gz ~/sonictmp
                bash ~/private/subsonic/subsonic.sh
                echo -e "A restart/start/kill script has been created at:" "\033[35m""~/bin/subsonicrsk""\e[0m"
                echo -e "\033[32m""Subsonic is now started, use the links below to access it. Don't forget to set path to FULL path to you music folder in the gui.""\e[0m"
                sleep 1
                echo
                echo -e "\033[31m""HTTP""\e[0m" "is accessible at" "\033[31m""http://$(hostname)""\e[0m"":""\033[33m""$(sed -n -e 's/SUBSONIC_PORT=\([0-9]\+\)/\1/p' ~/private/subsonic/subsonic.sh 2> /dev/null)""\e[0m"
                echo -e "HTTPS uses a custom but invalid subsonic.org cert and not one from Feral. It is safe to accept."
                echo -e "\033[32m""HTTPS""\e[0m" "is accessible at" "\033[32m""https://$(hostname)""\e[0m"":""\033[33m""$(sed -n -e 's/SUBSONIC_HTTPS_PORT=\([0-9]\+\)/\1/p' ~/private/subsonic/subsonic.sh 2> /dev/null)""\e[0m"
                echo
                echo -e "Subsonic started at PID:" "\033[31m""$(cat ~/private/subsonic/subsonic.4.8.sh.PID 2> /dev/null)""\e[0m"
                echo
                bash
                exit 1
            elif [[ $confirmupdate =~ ^[Mm]$ ]]
            then
                echo -e "Madsonic is being updated. This will only take a moment."
                echo
                killall -9 -u $(whoami) java 2> /dev/null
                mkdir -p ~/sonictmp
                wget -qO ~/madsonic.zip $madsonicfv
                unzip -qo ~/madsonic.zip -d ~/sonictmp
                rm -f ~/sonictmp/subsonic.sh
                cp -rf ~/sonictmp/. ~/private/subsonic/
                wget -qO ~/madffmpeg.zip $mffmpegfvc
                unzip -qo ~/madffmpeg.zip -d ~/private/subsonic/transcode
                chmod -f 700 ~/private/subsonic/transcode/Audioffmpeg ~/private/subsonic/transcode/ffmpeg
                echo -n "$madsonicfvs" > ~/private/subsonic/.version
                rm -rf ~/madsonic.zip ~/madffmpeg.zip ~/sonictmp
                bash ~/private/subsonic/subsonic.sh
                echo -e "A restart/start/kill script has been created at:" "\033[35m""~/bin/subsonicrsk""\e[0m"
                echo -e "\033[32m""Subsonic is now started, use the links below to access it. Don't forget to set path to FULL path to you music folder in the gui.""\e[0m"
                sleep 1
                echo
                echo -e "\033[31m""HTTP""\e[0m" "is accessible at" "\033[31m""http://$(hostname)""\e[0m"":""\033[33m""$(sed -n -e 's/SUBSONIC_PORT=\([0-9]\+\)/\1/p' ~/private/subsonic/subsonic.sh 2> /dev/null)""\e[0m"
                echo -e "HTTPS uses a custom but invalid subsonic.org cert and not one from Feral. It is safe to accept."
                echo -e "\033[32m""HTTPS""\e[0m" "is accessible at" "\033[32m""https://$(hostname)""\e[0m"":""\033[33m""$(sed -n -e 's/SUBSONIC_HTTPS_PORT=\([0-9]\+\)/\1/p' ~/private/subsonic/subsonic.sh 2> /dev/null)""\e[0m"
                echo
                echo -e "Subsonic started at PID:" "\033[31m""$(cat ~/private/subsonic/subsonic.4.8.sh.PID 2> /dev/null)""\e[0m"
                echo
                bash
                exit 1
            else
                echo "You did not select a valid option. The script will exit."
                echo
                exit 1
            fi
        else
            echo
            exit 1
        fi
    fi
else
    echo -e "You chose to exit after updating the scripts."
    echo
    bash
    exit 1
fi
############################
####### Script Ends  #######
############################