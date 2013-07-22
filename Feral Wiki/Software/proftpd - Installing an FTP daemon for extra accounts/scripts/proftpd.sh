#!/bin/bash
# proftpd basic setup script
scriptversion="1.0.3"
scriptname="proftpd Steps 1-5"
proftpdversion="proftpd 1.3.4d"
# randomessence
############################
## Version History Starts ##
############################
#
# 1.0.0 Doe some the basics.
# 1.0.1 Better echoes.
#
############################
### Version History Ends ###
############################
#
###### Self Updater Starts
#
mkdir -p $HOME/bin
#
if [ ! -f $HOME/proftpd.sh ]
then
    wget -qNO $HOME/proftpd.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/proftpd%20-%20Installing%20an%20FTP%20daemon%20for%20extra%20accounts/scripts/proftpd.sh
fi
if [ ! -f $HOME/bin/proftpd ]
then
    wget -qNO $HOME/bin/proftpd https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/proftpd%20-%20Installing%20an%20FTP%20daemon%20for%20extra%20accounts/scripts/proftpd.sh
fi
#
wget -qNO $HOME/000proftpd.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/proftpd%20-%20Installing%20an%20FTP%20daemon%20for%20extra%20accounts/scripts/proftpd.sh
#
if ! diff -q $HOME/000proftpd.sh $HOME/proftpd.sh > /dev/null 2>&1
then
	echo '#!/bin/bash
	wget -qNO $HOME/proftpd.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/proftpd%20-%20Installing%20an%20FTP%20daemon%20for%20extra%20accounts/scripts/proftpd.sh
	wget -qNO $HOME/bin/proftpd https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/proftpd%20-%20Installing%20an%20FTP%20daemon%20for%20extra%20accounts/scripts/proftpd.sh
	bash $HOME/proftpd.sh
	exit 1' > $HOME/111proftpd.sh
	bash $HOME/111proftpd.sh
	exit 1
fi
if ! diff -q $HOME/000proftpd.sh $HOME/bin/proftpd > /dev/null 2>&1
then
	echo '#!/bin/bash
	wget -qNO $HOME/proftpd.sh https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/proftpd%20-%20Installing%20an%20FTP%20daemon%20for%20extra%20accounts/scripts/proftpd.sh
	wget -qNO $HOME/bin/proftpd https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/proftpd%20-%20Installing%20an%20FTP%20daemon%20for%20extra%20accounts/scripts/proftpd.sh
	bash $HOME/proftpd.sh
	exit 1' > $HOME/222proftpd.sh
	bash $HOME/222proftpd.sh
	exit 1
fi
#
echo
echo -e "Hello $(whoami), you have the latest version of the" "\033[32m""$scriptname""\e[0m" "script. This script version is:" "\033[31m""$scriptversion""\e[0m"
echo -e "This script is using" "\033[32m""$proftpdversion""\e[0m"
echo
#
rm -f $HOME/000proftpd.sh $HOME/111proftpd.sh $HOME/222proftpd.sh
chmod -f 700 $HOME/bin/proftpd
#
read -ep "The scripts have been updated, do you wish to continue [y] or exit now [q] : " updatestatus
echo
if [[ $updatestatus =~ ^[Yy]$ ]]
then
#
### Self Updater Ends
#
############################
####### Script Start #######
############################
#
mkdir -p $HOME/proftpd/etc/sftp/authorized_keys
mkdir -p $HOME/proftpd/etc/keys
mkdir -p $HOME/proftpd/ssl
wget -qNO $HOME/proftpd.tar.gz ftp://ftp.proftpd.org/distrib/source/proftpd-1.3.4d.tar.gz
tar -xzf $HOME/proftpd.tar.gz -C $HOME/
rm -f $HOME/proftpd.tar.gz
cd $HOME/proftpd-1.3.4d
echo -e "\033[32m""About to configure, make and install proftpd. This could take some time with a lot of information shown. Be patient.""\e[0m"
sleep 2
# configure and install
install_user=$(whoami) install_group=$(whoami) ./configure --prefix=$HOME/proftpd --enable-openssl --enable-dso --enable-nls --enable-ctrls --with-shared=mod_ratio:mod_readme:mod_sftp:mod_tls:mod_ban > ~/proftpdinstall.log 2>&1
make && make install
cd $HOME/
rm -rf $HOME/proftpd-1.3.4d
# the conf files from github
wget -qN http://git.io/CbaIJQ -O $HOME/proftpd/etc/proftpd.conf
wget -qN http://git.io/SFHs5g -O $HOME/proftpd/etc/sftp.conf
wget -qN http://git.io/ee86Hw -O $HOME/proftpd/etc/ftps.conf
# proftpd.conf
sed -i 's|/media/DiskID/home/my_username|'$HOME'|g' $HOME/proftpd/etc/proftpd.conf
sed -i 's|User my_username|User '$(whoami)'|g' $HOME/proftpd/etc/proftpd.conf
sed -i 's|Group my_username|Group '$(whoami)'|g' $HOME/proftpd/etc/proftpd.conf
sed -i 's|AllowUser my_username|AllowUser '$(whoami)'|g' $HOME/proftpd/etc/proftpd.conf
# sftp.conf
sed -i 's|/media/DiskID/home/my_username|'$HOME'|g' $HOME/proftpd/etc/sftp.conf
sed -i 's|Port 23001|Port '$(shuf -i 6000-50000 -n 1)'|g' $HOME/proftpd/etc/sftp.conf
echo
echo -e "This is your" "\033[31m""SFTP""\e[0m" "port:" "\033[31m""$(sed -n -e 's/^Port \(.*\)/\1/p' ~/proftpd/etc/sftp.conf)""\e[0m"
# ftps.conf
sed -i 's|/media/DiskID/home/my_username|'$HOME'|g' $HOME/proftpd/etc/ftps.conf
sed -i 's|Port 23002|Port '$(shuf -i 6000-50000 -n 1)'|g' $HOME/proftpd/etc/ftps.conf
echo
#
# Generate our keyfiles
ssh-keygen -q -t rsa -f ~/proftpd/etc/keys/sftp_rsa -N '' && ssh-keygen -q -t dsa -f ~/proftpd/etc/keys/sftp_dsa -N ''
echo "rsa keys generated with no passphrase"
openssl req -new -x509 -nodes -days 365 -subj '/C=GB/ST=none/L=none/CN=none' -newkey rsa:2048 -keyout ~/proftpd/ssl/proftpd.key.pem -out ~/proftpd/ssl/proftpd.cert.pem > /dev/null 2>&1
echo "ssl keys generated"
echo
#
#
echo -e "This is your" "\033[32m""FTPS""\e[0m" "port:" "\033[32m""$(sed -n -e 's/^Port \(.*\)/\1/p' ~/proftpd/etc/ftps.conf)""\e[0m"
echo
echo -e "The basic setup and cofiguration has been completed. Please continue with the FAQ from Step 4"
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