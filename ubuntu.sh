sudo apt-get install python-software-properties
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y php5.6
sudo apt-get install php5.6-mcrypt php5.6-mbstring php5.6-curl php5.6-cli php5.6-mysql php5.6-gd php5.6-intl php5.6-xsl php5.6-zip php5.6-xml
sudo apt install mysql-server
sudo apt-get install phpmyadmin

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

# Restart Apache
sudo service apache2 reload

#Enable Mod-Rewrite
sudo a2enmod rewrite

# restart apache
sudo service apache2 restart

# Install Curl
sudo apt-get install curl

# Install Composer First
cd ~
curl -sS https://getcomposer.org/installer | sudo php

sudo mv composer.phar /usr/local/bin/composer

Install Laravel
# your-project is your destination folder
cd /var/www/html
composer create-project laravel/laravel your-project --prefer-dist

Set up your Apache virtual host

# Copy default Apache conf
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/laravel.conf
# Edit laravel.conf and change DocumentRoot to /var/www/laravel/public
sudo nano /etc/apache2/sites-available/laravel.conf
# Edit laravel.conf add the following and save.

<VirtualHost *:80>
	ServerName laravel.co
	ServerAdmin webmaster@localhost
	DocumentRoot /var/www/html/laravel/public
	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined

	<Directory /var/www/html/laravel>
		Options All
		AllowOverride All
		Order allow,deny
		Allow from all
	</Directory>
</VirtualHost>

#Save and close.

# Disable default Apache conf
sudo a2dissite 000-default.conf

# Enable laravel.conf
sudo a2ensite laravel.conf

# Reload Apache
sudo service apache2 reload

#Register your laravel.co in hosts file
gedit cd /etc/hosts

#Add this line : 
127.0.0.1 	laravel.co

#Go to browser and hit : 
http://laravel.co
