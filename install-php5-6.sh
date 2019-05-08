#Use the following set of commands to enable PPA for PHP 5.6 in your Ubuntu system and install PHP 5.6.

sudo apt-get install python-software-properties
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y php5.6

#install most required packages for php
sudo apt-get install php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-xml php5.6-intl php5.6-gd php5.6-curl php5.6-zip

#check php version
sudo php -v

# Install Mysql Server
sudo apt install mysql-server

# Install PHPMyAdmin
sudo apt-get install phpmyadmin

#Open apache2.conf file and include phpmyadmin
gedit /etc/apache2/apache2.conf

#Add the following to the bottom of the file:
Include /etc/phpmyadmin/apache.conf

#restart apache server
service apache2 restart


# Set group to www-data
sudo chgrp www-data /var/www/html

# Make it writable for the group
sudo chmod 775 /var/www/html

# Set GID to www-data for all sub-folders
sudo chmod g+s /var/www/html

# Add your username to www-data group 
#HELP for get username > write whoami in terminal OR echo $USER
sudo usermod -a -G www-data username

# Finally change ownership to username
sudo chown username /var/www/html

# Restart Apache
sudo service apache2 reload


# enable rewrite
sudo a2enmod rewrite

# restart apache
sudo service apache2 restart

#Install Composer First
cd ~
curl -sS https://getcomposer.org/installer | sudo php

sudo mv composer.phar /usr/local/bin/composer

#Setup fresh laravel in ubuntu using composer	
composer create-project --prefer-dist laravel/laravel blog --prefer-dist

#OR download laravel specific verion

composer create-project --prefer-dist laravel/laravel blog "5.8.*"

#Open Terminal : >_ 
sudo -i 
cd /etc/apache2/sites-available/
cp 000-default.conf blog.conf
#copy and paste this text 
		 
<VirtualHost *:80>
	ServerName blog.co
	ServerAdmin webmaster@localhost
	DocumentRoot /var/www/html/blog/public
	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined
	<Directory /var/www/html/blog>
		Options All
		AllowOverride All
		Order allow,deny
		Allow from all
	</Directory>
</VirtualHost>

#Save and close.
a2ensite blog.conf
service apache2 restart
gedit cd /etc/hosts

#Register your blog.co in hosts file
#Add this line : 
127.0.0.1 	blog.co

#Go to browser and hit : 
http://blog.co

#setting up .env file with database credentials
php artisan migrate
