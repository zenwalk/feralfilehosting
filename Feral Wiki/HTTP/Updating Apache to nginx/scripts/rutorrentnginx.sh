#!/bin/bash
# wget -qNO ~/rutnginx.sh http://git.io/9vlcyw && bash ~/rutnginx.sh
echo 'location /rutorrent {
    auth_basic '$(whoami)';
    auth_basic_user_file '$HOME/www/$(whoami).$(hostname)/public_html/rutorrent/.htpasswd';
}

location /rutorrent/conf { deny all; }
location /rutorrent/share { deny all; }' > ~/.nginx/conf.d/000-default-server.d/rutorrent.conf
killall -9 nginx php5-fpm -u $(whoami)