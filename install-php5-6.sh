Use the following set of commands to enable PPA for PHP 5.6 in your Ubuntu system and install PHP 5.6.

sudo apt-get install python-software-properties
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y php5.6

sudo apt-get install php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-xml php5.6-intl php5.6-gd

sudo php -v

# Install Mysql Server
sudo apt install mysql-server

# Install PHPMyAdmin
sudo apt-get install phpmyadmin

gedit /etc/apache2/apache2.conf
Add the following to the bottom of the file:
Include /etc/phpmyadmin/apache.conf

service apache2 restart





# Set group to www-data
sudo chgrp www-data /var/www/html

# Make it writable for the group
sudo chmod 775 /var/www/html

# Set GID to www-data for all sub-folders
sudo chmod g+s /var/www/html

# Add your username to www-data group
sudo usermod -a -G www-data username

# Finally change ownership to username
sudo chown username /var/www/html

# Your account shouldn't have any more permission issues

Install Curl
sudo apt-get install php5-curl

Install Mycrypt
sudo apt-get install php5-mcrypt

Activate Mcrypt
# Enable extension
sudo phpenmod mcrypt

# Restart Apache
sudo service apache2 reload


Enable Mod-Rewrite
# enable rewrite
sudo a2enmod rewrite

# restart apache
sudo service apache2 restart

Install Composer First
cd ~
curl -sS https://getcomposer.org/installer | sudo php

sudo mv composer.phar /usr/local/bin/composer

Install Laravel
# your-project is your destination folder
cd /var/www/
composer create-project laravel/laravel your-project --prefer-dist

Set up your Apache virtual host

# Copy default Apache conf
sudo cp /etc/apache2/sites-available/000-default /etc/apache2/sites-available/laravel.conf
# Edit laravel.conf and change DocumentRoot to /var/www/laravel/public
sudo nano /etc/apache2/sites-available/laravel.conf
# Edit laravel.conf add the following and save.
DocumentRoot /var/www/laravel/public
<Directory /var/www/laravel/public>
 Options Indexes FollowSymLinks MultiViews
 AllowOverride All
 Order allow,deny
 allow from all
</Directory>
# Reload Apache
sudo service apache2 reload
# Disable default Apache conf
sudo a2dissite 000-default.conf
# Enable laravel.conf
sudo a2ensite laravel.conf
# Reload Apache
sudo service apache reload
