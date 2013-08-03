# Some variable links for subsonic
subsonicfv="https://sourceforge.net/projects/subsonic/files/subsonic/4.8/subsonic-4.8-standalone.tar.gz"
subsonicfvs="subsonic-4.8-standalone.tar.gz"


echo -e "\033[32m""$subsonicfvs""\e[0m" "Is downloading now."
killall -9 java -u $(whoami) 2> /dev/null
mkdir -p ~/subsonictmp
wget -qNO ~/subsonic.tar.gz $subsonicfv
tar -xzf ~/subsonic.tar.gz -C ~/subsonictmp
rm -f ~/subsonictmp/subsonic.sh
cp -rf ~/subsonictmp/. ~/private/subsonic/
rm -rf ~/subsonic.tar.gz ~/subsonictmp
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