# Add Software common properties
>sudo apt-get install -y software-properties-common

>sudo add-apt-repository ppa:ondrej/php

>sudo apt-get update

# Install PHP 8.2 in Ubuntu 20.04 LTS

>sudo apt-get install -y php8.2

>sudo apt install php8.2-{bcmath,fpm,xml,mysql,zip,intl,ldap,gd,cli,bz2,curl,mbstring,pgsql,opcache,soap,cgi}

# Install PHP 8.1 in Ubuntu 20.04 LTS

>sudo apt-get install -y php8.1

>>sudo apt-get install php8.1-curl php8.1-dev php8.1-gd php8.1-mbstring php8.1-zip php8.1-mysql php8.1-xml php8.1-bcmath php8.1-cli php8.1-common php8.1-intl php8.1-soap php8.1-fpm php8.1-xsl php8.1-iconv php8.1-memcached

NOTICE: Not enabling PHP 8.1 FPM by default.

NOTICE: To enable PHP 8.1 FPM in Apache2 do:

>sudo a2enmod proxy_fcgi setenvif

>sudo systemctl restart apache2

>sudo a2enconf php8.1-fpm

>sudo systemctl reload apache2

NOTICE: You are seeing this message because you have apache2 package installed.


# Install PHP 8.0 in Ubuntu 20.04 LTS

>sudo apt-get install -y php8.0

>>sudo apt-get install php8.0-curl php8.0-dev php8.0-gd php8.0-mbstring php8.0-zip php8.0-mysql php8.0-xml php8.0-bcmath php8.0-cli php8.0-common php8.0-intl php8.0-soap php8.0-fpm php8.0-xsl php8.0-iconv php8.0-memcached

# Install PHP 7.4 in Ubuntu 20.04 LTS
>sudo apt-get install -y php7.4

>sudo apt-get install php7.4-curl php7.4-dev php7.4-gd php7.4-mbstring php7.4-zip php7.4-mysql php7.4-xml php7.4-bcmath php7.4-cli php7.4-common php7.4-intl php7.4-json php7.4-soap php7.4-fpm php7.4-xsl php7.4-iconv php7.4-memcached


# Install PHP 7.3 in Ubuntu 20.04 LTS
>sudo apt-get install -y php7.3

>sudo apt-get install php7.3-curl php7.3-dev php7.3-gd php7.3-mbstring php7.3-zip php7.3-mysql php7.3-xml php7.3-bcmath php7.3-cli php7.3-common php7.3-intl php7.3-mcrypt php7.3-json php7.3-soap php7.3-fpm php7.3-xsl php7.3-iconv php7.3-memcached


# Install PHP 7.2 in Ubuntu 20.04 LTS
>sudo apt-get install -y php7.2

>sudo apt-get install php7.2-curl php7.2-dev php7.2-gd php7.2-mbstring php7.2-zip php7.2-mysql php7.2-xml php7.2-bcmath php7.2-cli php7.2-common php7.2-intl php7.2-json php7.2-soap php7.2-fpm php7.2-xsl php7.2-iconv

# Install PHP 7.1 in Ubuntu 20.04 LTS
>sudo apt-get install -y php7.1

>sudo apt-get install php7.1-curl php7.1-dev php7.1-gd php7.1-mbstring php7.1-zip php7.1-mysql php7.1-xml php7.1-bcmath php7.1-cli php7.1-common php7.1-intl php7.1-json php7.1-soap php7.1-fpm php7.1-xsl php7.1-iconv


# Install PHP 5.6 in Ubuntu 20.04 LTS
>sudo apt-get install -y php5.6

>sudo apt-get install php5.6-mcrypt php5.6-mbstring php5.6-curl php5.6-cli php5.6-mysql php5.6-gd php5.6-intl php5.6-xsl php5.6-zip libapache2-mod-php5.6 php5.6-xdebug

===================================================================================================

# Install Mysql Server (mysql server v8.0)
>sudo apt install mysql-server

# Install PHPMyAdmin
>sudo apt-get install phpmyadmin

# Open apache2.conf file and include phpmyadmin
>sudo gedit /etc/apache2/apache2.conf

# Add the following to the bottom of the file:
Include /etc/phpmyadmin/apache.conf

# restart apache server
>sudo service apache2 restart

===================================================================================================

# Set group to www-data
>sudo chgrp www-data /var/www/html

# Make it writable for the group
>sudo chmod 775 /var/www/html

# Set GID to www-data for all sub-folders
>sudo chmod g+s /var/www/html

# Add your username to www-data group 
#HELP for get username > write whoami in terminal OR echo $USER
>sudo usermod -a -G www-data username

# Finally change ownership to username
>sudo chown username /var/www/html

# Restart Apache
>sudo service apache2 reload

# enable rewrite
>sudo a2enmod rewrite

# restart apache
>sudo service apache2 restart

# Set localhost root user password

>sudo gedit /etc/phpmyadmin/config.inc.php

*Search: AllowNoPassword

*uncomment it.

*Add below line into config.inc.php and save it

>$cfg['SendErrorReports'] = 'never';

Login into MySQL

>sudo mysql -u root

>USE mysql;

>UPDATE mysql.user SET authentication_string='', plugin='mysql_native_password' WHERE User='root' AND Host='localhost';FLUSH PRIVILEGES;EXIT;

>sudo service mysql restart

# Update default server configurations

Open php.ini based on your selected php version

For Ex: 

>sudo gedit /etc/php/8.0/apache2/php.ini
>
>sudo gedit /etc/php/8.0/cli/php.ini
>
>sudo gedit /etc/php/8.0/fpm/php.ini


>post_max_size = 2000M
>
>upload_max_filesize = 2000M
>
>max_execution_time = 300
>
>max_input_time = 300
>
>memory_limit = 2000M
>
>session.gc_maxlifetime = 99900

restart apache

>sudo service apache2 restart

===================================================================================================

# Install Curl
>sudo apt install curl
 
# Install Composer
>cd ~
>
>sudo curl -sS https://getcomposer.org/installer | sudo php
>
>sudo mv composer.phar /usr/local/bin/composer
>
>sudo ln -s /usr/local/bin/composer /usr/bin/composer

>composer -v

# New folder & File create
>mkdir ~/Templates
>
>touch ~/Templates/Text\ File.txt
