
# Install apache2 server
apt update
apt install apache2 -y

# Open HTTP(80) and HTTPS(443) ports
ufw allow 'Apache Full'

apt-add-repository ppa:ondrej/php
apt-get install -y php7.0
apt-get install -y libapache2-mod-php7.0 libapache2-mod-php
apt-get install php7.0-mysql

# @TODO Build virtual host
# mkdir /var/www/my-app
# chown -R $USER:$USER /var/www/my-app

# Enable php interpreter
a2dismod mpm_event
a2enmod mpm_prefork
a2enmod php7.0

# Enable php module mysqli
phpenmod mysqli

system apache2 restart
