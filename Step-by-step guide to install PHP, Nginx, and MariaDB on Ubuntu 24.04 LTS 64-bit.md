This tutorial is going to show you how to install LEMP stack (Nginx, MariaDB, and PHP8.3) on Ubuntu 24.04. A software stack is a set of software tools bundled together. LEMP stands for Linux, Nginx (Engine-X), MariaDB/MySQL, and PHP, all of which are open source and free to use.

It is the most common software stack that powers dynamic websites and web applications.

1. Linux is the operating system.
2. Nginx is the web server.
3. MariaDB/MySQL is the database server.
4. PHP is the server-side scripting language responsible for generating dynamic web pages.

Here's a step-by-step guide to install PHP, Nginx, and MariaDB on Ubuntu 24.04 LTS 64-bit:

### Step 1: Update and Upgrade the System
Before installing any packages, it's important to update your system.

1. Open a terminal.
2. Run the following commands:
   ```bash
   sudo apt update
   sudo apt upgrade -y
   sudo apt dist-upgrade -y
   sudo apt autoremove -y
   ```

### Step 2: Install Nginx
Nginx is a powerful, efficient web server.

1. Install Nginx:
   ```bash
   sudo apt install nginx -y
   ```

2. Enable and start the Nginx service:
   ```bash
   sudo systemctl enable nginx
   sudo systemctl start nginx
   ```

3. Check if Nginx is running:
   ```bash
   sudo systemctl status nginx
   ```
   You should see a message indicating that Nginx is active and running.

### Step 3: Install MariaDB
MariaDB is a popular open-source database server.

1. Install MariaDB:
   ```bash
   sudo apt install mariadb-server mariadb-client -y
   ```

2. Secure the MariaDB installation:
   ```bash
   sudo mysql_secure_installation
   ```
   You'll be prompted to configure some security settings. Follow the prompts to secure your database.

3. Enable and start the MariaDB service:
   ```bash
   sudo systemctl enable mariadb
   sudo systemctl start mariadb
   ```

4. Check if MariaDB is running:
   ```bash
   sudo systemctl status mariadb
   ```
   You should see a message indicating that MariaDB is active and running.

### Step 4: Install PHP
PHP is the scripting language that will run on your server.

1. Add the PHP repository:
   ```bash
   sudo add-apt-repository ppa:ondrej/php
   sudo apt update
   sudo apt install imagemagick -y
   ```

2. Install PHP and necessary extensions:
   ```bash
   sudo apt install php8.3 php8.3-{common,bcmath,fpm,xml,xmlrpc,mysql,zip,intl,ldap,gd,cli,bz2,curl,mbstring,pgsql,opcache,soap,cgi,imagick,json,hash,mcrypt,iconv} -y
   ```

3. Enable and start PHP-FPM (FastCGI Process Manager):
   ```bash
   sudo systemctl enable php8.3-fpm
   sudo systemctl start php8.3-fpm
   ```

4. Check if PHP-FPM is running:
   ```bash
   sudo systemctl status php8.3-fpm
   ```
   You should see a message indicating that PHP-FPM is active and running.

### Step 5: Configure Nginx to Use PHP
You need to configure Nginx to use PHP for processing `.php` files.

1. Open the default Nginx server block configuration file:
   ```bash
   sudo nano /etc/nginx/sites-available/default
   ```

2. Modify the file to include the following changes:
   ```nginx
   server {
       listen 80 default_server;
       listen [::]:80 default_server;

       root /var/www/html;
       index index.php index.html index.htm;

       server_name _;

       location / {
           try_files $uri $uri/ =404;
       }

       location ~ \.php$ {
           include snippets/fastcgi-php.conf;
           fastcgi_pass unix:/var/run/php/php8.3-fpm.sock;
       }

       location ~ /\.ht {
           deny all;
       }
   }
   ```

3. Save and close the file (press `CTRL+X`, then `Y`, then `Enter`).

4. Test the Nginx configuration for syntax errors:
   ```bash
   sudo nginx -t
   ```

5. Reload Nginx to apply the changes:
   ```bash
   sudo systemctl reload nginx
   ```

### Step 6: Test PHP
To verify that PHP is working with Nginx, create a simple PHP info file.

1. Create a `info.php` file in the web root:
   ```bash
   sudo nano /var/www/html/info.php
   ```

2. Add the following content:
   ```php
   <?php
   phpinfo();
   ?>
   ```

3. Save and close the file.

4. Open your web browser and navigate to `http://your_server_ip/info.php`.

   You should see a page displaying detailed information about your PHP installation.

### Step 7: Secure Your Server (Optional but Recommended)
- **Firewall**: You can enable the firewall and allow SSH, HTTP, and HTTPS traffic:
  ```bash
  sudo ufw allow OpenSSH
  sudo ufw allow 'Nginx Full'
  sudo ufw enable
  sudo ufw status
  ```
- **Disable the PHP info file**: Once you've verified that PHP is working, it's a good idea to delete the `info.php` file for security reasons:
  ```bash
  sudo rm /var/www/html/info.php
  ```

### Step 8: Final Steps
- **Reboot the Server** (optional):
  ```bash
  sudo reboot
  ```

Now you have a server running Nginx, PHP, and MariaDB on Ubuntu 24.04 LTS.
