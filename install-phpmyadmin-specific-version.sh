https://www.phpmyadmin.net/downloads/

https://computingforgeeks.com/how-to-install-latest-phpmyadmin-on-ubuntu-debian/

sudo mysql -u root

mysql> USE mysql;

mysql> UPDATE mysql.user SET authentication_string=PASSWORD(''), plugin='mysql_native_password' WHERE User='root' AND Host='localhost';EXIT;
