then you need to create a file inside your called 

touch ~/.apache2/conf.d/digest.conf

nano ~/.apache2/conf.d/digest.conf

Include /etc/apache2/mods-available/auth_digest.load

/usr/sbin/apache2ctl restart

test it is loaded: might be near the bottom

/usr/sbin/apachectl -t -D DUMP_MODULES