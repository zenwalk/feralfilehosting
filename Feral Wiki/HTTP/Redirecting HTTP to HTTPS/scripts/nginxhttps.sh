#!/bin/bash
# Script name
scriptversion="1.0.1"
scriptname="nginxhttps"
# Author name
#
############################
## Version History Starts ##
############################
#
# wget -qNO ~/nginxhttps.sh http://git.io/A34SpA && bash ~/nginxhttps.sh
#
############################
### Version History Ends ###
############################
#
#
#
############################
###### Variable Start ######
############################
#
#
#
############################
####### Variable End #######
############################
#
#
#
############################
#### Self Updater Start ####
############################
#
if [ ! -f $HOME/nginxhttps.sh ]
then
    wget -qNO $HOME/nginxhttps.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Redirecting%20HTTP%20to%20HTTPS/scripts/nginxhttps.sh
fi
#
wget -qNO $HOME/000nginxhttps.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Redirecting%20HTTP%20to%20HTTPS/scripts/nginxhttps.sh
#
if ! diff -q $HOME/000nginxhttps.sh $HOME/nginxhttps.sh > /dev/null 2>&1
then
    echo '#!/bin/bash
    wget -qNO $HOME/nginxhttps.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Redirecting%20HTTP%20to%20HTTPS/scripts/nginxhttps.sh
    bash $HOME/nginxhttps.sh
    exit 1' > $HOME/111nginxhttps.sh
    bash $HOME/111nginxhttps.sh
    exit 1
fi
#
echo
echo -e "Hello $(whoami), you have the latest version of the" "\033[36m""$scriptname""\e[0m" "script. This script version is:" "\033[31m""$scriptversion""\e[0m"
echo
#
rm -f $HOME/000nginxhttps.sh $HOME/111nginxhttps.sh
#
############################
##### Self Updater End #####
############################
#
read -ep "The scripts have been updated, do you wish to continue [y] or exit now [q] : " updatestatus
echo
if [[ $updatestatus =~ ^[Yy]$ ]]
then
#
############################
####### Script Start #######
############################
#
echo "Creating the conf file"
#
echo -n "# Set the variable so we can also redirect to server.feralhosting.com/username/
set \$feraluser  \"$(whoami)\";

# Checks if https is NOT on and then SETs part one of our custom variable.
if (\$http_x_forwarded_proto != https ) {
    set \$forceh  A;
}

# Check for the URL format username.server.feralhosting.com and SETs part 2 of our custom variable.
if (\$http_x_host = \$http_host) {
    set \$forceh  \"\${forceh}1\"; 
}

# Check for the URL format server.feralhosting.com/username and SETs part 2 of our custom variable.
if (\$http_x_host != \$http_host) {
    set \$forceh  \"\${forceh}2\";
}

# Check x_host when it does match host that it is also specific to feral, so as not to apply to a users's VHost domains.
if (\$http_x_host ~* ^([0-9a-zA-Z-]+)\.([0-9a-zA-Z-]+)\.feralhosting\.com\$) {
    set \$forceh  \"\${forceh}3\";
}

# Check x_host when it does not match host that it is also specific to feral, so as not to apply to a users's VHost domains.
if (\$http_x_host ~* ^([0-9a-zA-Z-]+)\.feralhosting\.com\$) {
    set \$forceh  \"\${forceh}4\";
}

# Combines the SET options to rewrite this URL format: username.server.feralhosting.com
if (\$forceh = A13) {
    rewrite ^ https://\$http_x_host\$request_uri? permanent;
}

# Combines the SET options to rewrite this URL format: server.feralhosting.com/username
if (\$forceh = A24) {
    rewrite ^ https://\$http_x_host/\$feraluser\$request_uri? permanent;
}" > ~/.nginx/conf.d/000-default-server.d/https.conf
#
echo "Restarting nginx and php"
echo
killall -9 nginx php5-fpm -u $(whoami) 2> /dev/null
echo "Please wait up to 5 minutes for nginx to restart."
echo
#
############################
####### Script Ends  #######
############################
#
else
    echo -e "You chose to exit after updating the scripts."
    exit 1
    cd && bash
fi